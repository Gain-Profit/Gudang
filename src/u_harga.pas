unit u_harga;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sEdit, sSkinProvider, UFungsi, ExtCtrls, sPanel, Buttons, ComCtrls,
  cxCustomData, cxGraphics, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxCheckBox, cxCurrencyEdit,
  cxTextEdit, cxImageComboBox, cxStyles, sSpeedButton, cxFilter, cxData,
  StdCtrls, MemDS, DBAccess, MyAccess, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxNavigator;

const
  WM_AFTER_SHOW = WM_USER + 300; // custom message

type
  TF_Edit_Harga = class(TForm)
    sSkinProvider1: TsSkinProvider;
    pnlSide: TsPanel;
    pnlMain: TsPanel;
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
    pnlheader: TPanel;
    Ed_Cari: TEdit;
    pnlcheck: TPanel;
    CkSemua: TCheckBox;
    pnlFilter: TPanel;
    t_dataHppLama: TcxGridDBColumn;
    t_datalaba: TcxGridDBColumn;
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
    procedure CkSemuaClick(Sender: TObject);
  private
    procedure WmAfterShow(var Msg: TMessage); message WM_AFTER_SHOW;
    procedure LihatData;
    procedure Segarkan(ASemua: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Edit_Harga: TF_Edit_Harga;

implementation

uses
  u_dm, u_edit_harga, u_utama;

{$R *.dfm}

const
  sHargaSQL =
    'SELECT br.kd_barang, br.barcode3, br.n_barang, brhg.kd_macam_harga, ' +
    'br.hpp_lama, br.hpp_ahir, (brhg.harga_jual3 - br.hpp_aktif) AS laba, ' +
    'br.hpp_aktif, brhg.harga_jual3, brhg.harga_jual2, brhg.harga_jual1, brhg.kode_user, ' +
    'IF((br.hpp_lama > br.hpp_ahir),-(1),IF((br.hpp_lama < br.hpp_ahir),1,0)) AS `NATUR`' +
    'FROM (tb_barang br LEFT JOIN tb_barang_harga brhg ON(((br.kd_barang = brhg.kd_barang) ' +
    'AND (brhg.kd_perusahaan = br.kd_perusahaan)))) ';

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
      idx := F_utama.tc_child.Tabs.IndexOfObject(TObject(msg.ActiveWnd));
      F_utama.tc_child.Tag := -1;
      F_utama.tc_child.TabIndex := idx;
      F_utama.tc_child.Tag := 0;
    end;
  end;
end;

procedure TF_Edit_Harga.WmAfterShow(var Msg: TMessage);
begin
  Segarkan(CkSemua.Checked);
  t_data.DataController.FocusedRowIndex := 1;
end;

procedure TF_Edit_Harga.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f2) and (not CkSemua.Checked) then
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
    if Ed_Cari.Text <> '' then
      caption := 'Edit Harga - ' + Ed_Cari.Text
    else
      caption := 'Edit Harga';

    Segarkan(CkSemua.Checked);
    grid.SetFocus;
    ed_cari.SetFocus;
  end;
end;

procedure TF_Edit_Harga.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  F_utama.MDIChildDestroyed(Self.Handle);
  action := cafree;
  F_edit_harga := nil;
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
      Segarkan(CkSemua.Checked);
      showmessage('penghapusan data harga barang Berhasil');
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
  F_utama.MDIChildCreated(self.Handle);
end;

procedure TF_Edit_Harga.sb_2Click(Sender: TObject);
begin
  Segarkan(CkSemua.Checked);
end;

procedure TF_Edit_Harga.sb_1Click(Sender: TObject);
begin
  close;
end;

procedure TF_Edit_Harga.LihatData;
begin
  application.CreateForm(TF_ubah_harga, F_ubah_harga);
  F_ubah_harga.ubah(Q_harga.FieldByName('kd_barang').AsString, Q_harga.FieldByName
    ('kd_macam_harga').AsString);
  if F_ubah_harga.ShowModal = mrOk then
    Segarkan(CkSemua.Checked);
end;

procedure TF_Edit_Harga.Segarkan(ASemua: Boolean);
var
  LKode, LSQL: string;
  posisi: integer;
begin
  if CkSemua.Checked then
  begin
    LSQL := Format('%s WHERE br.kd_perusahaan = "%s"', [sHargaSQL, dm.kd_perusahaan]);
  end
  else
  begin
    LKode := Ed_Cari.Text;
    if LKode = '' then
      LSQL := Format('%s WHERE br.kd_perusahaan = "%s" LIMIT 50', [sHargaSQL, dm.kd_perusahaan])
    else
      LSQL := Format('%s WHERE ((br.kd_perusahaan = "%s") AND ' +
        '(br.kd_barang LIKE "%%%s%%" or br.n_barang LIKE "%%%s%%" or br.barcode3 LIKE "%%%s%%"))',
        [sHargaSQL, dm.kd_perusahaan, LKode, LKode, LKode]);
  end;

  Screen.Cursor := crHourGlass;
  posisi := Q_harga.RecNo;
  fungsi.SQLExec(Q_harga, LSQL, True);
  Q_harga.RecNo := posisi;
  Screen.Cursor := crDefault;
end;

procedure TF_Edit_Harga.CkSemuaClick(Sender: TObject);
begin
  Segarkan(CkSemua.Checked);
  Ed_Cari.Enabled := not CkSemua.Checked;
  Ed_Cari.Clear;
end;

end.


