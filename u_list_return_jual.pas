unit u_list_return_jual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCurrencyEdit, sSkinProvider,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, StdCtrls, Buttons,
  sBitBtn, ExtCtrls, sPanel,U_fungsi,frxclass,uTerbilang, sSpeedButton,
  Mask, sMaskEdit, sCustomComboEdit, sTooledit, sLabel, cxImageComboBox,
  sButton;

type
  Tf_list_return_jual = class(TForm)
    sPanel1: TsPanel;
    grid: TcxGrid;
    grid_data: TcxGridDBTableView;
    l_data: TcxGridLevel;
    sSkinProvider1: TsSkinProvider;
    clmn_dataColumn1: TcxGridDBColumn;
    clmn_dataColumn2: TcxGridDBColumn;
    clmn_dataColumn4: TcxGridDBColumn;
    clmn_dataColumn5: TcxGridDBColumn;
    clmn_dataColumn6: TcxGridDBColumn;
    clmn_dataColumn7: TcxGridDBColumn;
    sb_2: TsSpeedButton;
    sb_1: TsSpeedButton;
    p1: TsPanel;
    de_mulai: TsDateEdit;
    de_sampai: TsDateEdit;
    l_1: TsLabel;
    l_2: TsLabel;
    t_child: TcxGridDBTableView;
    dt__child1urut: TcxGridDBColumn;
    dt__child1kd_barang: TcxGridDBColumn;
    dt__child1n_barang: TcxGridDBColumn;
    dt__child1Qty: TcxGridDBColumn;
    dt__child1hpp: TcxGridDBColumn;
    dt__child1harga_pokok: TcxGridDBColumn;
    dt__child1harga_jual: TcxGridDBColumn;
    dt__child1discountP: TcxGridDBColumn;
    dt__child1discountRp: TcxGridDBColumn;
    dt__child1harga_netto: TcxGridDBColumn;
    dt__child1total_harga: TcxGridDBColumn;
    dt__child1laba: TcxGridDBColumn;
    dt__child1void_barang: TcxGridDBColumn;
    dt__child1ket: TcxGridDBColumn;
    b_cetak: TsButton;
    grid_dataColumn1: TcxGridDBColumn;
    procedure WMMDIACTIVATE(var msg : TWMMDIACTIVATE) ; message WM_MDIACTIVATE;
    procedure segarkan;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grid_dataCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
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
  f_list_return_jual: Tf_list_return_jual;
  fungsi: Tfungsi;
implementation

uses u_utama, u_dm;

{$R *.dfm}

procedure Tf_list_return_jual.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
var
  active: TWinControl;
  idx: Integer;
begin
  active := FindControl(msg.ActiveWnd) ;
if not(metu_kabeh) then
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

procedure Tf_list_return_jual.segarkan;
begin
fungsi.SQLExecT(dm.Q_list_return_jual,'select * from vw_list_return_jual where kd_perusahaan = '+
QuotedStr(f_utama.sb.panels[3].text)+' and tgl_return_jual >= '+
quotedstr(FormatDateTime('yyyy-MM-dd',de_mulai.Date))+' and tgl_return_jual <= '+
quotedstr(FormatDateTime('yyyy-MM-dd',de_sampai.Date))+'',true);
end;

procedure Tf_list_return_jual.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
f_utama.MDIChildDestroyed(Self.Handle);
action:=caFree;
f_list_return_jual:=nil;
end;

procedure Tf_list_return_jual.grid_dataCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
b_cetakClick(Self);
end;

procedure Tf_list_return_jual.FormCreate(Sender: TObject);
var
  Year, Month, Day: Word;
begin
DecodeDate(Now, Year, Month, Day);
de_mulai.Date:= EncodeDate(Year,Month,1);
de_sampai.Date:= Date();

f_utama.MDIChildCreated(self.Handle);
segarkan;
end;

procedure Tf_list_return_jual.sb_1Click(Sender: TObject);
begin
close;
end;

procedure Tf_list_return_jual.sb_2Click(Sender: TObject);
begin
segarkan;
end;

procedure Tf_list_return_jual.de_sampaiChange(Sender: TObject);
begin
if de_sampai.Date<de_mulai.Date then
   de_sampai.Date:= de_mulai.Date;
end;

procedure Tf_list_return_jual.b_cetakClick(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_laporan,'select * from vw_cetak_return_jual where kd_perusahaan="'+
  f_utama.sb.Panels[3].Text+'" and kd_return_jual="'+
  dm.Q_list_return_jual.fieldbyname('kd_return_jual').AsString+'"',true);

  dm.laporan.LoadFromFile(dm.WPath + 'laporan\gp_return_jual_rinci.fr3');
  dm.FRMemo(dm.laporan, 'Memo9').Text := MyTerbilang(dm.Q_laporan.fieldbyname('nilai_faktur').AsFloat)+'Rupiah';
  dm.laporan.ShowReport;
end;

end.
