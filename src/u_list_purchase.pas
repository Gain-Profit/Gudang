unit u_list_purchase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, sBitBtn, ComCtrls, ExtCtrls, sPanel, sSkinProvider,
  cxGraphics, cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxControls, cxGridCustomView, cxClasses,
  cxGridLevel, cxGrid, UFungsi, cxStyles, sSpeedButton, sTooledit, sLabel,
  cxCustomData, cxFilter, cxData, StdCtrls, Mask, sMaskEdit, sCustomComboEdit,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxNavigator;

type
  TF_List_purchase = class(TForm)
    sSkinProvider1: TsSkinProvider;
    sPanel1: TsPanel;
    grid: TcxGrid;
    l_data: TcxGridLevel;
    t_data: TcxGridDBTableView;
    t_datakd_purchase: TcxGridDBColumn;
    t_datatgl_purchase: TcxGridDBColumn;
    t_datanilai_faktur: TcxGridDBColumn;
    t_datan_supp: TcxGridDBColumn;
    t_dataColumn1: TcxGridDBColumn;
    spnl1: TsPanel;
    b_receipt: TsBitBtn;
    sb_2: TsSpeedButton;
    sb_1: TsSpeedButton;
    p1: TsPanel;
    l_1: TsLabel;
    l_2: TsLabel;
    de_mulai: TsDateEdit;
    de_sampai: TsDateEdit;
    t_data_simpan_pada: TcxGridDBColumn;
    procedure WMMDIACTIVATE(var msg: TWMMDIACTIVATE); message WM_MDIACTIVATE;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure t_dataCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo:
      TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState;
      var AHandled: Boolean);
    procedure b_receiptClick(Sender: TObject);
    procedure segarkan;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sb_1Click(Sender: TObject);
    procedure sb_2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_List_purchase: TF_List_purchase;

implementation

uses
  u_dm, u_purchase, u_utama, u_receipt;

{$R *.dfm}

procedure TF_List_purchase.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
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

procedure TF_List_purchase.segarkan;
begin
  fungsi.SQLExec(dm.q_list_purchase,
    'select * from vw_list_purchase  where kd_perusahaan="' + dm.kd_perusahaan +
    '" and tgl_purchase >= ' + quotedstr(FormatDateTime('yyyy-MM-dd', de_mulai.Date))
    + ' and tgl_purchase <= ' + quotedstr(FormatDateTime('yyyy-MM-dd', de_sampai.Date))
    + '', true);
end;

procedure TF_List_purchase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  F_utama.MDIChildDestroyed(Self.Handle);
  action := cafree;
  F_list_purchase := nil;
end;

procedure TF_List_purchase.t_dataCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
  TShiftState; var AHandled: Boolean);
begin
//if F_purchase = nil then
  application.CreateForm(TF_purchase, F_purchase);

  F_purchase.Show;
  F_purchase.tampil_data;
end;

procedure TF_List_purchase.b_receiptClick(Sender: TObject);
begin
  application.CreateForm(TF_RO, F_RO);
  F_RO.Show;
  F_ro.tampil_purchase;
end;

procedure TF_List_purchase.FormShow(Sender: TObject);
begin
  if (F_utama.sb.Panels[8].Text = 'PUSAT') and (F_utama.HakAkses('gdTrRO')) then
    b_receipt.Enabled := True
  else
    b_receipt.Enabled := false;
end;

procedure TF_List_purchase.FormCreate(Sender: TObject);
var
  Year, Month, Day: Word;
begin
  DecodeDate(Now, Year, Month, Day);
  de_mulai.Date := EncodeDate(Year, Month, 1);
  de_sampai.Date := Date();

  F_utama.MDIChildCreated(self.Handle);
  segarkan;
end;

procedure TF_List_purchase.sb_1Click(Sender: TObject);
begin
  close;
end;

procedure TF_List_purchase.sb_2Click(Sender: TObject);
begin
  segarkan;
end;

end.


