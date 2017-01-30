unit u_barang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, sEdit, 
  Buttons, ExtCtrls, sPanel, UFungsi,
  cxCustomData, cxGraphics,cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxSpinEdit,
  cxGridCustomPopupMenu, sButton,sSkinProvider, cxStyles, cxTextEdit,
  sSpeedButton, cxFilter, cxData, StdCtrls, mySQLDbTables;

  const
  WM_AFTER_SHOW = WM_USER + 300; // custom message

type
  NewControl = class(TControl);
  TF_barang = class(TForm)
    sPanel2: TsPanel;
    Ed_Cari: TsEdit;
    sPanel1: TsPanel;
    TvData: TcxGridDBTableView;
    lvData: TcxGridLevel;
    grid: TcxGrid;
    TvDataN_Jenis: TcxGridDBColumn;
    TvDataN_merk: TcxGridDBColumn;
    TvDatan_kategori: TcxGridDBColumn;
    TvDataN_golbrg: TcxGridDBColumn;
    TvDatakd_barang: TcxGridDBColumn;
    TvDatan_barang: TcxGridDBColumn;
    TvDatabarcode3: TcxGridDBColumn;
    TvDataminstok: TcxGridDBColumn;
    TvDatamaxstok: TcxGridDBColumn;
    TvDataleadtime: TcxGridDBColumn;
    TvDataaktif: TcxGridDBColumn;
    TvDataminor: TcxGridDBColumn;
    sSkinProvider1: TsSkinProvider;
    vDataColumn1: TcxGridDBColumn;
    vDataColumn2: TcxGridDBColumn;
    spnl1: TsPanel;
    B_tambah: TsButton;
    b_edit: TsButton;
    b_hapus: TsButton;
    b_duplikat: TsButton;
    sb_2: TsSpeedButton;
    sb_1: TsSpeedButton;
    p1: TsPanel;
    B_property: TsButton;
    tDataColumn3: TcxGridDBColumn;
    tDataColumn4: TcxGridDBColumn;
    tDataColumn5: TcxGridDBColumn;
    ds_barang: TDataSource;
    Q_barang: TmySQLQuery;
    procedure WMMDIACTIVATE(var msg : TWMMDIACTIVATE) ; message WM_MDIACTIVATE;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure b_editClick(Sender: TObject);
    procedure B_tambahClick(Sender: TObject);
    procedure b_hapusClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TvDataCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure Ed_CariKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TvDataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure b_duplikatClick(Sender: TObject);
    procedure sb_2Click(Sender: TObject);
    procedure sb_1Click(Sender: TObject);
    procedure B_propertyClick(Sender: TObject);
    procedure HapusBarang(perusahaan:String);
  private
   procedure WmAfterShow(var Msg: TMessage); message WM_AFTER_SHOW;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_barang: TF_barang;

implementation

uses u_dm, u_barang_det, u_utama, u_barang_property;

{$R *.dfm}

procedure TF_barang.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
var
  active: TWinControl;
  idx: Integer;
begin
  active := FindControl(msg.ActiveWnd) ;
if not(dm.metu_kabeh) then
begin
  if Assigned(active) then
  begin
    idx := f_utama.tc_child.Tabs.IndexOfObject(TObject(msg.ActiveWnd));
    f_utama.tc_child.Tag := -1;
    f_utama.tc_child.TabIndex := idx;
    f_utama.tc_child.Tag := 0;
  end;
end;
end;

procedure TF_barang.WmAfterShow(var Msg: TMessage);
begin
fungsi.SQLExecT(Q_barang,'SELECT kd_perusahaan,kd_barang,n_barang,kd_jenis, '+
'kd_kategori,kd_golbrg,kd_merk,kd_sat1,kd_sat2,kd_sat3,barcode3,minstok,maxstok, '+
'leadtime,aktif,minor,barcode1,barcode2,Qty1,Qty2,N_golbrg,N_merk,N_Jenis, '+
'n_kategori,stok_OH,hpp_aktif,hpp_ahir,tot_HPP '+
' from vw_daftar_barang where kd_perusahaan="'+dm.kd_perusahaan+'"',true);
//limit '+inttostr(br_awal)+','+inttostr(limit)+'',true);
tvdata.DataController.FocusedRowIndex:=1;
end;

procedure TF_barang.FormShow(Sender: TObject);
begin
{limit:=100;
hal:=1;
if hal<=1 then
br_awal:= 0 else
br_awal:= (hal-1)*100;
}
 if f_utama.sb.Panels[8].Text='PUSAT' then
 begin
  B_tambah.Enabled:=True;
  b_hapus.Enabled:=True;
  b_duplikat.Enabled:= True;
 end else
 begin
  B_tambah.Enabled:=False;
  b_hapus.Enabled:=False;
  b_duplikat.Enabled:= False;
 end;

PostMessage(Self.Handle, WM_AFTER_SHOW, 0, 0);
end;

procedure TF_barang.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_f2 then ed_cari.SetFocus;
end;

procedure TF_barang.b_editClick(Sender: TObject);
begin
application.CreateForm(TF_barang_det,F_barang_det);
f_barang_det.tampil(Q_barang.FieldByName('kd_barang').AsString);
f_barang_det.ShowModal;
end;

procedure TF_barang.B_tambahClick(Sender: TObject);
begin
application.CreateForm(TF_barang_det,F_barang_det);
f_barang_det.baru;
f_barang_det.ShowModal;
end;

procedure TF_barang.b_hapusClick(Sender: TObject);
var i: Integer;
begin
if MessageDlg('Yakinkah, akan menghapus data ini?...', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
begin
dm.db_conn.StartTransaction;
try
HapusBarang(Q_barang.fieldbyname('kd_perusahaan').AsString);
if F_utama.sb.Panels[8].Text='PUSAT' then
begin
  for i:=0 to cabang.Count -1 do
  begin
    HapusBarang(cabang[i]);
  end;
end;

sb_2Click(Sender);
dm.db_conn.Commit;
showmessage('Penghapusan data sukses...');
except on e:exception do begin
  dm.db_conn.Rollback;
  showmessage('penghapusan data gagal '#10#13'' +e.Message);
  end;
end;
end;
end;

procedure TF_barang.HapusBarang(perusahaan:string);
begin
fungsi.SQLExec(dm.Q_Exe,'delete from tb_barang where kd_perusahaan="'+perusahaan+'" and kd_barang="'+
Q_barang.fieldbyname('kd_barang').AsString+'" ',false);

fungsi.SQLExec(dm.Q_Exe,'delete from tb_mutasi where kd_perusahaan="'+perusahaan+'" and kd_barang="'+
Q_barang.fieldbyname('kd_barang').AsString+'" ',false);

fungsi.SQLExec(dm.Q_Exe,'delete from tb_barang_harga where kd_perusahaan="'+perusahaan+'" and kd_barang="'+
Q_barang.fieldbyname('kd_barang').AsString+'" ',false);

fungsi.SQLExec(dm.Q_Exe,'delete from tb_barang_supp where kd_perusahaan="'+perusahaan+'" and kd_barang="'+
Q_barang.fieldbyname('kd_barang').AsString+'" ',false);

fungsi.SQLExec(dm.Q_Exe,'delete from tb_planogram where kd_perusahaan="'+perusahaan+'" and kd_barang="'+
Q_barang.fieldbyname('kd_barang').AsString+'" ',false);
end;
  
procedure TF_barang.FormClose(Sender: TObject; var Action: TCloseAction);
begin
f_utama.MDIChildDestroyed(Self.Handle);
action:=cafree;
f_barang:= nil;
end;

procedure TF_barang.TvDataCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
b_editClick(Sender);
end;

procedure TF_barang.Ed_CariKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_down then grid.SetFocus;

if key=vk_return then
begin
PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE );
fungsi.SQLExec(Q_barang,'SELECT kd_perusahaan,kd_barang,n_barang,kd_jenis, '+
'kd_kategori,kd_golbrg,kd_merk,kd_sat1,kd_sat2,kd_sat3,barcode3,minstok,maxstok, '+
'leadtime,aktif,minor,barcode1,barcode2,Qty1,Qty2,N_golbrg,N_merk,N_Jenis,n_kategori,stok_OH '+
'from vw_daftar_barang where (kd_barang like "%'+
ed_cari.Text+'%" or n_barang like "%'+ed_cari.Text+'%" or barcode3 like "%'+ed_cari.Text+'%" or barcode2 like "%'+
ed_cari.Text+'%" or barcode1 like "%'+ed_cari.Text+'%") and (kd_perusahaan="'+
dm.kd_perusahaan+'")',true);
grid.SetFocus;
ed_cari.SetFocus;
end;
end;

procedure TF_barang.TvDataKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
begin
b_editClick(Sender);
end;

if Key= vk_delete then b_hapusClick(Sender);
end;

procedure TF_barang.FormCreate(Sender: TObject);
begin
  f_utama.MDIChildCreated(self.Handle);
end;

procedure TF_barang.b_duplikatClick(Sender: TObject);
begin
application.CreateForm(TF_barang_det,F_barang_det);
f_barang_det.duplikat(Q_barang.FieldByName('kd_barang').AsString);
f_barang_det.ShowModal;
end;

procedure TF_barang.sb_2Click(Sender: TObject);
var posisi:integer;
begin
Screen.Cursor:= crHourGlass;
posisi:= tvdata.DataController.DataSource.DataSet.RecNo;
tvdata.DataController.DataSource.DataSet.Close;
tvdata.DataController.DataSource.DataSet.Open;
tvdata.DataController.DataSource.DataSet.RecNo:= posisi;
Screen.Cursor:= crDefault;
end;

procedure TF_barang.sb_1Click(Sender: TObject);
begin
close;
end;

procedure TF_barang.B_propertyClick(Sender: TObject);
begin
application.CreateForm(TF_barang_property,F_barang_property);
F_barang_property.tampil(Q_barang.FieldByName('kd_barang').AsString,
  Q_barang.FieldByName('n_barang').AsString);
F_barang_property.ShowModal;
end;

end.
