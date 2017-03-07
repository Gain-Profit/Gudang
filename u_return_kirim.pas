unit u_return_kirim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxDataStorage, cxEdit,
  cxCurrencyEdit, sDialogs, StdCtrls, sButton, sSkinProvider, sTooledit, sEdit,
  Buttons, sSpeedButton, ExtCtrls, sBevel, sLabel, Mask, sCustomComboEdit,
  sCurrEdit, sCurrencyEdit, sMemo, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxClasses, uTerbilang, cxControls, cxGridCustomView, cxGrid,
  sPanel, UFungsi, cxFilter, cxData, sMaskEdit;

type
  Tf_return_kirim = class(TForm)
    sPanel1: TsPanel;
    panel1: TsPanel;
    Mm_nama: TsMemo;
    ce_harga: TsCurrencyEdit;
    panel2: TsPanel;
    sLabel6: TsLabel;
    sBevel1: TsBevel;
    sLabel1: TsLabel;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    sb_pelanggan: TsSpeedButton;
    sb_cari: TsSpeedButton;
    l_toko: TsLabel;
    sLabel5: TsLabel;
    ed_no_faktur: TsEdit;
    ed_tgl: TsDateEdit;
    ed_pelanggan: TsEdit;
    ed_code: TsEdit;
    ed_fak_kirim: TsEdit;
    panel3: TsPanel;
    ed_nilai_faktur: TsCurrencyEdit;
    panel4: TsPanel;
    sSpeedButton18: TsSpeedButton;
    sPanel2: TsPanel;
    b_simpan_file: TsButton;
    b_load: TsButton;
    spnl1: TsPanel;
    b_print: TsButton;
    b_new: TsButton;
    b_simpan: TsButton;
    od: TsOpenDialog;
    sd: TsSaveDialog;
    sSkinProvider1: TsSkinProvider;
    Grid: TcxGrid;
    TableView: TcxGridTableView;
    ableViewColumn1: TcxGridColumn;
    ableViewColumn2: TcxGridColumn;
    t_view_Qty: TcxGridColumn;
    t_view_harga: TcxGridColumn;
    t_view_total: TcxGridColumn;
    Level: TcxGridLevel;
    b_auto: TsButton;
    l_1: TsLabel;
    l_2: TsLabel;
    l_3: TsLabel;
    l_4: TsLabel;
    t_view_barcode: TcxGridColumn;
    procedure bersih;
    procedure tampil_data;
    procedure CreateRows;
    procedure WMMDIACTIVATE(var msg: TWMMDIACTIVATE); message WM_MDIACTIVATE;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ed_codeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure b_newClick(Sender: TObject);
    procedure sb_pelangganClick(Sender: TObject);
    procedure ed_pelangganKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sb_cariClick(Sender: TObject);
    procedure
      TableViewTcxGridDataControllerTcxDataSummaryFooterSummaryItems4GetText(Sender:
      TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var AText: string);
    procedure b_autoClick(Sender: TObject);
    procedure sSpeedButton18Click(Sender: TObject);
    procedure ed_no_fakturChange(Sender: TObject);
    procedure b_printClick(Sender: TObject);
    procedure b_simpanClick(Sender: TObject);
    procedure ed_fak_kirimChange(Sender: TObject);
    procedure b_simpan_fileClick(Sender: TObject);
    procedure b_loadClick(Sender: TObject);
    procedure ed_codeKeyPress(Sender: TObject; var Key: Char);
    procedure ed_no_fakturKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ed_fak_kirimKeyPress(Sender: TObject; var Key: Char);
    procedure ed_pelangganChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure returnCabang;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_return_kirim: Tf_return_kirim;

implementation

uses
  u_dm, u_cari, u_utama;

{$R *.dfm}

procedure Tf_return_kirim.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
var
  active: TWinControl;
  idx: Integer;
begin
  active := FindControl(msg.ActiveWnd);
  if not (dm.metu_kabeh) then
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

procedure Tf_return_kirim.FormCreate(Sender: TObject);
begin
  f_utama.MDIChildCreated(self.Handle);
  ed_code.width := panel2.width - 260;
end;

procedure Tf_return_kirim.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  f_utama.MDIChildDestroyed(Self.Handle);
  Action := cafree;
  f_return_kirim := nil;
end;

procedure Tf_return_kirim.FormShow(Sender: TObject);
begin
  if (f_utama.sb.Panels[8].Text = 'PUSAT') and (f_utama.HakAkses('gdTrReturnKirim')) then
  begin
    b_new.Enabled := True;
    ed_no_faktur.Enabled := True;
  end
  else
  begin
    b_new.Enabled := false;
    ed_no_faktur.Enabled := False;
  end;
end;

procedure Tf_return_kirim.bersih;
begin
  l_toko.Caption := '';
  ed_tgl.Date := now();
  mm_nama.Clear;
  ce_harga.Clear;
  ed_pelanggan.Clear;
  ed_no_faktur.Clear;
  ed_fak_kirim.Clear;
  tableview.DataController.RecordCount := 0;
  ed_nilai_faktur.Clear;
end;

procedure Tf_return_kirim.tampil_data;
var
  h: Integer;
  x_hpp: Real;
begin
  ed_pelanggan.Text := dm.Q_list_return_kirim.fieldbyname('kd_pelanggan').AsString;
  l_toko.Caption := dm.Q_list_return_kirim.fieldbyname('n_pelanggan').AsString;
  ed_no_faktur.Text := dm.Q_list_return_kirim.fieldbyname('kd_return_kirim').AsString;
  ed_fak_kirim.Text := dm.Q_list_return_kirim.fieldbyname('kd_kirim').AsString;
  ed_tgl.Text := formatdatetime('dd/MM/yyyy', dm.Q_list_return_kirim.fieldbyname
    ('tgl_return_kirim').AsDateTime);

  fungsi.SQLExec(dm.Q_temp,
    'select * from tb_return_kirim_rinci where kd_perusahaan="' + dm.Q_list_return_kirim.fieldbyname
    ('kd_perusahaan').AsString + '" and kd_return_kirim="' + dm.Q_list_return_kirim.fieldbyname
    ('kd_return_kirim').AsString + '"', true);

  if dm.Q_temp.RecordCount <> 0 then
  begin
    tableview.DataController.RecordCount := dm.Q_temp.RecordCount;
    for h := 0 to dm.Q_temp.RecordCount - 1 do
    begin
      TableView.DataController.SetValue(h, 0, dm.Q_temp.FieldByName('kd_barang').AsString);
      TableView.DataController.SetValue(h, 1, dm.Q_temp.fieldbyname('n_barang').AsString);
      TableView.DataController.SetValue(h, 2, dm.Q_temp.FieldByName('qty_return_kirim').AsString);
      TableView.DataController.SetValue(h, 4, dm.Q_temp.fieldbyname('harga_pokok').AsString);
      TableView.DataController.SetValue(h, 5, dm.Q_temp.fieldbyname('barcode').AsString);
      x_hpp := dm.Q_temp.fieldbyname('harga_pokok').AsFloat / dm.Q_temp.FieldByName
        ('qty_return_kirim').AsFloat;
      TableView.DataController.SetValue(h, 3, x_hpp);
      dm.Q_temp.Next;
    end;
    tableview.DataController.ChangeFocusedRowIndex(tableview.DataController.RecordCount
      + 1);
  end;

end;

procedure Tf_return_kirim.CreateRows;
var
  baris_baru: integer;
  f: integer;
begin
  if tableview.DataController.RecordCount <> 0 then
  begin
    for f := 0 to tableview.DataController.RecordCount - 1 do
    begin
      if (pos(TableView.DataController.GetValue(f, 0), dm.Q_temp.fieldbyname('kd_barang').AsString)
        > 0) then
      begin
        tableview.DataController.ChangeFocusedRecordIndex(f);
        TableView.DataController.SetValue(f, 0, dm.Q_temp.fieldbyname('kd_barang').AsString);
        TableView.DataController.SetValue(f, 1, dm.Q_temp.fieldbyname('n_barang').AsString);
        TableView.DataController.SetValue(f, 2, TableView.DataController.GetValue
          (f, 2) + 1);
        TableView.DataController.SetValue(f, 4, TableView.DataController.GetValue
          (f, 2) * TableView.DataController.GetValue(f, 3));
        TableView.DataController.SetValue(f, 5, dm.Q_temp.fieldbyname('barcode3').AsString);
        exit;
      end;
    end;
  end;

  baris_baru := tableview.DataController.RecordCount + 1;
  tableview.DataController.RecordCount := baris_baru;
  TableView.DataController.SetValue(baris_baru - 1, 0, dm.Q_temp.fieldbyname('kd_barang').AsString);
  TableView.DataController.SetValue(baris_baru - 1, 1, dm.Q_temp.fieldbyname('n_barang').AsString);
  TableView.DataController.SetValue(baris_baru - 1, 2, 1);
  TableView.DataController.SetValue(baris_baru - 1, 3, dm.Q_temp.fieldbyname('hpp_aktif').AsCurrency);
  TableView.DataController.SetValue(baris_baru - 1, 4, dm.Q_temp.fieldbyname('hpp_aktif').AsCurrency);
  TableView.DataController.SetValue(baris_baru - 1, 5, dm.Q_temp.fieldbyname('barcode3').AsString);
  tableview.DataController.ChangeFocusedRowIndex(baris_baru);
  mm_nama.Text := tableView.DataController.GetValue(baris_baru - 1, 1);
  ce_harga.Value := tableView.DataController.GetValue(baris_baru - 1, 3);
end;

procedure Tf_return_kirim.ed_codeKeyDown(Sender: TObject; var Key: Word; Shift:
  TShiftState);
begin
  if key = vk_return then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    if ed_code.Text = '' then
      exit;
    fungsi.sqlExec(dm.Q_temp, 'SELECT kd_barang,n_barang,barcode3, ' +
      'hpp_aktif,kd_sat3 FROM tb_barang WHERE ((kd_barang = "' + ed_code.Text +
      '" OR barcode3 = "' + ed_code.Text + '" OR barcode2 = "' + ed_code.Text +
      '" OR barcode1 = "' + ed_code.Text + '") AND kd_perusahaan="' + dm.kd_perusahaan
      + '")', true);
    if dm.Q_temp.RecordCount <> 0 then
    begin
      createrows;
    end
    else
    begin
      showmessage('data tidak dapat ditemukan dalam daftar barang...');
    end;
    ed_code.Clear
  end;

  if (key = vk_f2) and (sb_cari.Enabled = True) then
    sb_cariClick(Sender);

  if key = vk_up then
  begin
    if tableview.DataController.FocusedRecordIndex >= 1 then
      tableview.DataController.FocusedRecordIndex := tableview.DataController.FocusedRecordIndex
        - 1;
    key := VK_NONAME;

  end;
  if key = vk_down then
    tableview.DataController.FocusedRowIndex := tableview.DataController.FocusedRowIndex
      + 1;

end;

procedure Tf_return_kirim.TableViewFocusedRecordChanged(Sender:
  TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord:
  TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  if tableview.DataController.RecordCount = 0 then
  begin
    mm_nama.Clear;
    ce_harga.Clear;
    exit;
  end;

  try
    mm_nama.Text := AfocusedRecord.Values[1];
    ce_harga.Value := AfocusedRecord.Values[3];
  except
  end;
end;

procedure Tf_return_kirim.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssctrl]) and (Key = vk_delete) then
    if (MessageDlg('Yakinkah, Anda akan menghapus data ini???', mtConfirmation,
      [mbYes, mbNo], 0) = mrYes) then
      TableView.DataController.DeleteFocused;

  if key = vk_f2 then
    ed_code.SetFocus;
  if key = vk_f3 then
    grid.SetFocus;
  if key = vk_f4 then
    sb_pelangganClick(Sender);
  if key = vk_f5 then
    b_autoClick(Sender);
end;

procedure Tf_return_kirim.b_newClick(Sender: TObject);
begin
  bersih;
end;

procedure Tf_return_kirim.sb_pelangganClick(Sender: TObject);
var
  sebelum: string;
begin
  sebelum := ed_pelanggan.Text;

  ed_pelanggan.SetFocus;
  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi := 'select kd_pelanggan,n_pelanggan from ' +
      'tb_pelanggan where kd_pelanggan IN (SELECT kd_perusahaan from tb_company) and kd_perusahaan="' +
      dm.kd_perusahaan + '"';
    tblcap[0] := 'Kode';
    tblCap[1] := 'Nama Pelanggan';
    CariT := 11;
    tampil_button(False, True);
    if ShowModal = mrOk then
    begin
      ed_pelanggan.Text := TblVal[0];
      l_toko.Caption := tblval[1];
    end;
  finally
    close;
  end;
  if CompareStr(ed_pelanggan.Text, sebelum) <> 0 then
    ed_no_faktur.Clear;

end;

procedure Tf_return_kirim.ed_pelangganKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) and (sb_pelanggan.Enabled = True) then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    sb_pelangganClick(Sender);
  end;
end;

procedure Tf_return_kirim.sb_cariClick(Sender: TObject);
begin
  ed_code.SetFocus;
  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi := 'select kd_barang, n_barang from tb_barang where kd_perusahaan="' +
      dm.kd_perusahaan + '"';
    tblcap[0] := 'PID';
    tblCap[1] := 'Deskripsi Barang';
    tampil_button(False, True);
    if ShowModal = mrOk then
    begin
      ed_code.Text := TblVal[0];
    end;
  finally
    close;
  end;
end;

procedure Tf_return_kirim.TableViewTcxGridDataControllerTcxDataSummaryFooterSummaryItems4GetText
  (Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var
  AText: string);
begin
  if (Atext <> '') then
    ed_nilai_faktur.Value := aVALUE
  else
    ed_nilai_faktur.Clear;
end;

procedure Tf_return_kirim.b_autoClick(Sender: TObject);
var
  w: Integer;
  x, sekarang: string;
begin
  if ed_pelanggan.Text = '' then
  begin
    ShowMessage('untuk auto kode, data Toko harus diisi terlebih dahulu');
    ed_pelanggan.SetFocus;
    Exit;
  end;

  sekarang := formatdatetime('yyyyMMdd', dm.waktu_sekarang);

  fungsi.SQLExec(dm.Q_temp, 'select Count(kd_return_kirim) as jumlah from ' +
    'tb_return_kirim_global where kd_tk_return_kirim="' + ed_pelanggan.text +
    '" and kd_perusahaan = "' + dm.kd_perusahaan +
    '" and date(simpan_pada)=date(now())', true);

  w := dm.Q_temp.fieldbyname('jumlah').AsInteger + 1;

  if w < 10 then
    x := '0' + inttostr(w)
  else if w < 100 then
    x := '' + inttostr(w);

  ed_no_faktur.Text := 'RK-' + ed_pelanggan.text + '-' + sekarang + x;

end;

procedure Tf_return_kirim.sSpeedButton18Click(Sender: TObject);
begin
  close;
end;

procedure Tf_return_kirim.ed_no_fakturChange(Sender: TObject);
var
  urip: Boolean;
begin
  fungsi.SQLExec(dm.Q_temp,
    'select kd_return_kirim from tb_return_kirim_global where kd_return_kirim="' +
    ed_no_faktur.Text + '" and kd_perusahaan="' + dm.kd_perusahaan + '"', true);
  if not (dm.Q_temp.Eof) then
  begin
    ed_no_faktur.Color := clblue;
    Caption := 'R. Kirim (' + ed_no_faktur.Text + ')';
    f_utama.tc_child.Tabs.Strings[f_utama.tc_child.TabIndex] := Caption;
    urip := True;
  end
  else
  begin
    ed_no_faktur.Color := clwhite;
    Caption := 'R. Kirim (New)';
    f_utama.tc_child.Tabs.Strings[f_utama.tc_child.TabIndex] := Caption;
    urip := False;
  end;

  b_auto.Enabled := not (urip);
  sb_pelanggan.Enabled := not (urip);
  sb_cari.Enabled := not (urip);
  b_simpan.Enabled := not (urip);
  b_print.Enabled := urip;

  ed_tgl.ReadOnly := urip;
  ed_code.ReadOnly := urip;
end;

procedure Tf_return_kirim.b_printClick(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_laporan,
    'select * from vw_cetak_return_kirim where kd_perusahaan="' + dm.kd_perusahaan
    + '" and kd_return_kirim="' + ed_no_faktur.Text + '"', true);
  dm.laporan.LoadFromFile(dm.WPath + 'laporan\gp_return_kirim_rinci.fr3');
  dm.FRMemo(dm.laporan, 'Memo9').Text := MyTerbilang(dm.Q_laporan.fieldbyname('nilai_faktur').AsFloat)
    + 'Rupiah';
  dm.laporan.ShowReport;
end;

procedure Tf_return_kirim.b_simpanClick(Sender: TObject);
var
  x, i: integer;
  isi_sql, kd_faktur: string;
begin
  if (ed_pelanggan.Text = dm.kd_perusahaan) then
  begin
    showmessage('data tidak dapat disimpan karena toko pegirim dan penerima sama...');
    exit;
  end;

  if (ed_pelanggan.Text = '') or (ed_no_faktur.Text = '') or (ed_fak_kirim.Text = '') then
  begin
    showmessage('Data Toko dan no faktur harus di isi terlebih dahulu...');
    exit;
  end;

  if (ed_no_faktur.Color = clblue) then
  begin
    showmessage('no faktur ini sudah ada dalam database....');
    exit;
  end;

  if (ed_fak_kirim.Color = clblue) then
  begin
    showmessage('no faktur kirim ini tidak ada dalam database....');
    exit;
  end;

  if tableview.DataController.RecordCount = 0 then
  begin
    showmessage('Data barang masih kosong...');
    exit;
  end;

  kd_faktur := ed_no_faktur.Text;

  for x := 0 to tableview.DataController.RecordCount - 1 do
  begin
    isi_sql := isi_sql + '("' + dm.kd_perusahaan + '","' + ed_no_faktur.Text +
      '","' + formatdatetime('yyyy-MM-dd', ed_tgl.Date) + '","' + TableView.DataController.GetDisplayText
      (x, 0) + '","' + TableView.DataController.GetDisplayText(x, 1) + '","' +
      floattostr(TableView.DataController.GetValue(x, 2)) + '","' + floattostr(TableView.DataController.GetValue
      (x, 4)) + '","' + TableView.DataController.GetDisplayText(x, 5) + '",date(now())),';
  end;
  delete(isi_sql, length(isi_sql), 1);

  dm.db_conn.StartTransaction;
  try
    fungsi.SQLExec(dm.Q_exe,
      'insert into tb_return_kirim_global(kd_perusahaan,kd_return_kirim, ' +
      'kd_kirim,tgl_return_kirim,kd_tk_return_kirim,nilai_faktur,pengguna,simpan_pada) values ("' +
      dm.kd_perusahaan + '","' + ed_no_faktur.Text + '","' + ed_fak_kirim.Text +
      '","' + formatdatetime('yyyy-MM-dd', ed_tgl.Date) + '","' + ed_pelanggan.Text
      + '","' + ed_nilai_faktur.Text + '","' + dm.kd_pengguna + '",now())', false);

    fungsi.SQLExec(dm.Q_exe,
      'insert into tb_return_kirim_rinci(kd_perusahaan,kd_return_kirim,tgl_return_kirim,' +
      'kd_barang,n_barang,qty_return_kirim,harga_pokok,barcode,tgl_simpan) values  ' +
      isi_sql, false);

    for i := 0 to cabang.Count - 1 do
    begin
      if (cabang[i] = ed_pelanggan.Text) then
        returnCabang;
    end;

    dm.db_conn.Commit;

    showmessage('penyimpanan data berhasil...');

//b_simpan_fileClick(Self);

    ed_no_faktur.Clear;
    ed_no_faktur.Text := kd_faktur;
    b_print.SetFocus;

  except
    on E: exception do
    begin
      dm.db_conn.Rollback;
      messagedlg('proses penyimpanan gagal '#10#13'' + e.Message, mterror, [mbOk], 0);
    end;
  end;
end;

procedure Tf_return_kirim.returnCabang;
var
  x: integer;
  isi_sql: string;
begin
  for x := 0 to tableview.DataController.RecordCount - 1 do
  begin
    isi_sql := isi_sql + '("' + ed_pelanggan.Text + '","' + ed_no_faktur.Text +
      '","' + formatdatetime('yyyy-MM-dd', ed_tgl.Date) + '","' + TableView.DataController.GetDisplayText
      (x, 0) + '","' + TableView.DataController.GetDisplayText(x, 1) + '","' +
      floattostr(TableView.DataController.GetValue(x, 2)) + '","' + floattostr(TableView.DataController.GetValue
      (x, 4)) + '",0,"' + TableView.DataController.GetDisplayText(x, 5) +
      '",date(now())),';
  end;
  delete(isi_sql, length(isi_sql), 1);

  fungsi.SQLExec(dm.Q_exe,
    'insert into tb_return_global(kd_perusahaan,kd_return,tgl_return,' +
    'kd_suplier,disk_rp,nilai_faktur,pengguna,faktur_receipt,simpan_pada) values ("' +
    ed_pelanggan.Text + '","' + ed_no_faktur.Text + '","' + formatdatetime('yyyy-MM-dd',
    ed_tgl.Date) + '","' + dm.kd_perusahaan + '",0,"' + ed_nilai_faktur.Text +
    '","AUTO","' + ed_fak_kirim.Text + '",now())', false);

  fungsi.SQLExec(dm.Q_exe,
    'insert into tb_return_rinci(kd_perusahaan,kd_return,tgl_return,' +
    'kd_barang,n_barang,qty_return,harga_pokok,diskon,barcode,tgl_simpan) values  ' +
    isi_sql, false);
end;

procedure Tf_return_kirim.ed_fak_kirimChange(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_temp,
    'select faktur from vw_piutang where `status`= "belum lunas" and faktur="' +
    ed_fak_kirim.Text + '" and kd_perusahaan="' + dm.kd_perusahaan +
    '" and pelanggan = "' + ed_pelanggan.Text + '"', true);
  if dm.Q_temp.Eof then
    ed_fak_kirim.Color := clblue
  else
    ed_fak_kirim.Color := clwhite;
end;

procedure Tf_return_kirim.b_simpan_fileClick(Sender: TObject);
var
  F: TextFile;
  x: Integer;
begin
  sd.FileName := ed_no_faktur.Text + sd.DefaultExt;
  sd.InitialDir := dm.DocPath;

  if sd.Execute then
  begin
    AssignFile(F, sd.FileName);
    Rewrite(F);
    Writeln(F, ed_no_faktur.text);
    Writeln(F, ed_fak_kirim.text);
    Writeln(F, ed_pelanggan.text);
    Writeln(F, L_toko.caption);
    Writeln(F, ed_tgl.text);
    Writeln(F, tableview.DataController.RecordCount);
    for x := 0 to tableview.DataController.RecordCount - 1 do
    begin
      Writeln(F, TableView.DataController.GetValue(x, 0));
      Writeln(F, TableView.DataController.GetValue(x, 1));
      Writeln(F, TableView.DataController.GetValue(x, 2));
      Writeln(F, TableView.DataController.GetValue(x, 3));
      Writeln(F, TableView.DataController.GetValue(x, 4));
      Writeln(F, TableView.DataController.GetValue(x, 5));
    end;
    CloseFile(F);
    fungsi.amankan(sd.FileName, sd.FileName, 159);
  end;
end;

procedure Tf_return_kirim.b_loadClick(Sender: TObject);
var
  F: TextFile;
  Tmp, x: Integer;
  TmpStr: string;
begin
  od.InitialDir := dm.DocPath;
  if od.Execute then
  begin
    try
      fungsi.amankan(od.FileName, od.FileName, 159);
      try
        AssignFile(F, od.FileName);
        Reset(F);
        Readln(F, TmpStr);
        ed_no_faktur.Text := TmpStr;
        Readln(F, TmpStr);
        ed_fak_kirim.Text := TmpStr;
        Readln(F, TmpStr);
        ed_pelanggan.Text := TmpStr;
        Readln(F, TmpStr);
        L_toko.Caption := TmpStr;
        Readln(F, TmpStr);
        ed_tgl.Text := TmpStr;

        Readln(F, Tmp);
        tableview.DataController.RecordCount := Tmp;
        for x := 0 to tableview.DataController.RecordCount - 1 do
        begin
          Readln(F, TmpStr);
          TableView.DataController.SetValue(x, 0, TmpStr);
          Readln(F, TmpStr);
          TableView.DataController.SetValue(x, 1, TmpStr);
          Readln(F, TmpStr);
          TableView.DataController.SetValue(x, 2, TmpStr);
          Readln(F, TmpStr);
          TableView.DataController.SetValue(x, 3, TmpStr);
          Readln(F, TmpStr);
          TableView.DataController.SetValue(x, 4, TmpStr);
          Readln(F, TmpStr);
          TableView.DataController.SetValue(x, 5, TmpStr);
        end;
      finally
        CloseFile(F);
      end;
      tableview.DataController.ChangeFocusedRowIndex(tableview.DataController.RecordCount);
      mm_nama.Text := tableView.DataController.GetValue(tableview.DataController.RecordCount
        - 1, 1);
      ce_harga.Text := tableView.DataController.GetValue(tableview.DataController.RecordCount
        - 1, 3);
      fungsi.amankan(od.FileName, od.FileName, 159);

    except
      ShowMessage('proses load data gagal...');
    end;
  end;
end;

procedure Tf_return_kirim.ed_codeKeyPress(Sender: TObject; var Key: Char);
var
  harga, qty: real;
  kode: string;
  b: Integer;
begin
{if not ((key>='0')and(key<='9')or(key=#8) or(key=#43)) then
begin
key:=#0;
Exit;
end;
}
  if TableView.DataController.RecordCount = 0 then
    Exit;

  harga := TableView.DataController.GetValue(tableview.DataController.FocusedRecordIndex,
    3);
  Qty := TableView.DataController.GetValue(tableview.DataController.FocusedRecordIndex,
    2);

  kode := Ed_Code.Text;

  b := TableView.DataController.GetFocusedRecordIndex;

  if key = #43 then // tanda + (repeat)
  begin
    delete(kode, pos('+', kode), 1);
    ed_code.Clear;
    key := #0;

    if (StrToIntDef(kode, 0) = 0) or (Length(kode) = 0) then
      Exit;

    TableView.DataController.SetValue(b, 2, kode); //Qty
    TableView.DataController.SetValue(b, 4, harga * StrToFloatdef(kode, 0)); //total harga
  end;

  if Key = #47 then //tanda (/)  ubah harga
  begin
    delete(kode, pos('/', kode), 1);
    ed_code.Clear;
    key := #0;

    if (Length(kode) = 0) then
      Exit;

    TableView.DataController.SetValue(b, 3, kode); //harga baru
    TableView.DataController.SetValue(b, 4, Qty * StrToFloatdef(kode, 0)); //total harga
  end;

end;

procedure Tf_return_kirim.ed_no_fakturKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_return) and (b_auto.Enabled = True) then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    b_autoClick(self);
  end;
end;

procedure Tf_return_kirim.ed_fak_kirimKeyPress(Sender: TObject; var Key: Char);
begin
  if ed_pelanggan.Text = '' then
  begin
    Key := #0;
    ShowMessage('data Toko harus diisi terlebih dahulu');
    ed_pelanggan.SetFocus;
    Exit;
  end;
end;

procedure Tf_return_kirim.ed_pelangganChange(Sender: TObject);
begin
  ed_fak_kirimChange(Self);
end;

procedure Tf_return_kirim.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (ed_pelanggan.Text = dm.kd_perusahaan) then
  begin
    CanClose := True;
    Exit;
  end;

  if (ed_no_faktur.Color <> clblue) and (tableview.DataController.RecordCount >= 1) then
  begin
    case MessageBox(0, 'Data Belum disimpan, ' + #13 + #10 +
      'apakah anda akan menyimpan data ini???', 'Central of Profit',
      MB_ICONWARNING or MB_YESNOCANCEL) of
      idYes:
        begin
          b_simpanClick(Self);
          CanClose := False;
        end;
      idNo:
        CanClose := True;
      IDCANCEL:
        begin
          ed_code.SetFocus;
          CanClose := False;
        end;
    end;

  end;

end;

end.


