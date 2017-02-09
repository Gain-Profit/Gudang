unit u_barang_property;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, 
  cxDataStorage, cxEdit, DB, cxDBData, cxCurrencyEdit, sComboBox,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, sButton, sGroupBox,UFungsi,
  ExtCtrls, sPanel, 
  MyAccess, cxCustomData, cxFilter, cxData, MemDS, DBAccess, StdCtrls;

type
  TF_barang_property = class(TForm)
    gb_detail: TsGroupBox;
    grid: TcxGrid;
    t_data_plano: TcxGridDBTableView;
    dt_rak: TcxGridDBColumn;
    dt_shelving: TcxGridDBColumn;
    dt_urut: TcxGridDBColumn;
    dt_KK: TcxGridDBColumn;
    dt_DB: TcxGridDBColumn;
    dt_AB: TcxGridDBColumn;
    dt_Kapasitas: TcxGridDBColumn;
    dt_display: TcxGridDBColumn;
    t_supplier: TcxGridDBTableView;
    dt__supplierkd_suplier: TcxGridDBColumn;
    dt__suppliern_supp: TcxGridDBColumn;
    dt__suppliertelp: TcxGridDBColumn;
    dt__supplieremail: TcxGridDBColumn;
    t_mutasi_barang: TcxGridDBTableView;
    t_tgl: TcxGridDBColumn;
    t_awal: TcxGridDBColumn;
    t_receipt: TcxGridDBColumn;
    t_return: TcxGridDBColumn;
    t_sales: TcxGridDBColumn;
    t_koreksi: TcxGridDBColumn;
    t_ahir: TcxGridDBColumn;
    t_mutasi_harga: TcxGridDBTableView;
    dt__mutasi_hargatgl: TcxGridDBColumn;
    dt__mutasi_hargauang_awal: TcxGridDBColumn;
    dt__mutasi_hargauang_receipt: TcxGridDBColumn;
    dt__mutasi_hargauang_return: TcxGridDBColumn;
    dt__mutasi_hargauang_sales: TcxGridDBColumn;
    dt__mutasi_hargauang_koreksi: TcxGridDBColumn;
    dt__mutasi_hargauang_ahir: TcxGridDBColumn;
    l_data_plano: TcxGridLevel;
    l_supplier: TcxGridLevel;
    l_mutasi_barang: TcxGridLevel;
    l_mutasi_harga: TcxGridLevel;
    cb_periode: TsComboBox;
    ds_mutasi: TDataSource;
    Q_mutasi: TMyQuery;
    q_supp: TMyQuery;
    ds_supp: TDataSource;
    ds_plano: TDataSource;
    Q_plano: TMyQuery;
    Q_temp: TMyQuery;
    t_kirim: TcxGridDBColumn;
    t_return_kirim: TcxGridDBColumn;
    t_return_jual: TcxGridDBColumn;
    t_mutasi_kirim: TcxGridDBColumn;
    t_mutasi_return_kirim: TcxGridDBColumn;
    t_mutasi_return_jual: TcxGridDBColumn;
    p_barang: TsPanel;
    panelBawah: TsPanel;
    btnMutasiHrg: TsButton;
    btnClose: TsButton;
    procedure cb_periodeChange(Sender: TObject);
    procedure t_data_planoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCloseClick(Sender: TObject);
    procedure btnMutasiHrgClick(Sender: TObject);
  private
    FPid, FDeskripsi, periode,bulan,tahun : string;
    procedure refresh_mutasi;
    { Private declarations }
  public
    procedure tampil(APID, ADeskripsi: string);
    { Public declarations }
  end;

var
  F_barang_property: TF_barang_property;


implementation

uses u_dm, u_cari;

{$R *.dfm}

procedure TF_barang_property.tampil(APID, ADeskripsi: string);
var x: Integer;
begin
fungsi.SQLExec(Q_temp,'SELECT LEFT(tb_mutasi_bulan.tgl,7) as periode, '+
'left(date(now()),7) as sekarang FROM tb_mutasi_bulan where kd_perusahaan = "'+
dm.kd_perusahaan+'" GROUP BY LEFT(tb_mutasi_bulan.tgl,7)', true);

for x:= 1 to Q_temp.RecordCount do
  begin
    cb_periode.Items.Add(Q_temp.fieldbyname('periode').AsString);
    Q_temp.Next;
  end;

cb_periode.ItemIndex:= cb_periode.Items.Count-1;

FPid:= APID;
FDeskripsi:= ADeskripsi;
p_barang.Caption:= FPid + ' - '+ FDeskripsi;

refresh_mutasi;

fungsi.SQLExecT(Q_plano,'select * from tb_planogram where kd_barang="'+
FPid+'" and kd_perusahaan="'+dm.kd_perusahaan+'"',true);

fungsi.SQLExecT(q_supp,'select * from vw_supplier where kd_barang="'+
FPid + '" and kd_perusahaan="'+dm.kd_perusahaan+'"',true);

end;
procedure TF_barang_property.refresh_mutasi;
begin
  periode:= cb_periode.Text;
  bulan:= Copy(periode,6,2);
  tahun:= Copy(periode,1,4);

    fungsi.SQLExecT(Q_mutasi,'select * from tb_mutasi WHERE bulan="'+
    bulan+'" and tahun ="'+tahun+'" and kd_barang="'+FPid+'" and kd_perusahaan="'+dm.kd_perusahaan+'"',true);
end;

procedure TF_barang_property.cb_periodeChange(Sender: TObject);
begin
  refresh_mutasi;
end;

procedure TF_barang_property.t_data_planoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (Key= vk_delete) then
begin
if MessageDlg('Yakinkah, akan menghapus data ini?...', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
begin
dm.db_conn.StartTransaction;
try
fungsi.SQLExec(dm.Q_Exe,'delete from tb_planogram where kd_perusahaan="'+dm.kd_perusahaan+'" and kd_barang="'+
FPid +'" and no_rak="'+Q_plano.fieldbyname('no_rak').AsString+'" and no_shelving="'+
Q_plano.fieldbyname('no_shelving').AsString+'" and no_urut="'+
Q_plano.fieldbyname('no_urut').AsString+'"',false);

fungsi.SQLExec(Q_plano,'select * from tb_planogram where kd_barang="'+
FPid+'" and kd_perusahaan="'+dm.kd_perusahaan+'"',true);

dm.db_conn.Commit;
except on e:exception do begin
  dm.db_conn.Rollback;
  showmessage('penghapusan data gagal '#10#13'' +e.Message);
  end;
end;
end;

end;
end;


procedure TF_barang_property.btnCloseClick(Sender: TObject);
begin
close;
end;

procedure TF_barang_property.btnMutasiHrgClick(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_laporan,'select * from tb_mutasi WHERE bulan="'+
    bulan+'" and tahun ="'+tahun+'" and kd_barang="'+FPid+'" and kd_perusahaan="'+dm.kd_perusahaan+'"',true);
dm.laporan.LoadFromFile(dm.WPath+ 'laporan\gp_mutasi_brg.fr3');
dm.FRMemo(dm.laporan, 'mmPerusahaan').Text := 'LAPORAN MUTASI '+dm.kd_perusahaan;
dm.FRMemo(dm.laporan, 'mmPeriode').Text := 'Periode: '+ tahun +'-'+ bulan;
dm.FRMemo(dm.laporan, 'mmBarang').Text := FDeskripsi;
dm.laporan.ShowReport;
end;

end.
