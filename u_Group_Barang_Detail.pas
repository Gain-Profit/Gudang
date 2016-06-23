unit u_Group_Barang_Detail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, sSkinProvider, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, ExtCtrls, sPanel, StdCtrls, sButton,
  sEdit, sLabel, Buttons, sSpeedButton, sBevel;

type
  TFGroupBarangDetail = class(TForm)
    grid: TcxGrid;
    t_data: TcxGridDBTableView;
    tvKodeGroup: TcxGridDBColumn;
    vwBarcode: TcxGridDBColumn;
    l_data: TcxGridLevel;
    sSkinProvider1: TsSkinProvider;
    vwDeskripsi: TcxGridDBColumn;
    vwJenis: TcxGridDBColumn;
    vwGolongan: TcxGridDBColumn;
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
    procedure baru;
    procedure edit(GroupId: string);
    procedure btnBaruClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGroupBarangDetail: TFGroupBarangDetail;

implementation

{$R *.dfm}

{ TFGroupBarangDetail }

procedure TFGroupBarangDetail.baru;
begin
  edKodeGroup.Enabled:= True;
  edKodeGroup.Clear;
  edDeskripsiGroup.Clear;
  t_data.DataController.RecordCount:= 0;
end;

procedure TFGroupBarangDetail.edit(GroupId: string);
begin
  edKodeGroup.Text := GroupId;
  edKodeGroup.Enabled:= False;
end;

procedure TFGroupBarangDetail.btnBaruClick(Sender: TObject);
begin
  baru;
  edKodeGroup.SetFocus;
end;

end.
