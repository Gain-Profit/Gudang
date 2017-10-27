unit u_barang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, sEdit, Buttons, ExtCtrls, sPanel, UFungsi, cxCustomData,
  cxGraphics, cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxSpinEdit,
  cxGridCustomPopupMenu, sButton, sSkinProvider, cxStyles, cxTextEdit,
  sSpeedButton, MyAccess, cxFilter, cxData, MemDS, DBAccess, StdCtrls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, System.UITypes,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxNavigator;

const
  WM_AFTER_SHOW = WM_USER + 300; // custom message

type
  NewControl = class(TControl);

  TF_barang = class(TForm)
    sPanel2: TsPanel;
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
    Q_barang: TMyQuery;
    pnlheader: TPanel;
    Ed_Cari: TEdit;
    pnlcheck: TPanel;
    CkSemua: TCheckBox;
    pnlFilter: TPanel;
    procedure WMMDIACTIVATE(var msg: TWMMDIACTIVATE); message WM_MDIACTIVATE;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure b_editClick(Sender: TObject);
    procedure B_tambahClick(Sender: TObject);
    procedure b_hapusClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TvDataCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo:
      TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState;
      var AHandled: Boolean);
    procedure Ed_CariKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TvDataKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure b_duplikatClick(Sender: TObject);
    procedure sb_2Click(Sender: TObject);
    procedure sb_1Click(Sender: TObject);
    procedure B_propertyClick(Sender: TObject);
    procedure HapusBarang(perusahaan: string);
    procedure CkSemuaClick(Sender: TObject);
  private
    procedure WmAfterShow(var Msg: TMessage); message WM_AFTER_SHOW;
    procedure Segarkan(ASemua: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_barang: TF_barang;

implementation

uses
  u_dm, u_barang_detail, u_utama, u_barang_property;

{$R *.dfm}

const
  sBarangSQL = 'SELECT kd_perusahaan, kd_barang, n_barang, kd_jenis, kd_kategori, ' +
    'kd_golbrg, kd_merk, kd_sat1, kd_sat2, kd_sat3, barcode3, minstok, maxstok, ' +
    'leadtime, aktif, minor, barcode1, barcode2, Qty1, Qty2, N_golbrg, N_merk, N_Jenis, ' +
    'n_kategori, stok_OH, hpp_aktif, hpp_ahir, tot_HPP FROM vw_daftar_barang';

procedure TF_barang.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
var
  active: TWinControl;
  idx: Integer;
begin
  active := FindControl(msg.ActiveWnd);
  if not (dm.metu_kabeh) then
  begin
    if Assigned(active) then
    begin
      idx := F_utama.tc_child.Tabs.IndexOfObject(TObject(msg.ActiveWnd));
      F_utama.tc_child.Tag := -1;
      F_utama.tc_child.TabIndex := idx;
      F_utama.tc_child.Tag := 0;
    end;
  end;
end;

procedure TF_barang.WmAfterShow(var Msg: TMessage);
begin
  Segarkan(CkSemua.Checked);
  tvdata.DataController.FocusedRowIndex := 1;
end;

procedure TF_barang.FormShow(Sender: TObject);
begin
  if F_utama.sb.Panels[8].Text = 'PUSAT' then
  begin
    B_tambah.Enabled := True;
    b_hapus.Enabled := True;
    b_duplikat.Enabled := True;
  end
  else
  begin
    B_tambah.Enabled := False;
    b_hapus.Enabled := False;
    b_duplikat.Enabled := False;
  end;

  PostMessage(Self.Handle, WM_AFTER_SHOW, 0, 0);
end;

procedure TF_barang.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_f2 then
    ed_cari.SetFocus;
end;

procedure TF_barang.b_editClick(Sender: TObject);
begin
  application.CreateForm(TF_barang_det, F_barang_det);
  F_barang_det.tampil(Self, Q_barang.FieldByName('kd_barang').AsString);
  F_barang_det.ShowModal;
end;

procedure TF_barang.B_tambahClick(Sender: TObject);
begin
  application.CreateForm(TF_barang_det, F_barang_det);
  F_barang_det.baru(Self);
  F_barang_det.ShowModal;
end;

procedure TF_barang.b_hapusClick(Sender: TObject);
var
  i: Integer;
begin
  if MessageDlg('Yakinkah, akan menghapus data ini?...', mtConfirmation, [mbYes,
    mbNo], 0) = mrYes then
  begin
    dm.db_conn.StartTransaction;
    try
      HapusBarang(Q_barang.fieldbyname('kd_perusahaan').AsString);
      if F_utama.sb.Panels[8].Text = 'PUSAT' then
      begin
        for i := 0 to cabang.Count - 1 do
        begin
          HapusBarang(cabang[i]);
        end;
      end;

      dm.db_conn.Commit;
      Segarkan(CkSemua.Checked);
      showmessage('Penghapusan data sukses...');
    except
      on e: exception do
      begin
        dm.db_conn.Rollback;
        showmessage('penghapusan data gagal '#10#13'' + e.Message);
      end;
    end;
  end;
end;

procedure TF_barang.HapusBarang(perusahaan: string);
begin
  fungsi.SQLExec(dm.Q_Exe, 'delete from tb_barang where kd_perusahaan="' +
    perusahaan + '" and kd_barang="' + Q_barang.fieldbyname('kd_barang').AsString
    + '" ', false);

  fungsi.SQLExec(dm.Q_Exe, 'delete from tb_mutasi where kd_perusahaan="' +
    perusahaan + '" and kd_barang="' + Q_barang.fieldbyname('kd_barang').AsString
    + '" ', false);

  fungsi.SQLExec(dm.Q_Exe, 'delete from tb_barang_harga where kd_perusahaan="' +
    perusahaan + '" and kd_barang="' + Q_barang.fieldbyname('kd_barang').AsString
    + '" ', false);

  fungsi.SQLExec(dm.Q_Exe, 'delete from tb_barang_supp where kd_perusahaan="' +
    perusahaan + '" and kd_barang="' + Q_barang.fieldbyname('kd_barang').AsString
    + '" ', false);

  fungsi.SQLExec(dm.Q_Exe, 'delete from tb_planogram where kd_perusahaan="' +
    perusahaan + '" and kd_barang="' + Q_barang.fieldbyname('kd_barang').AsString
    + '" ', false);
end;

procedure TF_barang.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  F_utama.MDIChildDestroyed(Self.Handle);
  action := cafree;
  F_barang := nil;
end;

procedure TF_barang.TvDataCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
  TShiftState; var AHandled: Boolean);
begin
  b_editClick(Sender);
end;

procedure TF_barang.Ed_CariKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_down then
    grid.SetFocus;

  if key = vk_return then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    Segarkan(CkSemua.Checked);
    grid.SetFocus;
    ed_cari.SetFocus;
  end;
end;

procedure TF_barang.TvDataKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
  begin
    b_editClick(Sender);
  end;

  if Key = vk_delete then
    b_hapusClick(Sender);
end;

procedure TF_barang.FormCreate(Sender: TObject);
begin
  F_utama.MDIChildCreated(self.Handle);
end;

procedure TF_barang.b_duplikatClick(Sender: TObject);
begin
  application.CreateForm(TF_barang_det, F_barang_det);
  F_barang_det.duplikat(Self, Q_barang.FieldByName('kd_barang').AsString);
  F_barang_det.ShowModal;
end;

procedure TF_barang.sb_2Click(Sender: TObject);
begin
  Segarkan(CkSemua.Checked);
end;

procedure TF_barang.sb_1Click(Sender: TObject);
begin
  close;
end;

procedure TF_barang.B_propertyClick(Sender: TObject);
begin
  application.CreateForm(TF_barang_property, F_barang_property);
  F_barang_property.tampil(Q_barang.FieldByName('kd_barang').AsString, Q_barang.FieldByName
    ('n_barang').AsString);
  F_barang_property.ShowModal;
end;

procedure TF_barang.Segarkan(ASemua: Boolean);
var
  LKode, LSQL: string;
  posisi: integer;
begin
  if CkSemua.Checked then
  begin
    LSQL := Format('%s WHERE kd_perusahaan = "%s"', [sBarangSQL, dm.kd_perusahaan]);
  end
  else
  begin
    LKode := Ed_Cari.Text;
    if LKode = '' then
      LSQL := Format('%s WHERE kd_perusahaan = "%s" LIMIT 50', [sBarangSQL, dm.kd_perusahaan])
    else
      LSQL := Format('%s WHERE ((kd_perusahaan = "%s") AND ' +
        '(kd_barang LIKE "%%%s%%" or n_barang LIKE "%%%s%%" or barcode3 LIKE "%%%s%%"))',
        [sBarangSQL, dm.kd_perusahaan, LKode, LKode, LKode]);
  end;

  Screen.Cursor := crHourGlass;
  posisi := Q_barang.RecNo;
  fungsi.SQLExec(Q_barang, LSQL, True);
  Q_barang.RecNo := posisi;
  Screen.Cursor := crDefault;
end;

procedure TF_barang.CkSemuaClick(Sender: TObject);
begin
  Segarkan(CkSemua.Checked);
  Ed_Cari.Enabled := not CkSemua.Checked;
  Ed_Cari.Clear;
end;

end.


