unit u_receipt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sCheckBox, sTooledit, sEdit, Buttons, sSpeedButton, sButton,
  Mask, sCustomComboEdit, sCurrEdit, sCurrencyEdit, sLabel, ExtCtrls, sPanel,
  sMemo, cxCustomData, cxGraphics, cxDataStorage, cxEdit, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid,
  cxCurrencyEdit, UFungsi, sBevel, ComCtrls, sSkinProvider, cxImageComboBox,
  cxStyles, uTerbilang, sDialogs, DateUtils, cxFilter, cxData, sMaskEdit;

type
  Tf_RO = class(TForm)
    panel4: TsPanel;
    sPanel1: TsPanel;
    Grid: TcxGrid;
    TableView: TcxGridTableView;
    ableViewColumn1: TcxGridColumn;
    ableViewColumn2: TcxGridColumn;
    t_view_Qty: TcxGridColumn;
    t_view_harga: TcxGridColumn;
    t_view_diskon: TcxGridColumn;
    t_view_HPP: TcxGridColumn;
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
    S1: TsLabel;
    sb_cari: TsSpeedButton;
    L_supp: TsLabel;
    ed_no_faktur: TsEdit;
    ed_tgl: TsDateEdit;
    ed_supplier: TsEdit;
    ed_code: TsEdit;
    cb_tunai: TsCheckBox;
    ed_jatuh_tempo: TsCurrencyEdit;
    cb_PPN: TsCheckBox;
    panel3: TsPanel;
    sLabel2: TsLabel;
    sLabel7: TsLabel;
    sLabel8: TsLabel;
    sLabel9: TsLabel;
    ed_sub_total: TsCurrencyEdit;
    ce_diskonpr: TsCurrencyEdit;
    ce_diskonrp: TsCurrencyEdit;
    ce_PPN: TsCurrencyEdit;
    ed_nilai_faktur: TsCurrencyEdit;
    sSpeedButton18: TsSpeedButton;
    sSkinProvider1: TsSkinProvider;
    t_view_hpp_akhir: TcxGridColumn;
    t_view_stat: TcxGridColumn;
    sLabel5: TsLabel;
    sd: TsSaveDialog;
    od: TsOpenDialog;
    sPanel2: TsPanel;
    b_simpan_file: TsButton;
    b_load: TsButton;
    spnl1: TsPanel;
    b_simpan: TsButton;
    b_new: TsButton;
    b_print: TsButton;
    b_auto: TsButton;
    l_1: TsLabel;
    l_2: TsLabel;
    l_3: TsLabel;
    l_4: TsLabel;
    l_5: TsLabel;
    t_view_barcode: TcxGridColumn;
    pnlKeterangan: TsPanel;
    mmKeterangan: TsMemo;
    btnUpdateKeterangan: TsButton;
    lbl1: TsLabel;
    procedure WMMDIACTIVATE(var msg: TWMMDIACTIVATE); message WM_MDIACTIVATE;
    procedure bersih;
    procedure tampil_data;
    procedure tampil_purchase;
    procedure refresh_HPP;
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
    procedure cb_tunaiClick(Sender: TObject);
    procedure cb_PPNClick(Sender: TObject);
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
    procedure b_simpan_fileClick(Sender: TObject);
    procedure b_loadClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ed_codeKeyPress(Sender: TObject; var Key: Char);
    procedure ce_diskonprExit(Sender: TObject);
    procedure ce_diskonrpExit(Sender: TObject);
    procedure b_autoClick(Sender: TObject);
    procedure ed_no_fakturKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnUpdateKeteranganClick(Sender: TObject);
  private
    sub_sub_total, diskon: Double;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_RO: Tf_RO;

implementation

uses
  u_dm, u_cari, u_utama;

{$R *.dfm}

procedure Tf_RO.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
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

procedure Tf_RO.bersih;
begin
  l_supp.Caption := '';
  ed_tgl.Date := now();
  mm_nama.Clear;
  ce_harga.Clear;
  ed_supplier.Clear;
  ed_no_faktur.Clear;
  tableview.DataController.RecordCount := 0;
  ed_sub_total.Clear;
  ce_diskonrp.Clear;
  ce_diskonpr.Clear;
  ce_PPN.Clear;
  ed_nilai_faktur.Clear;
  mmKeterangan.Clear;
  mmKeterangan.Enabled := True;
  pnlKeterangan.Visible := False;
end;

procedure Tf_RO.tampil_purchase;
var
  h: Integer;
  x_hpp: real;
begin
  ed_tgl.Date := now();

  ed_supplier.Text := dm.q_list_purchase.fieldbyname('kd_suplier').AsString;
  l_supp.Caption := dm.q_list_purchase.fieldbyname('n_supp').AsString;

  fungsi.SQLExec(dm.Q_temp,
    'select * from tb_purchase_rinci where kd_perusahaan="' + dm.q_list_purchase.fieldbyname
    ('kd_perusahaan').AsString + '" and kd_purchase="' + dm.q_list_purchase.fieldbyname
    ('kd_purchase').AsString + '"', true);

  if dm.Q_temp.RecordCount <> 0 then
  begin
    tableview.DataController.RecordCount := dm.Q_temp.RecordCount;
    for h := 0 to dm.Q_temp.RecordCount - 1 do
    begin
      TableView.DataController.SetValue(h, 0, dm.Q_temp.FieldByName('kd_barang').AsString);
      TableView.DataController.SetValue(h, 1, dm.Q_temp.fieldbyname('n_barang').AsString);
      TableView.DataController.SetValue(h, 2, dm.Q_temp.FieldByName('qty_purchase').AsString);
      TableView.DataController.SetValue(h, 3, dm.Q_temp.fieldbyname('harga_pokok').AsCurrency);
      TableView.DataController.SetValue(h, 4, 0);
      x_hpp := dm.Q_temp.fieldbyname('harga_pokok').AsFloat / dm.Q_temp.FieldByName
        ('qty_purchase').AsFloat;
      TableView.DataController.SetValue(h, 5, x_hpp);
      TableView.DataController.SetValue(h, 8, dm.Q_temp.fieldbyname('barcode').AsString);
      dm.Q_temp.Next;
    end;
    refresh_HPP;
    tableview.DataController.ChangeFocusedRowIndex(tableview.DataController.RecordCount
      + 1);
  end;
end;

procedure Tf_RO.tampil_data;
var
  h: Integer;
  tunai, plus_PPN: string;
  x_hpp: real;
begin
  tunai := dm.Q_list_receipt.fieldbyname('tunai').AsString;
  if tunai = 'Y' then
    cb_tunai.Checked := true
  else
    cb_tunai.Checked := false;

  Plus_PPN := dm.Q_list_receipt.fieldbyname('plus_PPN').AsString;
  if plus_PPN = 'Y' then
    cb_PPN.Checked := true
  else
    cb_PPN.Checked := false;

  ed_supplier.Text := dm.Q_list_receipt.fieldbyname('kd_suplier').AsString;
  l_supp.Caption := dm.Q_list_receipt.fieldbyname('n_supp').AsString;
  ed_no_faktur.Text := dm.Q_list_receipt.fieldbyname('kd_receipt').AsString;
  ed_tgl.Text := formatdatetime('dd/MM/yyyy', dm.Q_list_receipt.fieldbyname('tgl_receipt').AsDateTime);
  ed_jatuh_tempo.Value := DaySpan(dm.Q_list_receipt.fieldbyname('jatuh_tempo').AsDateTime,
    dm.Q_list_receipt.fieldbyname('tgl_receipt').AsDateTime);
  ce_diskonrp.Value := dm.Q_list_receipt.fieldbyname('disk_rp').AsCurrency;

  fungsi.SQLExec(dm.Q_temp,
    'select * from tb_receipt_global where kd_perusahaan="' + dm.Q_list_receipt.fieldbyname
    ('kd_perusahaan').AsString + '" and kd_receipt="' + dm.Q_list_receipt.fieldbyname
    ('kd_receipt').AsString + '"', true);

  mmKeterangan.Text := dm.Q_temp.fieldbyname('Keterangan').AsString;

  fungsi.SQLExec(dm.Q_temp,
    'select * from tb_receipt_rinci where kd_perusahaan="' + dm.Q_list_receipt.fieldbyname
    ('kd_perusahaan').AsString + '" and kd_receipt="' + dm.Q_list_receipt.fieldbyname
    ('kd_receipt').AsString + '"', true);

  if dm.Q_temp.RecordCount <> 0 then
  begin
    tableview.DataController.RecordCount := dm.Q_temp.RecordCount;
    for h := 0 to dm.Q_temp.RecordCount - 1 do
    begin
      TableView.DataController.SetValue(h, 0, dm.Q_temp.FieldByName('kd_barang').AsString);
      TableView.DataController.SetValue(h, 1, dm.Q_temp.fieldbyname('n_barang').AsString);
      TableView.DataController.SetValue(h, 2, dm.Q_temp.FieldByName('qty_receipt').AsString);
      TableView.DataController.SetValue(h, 3, dm.Q_temp.fieldbyname('harga_pokok').AsCurrency);
      TableView.DataController.SetValue(h, 4, dm.Q_temp.fieldbyname('diskon').AsCurrency);
      x_hpp := (dm.Q_temp.fieldbyname('harga_pokok').AsFloat - dm.Q_temp.fieldbyname
        ('diskon').AsFloat) / dm.Q_temp.FieldByName('qty_receipt').AsFloat;
      TableView.DataController.SetValue(h, 5, x_hpp);
      TableView.DataController.SetValue(h, 8, dm.Q_temp.fieldbyname('barcode').AsString);
      dm.Q_temp.Next;
    end;
    refresh_HPP;
    tableview.DataController.ChangeFocusedRowIndex(tableview.DataController.RecordCount
      + 1);
  end;

  pnlKeterangan.Visible := True;
  mmKeterangan.Enabled := False;
end;

procedure Tf_RO.refresh_HPP;
var
  Qty, harga, diskon, per_barang, hpp_ahir: real;
  X: integer;
begin
  for X := 0 to tableview.DataController.RecordCount - 1 do
  begin
    Qty := TableView.DataController.GetValue(X, 2);
    harga := TableView.DataController.GetValue(X, 3);
    diskon := TableView.DataController.GetValue(X, 4);

    per_barang := (harga - diskon) / Qty;

    if (cb_ppn.Checked = false) then
      HPP_ahir := per_barang - ((ce_diskonpr.Value / 100) * per_barang) + (per_barang
        / dm.PPN)
    else
      HPP_ahir := per_barang - ((ce_diskonpr.Value / 100) * per_barang);

    TableView.DataController.SetValue(X, 6, HPP_ahir);

    if (TableView.DataController.GetValue(X, 5)) > (TableView.DataController.GetValue
      (X, 6)) then
      TableView.DataController.SetValue(X, 7, -1)
    else if (TableView.DataController.GetValue(X, 5)) < (TableView.DataController.GetValue
      (X, 6)) then
      TableView.DataController.SetValue(X, 7, 1)
    else
      TableView.DataController.SetValue(X, 7, 0);
  end;
end;

procedure Tf_RO.CreateRows;
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
        TableView.DataController.SetValue(f, 3, TableView.DataController.GetValue
          (f, 6) * StrToFloatdef(TableView.DataController.GetValue(f, 2), 0)); //total harga
        TableView.DataController.SetValue(f, 5, dm.Q_temp.fieldbyname('hpp_ahir').AsCurrency);
        TableView.DataController.SetValue(f, 8, dm.Q_temp.fieldbyname('barcode3').AsString);
        refresh_HPP;
        exit;
      end;
    end;
  end;

  baris_baru := tableview.DataController.RecordCount + 1;
  tableview.DataController.RecordCount := baris_baru;
  TableView.DataController.SetValue(baris_baru - 1, 0, dm.Q_temp.fieldbyname('kd_barang').AsString);
  TableView.DataController.SetValue(baris_baru - 1, 1, dm.Q_temp.fieldbyname('n_barang').AsString);
  TableView.DataController.SetValue(baris_baru - 1, 2, 1);
  TableView.DataController.SetValue(baris_baru - 1, 3, dm.Q_temp.fieldbyname('hpp_ahir').AsCurrency);
  TableView.DataController.SetValue(baris_baru - 1, 4, 0);
  TableView.DataController.SetValue(baris_baru - 1, 5, dm.Q_temp.fieldbyname('hpp_ahir').AsCurrency);
  TableView.DataController.SetValue(baris_baru - 1, 8, dm.Q_temp.fieldbyname('barcode3').AsString);
  tableview.DataController.ChangeFocusedRowIndex(baris_baru);
  mm_nama.Text := tableView.DataController.GetValue(baris_baru - 1, 1);
  ce_harga.Value := dm.Q_temp.fieldbyname('hpp_ahir').AsCurrency;
  refresh_HPP;
end;

procedure Tf_RO.ed_codeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    if ed_code.Text = '' then
      exit;
    fungsi.sqlExec(dm.Q_temp, 'SELECT kd_barang,n_barang,barcode3, ' +
      'hpp_ahir,kd_sat3 FROM tb_barang WHERE ((kd_barang = "' + ed_code.Text +
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

procedure Tf_RO.TableViewTcxGridDataControllerTcxDataSummaryFooterSummaryItems3GetText
  (Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var
  AText: string);
begin
  if (Atext <> '') then
    sub_sub_total := AValue
  else
  begin
    ed_sub_total.Clear;
    ce_ppn.Clear;
    ed_nilai_faktur.Clear;
  end;

end;

procedure Tf_RO.TableViewTcxGridDataControllerTcxDataSummaryFooterSummaryItems4GetText
  (Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var
  AText: string);
begin
  if (Atext <> '') then
  begin
    diskon := AValue;
    ed_sub_total.Value := sub_sub_total - diskon;
    if (cb_ppn.Checked = false) then
      Ce_PPN.Value := (ed_sub_total.Value - ce_diskonrp.Value) / dm.PPN
    else
      Ce_PPN.Value := 0;
    ed_nilai_faktur.Value := ed_sub_total.Value - ce_diskonrp.Value + ce_PPN.Value;
  end
  else
  begin
    ed_sub_total.Clear;
    ce_ppn.Clear;
    ed_nilai_faktur.Clear;
  end;

end;

procedure Tf_RO.TableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
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
    ce_harga.Value := AfocusedRecord.Values[3];
  except
  end;
end;

procedure Tf_RO.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure Tf_RO.cb_tunaiClick(Sender: TObject);
begin
  s1.Visible := not (cb_tunai.Checked);
  ed_jatuh_tempo.Visible := not (cb_tunai.Checked);
  if cb_tunai.Checked = true then
    ed_jatuh_tempo.Value := 0
  else
    ed_jatuh_tempo.Value := 1;
  if ed_jatuh_tempo.Visible = true then
    ed_jatuh_tempo.SetFocus;
end;

procedure Tf_RO.cb_PPNClick(Sender: TObject);
begin
  if (cb_ppn.Checked = false) then
    Ce_PPN.Value := (ed_sub_total.Value - ce_diskonrp.Value) / dm.PPN
  else
    Ce_PPN.Value := 0;

  ed_nilai_faktur.Value := ed_sub_total.Value - ce_diskonrp.Value + ce_PPN.Value;

  refresh_HPP;
end;

procedure Tf_RO.ed_sub_totalChange(Sender: TObject);
begin
  try
    ce_diskonpr.Value := (ce_diskonrp.Value / ed_sub_total.Value) * 100;
  except
  end;
end;

procedure Tf_RO.b_newClick(Sender: TObject);
begin
  bersih;
end;

procedure Tf_RO.sb_supplierClick(Sender: TObject);
begin
  ed_supplier.SetFocus;
  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi := 'select kode,n_supp from tb_supp where kd_perusahaan="' + dm.kd_perusahaan
      + '"';
    tblcap[0] := 'Kode';
    tblCap[1] := 'Nama Supplier';
    CariT := 9;
    tampil_button(True, True);
    if ShowModal = mrOk then
    begin
      ed_supplier.Text := TblVal[0];
      L_supp.Caption := tblval[1];
    end;
  finally
    close;
  end;
end;

procedure Tf_RO.ed_supplierKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_return) and (sb_supplier.Enabled = True) then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    sb_supplierClick(Sender);
  end;
end;

procedure Tf_RO.sb_cariClick(Sender: TObject);
begin
  ed_code.SetFocus;
  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi := 'select kd_barang, n_barang, hpp_ahir from tb_barang ' +
      'where kd_perusahaan="' + dm.kd_perusahaan + '"';
    tblcap[0] := 'PID';
    tblCap[1] := 'Deskripsi Barang';
    tblCap[2] := 'HPP';
    tampil_button(False, True);
    if ShowModal = mrOk then
    begin
      ed_code.Text := TblVal[0];
    end;
  finally
    close;
  end;
end;

procedure Tf_RO.b_simpanClick(Sender: TObject);
var
  _sql, isi_sql, isi_sql2: string;
  LIsiHppAktif, LIsiHppAkhir, LIsiStokOH: string;
  tunai, plus_PPN, kd_faktur: string;
  LKdBarang, LKdBarangs: string;
  x, LQty, LHppAhir: integer;
begin
  refresh_HPP;
  if (ed_supplier.Text = '') or (ed_no_faktur.Text = '') then
  begin
    showmessage('Data Supplier dan no faktur harus di isi terlebih dahulu...');
    exit;
  end;

  if (ed_no_faktur.Color = clblue) then
  begin
    showmessage('no faktur ini sudah ada dalam database....');
    exit;
  end;

  if tableview.DataController.RecordCount = 0 then
  begin
    showmessage('Data barang masih kosong...');
    exit;
  end;

  kd_faktur := ed_no_faktur.Text;

  if cb_tunai.Checked = true then
    tunai := 'Y'
  else
    tunai := 'N';
  if cb_PPN.Checked = true then
    plus_PPN := 'Y'
  else
    plus_PPN := 'N';

  for x := 0 to tableview.DataController.RecordCount - 1 do
  begin
    LHppAhir := TableView.DataController.GetValue(x, 6);
    LQty := TableView.DataController.GetValue(x, 2);
    LKdBarang := TableView.DataController.GetDisplayText(x, 0);

    isi_sql := isi_sql + Format('("%s", "%s", "%s", "%s", "%d", "%g", "%g", date(now()), "%s"), ',
      [dm.kd_perusahaan, ed_no_faktur.Text, LKdBarang, TableView.DataController.GetDisplayText(x, 1),
      LQty, Double(TableView.DataController.GetValue(x, 3)), Double(TableView.DataController.GetValue(x, 4)),
      TableView.DataController.GetDisplayText(x, 8)]);

    isi_sql2 := isi_sql2 + Format('("%s", "%s", "%s", date(now())), ', [dm.kd_perusahaan,
      ed_supplier.Text, LKdBarang]);

    LIsiHppAktif := LIsiHppAktif + Format('WHEN "%s" THEN (((hpp_aktif * stok_OH) + (%d * %d))/(stok_OH + %d)) ',
      [LKdBarang, LHppAhir, LQty, LQty]);

    LIsiHppAkhir := LIsiHppAkhir + Format('WHEN "%s" THEN (%d) ', [LKdBarang, LHppAhir]);

    LIsiStokOH := LIsiStokOH + Format('WHEN "%s" THEN (stok_OH + %d) ', [LKdBarang,
      LQty]);

    LKdBarangs := LKdBarangs + Format('"%s", ', [LKdBarang]);
  end;
  SetLength(isi_sql, length(isi_sql) - 2);
  SetLength(isi_sql2, length(isi_sql2) - 2);
  SetLength(LIsiHppAktif, Length(LIsiHppAktif) - 1);
  SetLength(LIsiHppAkhir, Length(LIsiHppAkhir) - 1);
  SetLength(LIsiStokOH, Length(LIsiStokOH) - 1);
  SetLength(LKdBarangs, Length(LKdBarangs) - 2);

  dm.db_conn.StartTransaction;
  try
    _sql := Format('INSERT INTO tb_receipt_global(kd_perusahaan, kd_receipt, tgl_receipt, '
      + 'kd_suplier, jatuh_tempo, tunai, plus_PPN, PPN, disk_rp, nilai_faktur, simpan_pada, '
      + 'pengguna, keterangan) VALUES ("%s", "%s", "%s", "%s", "%s", "%s", "%s", "%g", "%g", "%g", now(), "%s", "%s")',
      [dm.kd_perusahaan, ed_no_faktur.Text, formatdatetime('yyyy-MM-dd', ed_tgl.Date),
      ed_supplier.Text, ed_jatuh_tempo.Text, tunai, plus_PPN, ce_PPN.value,
      ce_diskonrp.Value, ed_nilai_faktur.Value, dm.kd_pengguna, mmKeterangan.Text]);

    fungsi.SQLExec(dm.Q_exe, _sql, false);

    _sql := Format('INSERT INTO tb_receipt_rinci(kd_perusahaan,kd_receipt, ' +
      'kd_barang,n_barang,qty_receipt,harga_pokok,diskon,tgl_simpan,barcode) VALUES %s',
      [isi_sql]);

    fungsi.SQLExec(dm.Q_exe, _sql, false);

    _sql := Format('UPDATE tb_barang SET hpp_aktif = (CASE kd_barang %s END), '
      + 'hpp_ahir = (CASE kd_barang %s END), stok_OH = (CASE kd_barang %s END), '
      + 'Tr_Akhir = date(now()) ' +
      'WHERE kd_perusahaan = "%s" AND kd_barang IN (%s)', [LIsiHppAktif,
      LIsiHppAkhir, LIsiStokOH, dm.kd_perusahaan, LKdBarangs]);

    fungsi.SQLExec(dm.Q_exe, _sql, false);

    _sql := Format('REPLACE tb_barang_supp(kd_perusahaan,kd_suplier,kd_barang,`update`) '
      + 'VALUES %s', [isi_sql2]);

    fungsi.SQLExec(dm.Q_exe, _sql, false);

    dm.db_conn.Commit;
    showmessage('penyimpanan data berhasil...');
    ed_code.SetFocus;
    ed_no_faktur.Clear;
    ed_no_faktur.Text := kd_faktur;
    b_print.SetFocus;
  except
    on E: exception do
    begin
      dm.db_conn.Rollback;
      messagedlg('proses penyimpanan gagal,ulangi lagi!!! '#10#13'' + e.Message,
        mterror, [mbOk], 0);
      exit;
    end;
  end;
  pnlKeterangan.Visible := True;
  mmKeterangan.Enabled := False;
end;

procedure Tf_RO.b_printClick(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_laporan,
    'select * from vw_cetak_receipt where kd_perusahaan="' + dm.kd_perusahaan +
    '" and kd_receipt="' + ed_no_faktur.Text + '"', true);
  dm.laporan.LoadFromFile(dm.WPath + 'laporan\gp_receipt_rinci.fr3');
  dm.FRMemo(dm.laporan, 'Memo9').Text := MyTerbilang(dm.Q_laporan.fieldbyname('nilai_faktur').AsFloat)
    + 'Rupiah';
  dm.laporan.ShowReport;
end;

procedure Tf_RO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  f_utama.MDIChildDestroyed(Self.Handle);
  Action := cafree;
  f_RO := nil;
end;

procedure Tf_RO.ed_no_fakturChange(Sender: TObject);
var
  urip: Boolean;
begin
  fungsi.SQLExec(dm.Q_temp,
    'select kd_receipt from tb_receipt_global where kd_receipt="' + ed_no_faktur.Text
    + '" and kd_perusahaan="' + dm.kd_perusahaan + '"', true);
  if not (dm.Q_temp.Eof) then
  begin
    urip := True;
    Caption := 'RO (' + ed_no_faktur.Text + ')';
    f_utama.tc_child.Tabs.Strings[f_utama.tc_child.TabIndex] := Caption;
    ed_no_faktur.Color := clblue;
  end
  else
  begin
    ed_no_faktur.Color := clwhite;
    Caption := 'RO (New)';
    f_utama.tc_child.Tabs.Strings[f_utama.tc_child.TabIndex] := Caption;
    urip := False;
  end;

  sb_supplier.Enabled := not (urip);
  sb_cari.Enabled := not (urip);
  b_simpan.Enabled := not (urip);
  b_auto.Enabled := not (urip);
  b_print.Enabled := urip;

  ed_tgl.ReadOnly := urip;
  ed_code.ReadOnly := urip;

  mmKeterangan.Enabled := not (urip);
  pnlKeterangan.Visible := urip;
  if urip then
    btnUpdateKeterangan.Caption := 'Edit Keterangan'
  else
    btnUpdateKeterangan.Caption := 'Simpan Keterangan';
end;

procedure Tf_RO.sSpeedButton18Click(Sender: TObject);
begin
  close;
end;

procedure Tf_RO.b_simpan_fileClick(Sender: TObject);
var
  F: TextFile;
  x, tunai, ppn: Integer;
begin
  if cb_tunai.Checked then
    tunai := 1
  else
    tunai := 0;
  if cb_PPN.Checked then
    ppn := 1
  else
    ppn := 0;

  sd.InitialDir := dm.DocPath;
  if sd.Execute then
  begin
    AssignFile(F, sd.FileName);
    Rewrite(F);
    Writeln(F, ed_supplier.text);
    Writeln(F, L_supp.caption);
    Writeln(F, ed_no_faktur.text);
    Writeln(F, ed_tgl.text);
    Writeln(F, ed_jatuh_tempo.text);
    Writeln(F, tunai);
    Writeln(F, ppn);
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
      Writeln(F, TableView.DataController.GetValue(x, 8));
    end;
    CloseFile(F);
    fungsi.amankan(sd.FileName, sd.FileName, 456);
  end;
end;

procedure Tf_RO.b_loadClick(Sender: TObject);
var
  F: TextFile;
  Tmp, x: Integer;
  TmpStr: string;
begin
  od.InitialDir := dm.DocPath;
  if od.Execute then
  begin
    try
      bersih;
      fungsi.amankan(od.FileName, od.FileName, 456);
      AssignFile(F, od.FileName);
      Reset(F);
      Readln(F, TmpStr);
      ed_supplier.Text := TmpStr;
      Readln(F, TmpStr);
      L_supp.Caption := TmpStr;
      Readln(F, TmpStr);
      ed_no_faktur.Text := TmpStr;
      Readln(F, TmpStr);
      ed_tgl.Text := TmpStr;
      Readln(F, TmpStr);
      ed_jatuh_tempo.Text := TmpStr;
      Readln(F, TmpStr);
      if TmpStr = '1' then
        cb_tunai.Checked := True
      else
        cb_tunai.Checked := False;
      Readln(F, TmpStr);
      if TmpStr = '1' then
        cb_PPN.Checked := True
      else
        cb_PPN.Checked := False;
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
        TableView.DataController.SetValue(x, 8, TmpStr);
      end;
      CloseFile(F);
      tableview.DataController.ChangeFocusedRowIndex(tableview.DataController.RecordCount);
      mm_nama.Text := tableView.DataController.GetValue(tableview.DataController.RecordCount
        - 1, 1);
      ce_harga.Value := tableView.DataController.GetValue(tableview.DataController.RecordCount
        - 1, 3);
      refresh_HPP;
      fungsi.amankan(od.FileName, od.FileName, 456);
    except
      ShowMessage('proses load data gagal...');
    end
  end;
end;

procedure Tf_RO.FormShow(Sender: TObject);
begin
  if (f_utama.sb.Panels[8].Text = 'PUSAT') and (f_utama.HakAkses('gdTrRO')) then
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

procedure Tf_RO.FormCreate(Sender: TObject);
begin
  f_utama.MDIChildCreated(self.Handle);
end;

procedure Tf_RO.ed_codeKeyPress(Sender: TObject; var Key: Char);
var
  harga: real;
  kode: string;
  b: Integer;
begin
  if TableView.DataController.RecordCount = 0 then
    Exit;

  harga := TableView.DataController.GetValue(tableview.DataController.FocusedRecordIndex,
    5);

  kode := Ed_Code.Text;

  b := TableView.DataController.GetFocusedRecordIndex;

  if Key = #45 then //tanda -  diskon Rp
  begin
    delete(kode, pos('-', kode), 1);
    ed_code.Clear;
    key := #0;
    if (Length(kode) = 0) then
      Exit;

    TableView.DataController.SetValue(b, 4, StrToFloat(kode)); //diskon RP
    refresh_HPP;
  end;

  if key = #43 then // tanda + (repeat)
  begin
    delete(kode, pos('+', kode), 1);
    ed_code.Clear;
    key := #0;

    if (StrToIntDef(kode, 0) = 0) then
      Exit;

    TableView.DataController.SetValue(b, 2, StrToInt(kode)); //Qty
    TableView.DataController.SetValue(b, 3, harga * StrToInt(kode)); //total harga
    refresh_HPP;
  end;

  if Key = #47 then //tanda (/)  ubah harga
  begin
    delete(kode, pos('/', kode), 1);
    ed_code.Clear;
    key := #0;

    if (Length(kode) = 0) then
      Exit;

    TableView.DataController.SetValue(b, 3, StrToFloat(kode)); //harga baru
    refresh_HPP;
  end;
end;

procedure Tf_RO.ce_diskonprExit(Sender: TObject);
begin
  if ed_sub_total.Value <> 0 then
    ce_diskonrp.Value := (ce_diskonpr.Value / 100) * ed_sub_total.Value;

  if (cb_ppn.Checked = false) then
    Ce_PPN.Value := (ed_sub_total.Value - ce_diskonrp.Value) / dm.PPN
  else
    Ce_PPN.Value := 0;

  ed_nilai_faktur.Value := ed_sub_total.Value - ce_diskonrp.Value + ce_PPN.Value;

  refresh_HPP;
end;

procedure Tf_RO.ce_diskonrpExit(Sender: TObject);
begin
  if (cb_ppn.Checked = false) then
    Ce_PPN.Value := (ed_sub_total.Value - ce_diskonrp.Value) / dm.PPN
  else
    Ce_PPN.Value := 0;

  if ed_sub_total.Value <> 0 then
    ce_diskonpr.Value := (ce_diskonrp.Value / ed_sub_total.Value) * 100;

  ed_nilai_faktur.Value := ed_sub_total.Value - ce_diskonrp.Value + ce_PPN.Value;

  refresh_HPP;
end;

procedure Tf_RO.b_autoClick(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_temp, Format('SELECT CONCAT("RO", DATE_FORMAT(NOW(), "%%Y%%m%%d"), '
    + 'LPAD(COUNT(kd_receipt) + 1, 4, "0")) AS new_id FROM tb_receipt_global ' +
    'WHERE DATE(simpan_pada) = DATE(NOW()) AND kd_perusahaan = "%s"', [dm.kd_perusahaan]),
    true);

  ed_no_faktur.Text := dm.Q_temp.fieldbyname('new_id').AsString;
end;

procedure Tf_RO.ed_no_fakturKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_return) and (b_auto.Enabled = True) then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    b_autoClick(Self);
  end;
end;

procedure Tf_RO.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure Tf_RO.btnUpdateKeteranganClick(Sender: TObject);
var
  _sql: string;
begin
  _sql := Format('update tb_receipt_global set keterangan = "%s" ' +
    'where kd_perusahaan = "%s" and kd_receipt = "%s"', [mmKeterangan.Text, dm.kd_perusahaan,
    ed_no_faktur.Text]);

  if btnUpdateKeterangan.Caption = 'Edit Keterangan' then
  begin
    mmKeterangan.Enabled := True;
    mmKeterangan.SetFocus;
    btnUpdateKeterangan.Caption := 'Simpan Keterangan';
  end
  else
  begin

    fungsi.SQLExec(dm.Q_exe, _sql, false);

    ShowMessage('Keterangan Transaksi Berhasil disimpan..');
    mmKeterangan.Enabled := False;
    btnUpdateKeterangan.Caption := 'Edit Keterangan';
    ed_code.SetFocus;
  end;
end;

end.


