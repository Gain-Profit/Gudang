unit u_return;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sTooledit, sEdit, Buttons, sSpeedButton, sButton, Mask,
  sCustomComboEdit, sCurrEdit, sCurrencyEdit, sLabel, ExtCtrls, sPanel, sMemo,
  cxCustomData, cxGraphics, cxDataStorage, cxEdit, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid,
  cxCurrencyEdit, UFungsi, sBevel, ComCtrls, sSkinProvider, cxImageComboBox,
  cxStyles, uTerbilang, sDialogs, cxFilter, cxData, sMaskEdit,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, System.UITypes,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxNavigator;

type
  TF_return = class(TForm)
    panel4: TsPanel;
    sPanel1: TsPanel;
    Grid: TcxGrid;
    TableView: TcxGridTableView;
    view_PID: TcxGridColumn;
    view_deskripsi: TcxGridColumn;
    t_view_Qty: TcxGridColumn;
    view_total_harga: TcxGridColumn;
    t_view_diskon: TcxGridColumn;
    Level: TcxGridLevel;
    panel1: TsPanel;
    Mm_nama: TsMemo;
    ce_harga: TsCurrencyEdit;
    panel2: TsPanel;
    sBevel1: TsBevel;
    sLabel1: TsLabel;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    sb_supplier: TsSpeedButton;
    sb_cari: TsSpeedButton;
    L_supp: TsLabel;
    ed_no_faktur: TEdit;
    ed_tgl: TsDateEdit;
    ed_supplier: TEdit;
    ed_code: TEdit;
    panel3: TsPanel;
    sLabel2: TsLabel;
    sLabel7: TsLabel;
    sLabel9: TsLabel;
    ed_sub_total: TsCurrencyEdit;
    ce_diskonpr: TsCurrencyEdit;
    ce_diskonrp: TsCurrencyEdit;
    ed_nilai_faktur: TsCurrencyEdit;
    sSpeedButton18: TsSpeedButton;
    sSkinProvider1: TsSkinProvider;
    ed_fak_receipt: TEdit;
    sLabel5: TsLabel;
    sLabel6: TsLabel;
    sPanel2: TsPanel;
    b_simpan_file: TsButton;
    b_load: TsButton;
    od: TsOpenDialog;
    sd: TsSaveDialog;
    spnl1: TsPanel;
    b_print: TsButton;
    b_new: TsButton;
    b_simpan: TsButton;
    b_auto: TsButton;
    view_harga: TcxGridColumn;
    l_1: TsLabel;
    l_2: TsLabel;
    l_3: TsLabel;
    l_4: TsLabel;
    l_5: TsLabel;
    t_view_barcode: TcxGridColumn;
    procedure WMMDIACTIVATE(var msg: TWMMDIACTIVATE); message WM_MDIACTIVATE;
    procedure bersih;
    procedure tampil_data;
    procedure CreateRows;
    procedure ed_codeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure
      TableViewTcxGridDataControllerTcxDataSummaryFooterSummaryItems3GetText(Sender:
      TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var AText: string);
    procedure
      TableViewTcxGridDataControllerTcxDataSummaryFooterSummaryItems4GetText(Sender:
      TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var AText: string);
    procedure TableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ed_sub_totalChange(Sender: TObject);
    procedure b_newClick(Sender: TObject);
    procedure sb_supplierClick(Sender: TObject);
    procedure ed_supplierKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sb_cariClick(Sender: TObject);
    procedure b_simpanClick(Sender: TObject);
    procedure b_printClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ed_no_fakturChange(Sender: TObject);
    procedure sSpeedButton18Click(Sender: TObject);
    procedure ed_fak_receiptChange(Sender: TObject);
    procedure b_simpan_fileClick(Sender: TObject);
    procedure b_loadClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ed_codeKeyPress(Sender: TObject; var Key: Char);
    procedure ce_diskonrpExit(Sender: TObject);
    procedure ce_diskonprExit(Sender: TObject);
    procedure b_autoClick(Sender: TObject);
    procedure ed_no_fakturKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ed_fak_receiptKeyPress(Sender: TObject; var Key: Char);
    procedure ed_supplierChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    sub_sub_total, diskon: Currency;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_return: TF_return;

implementation

uses
  u_dm, u_cari, u_utama;

{$R *.dfm}

procedure TF_return.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
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

procedure TF_return.bersih;
begin
  l_supp.Caption := '';
  ed_tgl.Date := now();
  mm_nama.Clear;
  ce_harga.Clear;
  ed_supplier.Clear;
  ed_no_faktur.Clear;
  ed_fak_receipt.Clear;
  tableview.DataController.RecordCount := 0;
  ed_sub_total.Clear;
  ce_diskonrp.Clear;
  ce_diskonpr.Clear;
  ed_nilai_faktur.Clear;
end;

procedure TF_return.tampil_data;
var
  h: Integer;
begin
  ed_supplier.Text := dm.Q_list_return.fieldbyname('kd_suplier').AsString;
  l_supp.Caption := dm.Q_list_return.fieldbyname('n_supp').AsString;
  ed_no_faktur.Text := dm.Q_list_return.fieldbyname('kd_return').AsString;
  ed_fak_receipt.Text := dm.Q_list_return.fieldbyname('faktur_receipt').AsString;
  ed_tgl.Text := formatdatetime('dd/MM/yyyy', dm.Q_list_return.fieldbyname('tgl_return').AsDateTime);
  ce_diskonrp.Text := dm.Q_list_return.fieldbyname('disk_rp').AsString;

  fungsi.SQLExec(dm.Q_temp,
    'select * from tb_return_rinci where kd_perusahaan="' + dm.Q_list_return.fieldbyname
    ('kd_perusahaan').AsString + '" and kd_return="' + dm.Q_list_return.fieldbyname
    ('kd_return').AsString + '"', true);

  if dm.Q_temp.RecordCount <> 0 then
  begin
    tableview.DataController.RecordCount := dm.Q_temp.RecordCount;
    for h := 0 to dm.Q_temp.RecordCount - 1 do
    begin
      TableView.DataController.SetValue(h, 0, dm.Q_temp.FieldByName('kd_barang').AsString);
      TableView.DataController.SetValue(h, 1, dm.Q_temp.fieldbyname('n_barang').AsString);
      TableView.DataController.SetValue(h, 2, dm.Q_temp.FieldByName('qty_return').AsString);
      TableView.DataController.SetValue(h, 3, dm.Q_temp.fieldbyname('harga_pokok').AsCurrency
        / dm.Q_temp.FieldByName('qty_return').AsInteger);
      TableView.DataController.SetValue(h, 4, dm.Q_temp.fieldbyname('harga_pokok').AsCurrency);
      TableView.DataController.SetValue(h, 5, dm.Q_temp.fieldbyname('diskon').AsCurrency);
      TableView.DataController.SetValue(h, 6, dm.Q_temp.fieldbyname('barcode').AsString);
      dm.Q_temp.Next;
    end;
    tableview.DataController.ChangeFocusedRowIndex(tableview.DataController.RecordCount
      + 1);
  end;
end;

procedure TF_return.CreateRows;
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
        TableView.DataController.SetValue(f, 2, TableView.DataController.getValue
          (f, 2) + 1);
        TableView.DataController.SetValue(f, 4, TableView.DataController.getValue
          (f, 2) * TableView.DataController.getValue(f, 3));
        TableView.DataController.SetValue(f, 6, dm.Q_temp.fieldbyname('barcode3').AsString);
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
  TableView.DataController.SetValue(baris_baru - 1, 5, 0);
  TableView.DataController.SetValue(baris_baru - 1, 6, dm.Q_temp.fieldbyname('barcode3').AsString);
  tableview.DataController.ChangeFocusedRowIndex(baris_baru);
  mm_nama.Text := tableView.DataController.GetValue(baris_baru - 1, 1);
  ce_harga.Value := dm.Q_temp.fieldbyname('hpp_aktif').AsCurrency;
end;

procedure TF_return.ed_codeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  LSql : String;
begin
  if key = vk_return then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    if ed_code.Text = '' then
      exit;
    fungsi.sqlExec(dm.Q_temp, 'SELECT kd_barang,n_barang,barcode3, ' +
      'hpp_aktif,kd_sat3, stok_OH FROM tb_barang WHERE ((kd_barang = "' + ed_code.Text +
      '" OR barcode3 = "' + ed_code.Text + '" OR barcode2 = "' + ed_code.Text +
      '" OR barcode1 = "' + ed_code.Text + '") AND kd_perusahaan="' + dm.kd_perusahaan
      + '")', true);
    if dm.Q_temp.RecordCount <> 0 then
    begin
      LSql := 'SELECT `nilai` FROM `tb_settings` WHERE `parameter`="canoutonstockout"';
      fungsi.SQLExec(DM.Q_Exe, LSql, true);
      if not(dm.Q_Exe.FieldByName('nilai').AsBoolean) then
      begin
        if (dm.Q_temp.FieldByName('stok_OH').AsInteger <= 0) then
        begin
          messagedlg('Barang Tidak Dapat Ditransaksikan '#10#13'Stok Tidak Mencukupi',
            mtError, [mbOk], 0);
          Exit;
        end;
      end;

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

procedure TF_return.TableViewTcxGridDataControllerTcxDataSummaryFooterSummaryItems3GetText
  (Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var
  AText: string);
begin
  if (Atext <> '') then
    sub_sub_total := AValue
  else
  begin
    ed_sub_total.Clear;
    ed_nilai_faktur.Clear;
  end;

end;

procedure TF_return.TableViewTcxGridDataControllerTcxDataSummaryFooterSummaryItems4GetText
  (Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var
  AText: string);
begin
  if (Atext <> '') then
  begin
    diskon := AValue;
    ed_sub_total.Value := sub_sub_total - diskon;
    ed_nilai_faktur.Value := ed_sub_total.Value - ce_diskonrp.Value;
  end
  else
  begin
    ed_sub_total.Clear;
    ed_nilai_faktur.Clear;
  end;

end;

procedure TF_return.TableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if tableview.DataController.RecordCount = 0 then
  begin
    mm_nama.Clear;
    ce_harga.Clear;
    ed_sub_total.Clear;
    ce_diskonrp.Clear;
    exit;
  end;

  try
    mm_nama.Text := AfocusedRecord.Values[1];
    ce_harga.Value := AfocusedRecord.Values[4];
  except
  end;
end;

procedure TF_return.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
    sb_supplierClick(Sender);
end;

procedure TF_return.ed_sub_totalChange(Sender: TObject);
begin
  if ed_sub_total.Value <> 0 then
    ce_diskonpr.Value := (ce_diskonrp.Value / ed_sub_total.Value) * 100;
end;

procedure TF_return.b_newClick(Sender: TObject);
begin
  bersih;
end;

procedure TF_return.sb_supplierClick(Sender: TObject);
begin
  ed_supplier.SetFocus;
  application.CreateForm(TF_cari, F_cari);
  with F_cari do
  try
    _SQLi := 'select kode,n_supp from tb_supp where kd_perusahaan="' + dm.kd_perusahaan
      + '"';
    tblcap[0] := 'Kode';
    tblCap[1] := 'Nama Supplier';
    cariT := 9;
    tampil_button(true, True);
    if ShowModal = mrOk then
    begin
      ed_supplier.Text := TblVal[0];
      L_supp.Caption := TblVal[1];
    end;
  finally
    close;
  end;
end;

procedure TF_return.ed_supplierKeyDown(Sender: TObject; var Key: Word; Shift:
  TShiftState);
begin
  if (key = vk_return) and (sb_supplier.Enabled = True) then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    sb_supplierClick(Sender);
  end;
end;

procedure TF_return.sb_cariClick(Sender: TObject);
begin
  ed_code.SetFocus;
  application.CreateForm(TF_cari, F_cari);
  with F_cari do
  try
    _SQLi := 'select kd_barang, n_barang, hpp_aktif from tb_barang where kd_perusahaan="' +
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

procedure TF_return.b_simpanClick(Sender: TObject);
var
  x, LQty: integer;
  isi_sql, kd_faktur: string;
  LSQL, LIsiStokOHMin, LKdBarangs, LKdBarang:String;
begin
  kd_faktur := ed_no_faktur.Text;

  if (ed_supplier.Text = '') or (ed_no_faktur.Text = '') or (ed_fak_receipt.Text
    = '') then
  begin
    showmessage('Data Supplier, faktur return dan faktur receipt harus di isi terlebih dahulu...');
    exit;
  end;

  if (ed_no_faktur.Color = clblue) then
  begin
    showmessage('no faktur return ini sudah ada dalam database....');
    exit;
  end;

  if (ed_fak_receipt.Color = clblue) then
  begin
    showmessage('no faktur receipt ini tidak ada dalam database....');
    exit;
  end;

  if tableview.DataController.RecordCount = 0 then
  begin
    showmessage('Data barang masih kosong...');
    exit;
  end;

  for x := 0 to tableview.DataController.RecordCount - 1 do
  begin
    LKdBarang := TableView.DataController.GetDisplayText(x, 0);
    LQty := TableView.DataController.GetValue(x, 2);

    isi_sql := isi_sql + Format('("%s", "%s", "%s", "%s", "%d", "%g", "%g", "%s", date(now())), ',
      [dm.kd_perusahaan, ed_no_faktur.Text, LKdBarang,
      TableView.DataController.GetDisplayText(x, 1), LQty,
      Currency(TableView.DataController.GetValue(x, 4)), Currency(TableView.DataController.GetValue(x, 5)),
      TableView.DataController.GetDisplayText(x, 6)]);

    LIsiStokOHMin := LIsiStokOHMin + Format('WHEN "%s" THEN (stok_OH - %d) ', [LKdBarang,
      LQty]);
      
    LKdBarangs := LKdBarangs + Format('"%s", ', [LKdBarang]);
  end;
  SetLength(isi_sql, length(isi_sql) - 2);
  SetLength(LIsiStokOHMin, length(LIsiStokOHMin) - 1);
  SetLength(LKdBarangs, length(LKdBarangs) - 2);

  dm.db_conn.StartTransaction;
  try
    LSQL := Format('INSERT INTO tb_return_global(kd_perusahaan,kd_return,tgl_return,' +
      'kd_suplier,disk_rp,nilai_faktur,pengguna,faktur_receipt,simpan_pada) VALUES '+
      '("%s", "%s", "%s", "%s", "%g", "%g", "%s", "%s", now())', [dm.kd_perusahaan,
      ed_no_faktur.Text, MyDate(ed_tgl.Date), ed_supplier.Text, ce_diskonrp.Value,
      ed_nilai_faktur.Value, dm.kd_pengguna, ed_fak_receipt.Text]);

    fungsi.SQLExec(dm.Q_exe, LSQL, false);

    LSQL := Format('INSERT INTO tb_return_rinci(kd_perusahaan,kd_return, ' +
      'kd_barang,n_barang,qty_return,harga_pokok,diskon,barcode,tgl_simpan) VALUES  %s',
      [isi_sql]);

    fungsi.SQLExec(dm.Q_exe, LSQL, false);

    LSQL := Format('UPDATE tb_hutang SET return_beli = return_beli + %g, `update`=date(now()) '
      + 'WHERE kd_perusahaan = "%s" and faktur = "%s"', [ed_nilai_faktur.Value,
      dm.kd_perusahaan, ed_fak_receipt.Text]);

    fungsi.SQLExec(dm.Q_exe, LSQL, false);

    LSQL := Format('UPDATE tb_barang SET stok_OH = (CASE kd_barang %s END), '
      + 'Tr_Akhir = date(now()) ' +
      'WHERE kd_perusahaan = "%s" AND kd_barang IN (%s)', [LIsiStokOHMin,
      dm.kd_perusahaan, LKdBarangs]);

    fungsi.SQLExec(dm.Q_exe, LSQL, false);

    dm.db_conn.Commit;
    showmessage('penyimpanan sukses...');

    ed_no_faktur.Clear;
    ed_no_faktur.Text := kd_faktur;
    b_print.SetFocus;

  except
    on E: exception do
    begin
      dm.db_conn.Rollback;
      messagedlg('proses penyimpanan gagal,ulangi lagi!!! '#10#13'' + e.Message,
        mterror, [mbOk], 0);
    end;
  end;

end;

procedure TF_return.b_printClick(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_laporan,
    'select * from vw_cetak_return where kd_perusahaan="' + dm.kd_perusahaan +
    '" and kd_return="' + ed_no_faktur.Text + '"', true);
  dm.laporan.LoadFromFile(dm.WPath + 'laporan\gp_return_rinci.fr3');
  dm.FRMemo(dm.laporan, 'Memo9').Text := MyTerbilang(dm.Q_laporan.fieldbyname('nilai_faktur').AsCurrency)
    + 'Rupiah';
  dm.laporan.ShowReport;
end;

procedure TF_return.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  F_utama.MDIChildDestroyed(Self.Handle);
  Action := cafree;
  F_Return := nil;
end;

procedure TF_return.ed_no_fakturChange(Sender: TObject);
var
  urip: Boolean;
begin
  fungsi.SQLExec(dm.Q_temp,
    'select kd_return from tb_return_global where kd_return="' + ed_no_faktur.Text
    + '" and kd_perusahaan="' + dm.kd_perusahaan + '"', true);
  if not (dm.Q_temp.Eof) then
  begin
    ed_no_faktur.Color := clblue;
    Caption := 'Return (' + ed_no_faktur.Text + ')';
    F_utama.tc_child.Tabs.Strings[F_utama.tc_child.TabIndex] := Caption;
    urip := True;
  end
  else
  begin
    ed_no_faktur.Color := clwhite;
    Caption := 'Return (New)';
    F_utama.tc_child.Tabs.Strings[F_utama.tc_child.TabIndex] := Caption;
    urip := False;
  end;

  sb_supplier.Enabled := not (urip);
  sb_cari.Enabled := not (urip);
  b_simpan.Enabled := not (urip);
  b_auto.Enabled := not (urip);

  b_print.Enabled := urip;

  ed_fak_receipt.ReadOnly := urip;
  ed_tgl.ReadOnly := urip;
  ed_code.ReadOnly := urip;
end;

procedure TF_return.sSpeedButton18Click(Sender: TObject);
begin
  close;
end;

procedure TF_return.ed_fak_receiptChange(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_temp,
    'select faktur from vw_hutang where `status`= "belum lunas" and faktur="' +
    ed_fak_receipt.Text + '" and kd_perusahaan="' + dm.kd_perusahaan +
    '" and supplier ="' + ed_supplier.Text + '"', true);
  if dm.Q_temp.Eof then
    ed_fak_receipt.Color := clblue
  else
    ed_fak_receipt.Color := clwhite;
end;

procedure TF_return.b_simpan_fileClick(Sender: TObject);
var
  F: TextFile;
  x: Integer;
begin
  sd.InitialDir := dm.DocPath;
  if sd.Execute then
  begin
    AssignFile(F, sd.FileName);
    Rewrite(F);
    Writeln(F, ed_no_faktur.text);
    Writeln(F, ed_fak_receipt.text);
    Writeln(F, ed_supplier.text);
    Writeln(F, L_supp.caption);
    Writeln(F, ed_tgl.text);
    Writeln(F, ce_diskonrp.text);
    Writeln(F, tableview.DataController.RecordCount);
    for x := 0 to tableview.DataController.RecordCount - 1 do
    begin
      Writeln(F, TableView.DataController.GetValue(x, 0));
      Writeln(F, TableView.DataController.GetValue(x, 1));
      Writeln(F, TableView.DataController.GetValue(x, 2));
      Writeln(F, TableView.DataController.GetValue(x, 3));
      Writeln(F, TableView.DataController.GetValue(x, 4));
      Writeln(F, TableView.DataController.GetValue(x, 5));
      Writeln(F, TableView.DataController.GetValue(x, 6));
    end;
    CloseFile(F);
    fungsi.amankan(sd.FileName, sd.FileName, 789);
  end;
end;

procedure TF_return.b_loadClick(Sender: TObject);
var
  F: TextFile;
  Tmp, x: Integer;
  TmpStr: string;
begin
  od.InitialDir := dm.DocPath;
  if od.Execute then
  begin
    try
      fungsi.amankan(od.FileName, od.FileName, 789);
      AssignFile(F, od.FileName);
      Reset(F);
      Readln(F, TmpStr);
      ed_no_faktur.Text := TmpStr;
      Readln(F, TmpStr);
      ed_fak_receipt.Text := TmpStr;
      Readln(F, TmpStr);
      ed_supplier.Text := TmpStr;
      Readln(F, TmpStr);
      L_supp.Caption := TmpStr;
      Readln(F, TmpStr);
      ed_tgl.Text := TmpStr;
      Readln(F, TmpStr);
      ce_diskonrp.Text := TmpStr;

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
        Readln(F, TmpStr);
        TableView.DataController.SetValue(x, 6, TmpStr);
      end;
      CloseFile(F);
      tableview.DataController.ChangeFocusedRowIndex(tableview.DataController.RecordCount);
      mm_nama.Text := tableView.DataController.GetValue(tableview.DataController.RecordCount
        - 1, 1);
      ce_harga.Text := tableView.DataController.GetValue(tableview.DataController.RecordCount
        - 1, 4);
      fungsi.amankan(od.FileName, od.FileName, 789);

    except
      ShowMessage('proses load data gagal...');
    end

  end;

end;

procedure TF_return.FormShow(Sender: TObject);
begin
  if (F_utama.sb.Panels[8].Text = 'PUSAT') and (F_utama.HakAkses('gdTrReturn')) then
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

procedure TF_return.FormCreate(Sender: TObject);
begin
  F_utama.MDIChildCreated(self.Handle);
  ed_code.Width := panel2.Width - 260;
end;

procedure TF_return.ed_codeKeyPress(Sender: TObject; var Key: Char);
var
  harga, qty: Currency;
  kode: string;
  b: integer;
begin
  if TableView.DataController.RecordCount = 0 then
    Exit;

  kode := Ed_Code.Text;

  b := TableView.DataController.GetFocusedRecordIndex;
  harga := TableView.DataController.GetValue(tableview.DataController.FocusedRecordIndex,
    3);
  qty := TableView.DataController.GetValue(tableview.DataController.FocusedRecordIndex,
    2);

  if Key = #45 then //tanda -  diskon Rp
  begin
    delete(kode, pos('-', kode), 1);
    ed_code.Clear;
    key := #0;
    if (Length(kode) = 0) then
      Exit;

    TableView.DataController.SetValue(b, 5, kode); //diskon RP
  end;

  if key = #43 then // tanda + (repeat)
  begin
    delete(kode, pos('+', kode), 1);
    ed_code.Clear;
    key := #0;

    if (StrToIntDef(kode, 0) = 0) then
      Exit;

    TableView.DataController.SetValue(b, 2, StrToInt(kode)); //Qty
    TableView.DataController.SetValue(b, 4, StrToInt(kode) * harga); //Qty
  end;

  if Key = #47 then //tanda (/)  ubah harga
  begin
    delete(kode, pos('/', kode), 1);
    ed_code.Clear;
    key := #0;

    if (Length(kode) = 0) then
      Exit;

    TableView.DataController.SetValue(b, 3, StrToFloat(kode)); //harga baru
    TableView.DataController.SetValue(b, 4, StrToFloat(kode) * Qty); //Qty
  end;
end;

procedure TF_return.ce_diskonrpExit(Sender: TObject);
begin
  if ed_sub_total.Value <> 0 then
    ce_diskonpr.Value := (ce_diskonrp.Value / ed_sub_total.Value) * 100;

  ed_nilai_faktur.Value := ed_sub_total.Value - ce_diskonrp.Value;
end;

procedure TF_return.ce_diskonprExit(Sender: TObject);
begin
  if ed_sub_total.Value <> 0 then
    ce_diskonrp.Value := (ce_diskonpr.Value / 100) * ed_sub_total.Value;

  ed_nilai_faktur.Value := ed_sub_total.Value - ce_diskonrp.Value;
end;

procedure TF_return.b_autoClick(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_temp, Format('SELECT CONCAT("RT", DATE_FORMAT(NOW(), "%%Y%%m%%d"), '
    + 'LPAD(COUNT(kd_return) + 1, 4, "0")) AS new_id FROM tb_return_global ' +
    'WHERE DATE(simpan_pada) = DATE(NOW()) AND kd_perusahaan = "%s"', [dm.kd_perusahaan]),
    true);

  ed_no_faktur.Text := dm.Q_temp.fieldbyname('new_id').AsString;
end;

procedure TF_return.ed_no_fakturKeyDown(Sender: TObject; var Key: Word; Shift:
  TShiftState);
begin
  if (Key = vk_return) and (b_auto.Enabled = True) then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    b_autoClick(Self);
  end;
end;

procedure TF_return.ed_fak_receiptKeyPress(Sender: TObject; var Key: Char);
begin
  if ed_supplier.Text = '' then
  begin
    key := #0;
    ShowMessage('supplier harus diisi terlebih dahulu');
    ed_supplier.SetFocus;
    Exit;
  end;
end;

procedure TF_return.ed_supplierChange(Sender: TObject);
begin
  ed_fak_receiptChange(Self);
end;

procedure TF_return.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
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


