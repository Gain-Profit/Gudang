unit u_list_jual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxDataStorage, cxEdit, DB, cxDBData,
  cxCurrencyEdit, sSkinProvider, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, cxGridCustomView,
  cxGrid, Buttons, ExtCtrls, sPanel, UFungsi, frxclass, uTerbilang, sSpeedButton,
  sTooledit, sLabel, cxImageComboBox, sButton, cxCustomData, cxFilter, cxData,
  StdCtrls, Mask, sMaskEdit, sCustomComboEdit, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxNavigator;

type
  TF_list_sales = class(TForm)
    sPanel1: TsPanel;
    grid: TcxGrid;
    grid_data: TcxGridDBTableView;
    l_data: TcxGridLevel;
    sSkinProvider1: TsSkinProvider;
    clmn_dataColumn1: TcxGridDBColumn;
    clmn_dataColumn2: TcxGridDBColumn;
    clmn_dataColumn3: TcxGridDBColumn;
    clmn_dataColumn4: TcxGridDBColumn;
    clmn_dataColumn5: TcxGridDBColumn;
    clmn_dataColumn6: TcxGridDBColumn;
    clmn_dataColumn7: TcxGridDBColumn;
    clmn_dataColumn8: TcxGridDBColumn;
    clmn_dataColumn9: TcxGridDBColumn;
    sb_2: TsSpeedButton;
    sb_1: TsSpeedButton;
    p1: TsPanel;
    de_mulai: TsDateEdit;
    de_sampai: TsDateEdit;
    l_1: TsLabel;
    l_2: TsLabel;
    l_child: TcxGridLevel;
    t_child: TcxGridDBTableView;
    dt__child1urut: TcxGridDBColumn;
    dt__child1kd_barang: TcxGridDBColumn;
    dt__child1n_barang: TcxGridDBColumn;
    dt__child1Qty: TcxGridDBColumn;
    dt__child1harga_pokok: TcxGridDBColumn;
    dt__child1harga_jual: TcxGridDBColumn;
    dt__child1discountP: TcxGridDBColumn;
    dt__child1discountRp: TcxGridDBColumn;
    dt__child1harga_netto: TcxGridDBColumn;
    dt__child1total_harga: TcxGridDBColumn;
    dt__child1void_barang: TcxGridDBColumn;
    dt__child1ket: TcxGridDBColumn;
    dt__datatunai: TcxGridDBColumn;
    dt__datajatuh_tempo: TcxGridDBColumn;
    dt__datakd_macam_harga: TcxGridDBColumn;
    dt__datasub_total: TcxGridDBColumn;
    dt__datadiscountGP: TcxGridDBColumn;
    dt__datavoid: TcxGridDBColumn;
    dt__datakomp: TcxGridDBColumn;
    b_cetak: TsButton;
    t_data_simpan_pada: TcxGridDBColumn;
    procedure WMMDIACTIVATE(var msg: TWMMDIACTIVATE); message WM_MDIACTIVATE;
    procedure segarkan;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grid_dataCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
      TShiftState; var AHandled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure sb_1Click(Sender: TObject);
    procedure sb_2Click(Sender: TObject);
    procedure de_sampaiChange(Sender: TObject);
    procedure b_cetakClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_list_sales: TF_list_sales;

implementation

uses
  u_utama, u_dm;

{$R *.dfm}

procedure TF_list_sales.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
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

function FRObject(FastReport: TfrxReport; ObjectName: string): TObject;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to FastReport.ComponentCount - 1 do
  begin
    if LowerCase(FastReport.Components[i].Name) = LowerCase(ObjectName) then
    begin
      Result := TObject(FastReport.Components[i]);
      Break;
    end;
  end;
end;

function FRMemo(FastReport: TfrxReport; ObjectName: string): TfrxMemoView;
begin
  Result := TfrxMemoView(FRObject(FastReport, ObjectName));
end;

procedure TF_list_sales.segarkan;
begin
  fungsi.SQLExec(dm.Q_list_sales,
    'select * from vw_list_sales where kd_perusahaan = ' + QuotedStr(dm.kd_perusahaan)
    + ' and tgl_transaksi >= ' + quotedstr(FormatDateTime('yyyy-MM-dd', de_mulai.Date))
    + ' and tgl_transaksi <= ' + quotedstr(FormatDateTime('yyyy-MM-dd',
    de_sampai.Date)) + '', true);

  fungsi.SQLExec(dm.Q_child_sales, 'select *, ifnull(((`discountRp` * 100) / `harga_jual`), 0) '+
    'AS `discountP`, (`harga_jual` - `discountRp`) AS `harga_netto`, '+
    '((`harga_jual` - `discountRp`) * `Qty`) AS `total_harga` '+
    'from tb_jual_rinci where kd_perusahaan = ' + QuotedStr(dm.kd_perusahaan)
    + ' and date(tgl_simpan) BETWEEN ' + quotedstr(FormatDateTime('yyyy-MM-dd', de_mulai.Date)) +
    ' AND ' + quotedstr(FormatDateTime('yyyy-MM-dd', de_sampai.Date)) + '', True);
end;

procedure TF_list_sales.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  F_utama.MDIChildDestroyed(Self.Handle);
  action := caFree;
  F_list_sales := nil;
end;

procedure TF_list_sales.grid_dataCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
  TShiftState; var AHandled: Boolean);
begin
  b_cetakClick(Self);
end;

procedure TF_list_sales.FormCreate(Sender: TObject);
{var
  Year, Month, Day: Word;
begin
DecodeDate(Now, Year, Month, Day);
de_mulai.Date:= EncodeDate(Year,Month,1);
}
begin
  de_mulai.Date := Date();
  de_sampai.Date := Date();

  F_utama.MDIChildCreated(self.Handle);
  segarkan;
end;

procedure TF_list_sales.sb_1Click(Sender: TObject);
begin
  close;
end;

procedure TF_list_sales.sb_2Click(Sender: TObject);
begin
  segarkan;
end;

procedure TF_list_sales.de_sampaiChange(Sender: TObject);
begin
  if de_sampai.Date < de_mulai.Date then
    de_sampai.Date := de_mulai.Date;
end;

procedure TF_list_sales.b_cetakClick(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_laporan,
    'select * from vw_jual_barang where no_transaksi="' + dm.Q_list_sales.fieldbyname
    ('kd_transaksi').AsString + '" and kd_perusahaan=' + quotedstr(dm.kd_perusahaan)
    + '', true);
  dm.laporan.LoadFromFile(dm.WPath + 'laporan/k_struk_retail.fr3');
  FRMemo(dm.laporan, 'Memo9').Text := MyTerbilang(dm.Q_laporan.fieldbyname('grand_total').AsCurrency)
    + 'Rupiah';
  dm.laporan.ShowReport;
end;

end.


