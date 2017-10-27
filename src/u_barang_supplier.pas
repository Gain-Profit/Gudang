unit u_barang_supplier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFungsi, sLabel, sEdit, Buttons, sSpeedButton, cxGraphics,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, cxGridCustomView,
  cxGrid, sSkinProvider, cxStyles, ExtCtrls, sPanel, sButton, DBAccess, MyAccess,
  cxCustomData, cxFilter, cxData, MemDS, StdCtrls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters, System.UITypes,
  dxSkinscxPCPainter, cxNavigator;

type
  TF_barang_supp = class(TForm)
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    sSkinProvider1: TsSkinProvider;
    sb_cari: TsSpeedButton;
    p1: TsPanel;
    l_1: TsLabel;
    ed_supp: TEdit;
    sb_supp: TsSpeedButton;
    l_supp: TsLabel;
    ed_kode: TEdit;
    btnPrint: TsButton;
    Q_supp: TMyQuery;
    ds_supp: TDataSource;
    procedure sb_suppClick(Sender: TObject);
    procedure ed_suppChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word; Shift:
      TShiftState);
    procedure ed_suppKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ed_kodeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sb_cariClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_barang_supp: TF_barang_supp;

implementation

uses
  u_dm, u_cari;

{$R *.dfm}

procedure TF_barang_supp.sb_suppClick(Sender: TObject);
begin
  application.CreateForm(TF_cari, F_cari);
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
      ed_supp.Text := TblVal[0];
      L_supp.Caption := tblval[1];
    end;
  finally
    close;
  end;
end;

procedure TF_barang_supp.ed_suppChange(Sender: TObject);
begin
  fungsi.SQLExec(q_supp, 'select * from vw_supp_barang where kd_perusahaan="' +
    dm.kd_perusahaan + '" and kd_suplier="' + ed_supp.Text + '"', true);
end;

procedure TF_barang_supp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  q_supp.Close;
  action := cafree;
end;

procedure TF_barang_supp.cxGridDBTableView1KeyDown(Sender: TObject; var Key:
  Word; Shift: TShiftState);
begin
  if (key = vk_delete) and (MessageDlg('Yakinkah, akan menghapus data ini?...',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    dm.db_conn.StartTransaction;
    try
      fungsi.SQLExec(dm.Q_Exe,
        'delete from tb_barang_supp where kd_perusahaan="' + dm.kd_perusahaan +
        '" and kd_suplier="' + ed_supp.Text + '" and kd_barang="' + q_supp.fieldbyname
        ('kd_barang').AsString + '"', false);

      fungsi.SQLExec(q_supp,
        'select * from vw_supp_barang where kd_perusahaan="' + dm.kd_perusahaan +
        '" and kd_suplier="' + ed_supp.Text + '"', true);

      dm.db_conn.Commit;
    except
      on e: exception do
      begin
        dm.db_conn.Rollback;
        showmessage('penghapusan data gagal '#10#13'' + e.Message);
      end;
    end;

  end;
end;

procedure TF_barang_supp.ed_suppKeyDown(Sender: TObject; var Key: Word; Shift:
  TShiftState);
begin
  if key = vk_return then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    sb_suppClick(Sender);
  end;
end;

procedure TF_barang_supp.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_escape then
    close;
  if key = vk_f2 then
    ed_kode.SetFocus;
  if key = vk_f3 then
    sb_suppClick(Sender);
end;

procedure TF_barang_supp.ed_kodeKeyDown(Sender: TObject; var Key: Word; Shift:
  TShiftState);
begin
  if Key = vk_f2 then
    sb_cariClick(Self);

  if key = vk_return then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    if ed_kode.Text = '' then
      Exit;

    if ed_supp.Text = '' then
    begin
      ShowMessage('masukkan kode supplier terlebih dahulu...');
      ed_supp.SetFocus;
      Exit;
    end;

    fungsi.SQLExec(dm.Q_Show,
      'select kd_barang from tb_barang where (kd_perusahaan="' + dm.kd_perusahaan
      + '") and (kd_barang ="' + ed_kode.Text + '" or barcode1 ="' + ed_kode.Text
      + '" or barcode2 = "' + ed_kode.Text + '" or barcode3 = "' + ed_kode.Text
      + '")', true);

    if dm.Q_Show.Eof then
    begin
      showmessage('data barang tidak ada....');
      ed_kode.SetFocus;
    end
    else
    begin
      dm.db_conn.StartTransaction;
      try
        fungsi.SQLExec(dm.Q_Exe,
          'insert into tb_barang_supp (kd_perusahaan,kd_suplier,kd_barang,`update`) values("' +
          dm.kd_perusahaan + '","' + ed_supp.Text + '","' + dm.Q_Show.fieldbyname
          ('kd_barang').AsString + '","' + formatdatetime('yyyy-MM-dd', date())
          + '")', false);

        fungsi.SQLExec(q_supp,
          'select * from vw_supp_barang where kd_perusahaan="' + dm.kd_perusahaan +
          '" and kd_suplier="' + ed_supp.Text + '"', true);

        ed_kode.Clear;
        ed_kode.SetFocus;
        dm.db_conn.Commit;
      except
        on e: exception do
        begin
          dm.db_conn.Rollback;
          showmessage('pemindahan data gagal '#10#13'' + e.Message);
        end;
      end;
    end;
  end;
end;

procedure TF_barang_supp.sb_cariClick(Sender: TObject);
begin
  ed_kode.SetFocus;
  application.CreateForm(TF_cari, F_cari);
  with F_cari do
  try
    _SQLi := 'select kd_barang, n_barang from tb_barang where kd_perusahaan="' +
      dm.kd_perusahaan + '"';
    tblcap[0] := 'PID';
    tblCap[1] := 'Deskripsi Barang';
    tampil_button(False, True);
    if ShowModal = mrOk then
    begin
      ed_kode.Text := TblVal[0];
    end;
  finally
    close;
  end;
end;

procedure TF_barang_supp.btnPrintClick(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_laporan, Q_supp.SQL.Text, true);
  dm.laporan.LoadFromFile(dm.WPath + 'laporan\gp_barang_supplier.fr3');
//dm.FRMemo(dm.laporan, 'Memo9').Text := MyTerbilang(dm.Q_laporan.fieldbyname('nilai_faktur').AsCurrency)+'Rupiah';
  dm.laporan.ShowReport;
end;

end.


