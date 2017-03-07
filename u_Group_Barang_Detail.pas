unit u_Group_Barang_Detail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxDataStorage, cxEdit, DB,
  cxDBData, sSkinProvider, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid, ExtCtrls,
  sPanel, StdCtrls, sButton, sEdit, sLabel, Buttons, sSpeedButton, sBevel,
  cxCurrencyEdit, sCurrEdit, sCurrencyEdit, cxFilter, cxData, Mask, sMaskEdit,
  sCustomComboEdit;

type
  TFGroupBarangDetail = class(TForm)
    sSkinProvider1: TsSkinProvider;
    pnlTop: TsPanel;
    pnlBottom: TsPanel;
    btnSimpan: TsButton;
    btnKeluar: TsButton;
    sLabel1: TsLabel;
    edKodeGroup: TsEdit;
    sLabel2: TsLabel;
    edDeskripsiGroup: TsEdit;
    sBevel1: TsBevel;
    sb_cari: TsSpeedButton;
    ed_code: TsEdit;
    btnBaru: TButton;
    Grid: TcxGrid;
    TableView: TcxGridTableView;
    vwKode: TcxGridColumn;
    vwDeskripsi: TcxGridColumn;
    vwQty: TcxGridColumn;
    vwBarcode: TcxGridColumn;
    Level: TcxGridLevel;
    l_2: TsLabel;
    l_1: TsLabel;
    l_5: TsLabel;
    edDiskon: TsCurrencyEdit;
    lblDiskon: TsLabel;
    btnDiskon: TsButton;
    procedure baru;
    procedure edit(GroupId: string);
    procedure btnBaruClick(Sender: TObject);
    procedure sb_cariClick(Sender: TObject);
    procedure ed_codeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure createrows;
    procedure btnKeluarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSimpanClick(Sender: TObject);
    procedure ed_codeKeyPress(Sender: TObject; var Key: Char);
    procedure btnDiskonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGroupBarangDetail: TFGroupBarangDetail;

implementation

uses
  u_dm, UFungsi, u_cari, u_Group_Barang;

{$R *.dfm}

{ TFGroupBarangDetail }

procedure TFGroupBarangDetail.baru;
begin
  edKodeGroup.Enabled := True;
  edKodeGroup.Clear;
  edDeskripsiGroup.Clear;
  edDiskon.Value := 0;
  TableView.DataController.RecordCount := 0;
end;

procedure TFGroupBarangDetail.edit(GroupId: string);
var
  i: Integer;
  jenis: string;
begin
  edKodeGroup.Text := GroupId;
  edKodeGroup.Enabled := False;

  fungsi.SQLExec(dm.Q_temp, 'select * from tb_barang_group where id_group="' +
    GroupId + '"', true);
  edDeskripsiGroup.Text := dm.Q_temp.FieldByName('deskripsi').AsString;
  edDiskon.Value := dm.Q_temp.FieldByName('diskon').AsFloat;
  jenis := dm.Q_temp.FieldByName('jenis').AsString;
  if jenis = '%' then
  begin
    btnDiskon.Caption := 'Persen';
    edDiskon.DisplayFormat := '##0.00;(##0.00);0.00';
  end
  else
  begin
    btnDiskon.Caption := 'Rupiah';
    edDiskon.DisplayFormat := '###,###,##0;(###,###,##0);0';
  end;

  fungsi.SQLExec(dm.Q_temp, Format('SELECT gr.kd_barang, gr.qty, ' +
    'br.n_barang, br.barcode3, br.kd_perusahaan FROM tb_barang_group_detail gr ' +
    'INNER JOIN tb_barang br ON br.kd_barang = gr.kd_barang WHERE br.kd_perusahaan = "%s" ' +
    'AND gr.barang_group_id = "%s"', [dm.kd_perusahaan, GroupId]), true);

  if dm.Q_temp.RecordCount <> 0 then
  begin
    tableview.DataController.RecordCount := dm.Q_temp.RecordCount;
    for i := 0 to dm.Q_temp.RecordCount - 1 do
    begin
      TableView.DataController.SetValue(i, 0, dm.Q_temp.FieldByName('kd_barang').AsString);
      TableView.DataController.SetValue(i, 1, dm.Q_temp.fieldbyname('n_barang').AsString);
      TableView.DataController.SetValue(i, 2, dm.Q_temp.FieldByName('barcode3').AsString);
      TableView.DataController.SetValue(i, 3, dm.Q_temp.fieldbyname('qty').AsInteger);
      dm.Q_temp.Next;
    end;
    tableview.DataController.ChangeFocusedRowIndex(tableview.DataController.RecordCount
      + 1);
  end;
end;

procedure TFGroupBarangDetail.btnBaruClick(Sender: TObject);
begin
  baru;
  edKodeGroup.SetFocus;
end;

procedure TFGroupBarangDetail.sb_cariClick(Sender: TObject);
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

procedure TFGroupBarangDetail.ed_codeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
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
  if key = vk_return then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    if ed_code.Text = '' then
      exit;

    fungsi.sqlExec(dm.Q_temp, 'SELECT kd_barang,n_barang,barcode3 ' +
      'FROM tb_barang WHERE ((kd_barang = "' + ed_code.Text +
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
end;

procedure TFGroupBarangDetail.createrows;
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
        TableView.DataController.SetValue(f, 2, dm.Q_temp.fieldbyname('barcode3').AsString);
        TableView.DataController.SetValue(f, 3, TableView.DataController.getValue
          (f, 3) + 1);
        exit;
      end;
    end;
  end;

  baris_baru := tableview.DataController.RecordCount + 1;
  tableview.DataController.RecordCount := baris_baru;
  TableView.DataController.SetValue(baris_baru - 1, 0, dm.Q_temp.fieldbyname('kd_barang').AsString);
  TableView.DataController.SetValue(baris_baru - 1, 1, dm.Q_temp.fieldbyname('n_barang').AsString);
  TableView.DataController.SetValue(baris_baru - 1, 2, dm.Q_temp.fieldbyname('barcode3').AsString);
  TableView.DataController.SetValue(baris_baru - 1, 3, 1);
  tableview.DataController.ChangeFocusedRowIndex(baris_baru);
end;

procedure TFGroupBarangDetail.btnKeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TFGroupBarangDetail.FormKeyDown(Sender: TObject; var Key: Word; Shift:
  TShiftState);
begin
  if (Shift = [ssctrl]) and (Key = vk_delete) then
    if (MessageDlg('Yakinkah, Anda akan menghapus data ini???', mtConfirmation,
      [mbYes, mbNo], 0) = mrYes) then
      TableView.DataController.DeleteFocused;

  if key = vk_f2 then
    ed_code.SetFocus;

  if Key = vk_escape then
    Close;
end;

procedure TFGroupBarangDetail.btnSimpanClick(Sender: TObject);
var
  x: integer;
  isi_sql, jenis: string;
begin
  if (edKodeGroup.Text = '') or (edDeskripsiGroup.Text = '') then
  begin
    showmessage('Kode Group dan Deskripsi Tidak Boleh Kosong...');
    exit;
  end;

  if tableview.DataController.RecordCount = 0 then
  begin
    showmessage('Data barang masih kosong...');
    exit;
  end;

  if btnDiskon.Caption = 'Rupiah' then
    jenis := '$'
  else
    jenis := '%';

  for x := 0 to tableview.DataController.RecordCount - 1 do
  begin
    isi_sql := isi_sql + '("' + edKodeGroup.Text + '","' + TableView.DataController.GetDisplayText
      (x, 0) + '","' + floattostr(TableView.DataController.GetValue(x, 3)) + '"),';
  end;
  delete(isi_sql, length(isi_sql), 1);

  dm.db_conn.StartTransaction;
  try
    fungsi.SQLExec(dm.Q_Exe, Format('REPLACE tb_barang_group (id_group, deskripsi, diskon, jenis) '
      + 'VALUES ("%s","%s","%s","%s")', [edKodeGroup.Text, edDeskripsiGroup.Text,
      edDiskon.Text, jenis]), False);

    fungsi.SQLExec(dm.Q_Exe, Format('DELETE FROM tb_barang_group_detail WHERE '
      + 'barang_group_id = "%s"', [edKodeGroup.Text]), False);

    fungsi.SQLExec(dm.Q_exe,
      'insert into tb_barang_group_detail(barang_group_id, ' + 'kd_barang, qty) values  '
      + isi_sql, false);

    dm.db_conn.Commit;

    showmessage('penyimpanan data sukses...');
    edKodeGroup.Enabled := False;
    FGroupBarang.segarkan;

  except
    on E: exception do
    begin
      dm.db_conn.Rollback;
      messagedlg('proses penyimpanan gagal,ulangi lagi!!! '#10#13'' + e.Message,
        mterror, [mbOk], 0);
    end;
  end;
end;

procedure TFGroupBarangDetail.ed_codeKeyPress(Sender: TObject; var Key: Char);
var
  kode: string;
  b: integer;
begin
  if TableView.DataController.RecordCount = 0 then
    Exit;
  kode := Ed_Code.Text;
  b := TableView.DataController.GetFocusedRecordIndex;

  if key = #43 then // tanda + (repeat)
  begin
    delete(kode, pos('+', kode), 1);
    ed_code.Clear;
    key := #0;

    if (StrToIntDef(kode, 0) = 0) or (Length(kode) = 0) then
      Exit;

    TableView.DataController.SetValue(b, 3, kode); //Qty
  end;
end;

procedure TFGroupBarangDetail.btnDiskonClick(Sender: TObject);
begin
  if btnDiskon.Caption = 'Rupiah' then
  begin
    btnDiskon.Caption := 'Persen';
    edDiskon.DisplayFormat := '##0.00;(##0.00);0.00';
  end
  else
  begin
    btnDiskon.Caption := 'Rupiah';
    edDiskon.DisplayFormat := '###,###,##0;(###,###,##0);0';
  end;
end;

end.


