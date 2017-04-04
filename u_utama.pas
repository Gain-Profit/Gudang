unit u_utama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sSkinProvider, ComCtrls, sStatusBar, Menus, ActnList,
  XPStyleActnCtrls, ActnMan, UFungsi, sPageControl, Buttons, sSpeedButton,
  ExtCtrls, sPanel, inifiles, shellapi, DB, sGauge, sTabControl, cxStyles,
  cxGraphics, cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxControls, cxGridCustomView, cxClasses,
  cxGrid, MemDS, DBAccess, MyAccess;

const
  WM_AFTER_SHOW = WM_USER + 300; // custom message

type
  Tf_utama = class(TForm)
    sSkinProvider1: TsSkinProvider;
    sb: TsStatusBar;
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
    sb_kirim_data: TsSpeedButton;
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
    CentralofProfitHelp1: TMenuItem;
    spdbtnac_return: TsSpeedButton;
    ac_kirim: TAction;
    spdbtnkirim: TsSpeedButton;
    ac_list_kirim: TAction;
    KirimData1: TMenuItem;
    DaftarKirimBarang1: TMenuItem;
    sb_lap: TsSpeedButton;
    ac_kirim_data: TAction;
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
    utupSemua1: TMenuItem;
    utupSemuaKecualiini1: TMenuItem;
    utup1: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    ac_realcard: TAction;
    Q_time: TMyQuery;
    SbubahPassword: TsSpeedButton;
    mniN6: TMenuItem;
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
    procedure CentralofProfitHelp1Click(Sender: TObject);
    procedure ac_kirimExecute(Sender: TObject);
    procedure ac_list_kirimExecute(Sender: TObject);
    procedure ac_kirim_dataExecute(Sender: TObject);
    procedure ac_updateExecute(Sender: TObject);
    procedure ac_list_salesExecute(Sender: TObject);
    procedure ac_list_soExecute(Sender: TObject);
    procedure MDIChildCreated(const childHandle: THandle);
    procedure MDIChildDestroyed(const childHandle: THandle);
    procedure tc_childChange(Sender: TObject);
    procedure utupSemua1Click(Sender: TObject);
    procedure utup1Click(Sender: TObject);
    procedure utupSemuaKecualiini1Click(Sender: TObject);
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
  private
    procedure WmAfterShow(var Msg: TMessage); message WM_AFTER_SHOW;
    { Private declarations }
  public
    koneksi: boolean;
    function HakAkses(kunci: string): Boolean;
    { Public declarations }
  end;

var
  f_utama: Tf_utama;

implementation

uses
  u_barang, u_harga, u_return, u_cari, u_dm, u_purchase, u_barang_supplier,
  u_planogram, u_list_purchase, u_list_receipt, u_list_return, u_Login,
  acselectskin, u_receipt, u_kirim, u_list_kirim, u_kirim_data, u_list_jual,
  u_list_stock_opname, u_return_kirim, u_list_return_kirim, u_laporan,
  u_ganti_hari, u_ubah_password, u_list_return_jual, u_barcode, u_real_card,
  u_Group_Barang, u_settings;

{$R *.dfm}

//add a tab for an MDI child
procedure tf_utama.MDIChildCreated(const childHandle: THandle);
begin
  tc_child.Tabs.AddObject(TForm(FindControl(childHandle)).Caption, TObject(childHandle));
  tc_child.TabIndex := -1 + tc_child.Tabs.Count;

  if f_utama.MDIChildCount > 1 then
  begin
    tc_child.Visible := True;
  end;
end;

//remove a tab for this MDI child
procedure tf_utama.MDIChildDestroyed(const childHandle: THandle);
var
  idx: Integer;
begin
  idx := tc_child.Tabs.IndexOfObject(TObject(childHandle));
  tc_child.Tabs.Delete(idx);

  if f_utama.MDIChildCount = 2 then
    tc_child.Visible := False;
end;

procedure Tf_utama.WmAfterShow(var Msg: TMessage);
begin
  dm.sm.Active := true;

  application.CreateForm(tF_login, f_login);
  f_login.sb.Panels[0].Text := dm.kd_perusahaan;
  f_login.sb.Panels[1].Text := sb.Panels[4].Text;
  f_login.ShowModal;
  if not (dm.CanLogin) then
    Close;
end;

procedure Tf_utama.ac_barangExecute(Sender: TObject);
begin
  if not (HakAkses('gdInvBarang')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalamMENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  if f_barang = nil then
    application.CreateForm(tf_barang, f_barang);

  f_barang.Show;
end;

procedure Tf_utama.ac_hargaExecute(Sender: TObject);
begin
  if not (HakAkses('gdInvHarga')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalamMENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  if f_edit_harga = nil then
    application.CreateForm(tf_edit_harga, f_edit_harga);

  f_edit_harga.Show;
end;

procedure Tf_utama.ac_receiptExecute(Sender: TObject);
begin
  if not (HakAkses('gdTrRO')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalamMENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  application.CreateForm(tf_RO, f_RO);
  f_RO.Show;
end;

procedure Tf_utama.ac_returnExecute(Sender: TObject);
begin
  if not (HakAkses('gdTrReturn')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalamMENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  application.CreateForm(tf_return, f_return);
  f_return.Show;
end;

procedure Tf_utama.ac_companyExecute(Sender: TObject);
begin
  if not (HakAkses('gdMaster')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalamMENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi := 'select kd_perusahaan, n_perusahaan from tb_company';
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

procedure Tf_utama.ac_jenisExecute(Sender: TObject);
begin
  if not (HakAkses('gdSetting')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalamMENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi := 'select kd_jenis,n_jenis from tb_jenis';
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

procedure Tf_utama.ac_golonganExecute(Sender: TObject);
begin
  if not (HakAkses('gdSetting')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalamMENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi := 'select kd_jenis, kd_golbrg, n_golbrg from tb_golongan';
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

procedure Tf_utama.ac_kategoriExecute(Sender: TObject);
begin
  if not (HakAkses('gdSetting')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalamMENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi := 'select tag,n_kategori from tb_kategori';
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

procedure Tf_utama.ac_merkExecute(Sender: TObject);
begin
  if not (HakAkses('gdSetting')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalamMENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi := 'select kd_merk,n_merk from tb_merk';
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

procedure Tf_utama.Ac_supplierExecute(Sender: TObject);
begin
  if not (HakAkses('gdMaster')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalamMENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi := 'select kode,n_supp from tb_supp where kd_perusahaan = "' + dm.kd_perusahaan
      + '"';
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

procedure Tf_utama.Ac_satuanExecute(Sender: TObject);
begin
  if not (HakAkses('gdSetting')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalamMENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi := 'select kd_satuan,n_satuan,n_singkat from tb_satuan';
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

procedure Tf_utama.ac_purchaseExecute(Sender: TObject);
begin
  if not (HakAkses('gdTrPO')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalamMENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  application.CreateForm(tf_purchase, f_purchase);
  f_purchase.Show;
end;

procedure Tf_utama.ac_barang_suppExecute(Sender: TObject);
begin
  if not (HakAkses('gdInvBrgSupp')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalamMENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  application.CreateForm(tf_barang_supp, f_barang_supp);
  f_barang_supp.ShowModal;
end;

procedure Tf_utama.ac_planogramExecute(Sender: TObject);
begin
  if not (HakAkses('gdInvPlano')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalamMENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  application.CreateForm(tf_planogram, f_planogram);
  f_planogram.ShowModal;
end;

procedure Tf_utama.FormShow(Sender: TObject);
begin
  cek_update;
  sb.Panels[9].Text := 'Versi: ' + fungsi.GetVersiApp;
  pc.ActivePage := ts_master;

  dm.metu_kabeh := False;

  sb.Panels[2].Text := dm.db_conn.Database + '@' + dm.db_conn.Server;
  sb.Panels[3].Text := dm.kd_perusahaan;
  fungsi.SQLExec(dm.Q_Show, 'select * from tb_company where kd_perusahaan = "' +
    dm.kd_perusahaan + '"', true);
  sb.Panels[4].Text := dm.Q_Show.fieldbyname('n_perusahaan').AsString;

  sb.Panels[8].Text := dm.Q_Show.fieldbyname('ket').AsString;

  PostMessage(Self.Handle, WM_AFTER_SHOW, 0, 0);
end;

procedure Tf_utama.ac_custExecute(Sender: TObject);
begin
  if not (HakAkses('gdMaster')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalamMENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi :=
      'select kd_pelanggan,n_pelanggan from tb_pelanggan where kd_perusahaan="' + dm.kd_perusahaan
      + '"';
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

procedure Tf_utama.ac_userExecute(Sender: TObject);
begin
  if not (HakAkses('admin')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalamMENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi := 'SELECT kd_user, n_user FROM tb_user where aktif ="Y"';

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

procedure Tf_utama.ac_list_purchaseExecute(Sender: TObject);
begin
  if f_List_purchase = nil then
    application.CreateForm(tf_list_purchase, f_list_purchase);

  f_list_purchase.Show;
end;

procedure Tf_utama.ac_list_receiptExecute(Sender: TObject);
begin
  if f_list_receipt = nil then
    application.CreateForm(tf_list_receipt, f_list_receipt);

  f_list_receipt.Show;
end;

procedure Tf_utama.ac_list_returnExecute(Sender: TObject);
begin
  if f_list_return = nil then
    application.CreateForm(tf_list_return, f_list_return);

  f_list_return.Show;
end;

procedure Tf_utama.FormClose(Sender: TObject; var Action: TCloseAction);
var
  appINI: TIniFile;
begin
  appINI := TIniFile.Create(dm.AppPath + 'gain.ini');
  appINI.WriteString('gudang', 'kd_perusahaan', dm.kd_perusahaan);
  appINI.Free;

  dm.metu_kabeh := True;
  dm.db_conn.Connected := false;

  action := cafree;
  f_utama := nil;
end;

procedure Tf_utama.Action1Execute(Sender: TObject);
begin
  close;
end;

procedure Tf_utama.ac_lapExecute(Sender: TObject);
begin
  Application.CreateForm(TF_toko, F_toko);
  F_toko.ShowModal;
end;

procedure Tf_utama.Timer1Timer(Sender: TObject);
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
    fungsi.SQLExec(Q_time, 'select now() as sekarang', True);

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
    if f_hari = nil then
    begin
      Application.CreateForm(Tf_hari, f_hari);
      f_hari.ShowModal;
    end;
  end
  else
  begin
    if f_hari <> nil then
      f_hari.Close;
  end;

end;

procedure Tf_utama.HidePanelControl1Click(Sender: TObject);
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

procedure Tf_utama.UbahSkin1Click(Sender: TObject);
begin
  selectskin(dm.sm);
end;

procedure Tf_utama.LogOut1Click(Sender: TObject);
begin
  if f_utama.MDIChildCount <> 0 then
  begin
    showmessage('tutup dulu semua windows...');
    exit;
  end;

  dm.kd_pengguna := 'USER';
  sb.Panels[0].Text := dm.kd_pengguna;
  sb.Panels[1].Text := 'NAMA USER';
  dm.CanLogin := False;

  application.CreateForm(tF_login, f_login);
  f_login.sb.Panels[0].Text := dm.kd_perusahaan;
  f_login.sb.Panels[1].Text := sb.Panels[4].Text;
  f_login.ShowModal;
  if not (dm.CanLogin) then
    Close;
end;

procedure Tf_utama.FormCreate(Sender: TObject);
begin
  DecimalSeparator := '.';
  ThousandSeparator := ',';
  ShortDateFormat := 'dd/mm/yyyy';
  ShortTimeFormat := 'hh:nn:ss';
end;

procedure Tf_utama.CentralofProfitHelp1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PChar('hh.exe'), PChar(dm.wpath +
    'tools/bantuan.chm::/Central_of_Profit.htm'), nil, SW_SHOW);
end;

procedure Tf_utama.ac_kirimExecute(Sender: TObject);
begin
  if not (HakAkses('gdTrKirim')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalamMENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  application.CreateForm(tF_kirim, F_kirim);
  F_kirim.Show;
end;

procedure Tf_utama.ac_list_kirimExecute(Sender: TObject);
begin
  if f_List_kirim = nil then
    application.CreateForm(tf_List_kirim, f_List_kirim);

  f_List_kirim.Show;
end;

procedure Tf_utama.ac_kirim_dataExecute(Sender: TObject);
begin
  if not (HakAkses('gdInvBrgUpdate')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalamMENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;
  application.CreateForm(TF_kirim_data, F_kirim_data);
  F_kirim_data.ShowModal;
end;

procedure Tf_utama.ac_updateExecute(Sender: TObject);
var
  W: Integer;
begin
  if not (HakAkses('gdInvBrgUpdate')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalamMENU ini...', mtWarning, [mbOk], 0);
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

procedure Tf_utama.ac_list_salesExecute(Sender: TObject);
begin
  if f_List_sales = nil then
    application.CreateForm(tf_List_sales, f_List_sales);

  f_List_sales.Show;
end;

procedure Tf_utama.ac_list_soExecute(Sender: TObject);
begin
  if f_list_SO = nil then
    application.CreateForm(tf_list_SO, f_list_SO);

  f_list_SO.Show;
end;

procedure Tf_utama.tc_childChange(Sender: TObject);
var
  cHandle: Integer;
  k: Integer;
begin
  cHandle := Integer(tc_child.Tabs.Objects[tc_child.TabIndex]);

  if tc_child.Tag = -1 then
    Exit;

  for k := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[k].Handle = cHandle then
    begin
      MDIChildren[k].Show;
      Break;
    end;
  end;
end;

procedure Tf_utama.utupSemua1Click(Sender: TObject);
var
  h: Integer;
begin
  for h := 0 to f_utama.MDIChildCount - 1 do
  begin
    f_utama.MDIChildren[h].Close;
  end;
  tc_child.Visible := False;
end;

procedure Tf_utama.utup1Click(Sender: TObject);
var
  cHandle: Integer;
  k: Integer;
begin
  cHandle := Integer(tc_child.Tabs.Objects[tc_child.TabIndex]);

  if tc_child.Tag = -1 then
    Exit;

  for k := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[k].Handle = cHandle then
    begin
      MDIChildren[k].Close;
      Break;
    end;
  end;
end;

procedure Tf_utama.utupSemuaKecualiini1Click(Sender: TObject);
var
  cHandle: Integer;
  k: Integer;
begin
  cHandle := Integer(tc_child.Tabs.Objects[tc_child.TabIndex]);

  if tc_child.Tag = -1 then
    Exit;

  for k := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[k].Handle <> cHandle then
    begin
      MDIChildren[k].Close;
    end;
  end;
  tc_child.Visible := False;
end;

procedure Tf_utama.ac_return_kirimExecute(Sender: TObject);
begin
  if not (HakAkses('gdTrReturnKirim')) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalam MENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  application.CreateForm(tf_return_kirim, f_return_kirim);
  f_return_kirim.Show;
end;

procedure Tf_utama.ac_list_return_kirimExecute(Sender: TObject);
begin
  if f_list_return_kirim = nil then
    application.CreateForm(tf_list_return_kirim, f_list_return_kirim);

  f_list_return_kirim.Show;
end;

procedure Tf_utama.panel_auto_width;
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

procedure Tf_utama.ac_realcardExecute(Sender: TObject);
begin
  application.CreateForm(TF_realCard, F_realCard);
  f_realCard.ShowModal;
end;

function Tf_utama.HakAkses(kunci: string): Boolean;
var
  sql: string;
begin
  sql := 'SELECT ' + kunci + ' FROM tb_user_company WHERE ' + 'kd_user="' + dm.kd_pengguna
    + '" AND kd_perusahaan="' + dm.kd_perusahaan + '"';

  fungsi.SQLExec(dm.Q_temp, sql, true);
  Result := dm.Q_temp.FieldByName(kunci).AsBoolean;
end;

procedure Tf_utama.SbubahPasswordClick(Sender: TObject);
begin
  Application.CreateForm(TF_ubahPassword, F_ubahPassword);
  F_ubahPassword.ShowModal;
end;

procedure Tf_utama.ac_cekUpdateExecute(Sender: TObject);
begin
  cek_update;
end;

procedure Tf_utama.ac_list_return_jualExecute(Sender: TObject);
begin
  if f_list_return_jual = nil then
    application.CreateForm(Tf_list_return_jual, f_list_return_jual);

  f_list_return_jual.Show;
end;

procedure Tf_utama.cek_update;
var
  versiDB, versiAPP, URLDownload: string;
  fileName, UrlDownloadLocal: string;
begin
  versiAPP := fungsi.GetVersiApp;

  fungsi.SQLExec(dm.Q_Show,
    'select versi_terbaru, URLdownload from  app_versi where kode="gudang.exe"', true);
  versiDB := dm.Q_Show.FieldByName('versi_terbaru').AsString;
  URLDownload := dm.Q_Show.FieldByName('URLdownload').AsString;
  fileName := Copy(URLDownload, LastDelimiter('/', URLDownload) + 1, Length(URLDownload));
  UrlDownloadLocal := 'http://' + dm.db_conn.Server + '/GainProfit/' + fileName;

  if versiAPP < versiDB then
  begin
    ShowMessage('APLIKASI GUDANG TIDAK DAPAT DIJALANKAN' + #13#10 +
      'aplikasi terbaru dengan versi : ' + versiDB + #13#10 + 'SUDAH DIRILIS...');

    Application.Terminate;
  end;
end;

procedure Tf_utama.ac_barcodeExecute(Sender: TObject);
begin
  application.CreateForm(Tf_Barcode, f_Barcode);
  f_Barcode.ShowModal;
end;

procedure Tf_utama.SbGroupBarangClick(Sender: TObject);
begin
  if FGroupBarang = nil then
    application.CreateForm(TFGroupBarang, FGroupBarang);

  FGroupBarang.Show;
end;

procedure Tf_utama.ac_settingExecute(Sender: TObject);
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

end.


