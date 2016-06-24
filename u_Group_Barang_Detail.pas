unit u_Group_Barang_Detail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, sSkinProvider, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, ExtCtrls, sPanel, StdCtrls, sButton,
  sEdit, sLabel, Buttons, sSpeedButton, sBevel, cxCurrencyEdit;

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
    procedure baru;
    procedure edit(GroupId: string);
    procedure btnBaruClick(Sender: TObject);
    procedure sb_cariClick(Sender: TObject);
    procedure ed_codeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGroupBarangDetail: TFGroupBarangDetail;

implementation

uses u_dm, U_fungsi, u_utama, u_cari;

{$R *.dfm}

{ TFGroupBarangDetail }

procedure TFGroupBarangDetail.baru;
begin
  edKodeGroup.Enabled:= True;
  edKodeGroup.Clear;
  edDeskripsiGroup.Clear;
  TableView.DataController.RecordCount:= 0;
end;

procedure TFGroupBarangDetail.edit(GroupId: string);
var i: Integer;
begin
  edKodeGroup.Text := GroupId;
  edKodeGroup.Enabled:= False;

  fungsi.SQLExec(dm.Q_temp,'select deskripsi from tb_barang_group where id_group="'+GroupId+'"',true);
  edDeskripsiGroup.Text:= dm.Q_temp.FieldByName('deskripsi').AsString;

  fungsi.SQLExec(dm.Q_temp,Format('SELECT gr.kd_barang, gr.qty, '+
  'br.n_barang, br.barcode3, br.kd_perusahaan FROM tb_barang_group_detail gr '+
  'INNER JOIN tb_barang br ON br.kd_barang = gr.kd_barang WHERE br.kd_perusahaan = "%s" '+
  'AND gr.barang_group_id = "%s"',[f_utama.sb.Panels[3].Text, GroupId]),true);

  if dm.Q_temp.RecordCount<>0 then
  begin
    tableview.DataController.RecordCount:= dm.Q_temp.RecordCount;
    for i:= 0 to dm.Q_temp.RecordCount-1 do
    begin
    TableView.DataController.SetValue(i, 0, dm.Q_temp.FieldByName('kd_barang').AsString);
    TableView.DataController.SetValue(i, 1, dm.Q_temp.fieldbyname('n_barang').AsString);
    TableView.DataController.SetValue(i, 2, dm.Q_temp.FieldByName('barcode3').AsString);
    TableView.DataController.SetValue(i, 3, dm.Q_temp.fieldbyname('qty').AsInteger);
    dm.Q_temp.Next;
    end;
    tableview.DataController.ChangeFocusedRowIndex(tableview.DataController.RecordCount+1);
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
    _SQLi:= 'select kd_barang, n_barang from tb_barang where kd_perusahaan="'+f_utama.sb.Panels[3].Text+'"';
    tblcap[0]:= 'PID';
    tblCap[1]:= 'Deskripsi Barang';
    tampil_button(False,True);
    if ShowModal = mrOk then
    begin
        ed_code.Text:=TblVal[0];
    end;
  finally
  close;
  end;
end;

procedure TFGroupBarangDetail.ed_codeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key= vk_f2) then sb_cariClick(Sender);

  if key= vk_up then
  begin
    if tableview.DataController.FocusedRecordIndex >=1 then
       tableview.DataController.FocusedRecordIndex:= tableview.DataController.FocusedRecordIndex-1;
    key:=VK_NONAME;
  end;

  if key= vk_down then
    tableview.DataController.FocusedRowIndex:= tableview.DataController.FocusedRowIndex+1;
end;

end.
