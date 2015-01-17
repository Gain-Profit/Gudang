unit U_toko;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, acProgressBar, Buttons, sBitBtn, DBCtrls, Mask,
  StdCtrls, sButton, sUpDown, sEdit, sLabel, sRadioButton, sGroupBox,
  ExtCtrls, sPanel, Grids, DBGrids, sPageControl,u_fungsi, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, sComboBox,
  sMaskEdit, sCustomComboEdit, sTooledit;

type
  TF_toko = class(TForm)
    pc_toko: TsPageControl;
    ts_margin: TsTabSheet;
    sLabel1: TsLabel;
    sStickyLabel1: TsStickyLabel;
    sStickyLabel2: TsStickyLabel;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    b_cetak: TsButton;
    ts_mutasi: TsTabSheet;
    sLabel10: TsLabel;
    sStickyLabel3: TsStickyLabel;
    sStickyLabel4: TsStickyLabel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    sButton1: TsButton;
    sTabSheet1: TsTabSheet;
    sLabel3: TsLabel;
    sButton2: TsButton;
    grid_data: TcxGridDBTableView;
    g_Grid1Level1: TcxGridLevel;
    g_stok: TcxGrid;
    clmn_stokGrid1DBTableView1Column1: TcxGridDBColumn;
    clmn_stokGrid1DBTableView1Column2: TcxGridDBColumn;
    clmn_stokGrid1DBTableView1Column3: TcxGridDBColumn;
    clmn_stokGrid1DBTableView1Column4: TcxGridDBColumn;
    cb_periode: TsComboBox;
    b_benarkan_mutasi: TsButton;
    de_mutasi: TsDateEdit;
    procedure FormShow(Sender: TObject);
    procedure b_cetakClick(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cb_periodeChange(Sender: TObject);
    procedure b_benarkan_mutasiClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_toko: TF_toko;
  fungsi: TFungsi;

implementation

uses u_dm, u_utama;

{$R *.dfm}

procedure TF_toko.FormShow(Sender: TObject);
begin
pc_toko.ActivePage:= ts_margin;
fungsi.SQLExecT(dm.Q_gross,'select * from vw_gross_margin where periode="'+
cb_periode.Text+'" and kd_perusahaan="'+f_utama.sb.Panels[3].Text+'"',true);
fungsi.SQLExecT(dm.Q_mutasi,'select * from vw_mutasi_toko where periode="'+
cb_periode.Text+'" and kd_perusahaan="'+f_utama.sb.Panels[3].Text+'"',true);
fungsi.SQLExecT(dm.q_stock_out,'select * from vw_stok_out where kd_perusahaan="'+f_utama.sb.Panels[3].Text+'"',true);
//dm.Q_mutasi.RecNo:=dm.Q_mutasi.RecordCount;
//dm.Q_gross.RecNo:= dm.Q_Gross.RecordCount;
//grid_data.DataController.FocusedRowIndex:=1;
end;

procedure TF_toko.b_cetakClick(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_laporan,'select * from vw_gross_margin where periode="'+
cb_periode.Text+'" and kd_perusahaan="'+f_utama.sb.Panels[3].Text+'"',true);
dm.laporan.LoadFromFile(dm.WPath + 'laporan\gp_gross.fr3');
dm.laporan.ShowReport;
end;

procedure TF_toko.sButton1Click(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_laporan,'select * from vw_mutasi_toko where periode="'+
cb_periode.Text+'" and kd_perusahaan="'+f_utama.sb.Panels[3].Text+'"',true);
dm.laporan.LoadFromFile(dm.WPath + 'laporan\gp_mutasi_tgl.fr3');
dm.laporan.ShowReport;
end;

procedure TF_toko.sButton2Click(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_laporan,'select * from vw_stok_out where kd_perusahaan="'+f_utama.sb.Panels[3].Text+'"',true);
dm.laporan.LoadFromFile(dm.WPath + 'laporan\gp_stok_out_harian.fr3');
dm.laporan.ShowReport;
end;

procedure TF_toko.FormCreate(Sender: TObject);
var x: Integer;
begin
de_mutasi.Date := Date;
fungsi.SQLExec(dm.Q_temp,'SELECT LEFT(tb_mutasi_bulan.tgl,7) as periode, '+
'left(date(now()),7) as sekarang FROM tb_mutasi_bulan where kd_perusahaan = "'+
F_Utama.sb.Panels[3].Text+'" GROUP BY LEFT(tb_mutasi_bulan.tgl,7)', true);

for x:= 1 to dm.Q_temp.RecordCount do
  begin
    cb_periode.Items.Add(dm.Q_temp.fieldbyname('periode').AsString);
    dm.Q_temp.Next;
  end;

cb_periode.ItemIndex:= cb_periode.IndexOf(dm.Q_temp.fieldbyname('sekarang').AsString);
end;

procedure TF_toko.cb_periodeChange(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_gross,'select * from vw_gross_margin where periode="'+
cb_periode.Text+'" and kd_perusahaan="'+f_utama.sb.Panels[3].Text+'"',true);
fungsi.SQLExec(dm.Q_mutasi,'select * from vw_mutasi_toko where periode="'+
cb_periode.Text+'" and kd_perusahaan="'+f_utama.sb.Panels[3].Text+'"',true);
dm.Q_mutasi.RecNo:=dm.Q_mutasi.RecordCount;
dm.Q_gross.RecNo:= dm.Q_Gross.RecordCount;
end;

procedure TF_toko.b_benarkan_mutasiClick(Sender: TObject);
begin
dm.My_Conn.StartTransaction;
try
fungsi.SQLExec(dm.Q_exe,'call sp_mutasi_repair("'+f_utama.sb.Panels[3].Text+'","'+
formatdatetime('yyyy-MM-dd',de_mutasi.Date)+'")',false);
dm.My_Conn.Commit;

showmessage('Proses Repair Mutasi Berhasil....');

except
on E:exception do
begin
dm.My_Conn.Rollback;
messagedlg('proses penyimpanan gagal,ulangi lagi!!! '#10#13'' + e.Message, mterror, [mbOk],0);
end;
end;
end;

end.
