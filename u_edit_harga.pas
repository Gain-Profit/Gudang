unit u_edit_harga;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sEdit, sSkinProvider, UFungsi, ExtCtrls, sPanel, Buttons, ComCtrls,
  cxCustomData, cxGraphics, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxCheckBox, cxCurrencyEdit,
  cxTextEdit, cxImageComboBox, cxStyles, sSpeedButton, cxFilter, cxData,
  StdCtrls, MemDS, DBAccess, MyAccess;

const
  WM_AFTER_SHOW = WM_USER + 300; // custom message

type
  TF_Edit_Harga = class(TForm)
    sSkinProvider1: TsSkinProvider;
    sPanel1: TsPanel;
    sPanel2: TsPanel;
    Ed_Cari: TsEdit;
    grid: TcxGrid;
    t_data: TcxGridDBTableView;
    l_data: TcxGridLevel;
    t_datakd_barang: TcxGridDBColumn;
    t_dataharga_pokok: TcxGridDBColumn;
    t_dataharga_jual1: TcxGridDBColumn;
    t_dataharga_jual2: TcxGridDBColumn;
    t_dataharga_jual3: TcxGridDBColumn;
    t_datan_barang: TcxGridDBColumn;
    t_databarcode3: TcxGridDBColumn;
    t_datan_macam_harga: TcxGridDBColumn;
    t_dataHppNew: TcxGridDBColumn;
    t_datauser: TcxGridDBColumn;
    t_dataColumn1: TcxGridDBColumn;
    sb_2: TsSpeedButton;
    sb_1: TsSpeedButton;
    Q_harga: TMyQuery;
    Ds_harga: TDataSource;
    procedure WMMDIACTIVATE(var msg: TWMMDIACTIVATE); message WM_MDIACTIVATE;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure T(Sender: TObject);
    procedure Ed_CariKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure t_dataCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo:
      TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState;
      var AHandled: Boolean);
    procedure t_dataKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure sb_2Click(Sender: TObject);
    procedure sb_1Click(Sender: TObject);
    procedure deleteHargaBarang(perusahaan: string);
  private
    procedure WmAfterShow(var Msg: TMessage); message WM_AFTER_SHOW;
    procedure LihatData;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Edit_Harga: TF_Edit_Harga;

implementation

uses
  u_dm, u_ubah, u_utama;

{$R *.dfm}

procedure TF_Edit_Harga.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
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

procedure TF_Edit_Harga.WmAfterShow(var Msg: TMessage);
begin
  fungsi.SQLExecT(Q_harga, 'select * from vw_harga_barang where kd_perusahaan="'
    + dm.kd_perusahaan + '"', true);
  t_data.DataController.FocusedRowIndex := 1;
end;

procedure TF_Edit_Harga.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  if key = vk_f2 then
    ed_cari.SetFocus;
end;

procedure TF_Edit_Harga.T(Sender: TObject);
begin
  PostMessage(Self.Handle, WM_AFTER_SHOW, 0, 0);
end;

procedure TF_Edit_Harga.Ed_CariKeyDown(Sender: TObject; var Key: Word; Shift:
  TShiftState);
begin
  if key = vk_down then
    grid.SetFocus;

  if key = vk_return then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    if ed_cari.Text <> '' then
      caption := 'Edit Harga - ' + ed_cari.Text
    else
      caption := 'Edit Harga';

    fungsi.SQLExec(Q_harga,
      'select * from vw_harga_barang where (kd_barang like "%' + ed_cari.Text +
      '%" or n_barang like "%' + ed_cari.Text + '%" or barcode3 like "%' +
      ed_cari.Text + '%" or barcode2 like "%' + ed_cari.Text +
      '%" or barcode1 like "%' + ed_cari.Text + '%") and (kd_perusahaan="' + dm.kd_perusahaan
      + '")', true);

    grid.SetFocus;
    ed_cari.SetFocus;
  end;
end;

procedure TF_Edit_Harga.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  f_utama.MDIChildDestroyed(Self.Handle);
  action := cafree;
  f_edit_harga := nil;
end;

procedure TF_Edit_Harga.t_dataCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
  TShiftState; var AHandled: Boolean);
begin
  LihatData;
end;

procedure TF_Edit_Harga.t_dataKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  i: Integer;
begin
  if (key = vk_delete) and (MessageDlg('Yakinkah, akan menghapus data ini?...',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    dm.db_conn.StartTransaction;
    try
      deleteHargaBarang(dm.kd_perusahaan);
      if F_utama.sb.Panels[8].Text = 'PUSAT' then
      begin
        for i := 0 to cabang.Count - 1 do
        begin
          deleteHargaBarang(cabang[i]);
        end;
      end;

      dm.db_conn.Commit;
    except
      on e: exception do
      begin
        dm.db_conn.Rollback;
        showmessage('penghapusan data gagal '#10#13'' + e.Message);
      end;
    end;
  end;

  if key = vk_return then
  begin
    LihatData;
  end;
end;

procedure TF_Edit_Harga.deleteHargaBarang(perusahaan: string);
begin
  fungsi.SQLExec(dm.Q_Exe, 'delete from tb_barang_harga where kd_perusahaan="' +
    perusahaan + '" and kd_macam_harga="' + Q_harga.fieldbyname('kd_macam_harga').AsString
    + '" and kd_barang="' + Q_harga.fieldbyname('kd_barang').AsString + '"', false);
end;

procedure TF_Edit_Harga.FormCreate(Sender: TObject);
begin
  f_utama.MDIChildCreated(self.Handle);
end;

procedure TF_Edit_Harga.sb_2Click(Sender: TObject);
var
  posisi: integer;
begin
  Screen.Cursor := crHourGlass;
  posisi := Q_harga.RecNo;
  fungsi.SQLExec(Q_harga, 'select * from vw_harga_barang where kd_perusahaan="'
    + dm.kd_perusahaan + '"', true);

  Q_harga.RecNo := posisi;
  Screen.Cursor := crDefault;
end;

procedure TF_Edit_Harga.sb_1Click(Sender: TObject);
begin
  close;
end;

procedure TF_Edit_Harga.LihatData;
begin
  application.CreateForm(TF_ubah_harga, F_ubah_harga);
  f_ubah_harga.ubah(Q_harga.FieldByName('kd_barang').AsString, Q_harga.FieldByName
    ('kd_macam_harga').AsString);
  F_ubah_harga.ShowModal;
end;

end.


