unit u_utama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sSkinProvider, ComCtrls, sStatusBar, Menus, ActnList, System.UITypes,
  XPStyleActnCtrls, ActnMan, UFungsi, sPageControl, Buttons, sSpeedButton,
  ExtCtrls, sPanel, inifiles, shellapi, DB, sGauge, sTabControl, cxStyles,
  cxGraphics, cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxControls, cxGridCustomView, cxClasses,
  System.Actions, cxGrid, MemDS, DBAccess, MyAccess;

const
  WM_AFTER_SHOW = WM_USER + 300; // custom message

type
  TF_utama = class(TForm)
    sSkinProvider1: TsSkinProvider;
    sb: TStatusBar;
    MainMenu1: TMainMenu;
    AL: TActionList;
    ac_barang: TAction;
    ac_harga: TAction;
    ac_receipt: TAction;
    ac_return: TAction;
    ac_company: TAction;
    ac_jenis: TAction;
    ac_golongan: TAction;
    ac_kategori: TAction;
    ac_merk: TAction;
    Ac_supplier: TAction;
    Ac_satuan: TAction;
    ac_purchase: TAction;
    ac_barang_supp: TAction;
    ac_planogram: TAction;
    ac_cust: TAction;
    ac_user: TAction;
    ac_list_purchase: TAction;
    ac_list_receipt: TAction;
    ac_list_return: TAction;
    pc: TsPageControl;
    ts_master: TsTabSheet;
    sTabSheet2: TsTabSheet;
    ts_set_inv: TsTabSheet;
    ts_transaksi: TsTabSheet;
    SetUpDefaultCompany1: TMenuItem;
    Action1: TAction;
    ac_lap: TAction;
    Timer1: TTimer;
    HidePanelControl1: TMenuItem;
    UbahSkin1: TMenuItem;
    N1: TMenuItem;
    SettingInventori1: TMenuItem;
    MasterData1: TMenuItem;
    Company1: TMenuItem;
    Supplier1: TMenuItem;
    Pelanggan1: TMenuItem;
    User1: TMenuItem;
    Jenis1: TMenuItem;
    Golongan1: TMenuItem;
    Kategori1: TMenuItem;
    Merk1: TMenuItem;
    Satuan1: TMenuItem;
    ransaksi1: TMenuItem;
    PO1: TMenuItem;
    RO1: TMenuItem;
    Return1: TMenuItem;
    N4: TMenuItem;
    DaftarPurchaseOrderPO1: TMenuItem;
    DaftarReceiptOrderRO1: TMenuItem;
    DaftarReturnPembelian1: TMenuItem;
    Inventory1: TMenuItem;
    Barang1: TMenuItem;
    Harga1: TMenuItem;
    Planogram1: TMenuItem;
    BarangSupplier1: TMenuItem;
    Laporan1: TMenuItem;
    LogOut1: TMenuItem;
    sPanel2: TsPanel;
    sSpeedButton12: TsSpeedButton;
    sSpeedButton13: TsSpeedButton;
    sSpeedButton14: TsSpeedButton;
    sSpeedButton15: TsSpeedButton;
    sSpeedButton2: TsSpeedButton;
    sCoolBar1: TsPanel;
    sBitBtn1: TsSpeedButton;
    sSpeedButton1: TsSpeedButton;
    sSpeedButton3: TsSpeedButton;
    sSpeedButton4: TsSpeedButton;
    sSpeedButton23: TsSpeedButton;
    sPanel3: TsPanel;
    sSpeedButton18: TsSpeedButton;
    sSpeedButton19: TsSpeedButton;
    sb_return_kirim: TsSpeedButton;
    sPanel1: TsPanel;
    sSpeedButton5: TsSpeedButton;
    sSpeedButton6: TsSpeedButton;
    sSpeedButton7: TsSpeedButton;
    sSpeedButton8: TsSpeedButton;
    sSpeedButton9: TsSpeedButton;
    sSpeedButton10: TsSpeedButton;
    Pertolongan1: TMenuItem;
    spdbtnac_return: TsSpeedButton;
    ac_kirim: TAction;
    spdbtnkirim: TsSpeedButton;
    ac_list_kirim: TAction;
    KirimData1: TMenuItem;
    DaftarKirimBarang1: TMenuItem;
    sb_lap: TsSpeedButton;
    sb_update_barang_harga: TsSpeedButton;
    ac_update: TAction;
    sg_update: TsGauge;
    ts_1: TsTabSheet;
    spnl1: TsPanel;
    sb_list_receipt: TsSpeedButton;
    sb_Action1: TsSpeedButton;
    sb_list_purchase: TsSpeedButton;
    sb_list_return1: TsSpeedButton;
    sb_list_kirim1: TsSpeedButton;
    sb_receipt: TsSpeedButton;
    ac_return_kirim: TAction;
    ac_list_return_kirim: TAction;
    sb_list_kirim: TsSpeedButton;
    ac_list_sales: TAction;
    ac_list_so: TAction;
    sb_list_return_kirim: TsSpeedButton;
    sb_list_sales: TsSpeedButton;
    tc_child: TsTabControl;
    pm1: TPopupMenu;
    MiTutupSemua: TMenuItem;
    MiTutupSemuaKecualiIni: TMenuItem;
    MiTutup: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    ac_realcard: TAction;
    Q_time: TMyQuery;
    SbubahPassword: TsSpeedButton;
    mniCekUpdateProgram1: TMenuItem;
    ac_cekUpdate: TAction;
    ReturnKirim1: TMenuItem;
    RealCard1: TMenuItem;
    DaftarReturnKirim1: TMenuItem;
    DaftarPenjualan1: TMenuItem;
    DaftarStokOpnameSO1: TMenuItem;
    ac_list_return_jual: TAction;
    btnRetunJual: TsSpeedButton;
    ac_barcode: TAction;
    sb_realCard: TsSpeedButton;
    sb_Barcode: TsSpeedButton;
    SbGroupBarang: TsSpeedButton;
    ac_setting: TAction;
    sSpeedButton11: TsSpeedButton;
    procedure ac_barangExecute(Sender: TObject);
    procedure ac_hargaExecute(Sender: TObject);
    procedure ac_receiptExecute(Sender: TObject);
    procedure ac_returnExecute(Sender: TObject);
    procedure ac_companyExecute(Sender: TObject);
    procedure ac_jenisExecute(Sender: TObject);
    procedure ac_golonganExecute(Sender: TObject);
    procedure ac_kategoriExecute(Sender: TObject);
    procedure ac_merkExecute(Sender: TObject);
    procedure Ac_supplierExecute(Sender: TObject);
    procedure Ac_satuanExecute(Sender: TObject);
    procedure ac_purchaseExecute(Sender: TObject);
    procedure ac_barang_suppExecute(Sender: TObject);
    procedure ac_planogramExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ac_custExecute(Sender: TObject);
    procedure ac_userExecute(Sender: TObject);
    procedure ac_list_purchaseExecute(Sender: TObject);
    procedure ac_list_receiptExecute(Sender: TObject);
    procedure ac_list_returnExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Action1Execute(Sender: TObject);
    procedure ac_lapExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure HidePanelControl1Click(Sender: TObject);
    procedure UbahSkin1Click(Sender: TObject);
    procedure LogOut1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ac_kirimExecute(Sender: TObject);
    procedure ac_list_kirimExecute(Sender: TObject);
    procedure ac_updateExecute(Sender: TObject);
    procedure ac_list_salesExecute(Sender: TObject);
    procedure ac_list_soExecute(Sender: TObject);
    procedure MDIChildCreated(const childHandle: THandle);
    procedure MDIChildDestroyed(const childHandle: THandle);
    procedure tc_childChange(Sender: TObject);
    procedure MiTutupSemuaClick(Sender: TObject);
    procedure MiTutupClick(Sender: TObject);
    procedure MiTutupSemuaKecualiIniClick(Sender: TObject);
    procedure ac_return_kirimExecute(Sender: TObject);
    procedure ac_list_return_kirimExecute(Sender: TObject);
    procedure panel_auto_width;
    procedure ac_realcardExecute(Sender: TObject);
    procedure SbubahPasswordClick(Sender: TObject);
    procedure ac_cekUpdateExecute(Sender: TObject);
    procedure ac_list_return_jualExecute(Sender: TObject);
    procedure cek_update;
    procedure ac_barcodeExecute(Sender: TObject);
    procedure SbGroupBarangClick(Sender: TObject);
    procedure ac_settingExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FVersion : TVersion;
    procedure WmAfterShow(var Msg: TMessage); message WM_AFTER_SHOW;
    { Private declarations }
  public
    koneksi: boolean;
    function HakAkses(kunci: string): Boolean;
    { Public declarations }
  end;

var
  F_utama: TF_utama;

implementation

uses
  u_barang, u_harga, u_return, u_cari, u_dm, u_purchase, u_barang_supplier,
  u_planogram, u_list_purchase, u_list_receipt, u_list_return, u_Login,
  acselectskin, u_receipt, u_kirim, u_list_kirim, u_list_jual,
  u_list_stock_opname, u_return_kirim, u_list_return_kirim, u_laporan,
  u_ganti_hari, u_ubah_password, u_list_return_jual, u_barcode, u_real_card,
  u_Group_Barang, u_settings;

{$R *.dfm}

//add a tab for an MDI child
procedure TF_utama.MDIChildCreated(const childHandle: THandle);
begin
  tc_child.Tabs.AddObject(TForm(FindControl(childHandle)).Caption, TObject(childHandle));
  tc_child.TabIndex := -1 + tc_child.Tabs.Count;

  if F_utama.MDIChildCount > 1 then
  begin
    tc_child.Visible := True;
  end;
end;

//remove a tab for this MDI child
procedure TF_utama.MDIChildDestroyed(const childHandle: THandle);
var
  idx: Integer;
begin
  idx := tc_child.Tabs.IndexOfObject(TObject(childHandle));
  tc_child.Tabs.Delete(idx);

  if F_utama.MDIChildCount = 2 then
    tc_child.Visible := False;
end;

procedure TF_utama.WmAfterShow(var Msg: TMessage);
begin
  dm.sm.Active := true;

  application.CreateForm(TF_login, F_login);
  F_login.sb.Panels[0].Text := dm.kd_perusahaan;
  F_login.sb.Panels[1].Text := sb.Panels[4].Text;
  F_login.ShowModal;
  if not (dm.CanLogin) then
    Close;
end;

procedure TF_utama.ac_barangExecute(Sender: TObject);
begin
  if not (HakAkses('gdInvBarang')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalam MENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  if F_barang = nil then
    application.CreateForm(TF_barang, F_barang);

  F_barang.Show;
end;

procedure TF_utama.ac_hargaExecute(Sender: TObject);
begin
  if not (HakAkses('gdInvHarga')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalam MENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  if F_edit_harga = nil then
    application.CreateForm(TF_edit_harga, F_edit_harga);

  F_edit_harga.Show;
end;

procedure TF_utama.ac_receiptExecute(Sender: TObject);
begin
  if not (HakAkses('gdTrRO')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalam MENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  application.CreateForm(TF_RO, F_RO);
  F_RO.Show;
end;

procedure TF_utama.ac_returnExecute(Sender: TObject);
begin
  if not (HakAkses('gdTrReturn')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalam MENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  application.CreateForm(TF_return, F_return);
  F_return.Show;
end;

procedure TF_utama.ac_companyExecute(Sender: TObject);
begin
  if not (HakAkses('gdMaster')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalam MENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  application.CreateForm(TF_cari, F_cari);
  with F_cari do
  try
    _SQLi := 'SELECT kd_perusahaan, n_perusahaan FROM tb_company';
    tblcap[0] := 'Kode';
    tblCap[1] := 'Nama';
    Caption := 'Daftar Perusahaan';
    cariT := 8;
    tampil_button(true, False);
    ShowModal;
  finally
    close;
  end;
end;

procedure TF_utama.ac_jenisExecute(Sender: TObject);
begin
  if not (HakAkses('gdSetting')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalam MENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  application.CreateForm(TF_cari, F_cari);
  with F_cari do
  try
    _SQLi := 'SELECT kd_jenis, n_jenis FROM tb_jenis';
    tblcap[0] := 'No';
    tblCap[1] := 'Deskripsi';
    Caption := 'Daftar Jenis Barang';
    cariT := 1;
    tampil_button(true, False);
    ShowModal;
  finally
    close;
  end;
end;

procedure TF_utama.ac_golonganExecute(Sender: TObject);
begin
  if not (HakAkses('gdSetting')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalam MENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  application.CreateForm(TF_cari, F_cari);
  with F_cari do
  try
    _SQLi := 'SELECT kd_jenis, kd_golbrg, n_golbrg FROM tb_golongan';
    tblCap[0] := 'kd Jenis';
    tblcap[1] := 'Kd Gol';
    tblCap[2] := 'Deskripsi';
    Caption := 'Daftar Golongan Barang';
    cariT := 2;
    tampil_button(true, False);
    ShowModal;
  finally
    close;
  end;
end;

procedure TF_utama.ac_kategoriExecute(Sender: TObject);
begin
  if not (HakAkses('gdSetting')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalam MENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  application.CreateForm(TF_cari, F_cari);
  with F_cari do
  try
    _SQLi := 'SELECT tag, n_kategori FROM tb_kategori';
    tblcap[0] := 'No';
    tblCap[1] := 'Deskripsi';
    Caption := 'Daftar Kategori Barang';
    cariT := 4;
    tampil_button(true, False);
    ShowModal;
  finally
    close;
  end;
end;

procedure TF_utama.ac_merkExecute(Sender: TObject);
begin
  if not (HakAkses('gdSetting')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalam MENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  application.CreateForm(TF_cari, F_cari);
  with F_cari do
  try
    _SQLi := 'SELECT kd_merk, n_merk FROM tb_merk';
    tblcap[0] := 'No';
    tblCap[1] := 'Deskripsi';
    Caption := 'Daftar Merk Barang';
    cariT := 3;
    tampil_button(true, False);
    ShowModal;
  finally
    close;
  end;
end;

procedure TF_utama.Ac_supplierExecute(Sender: TObject);
begin
  if not (HakAkses('gdMaster')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalam MENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  application.CreateForm(TF_cari, F_cari);
  with F_cari do
  try
    _SQLi := Format('SELECT kode, n_supp FROM tb_supp WHERE kd_perusahaan = "%s"',
      [dm.kd_perusahaan]);

    tblcap[0] := 'Kode';
    tblCap[1] := 'Nama Supplier';
    Caption := 'Daftar Supplier';
    cariT := 9;
    tampil_button(true, False);
    ShowModal;
  finally
    close;
  end;
end;

procedure TF_utama.Ac_satuanExecute(Sender: TObject);
begin
  if not (HakAkses('gdSetting')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalam MENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  application.CreateForm(TF_cari, F_cari);
  with F_cari do
  try
    _SQLi := 'SELECT kd_satuan, n_satuan, n_singkat FROM tb_satuan';
    tblcap[0] := 'No';
    tblCap[1] := 'Deskripsi';
    tblCap[2] := 'Singkatan';
    Caption := 'Daftar Satuan';
    tampil_button(true, False);
    ShowModal;
  finally
    close;
  end;
end;

procedure TF_utama.ac_purchaseExecute(Sender: TObject);
begin
  if not (HakAkses('gdTrPO')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalam MENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  application.CreateForm(TF_purchase, F_purchase);
  F_purchase.Show;
end;

procedure TF_utama.ac_barang_suppExecute(Sender: TObject);
begin
  if not (HakAkses('gdInvBrgSupp')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalam MENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  application.CreateForm(TF_barang_supp, F_barang_supp);
  F_barang_supp.ShowModal;
end;

procedure TF_utama.ac_planogramExecute(Sender: TObject);
begin
  if not (HakAkses('gdInvPlano')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalam MENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  application.CreateForm(TF_planogram, F_planogram);
  F_planogram.ShowModal;
end;

procedure TF_utama.FormShow(Sender: TObject);
var
  LSql : string;
begin
  cek_update;
  sb.Panels[9].Text := 'Versi: ' + FVersion.AsString;
  pc.ActivePage := ts_master;

  dm.metu_kabeh := False;

  sb.Panels[2].Text := dm.db_conn.Database + '@' + dm.db_conn.Server;
  if (dm.kd_perusahaan = '') then
    LSql := 'SELECT * FROM tb_company LIMIT 1' else
    LSql := Format('SELECT * FROM tb_company WHERE kd_perusahaan = "%s"',
      [dm.kd_perusahaan]);

  fungsi.SQLExec(dm.Q_Show, LSql, True);

  if dm.Q_Show.Eof then
  begin
    ShowMessage('Tidak Ada Perusahaan yang terdaftar di database.');
    Application.Terminate;
  end;

  dm.kd_perusahaan := dm.Q_Show.fieldbyname('kd_perusahaan').AsString;
  sb.Panels[3].Text := dm.kd_perusahaan;
  dm.n_perusahaan := dm.Q_Show.fieldbyname('n_perusahaan').AsString;
  sb.Panels[4].Text := dm.n_perusahaan;

  sb.Panels[8].Text := dm.Q_Show.fieldbyname('ket').AsString;

  PostMessage(Self.Handle, WM_AFTER_SHOW, 0, 0);
end;

procedure TF_utama.ac_custExecute(Sender: TObject);
begin
  if not (HakAkses('gdMaster')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalam MENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  application.CreateForm(TF_cari, F_cari);
  with F_cari do
  try
    _SQLi := Format('SELECT kd_pelanggan, n_pelanggan FROM tb_pelanggan ' +
      'WHERE kd_perusahaan="%s"', [dm.kd_perusahaan]);

    tblcap[0] := 'Kode';
    tblCap[1] := 'Nama Pelanggan';
    Caption := 'Daftar Pelanggan';
    CariT := 11;
    tampil_button(true, False);
    ShowModal;
  finally
    close;
  end;
end;

procedure TF_utama.ac_userExecute(Sender: TObject);
begin
  if not (HakAkses('admin')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalam MENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  application.CreateForm(TF_cari, F_cari);
  with F_cari do
  try
    _SQLi := 'SELECT kd_user, n_user FROM tb_user where aktif = "Y"';

    tblcap[0] := 'Kode';
    tblCap[1] := 'Nama Pengguna';
    Caption := 'Daftar Pengguna';
    CariT := 12;
    tampil_button(true, False);
    ShowModal;
  finally
    close;
  end;

end;

procedure TF_utama.ac_list_purchaseExecute(Sender: TObject);
begin
  if F_List_purchase = nil then
    application.CreateForm(TF_list_purchase, F_list_purchase);

  F_list_purchase.Show;
end;

procedure TF_utama.ac_list_receiptExecute(Sender: TObject);
begin
  if F_list_receipt = nil then
    application.CreateForm(TF_list_receipt, F_list_receipt);

  F_list_receipt.Show;
end;

procedure TF_utama.ac_list_returnExecute(Sender: TObject);
begin
  if F_list_return = nil then
    application.CreateForm(TF_list_return, F_list_return);

  F_list_return.Show;
end;

procedure TF_utama.FormClose(Sender: TObject; var Action: TCloseAction);
var
  appINI: TIniFile;
begin
  appINI := TIniFile.Create(dm.AppPath + 'gain.ini');
  appINI.WriteString('gudang', 'kd_perusahaan', dm.kd_perusahaan);
  appINI.Free;

  dm.metu_kabeh := True;
  dm.db_conn.Connected := false;

  action := cafree;
  F_utama := nil;
end;

procedure TF_utama.Action1Execute(Sender: TObject);
begin
  close;
end;

procedure TF_utama.ac_lapExecute(Sender: TObject);
begin
  Application.CreateForm(TF_toko, F_toko);
  F_toko.ShowModal;
end;

procedure TF_utama.Timer1Timer(Sender: TObject);
var
  days: array[1..7] of string;
begin
  if sb.Panels[0].Text = '' then
  begin
    ShowMessage('kode user kosong... lakukan login ulang...');
    Timer1.Enabled := False;
    Exit;
  end;

  days[1] := 'Minggu';
  days[2] := 'Senin';
  days[3] := 'Selasa';
  days[4] := 'Rabu';
  days[5] := 'Kamis';
  days[6] := 'Jumat';
  days[7] := 'Sabtu';

  try
    fungsi.SQLExec(Q_time, 'SELECT NOW() as sekarang', True);

    sb.Panels[5].Text := days[DayOfWeek(Q_time.fieldbyname('sekarang').AsDateTime)];
    sb.Panels[6].Text := formatdatetime('dd mmm yyyy', Q_time.fieldbyname('sekarang').AsDateTime);
    dm.waktu_sekarang := Q_time.fieldbyname('sekarang').AsDateTime;
    sb.Panels[7].Text := FormatDateTime('hh:nn:ss', Q_time.fieldbyname('sekarang').AsDateTime);
  except
    Timer1.Enabled := False;
    if (MessageDlg('KONEKSI TERPUTUS DENGAN SERVER...' + #13 + #10 + 'coba ' +
      'hubungkan kembali??????', mtWarning, [mbOK], 0) = mrOk) then
    begin
      Timer1.Enabled := True;
    end;
  end;

  if sb.Panels[7].Text >= '23:59:00' then
  begin
    if F_hari = nil then
    begin
      Application.CreateForm(TF_hari, F_hari);
      F_hari.ShowModal;
    end;
  end
  else
  begin
    if F_hari <> nil then
      F_hari.Close;
  end;

end;

procedure TF_utama.HidePanelControl1Click(Sender: TObject);
begin
  if (hidepanelcontrol1.Checked = true) then
  begin
    hidepanelcontrol1.Checked := false;
    pc.Visible := true;
  end
  else
  begin
    hidepanelcontrol1.Checked := true;
    pc.Visible := false;
  end;
end;

procedure TF_utama.UbahSkin1Click(Sender: TObject);
begin
  selectskin(dm.sm);
end;

procedure TF_utama.LogOut1Click(Sender: TObject);
begin
  if F_utama.MDIChildCount <> 0 then
  begin
    showmessage('tutup dulu semua windows...');
    exit;
  end;

  dm.kd_pengguna := 'USER';
  sb.Panels[0].Text := dm.kd_pengguna;
  sb.Panels[1].Text := 'NAMA USER';
  dm.CanLogin := False;

  application.CreateForm(TF_login, F_login);
  F_login.sb.Panels[0].Text := dm.kd_perusahaan;
  F_login.sb.Panels[1].Text := sb.Panels[4].Text;
  F_login.ShowModal;
  if not (dm.CanLogin) then
    Close;
end;

procedure TF_utama.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  FormatSettings.ThousandSeparator := ',';
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  FormatSettings.ShortTimeFormat := 'hh:nn:ss';

  FVersion := TAppVersion.Create(Application.ExeName);
end;

procedure TF_utama.ac_kirimExecute(Sender: TObject);
begin
  if not (HakAkses('gdTrKirim')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalam MENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  application.CreateForm(TF_kirim, F_kirim);
  F_kirim.Show;
end;

procedure TF_utama.ac_list_kirimExecute(Sender: TObject);
begin
  if F_List_kirim = nil then
    application.CreateForm(TF_List_kirim, F_List_kirim);

  F_List_kirim.Show;
end;

procedure TF_utama.ac_updateExecute(Sender: TObject);
var
  W: Integer;
begin
  if not (HakAkses('gdInvBrgUpdate')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalam MENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  if MessageDlg('Proses ini akan mengganti (insert Update dan Delete) ' + #13 +
    #10 + 'seluruh ' + 'data  barang dan harga sesuai dengan data ' + #13 + #10
    + 'yang ada dalam database Pusat ' + 'dan ' + #13 + #10 +
    'mungkin akan berlangsung untuk beberapa menit...' + #13 + #10 + '' + #13 +
    #10 + 'Yakinkah ' + 'Anda akan mengUpdate data ini???', mtWarning, [mbYes,
    mbNo], 0) = mrno then
    Exit;

//untuk update data barang dan data harga dari pusat
  sg_update.Progress := 0;
  sg_update.Suffix := ' %(Menambah Barang Baru)';
  sg_update.Visible := True;
//memasukkan barang baru
  dm.db_conn.StartTransaction;
  try
    fungsi.SQLExec(dm.Q_Exe,
      'INSERT IGNORE INTO tb_barang(kd_perusahaan,kd_barang,n_barang,kd_jenis,kd_kategori,kd_golbrg, ' +
      'kd_merk,kd_sat1,kd_sat2,kd_sat3,barcode1,barcode2,barcode3,Qty1,Qty2,minstok,maxstok, ' +
      'leadtime,aktif,minor,hpp_ahir,hpp_aktif,`update`) SELECT "' + dm.kd_perusahaan
      + '",kd_barang,n_barang,' +
      'kd_jenis,kd_kategori,kd_golbrg,kd_merk,kd_sat1,kd_sat2,kd_sat3,barcode1,barcode2,' +
      'barcode3,Qty1,Qty2,minstok,maxstok,leadtime,aktif,minor,hpp_ahir,hpp_aktif,`update` ' +
      'FROM tb_barang WHERE kd_perusahaan = "' + SB.Panels[8].Text + '"', False);

    sg_update.Progress := 10;
    sg_update.Suffix := ' %(Memperbarui data Barang)';

//mengupdate barang
    fungsi.SQLExec(dm.Q_Exe,
      'UPDATE tb_barang B2,tb_barang B1 SET B2.n_barang=B1.n_barang, ' +
      'B2.kd_jenis=B1.kd_jenis,B2.kd_kategori=B1.kd_kategori,B2.kd_golbrg=B1.kd_golbrg, ' +
      'B2.kd_merk=B1.kd_merk,B2.kd_sat1=B1.kd_sat1,B2.kd_sat2=B1.kd_sat2,B2.kd_sat3=B1.kd_sat3, ' +
      'B2.barcode1=B1.barcode1,B2.barcode2=B1.barcode2,B2.barcode3=B1.barcode3,B2.Qty1=B1.Qty1, ' +
      'B2.Qty2=B1.Qty2,B2.hpp_ahir=B1.hpp_ahir,B2.hpp_aktif=B1.hpp_aktif,B2.`update`=B1.`update` ' +
      'WHERE B2.kd_barang=B1.kd_barang AND B2.kd_perusahaan="' + dm.kd_perusahaan
      + '" AND B1.kd_perusahaan="' + SB.Panels[8].Text + '"', False);

    sg_update.Progress := 20;
    sg_update.Suffix := ' %(Menghapus data Barang lama)';

    fungsi.SQLExec(dm.Q_temp,
      'SELECT kd_barang from tb_barang WHERE kd_perusahaan = "' + dm.kd_perusahaan
      + '" AND kd_barang NOT IN (SELECT kd_barang FROM tb_barang WHERE kd_perusahaan="'
      + SB.Panels[8].Text + '")', True);

    if not (dm.Q_temp.Eof) then
    begin
//menghapus barang
      dm.Q_temp.First;
      for W := 1 to dm.Q_temp.RecordCount do
      begin
        fungsi.SQLExec(dm.Q_Exe, 'delete from tb_barang ' +
          'WHERE kd_perusahaan = "' + dm.kd_perusahaan + '" AND ' +
          'kd_barang = "' + dm.Q_temp.fieldbyname('kd_barang').AsString + '"', False);

        fungsi.SQLExec(dm.Q_Exe, 'delete from tb_mutasi ' +
          'WHERE kd_perusahaan = "' + dm.kd_perusahaan + '" AND ' +
          'kd_barang = "' + dm.Q_temp.fieldbyname('kd_barang').AsString + '"', False);

        fungsi.SQLExec(dm.Q_Exe, 'delete from tb_barang_supp ' +
          'WHERE kd_perusahaan = "' + dm.kd_perusahaan + '" AND ' +
          'kd_barang = "' + dm.Q_temp.fieldbyname('kd_barang').AsString + '"', False);

        fungsi.SQLExec(dm.Q_Exe, 'delete from tb_planogram ' +
          'WHERE kd_perusahaan = "' + dm.kd_perusahaan + '" AND ' +
          'kd_barang = "' + dm.Q_temp.fieldbyname('kd_barang').AsString + '"', False);

        dm.Q_temp.Next;
      end;
    end;

    sg_update.Progress := 30;
    sg_update.Suffix := ' %(Menambah Harga Barang Baru)';

    fungsi.SQLExec(dm.Q_Exe,
      'INSERT IGNORE INTO tb_barang_harga(kd_perusahaan,kd_barang,kd_macam_harga, ' +
      'laba,harga_jual1,harga_jual2,harga_jual3,kode_user,`update`,awal,ahir,diskon) ' +
      'SELECT "' + dm.kd_perusahaan +
      '",kd_barang,kd_macam_harga,laba,harga_jual1,harga_jual2,harga_jual3, ' +
      'kode_user,`update`,awal,ahir,diskon FROM tb_barang_harga WHERE kd_perusahaan = "' +
      SB.Panels[8].Text + '"', False);

    sg_update.Progress := 40;
    sg_update.Suffix := ' %(Memperbarui Harga Barang)';

    fungsi.SQLExec(dm.Q_Exe, 'UPDATE tb_barang_harga H1,tb_barang_harga H2 SET '
      + 'H1.laba=H2.laba,H1.harga_jual1=H2.harga_jual1, ' +
      'H1.harga_jual2=H2.harga_jual2,H1.harga_jual3=H2.harga_jual3, ' +
      'H1.kode_user=H2.kode_user,H1.`update`=H2.`update`,H1.awal=H2.awal,H1.ahir=H2.ahir,' +
      'H1.diskon =H2.diskon WHERE H1.kd_barang=H2.kd_barang AND ' +
      'H1.kd_macam_harga=H2.kd_macam_harga AND ' + 'H1.kd_perusahaan="' + dm.kd_perusahaan
      + '" AND H2.kd_perusahaan="' + SB.Panels[8].Text + '"', False);

    sg_update.Progress := 50;
    sg_update.Suffix := ' %(Proses hapus data harga barang...)';

    fungsi.SQLExec(dm.Q_temp,
      'SELECT kd_barang from tb_barang_harga WHERE kd_perusahaan = "' + dm.kd_perusahaan
      + '" AND kd_barang NOT IN (SELECT kd_barang FROM tb_barang_harga WHERE kd_perusahaan="'
      + SB.Panels[8].Text + '")', True);

    if not (dm.Q_temp.Eof) then
    begin
//menghapus barang
      dm.Q_temp.First;
      for W := 1 to dm.Q_temp.RecordCount do
      begin
        fungsi.SQLExec(dm.Q_Exe, 'delete from tb_barang_harga ' +
          'WHERE kd_perusahaan = "' + dm.kd_perusahaan + '" AND ' +
          'kd_barang = "' + dm.Q_temp.fieldbyname('kd_barang').AsString + '"', False);
        dm.Q_temp.Next;
      end;
    end;

    sg_update.Progress := 60;
    sg_update.Suffix := ' %(Proses memasukkan barang supp...)';

    fungsi.SQLExec(dm.Q_Exe,
      'INSERT IGNORE INTO tb_barang_supp(kd_perusahaan,kd_suplier,kd_barang,`update`) SELECT "' +
      dm.kd_perusahaan + '","' + SB.Panels[8].Text + '",kd_barang,date(now()) '
      + 'FROM tb_barang WHERE kd_perusahaan = "' + SB.Panels[8].Text + '"', False);

    sg_update.Progress := 70;
    sg_update.Suffix := ' %(Proses Update selesai)';

    sg_update.Visible := False;
    dm.db_conn.Commit;
    ShowMessage('proses update barang dan harga Berhasil....');
  except
    on E: Exception do
    begin
      dm.db_conn.Rollback;
      sg_update.Visible := False;
      ShowMessage('proses update barang dan harga gagal.... '#10#13'' + e.Message);
    end;
  end;
end;

procedure TF_utama.ac_list_salesExecute(Sender: TObject);
begin
  if F_List_sales = nil then
    application.CreateForm(TF_List_sales, F_List_sales);

  F_List_sales.Show;
end;

procedure TF_utama.ac_list_soExecute(Sender: TObject);
begin
  if F_list_SO = nil then
    application.CreateForm(TF_list_SO, F_list_SO);

  F_list_SO.Show;
end;

procedure TF_utama.tc_childChange(Sender: TObject);
var
  cHandle: Cardinal;
  k: Integer;
begin
  if tc_child.Tag = -1 then
    Exit;

  cHandle := Cardinal(tc_child.Tabs.Objects[tc_child.TabIndex]);

  for k := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[k].Handle = cHandle then
    begin
      MDIChildren[k].Show;
      Break;
    end;
  end;
end;

procedure TF_utama.MiTutupSemuaClick(Sender: TObject);
var
  h: Integer;
begin
  for h := 0 to F_utama.MDIChildCount - 1 do
  begin
    F_utama.MDIChildren[h].Close;
  end;
  tc_child.Visible := False;
end;

procedure TF_utama.MiTutupClick(Sender: TObject);
var
  cHandle: Cardinal;
  k: Integer;
begin
  if tc_child.Tag = -1 then
    Exit;

  cHandle := Cardinal(tc_child.Tabs.Objects[tc_child.TabIndex]);

  for k := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[k].Handle = cHandle then
    begin
      MDIChildren[k].Close;
      Break;
    end;
  end;
end;

procedure TF_utama.MiTutupSemuaKecualiIniClick(Sender: TObject);
var
  cHandle: Cardinal;
  k: Integer;
begin
  if tc_child.Tag = -1 then
    Exit;

  cHandle := Cardinal(tc_child.Tabs.Objects[tc_child.TabIndex]);

  for k := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[k].Handle <> cHandle then
    begin
      MDIChildren[k].Close;
    end;
  end;
  tc_child.Visible := False;
end;

procedure TF_utama.ac_return_kirimExecute(Sender: TObject);
begin
  if not (HakAkses('gdTrReturnKirim')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalam MENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  application.CreateForm(TF_return_kirim, F_return_kirim);
  F_return_kirim.Show;
end;

procedure TF_utama.ac_list_return_kirimExecute(Sender: TObject);
begin
  if F_list_return_kirim = nil then
    application.CreateForm(TF_list_return_kirim, F_list_return_kirim);

  F_list_return_kirim.Show;
end;

procedure TF_utama.panel_auto_width;
var
  x: integer;
  y: string;
begin
  for x := 0 to sb.Panels.Count - 1 do
  begin
    y := sb.Panels[x].text;
    sb.Panels[x].Width := sb.Canvas.TextWidth(y) + 30;
  end;
end;

procedure TF_utama.ac_realcardExecute(Sender: TObject);
begin
  application.CreateForm(TF_realCard, F_realCard);
  F_realCard.ShowModal;
end;

function TF_utama.HakAkses(kunci: string): Boolean;
var
  sql: string;
begin
  sql := Format('SELECT %s FROM tb_user_company WHERE kd_user="%s" ' +
    'AND kd_perusahaan="%s"', [kunci, dm.kd_pengguna, dm.kd_perusahaan]);

  fungsi.SQLExec(dm.Q_temp, sql, true);
  Result := dm.Q_temp.FieldByName(kunci).AsBoolean;
end;

procedure TF_utama.SbubahPasswordClick(Sender: TObject);
begin
  Application.CreateForm(TF_ubahPassword, F_ubahPassword);
  F_ubahPassword.ShowModal;
end;

procedure TF_utama.ac_cekUpdateExecute(Sender: TObject);
begin
  cek_update;
end;

procedure TF_utama.ac_list_return_jualExecute(Sender: TObject);
begin
  if F_list_return_jual = nil then
    application.CreateForm(TF_list_return_jual, F_list_return_jual);

  F_list_return_jual.Show;
end;

procedure TF_utama.cek_update;
var
  LVersiDB, LVersiAPP: TVersion;
  LSql :string;
begin
  LVersiAPP := FVersion;
  LSql := 'SELECT versi_terbaru FROM app_versi WHERE kode = "gudang.exe"';
  fungsi.SQLExec(dm.Q_Show, LSql, true);
  LVersiDB := TVersion.Create(dm.Q_Show.FieldByName('versi_terbaru').AsString);

  if CompareVersion(LVersiDB, LVersiAPP) = vHigher then
  begin
    ShowMessage('APLIKASI GUDANG TIDAK DAPAT DIJALANKAN' + #13#10 +
      'aplikasi terbaru dengan versi : ' + LVersiDB.AsString + #13#10 + 'SUDAH DIRILIS...');

    Application.Terminate;
  end;
  LVersiDB.Free;
end;

procedure TF_utama.ac_barcodeExecute(Sender: TObject);
begin
  application.CreateForm(TF_Barcode, F_Barcode);
  F_Barcode.ShowModal;
end;

procedure TF_utama.SbGroupBarangClick(Sender: TObject);
begin
  if FGroupBarang = nil then
    application.CreateForm(TFGroupBarang, FGroupBarang);

  FGroupBarang.Show;
end;

procedure TF_utama.ac_settingExecute(Sender: TObject);
begin
  if not (HakAkses('admin')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalam MENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  Application.CreateForm(TFrmSetting, FrmSetting);
  FrmSetting.ShowModal;
end;

procedure TF_utama.FormDestroy(Sender: TObject);
begin
  FVersion.Free;
end;

end.


