unit U_toko;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, Buttons, DBCtrls, 
  sButton, sLabel, 
  ExtCtrls, UFungsi, cxStyles,
  cxGraphics, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, sComboBox,
  sTooledit, DateUtils, StdCtrls, Mask, sMaskEdit, sCustomComboEdit;

type
  TF_toko = class(TForm)
    sButton2: TsButton;
    cb_periode: TsComboBox;
    btnMutasi: TsButton;
    de_mutasi: TsDateEdit;
    b_benarkan_mutasi: TsButton;
    btnGross: TsButton;
    lbl1: TsLabel;
    btnMutasiHarga: TsButton;
    lbl2: TsLabel;
    function TotalDay(Year: Integer; Month: Integer): Integer;
    procedure btnGrossClick(Sender: TObject);
    procedure btnMutasiClick(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure b_benarkan_mutasiClick(Sender: TObject);
    procedure cb_periodeChange(Sender: TObject);
    procedure cekPeriode;
  private
    periode,bulan,tahun : string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_toko: TF_toko;

implementation

uses u_dm;

{$R *.dfm}

procedure TF_toko.btnGrossClick(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_laporan,'select * from tb_gross_margin where MONTH(tanggal)="'+
bulan+'" and YEAR(tanggal)="'+tahun+'" and kd_perusahaan="'+dm.kd_perusahaan+'"',true);
dm.laporan.LoadFromFile(dm.WPath + 'laporan\gp_gross.fr3');
dm.laporan.ShowReport;
end;

procedure TF_toko.btnMutasiClick(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_laporan,'select * from tb_mutasi_bulan where MONTH(tgl)="'+
bulan+'" and YEAR(tgl)="'+tahun+'" and kd_perusahaan="'+dm.kd_perusahaan+'"',true);
if TsButton(Sender).Name = 'btnMutasi' then
dm.laporan.LoadFromFile(dm.WPath + 'laporan\gp_mutasi_global_stok.fr3') else
dm.laporan.LoadFromFile(dm.WPath + 'laporan\gp_mutasi_global_uang.fr3');

dm.laporan.ShowReport;
end;

procedure TF_toko.sButton2Click(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_laporan,'select * from vw_stok_out where kd_perusahaan="'+dm.kd_perusahaan+'"',true);
dm.laporan.LoadFromFile(dm.WPath + 'laporan\gp_stok_out_harian.fr3');
dm.laporan.ShowReport;
end;

procedure TF_toko.FormCreate(Sender: TObject);
var x: Integer;
begin
de_mutasi.Date := Date;
fungsi.SQLExec(dm.Q_temp,'SELECT LEFT(tb_mutasi_bulan.tgl,7) as periode, '+
'left(date(now()),7) as sekarang FROM tb_mutasi_bulan where kd_perusahaan = "'+
dm.kd_perusahaan+'" GROUP BY LEFT(tb_mutasi_bulan.tgl,7)', true);

for x:= 1 to dm.Q_temp.RecordCount do
  begin
    cb_periode.Items.Add(dm.Q_temp.fieldbyname('periode').AsString);
    dm.Q_temp.Next;
  end;

cb_periode.ItemIndex:= cb_periode.Items.Count-1;
cekPeriode;
end;

procedure TF_toko.b_benarkan_mutasiClick(Sender: TObject);
begin
dm.db_conn.StartTransaction;
try
fungsi.SQLExec(dm.Q_exe,'call sp_mutasi_repair("'+dm.kd_perusahaan+'","'+
formatdatetime('yyyy-MM-dd',de_mutasi.Date)+'")',false);
dm.db_conn.Commit;

showmessage('Proses Repair Mutasi Berhasil....');

except
on E:exception do
begin
dm.db_conn.Rollback;
messagedlg('proses penyimpanan gagal,ulangi lagi!!! '#10#13'' + e.Message, mterror, [mbOk],0);
end;
end;
end;

procedure TF_toko.cb_periodeChange(Sender: TObject);
begin
cekPeriode;
end;

// procdure untuk mendapatkan bulan dan tahun dari combo box
procedure TF_toko.cekPeriode;
begin
  periode:= cb_periode.Text;
  bulan:= Copy(periode,6,2);
  tahun:= Copy(periode,1,4);
end;

// procdure untuk mendapatkan total hari dalam tiga bulan terahir.
function TF_toko.TotalDay(Year, Month: Integer): Integer;
var
  MinOne, MinTwo, Now: Integer;
begin
  if Month = 2 then
  begin
    MinOne := DaysInAMonth(Year, 1);
    MinTwo := DaysInAMonth(Year - 1, 12);
  end else
  if Month = 1 then
  begin
    MinOne := DaysInAMonth(Year - 1, 12);
    MinTwo := DaysInAMonth(Year - 1, 11);
  end else
  begin
    MinOne := DaysInAMonth(Year, Month -1);
    MinTwo := DaysInAMonth(Year, Month -2);
  end;

  if ((YearOf(Date) = Year) and (MonthOf(Date) = Month)) then
  begin
    Now := DayOf(Date);
  end else
  begin
    Now := DaysInAMonth(Year, Month);
  end;

  Result := Now + MinOne + MinTwo;
end;

end.
