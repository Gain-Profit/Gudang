unit u_list_return_kirim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxDataStorage, cxEdit, DB, cxDBData,
  cxCurrencyEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid, Buttons,
  ExtCtrls, sPanel, sSkinProvider, UFungsi, sSpeedButton, sTooledit, sLabel,
  sButton, sComboBox, sCheckBox, FileCtrl, cxCustomData, cxFilter, cxData,
  StdCtrls, Mask, sMaskEdit, sCustomComboEdit, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxNavigator;

type
  Tf_list_return_kirim = class(TForm)
    sSkinProvider1: TsSkinProvider;
    sPanel1: TsPanel;
    grid: TcxGrid;
    t_data: TcxGridDBTableView;
    t_datan_supp: TcxGridDBColumn;
    t_datakd_return: TcxGridDBColumn;
    t_dataColumn1: TcxGridDBColumn;
    t_datatgl_return: TcxGridDBColumn;
    t_datanilai_faktur: TcxGridDBColumn;
    t_dataColumn3: TcxGridDBColumn;
    l_data: TcxGridLevel;
    sb_2: TsSpeedButton;
    sb_1: TsSpeedButton;
    p1: TsPanel;
    l_1: TsLabel;
    l_2: TsLabel;
    de_mulai: TsDateEdit;
    de_sampai: TsDateEdit;
    cb_belum: TsCheckBox;
    cbCabang: TsComboBox;
    btnSimpan: TsButton;
    procedure WMMDIACTIVATE(var msg: TWMMDIACTIVATE); message WM_MDIACTIVATE;
    procedure segarkan;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure t_dataCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo:
      TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState;
      var AHandled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure sb_1Click(Sender: TObject);
    procedure sb_2Click(Sender: TObject);
    procedure cb_belumClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_list_return_kirim: Tf_list_return_kirim;

implementation

uses
  u_dm, u_utama, u_return_kirim;
{$R *.dfm}

procedure Tf_list_return_kirim.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
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

procedure Tf_list_return_kirim.segarkan;
begin
  btnSimpan.Enabled := False;
  if not (cb_belum.Checked) then
  begin
    fungsi.SQLExec(dm.Q_list_return_kirim,
      'select * from vw_list_return_kirim  where kd_perusahaan="' + dm.kd_perusahaan
      + '" and tgl_return_kirim >= ' + quotedstr(FormatDateTime('yyyy-MM-dd',
      de_mulai.Date)) + ' and tgl_return_kirim <= ' + quotedstr(FormatDateTime('yyyy-MM-dd',
      de_sampai.Date)) + '', true);
  end
  else
  begin
    fungsi.SQLExec(dm.Q_list_return_kirim, 'call sp_belum_return_kirim("' +
      cbCabang.Text + '")', True);
    btnSimpan.Enabled := True;
  end;
end;

procedure Tf_list_return_kirim.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  f_utama.MDIChildDestroyed(Self.Handle);
  action := cafree;
  f_list_return_kirim := nil;
end;

procedure Tf_list_return_kirim.t_dataCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
  TShiftState; var AHandled: Boolean);
begin
//if f_return_kirim = nil then
  application.CreateForm(tf_return_kirim, f_return_kirim);

  f_return_kirim.Show;
  f_return_kirim.tampil_data;
end;

procedure Tf_list_return_kirim.FormCreate(Sender: TObject);
var
  Year, Month, Day: Word;
begin
  DecodeDate(Now, Year, Month, Day);
  de_mulai.Date := EncodeDate(Year, Month, 1);
  de_sampai.Date := Date();

  f_utama.MDIChildCreated(self.Handle);
  segarkan;
end;

procedure Tf_list_return_kirim.sb_1Click(Sender: TObject);
begin
  close;
end;

procedure Tf_list_return_kirim.sb_2Click(Sender: TObject);
begin
  segarkan;
end;

procedure Tf_list_return_kirim.cb_belumClick(Sender: TObject);
begin
  cbCabang.Visible := cb_belum.Checked;
  btnSimpan.Visible := cbCabang.Visible;
end;

procedure Tf_list_return_kirim.btnSimpanClick(Sender: TObject);
var
  tempat, nama_file: string;
  y: Integer;
  F: TextFile;
  qty, hpp, tot: Currency;
begin
  if SelectDirectory('Pilih Folder', ExtractFileDrive(dm.DocPath), tempat) then
  begin
    dm.Q_list_return_kirim.First;
    while not (dm.Q_list_return_kirim.Eof) do
    begin
      fungsi.SQLExec(dm.Q_temp,
        'select * from tb_return_kirim_rinci where kd_perusahaan="' + dm.Q_list_return_kirim.fieldbyname
        ('kd_perusahaan').AsString + '" and kd_return_kirim="' + dm.Q_list_return_kirim.fieldbyname
        ('kd_return_kirim').AsString + '"', true);

      nama_file := tempat + '\' + dm.Q_list_return_kirim.fieldbyname('kd_return_kirim').AsString
        + '.srk';

      AssignFile(F, nama_file);
      Rewrite(F);
      Writeln(F, dm.Q_list_return_kirim.fieldbyname('kd_return_kirim').AsString);
      Writeln(F, dm.Q_list_return_kirim.fieldbyname('kd_kirim').AsString);
      Writeln(F, dm.Q_list_return_kirim.fieldbyname('kd_pelanggan').AsString);
      Writeln(F, dm.Q_list_return_kirim.fieldbyname('n_pelanggan').AsString);
      Writeln(F, formatdatetime('dd/MM/yyyy', dm.Q_list_return_kirim.fieldbyname
        ('tgl_return_kirim').AsDateTime));
      Writeln(F, dm.q_temp.recordcount);

      if dm.Q_temp.RecordCount <> 0 then
      begin
        for y := 0 to dm.Q_temp.RecordCount - 1 do
        begin
          qty := dm.Q_temp.FieldByName('qty_return_kirim').AsInteger;
          hpp := dm.Q_temp.fieldbyname('harga_pokok').AsCurrency;
          tot := hpp / qty;

          Writeln(F, dm.Q_temp.FieldByName('kd_barang').AsString);
          Writeln(F, dm.Q_temp.fieldbyname('n_barang').AsString);
          Writeln(F, dm.Q_temp.FieldByName('qty_return_kirim').AsString);
          Writeln(F, floattostr(tot));
          Writeln(F, dm.Q_temp.fieldbyname('harga_pokok').AsString);
          Writeln(F, dm.Q_temp.fieldbyname('barcode').AsString);

          dm.Q_temp.Next;
        end;
      end;
      CloseFile(F);
      fungsi.amankan(nama_file, nama_file, 159);

      dm.Q_list_return_kirim.Next;
    end;
    showmessage('penyimpanan data berhasil...');
  end;
end;

end.


