unit u_kirim_data;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sButton,U_fungsi,DB, sDialogs, sCheckBox, sGroupBox,
  sRadioButton, ComCtrls, sListView, sLabel, sEdit, acShellCtrls, Mask,
  sMaskEdit, sCustomComboEdit, sTooledit, sMemo, sPageControl, sListBox,
  AbZView,AbZipKit, Grids, AbView, AbBase, AbBrowse, AbZBrows, AbZipper,
  ExtCtrls, sPanel, AbUnZper, sGauge, Menus,ShellAPI,ShlObj, sSpinEdit,
  Buttons, sSpeedButton, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxCurrencyEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, mySQLDbTables, sComboBox;

type
  TF_kirim_data = class(TForm)
    pc_1: TsPageControl;
    ts_1: TsTabSheet;
    lv_data_awal: TsListView;
    l_1: TsLabel;
    lv_harian: TsListView;
    l_2: TsLabel;
    ts_2: TsTabSheet;
    edt_terima: TsDateEdit;
    zk_load: TAbZipKit;
    zv_load: TAbZipView;
    spnl_load: TsPanel;
    od_load: TsOpenDialog;
    sg_load: TsGauge;
    spnl1: TsPanel;
    edt_kirim: TsDateEdit;
    l_3: TsLabel;
    b_kirim: TsButton;
    spnl2: TsPanel;
    sButton1: TsButton;
    sButton2: TsButton;
    sButton3: TsButton;
    pm_awal: TPopupMenu;
    N5: TMenuItem;
    utupSemuaKecualiini1: TMenuItem;
    pm_harian: TPopupMenu;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    ts_dafta: TsTabSheet;
    panel: TsPanel;
    edtHari: TsDecimalSpinEdit;
    l_4: TsLabel;
    SbSegarkan: TsSpeedButton;
    grid: TcxGrid;
    grid_data: TcxGridDBTableView;
    l_data: TcxGridLevel;
    Q_export: TmySQLQuery;
    dsExport: TDataSource;
    t_datadata: TcxGridDBColumn;
    t_dataket: TcxGridDBColumn;
    t_datatanggal: TcxGridDBColumn;
    cbJenis: TsComboBox;
    procedure b_kirimClick(Sender: TObject);
    procedure cek_dir_kirim;
    procedure cek_dir_terima;
    procedure FormShow(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
    procedure sButton3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure utupSemuaKecualiini1Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure SbSegarkanClick(Sender: TObject);
    procedure cbJenisChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_kirim_data: TF_kirim_data;
  dir_simpan,file_load,dir_load:string;

  const
  OFASI_EDIT = $0001;
  OFASI_OPENDESKTOP = $0002;

implementation

uses u_dm, u_utama;

{$R *.dfm}


{$IFDEF UNICODE}
function ILCreateFromPath(pszPath: PChar): PItemIDList stdcall; external shell32
  name 'ILCreateFromPathW';
{$ELSE}
function ILCreateFromPath(pszPath: PChar): PItemIDList stdcall; external shell32
  name 'ILCreateFromPathA';
{$ENDIF}
procedure ILFree(pidl: PItemIDList) stdcall; external shell32;
function SHOpenFolderAndSelectItems(pidlFolder: PItemIDList; cidl: Cardinal;
  apidl: pointer; dwFlags: DWORD): HRESULT; stdcall; external shell32;

function pilih_data(const FileName: string): boolean;
var
  IIDL: PItemIDList;
begin
  result := false;
  IIDL := ILCreateFromPath(PChar(FileName));
  if IIDL <> nil then
    try
      result := SHOpenFolderAndSelectItems(IIDL, 0, nil, 0) = S_OK;
    finally
      ILFree(IIDL);
    end;
end;

procedure TF_kirim_data.cek_dir_kirim;
begin
if not DirectoryExists(dm.DocPath+'DATA_KIRIM') then
  MkDir(dm.DocPath+'DATA_KIRIM');

if not DirectoryExists(dm.DocPath+'\DATA_KIRIM\'+f_utama.sb.Panels[3].text+'_'+f_utama.sb.Panels[4].text) then
  MkDir(dm.DocPath+'DATA_KIRIM\'+f_utama.sb.Panels[3].text+'_'+f_utama.sb.Panels[4].text);

if not DirectoryExists(dm.DocPath+'\DATA_KIRIM\'+f_utama.sb.Panels[3].text+'_'+
f_utama.sb.Panels[4].text+'\PC_'+f_utama.sb.Panels[3].text+'_'+formatdatetime('yyyy-MM-dd',edt_kirim.date)) then
    MkDir(dm.DocPath+'DATA_KIRIM\'+f_utama.sb.Panels[3].text+'_'+
    f_utama.sb.Panels[4].text+'\PC_'+f_utama.sb.Panels[3].text+'_'+formatdatetime('yyyy-MM-dd',edt_kirim.date));

dir_simpan:=dm.DocPath+'DATA_KIRIM\'+f_utama.sb.Panels[3].text+'_'+
            f_utama.sb.Panels[4].text+'\PC_'+f_utama.sb.Panels[3].text+'_'+formatdatetime('yyyy-MM-dd',edt_kirim.Date);
end;

procedure TF_kirim_data.cek_dir_terima;
begin
if not DirectoryExists(dm.DocPath+'DATA_TERIMA') then
  MkDir(dm.DocPath+'DATA_TERIMA');

if not DirectoryExists(dm.DocPath+'DATA_TERIMA\'+f_utama.sb.Panels[3].text+'_'+f_utama.sb.Panels[4].text) then
  MkDir(dm.DocPath+'DATA_TERIMA\'+f_utama.sb.Panels[3].text+'_'+f_utama.sb.Panels[4].text);

dir_load:=dm.DocPath+'DATA_TERIMA\'+f_utama.sb.Panels[3].text+'_'+f_utama.sb.Panels[4].text+'\';
file_load:=dm.DocPath+'DATA_TERIMA\'+f_utama.sb.Panels[3].text+'_'+f_utama.sb.Panels[4].text+'\CP_'+
f_utama.sb.Panels[3].text+'_'+formatdatetime('yyyy-MM-dd',edt_terima.Date)+'.zip';
end;

procedure TF_kirim_data.b_kirimClick(Sender: TObject);
var Q:Integer;
    namafile: string;
    zipp:TAbZipper;
begin
cek_dir_kirim;

if FileExists(dir_simpan+'.zip') then
DeleteFile(dir_simpan+'.zip');

zipp:= TAbZipper.Create(Self);
zipp.AutoSave:=True;
zipp.BaseDirectory:= dm.DocPath+'DATA_KIRIM\'+f_utama.sb.Panels[3].text+'_'+
          f_utama.sb.Panels[4].text+'\';

zipp.FileName:=dir_simpan+'.zip';

 try
  for Q:=0 to lv_data_awal.Items.Count-1 do
  begin
    if lv_data_awal.Items.Item[Q].Checked then
    begin
      namafile:= dir_simpan+'\'+lv_data_awal.Items.Item[Q].Caption+'.cbQ';
      fungsi.savetofile(dm.Q_Exe,'select * from '+lv_data_awal.Items.Item[Q].Caption,namafile);
      zipp.AddFiles('PC_'+f_utama.sb.Panels[3].text+'_'+formatdatetime('yyyy-MM-dd',edt_kirim.Date)+'\'+lv_data_awal.Items.Item[Q].Caption+'.cbQ', 0);
    end;
  end;

  for Q:=0 to lv_harian.Items.Count-1 do
  begin
    if lv_harian.Items.Item[Q].Checked then
    begin
      namafile:= dir_simpan+'\'+lv_harian.Items.Item[Q].Caption+'.cbQ';
      fungsi.savetofile(dm.Q_Exe,'select * from '+lv_harian.Items.Item[Q].Caption+' where kd_perusahaan="'+
      f_utama.sb.Panels[3].Text+'"',namafile);
      zipp.AddFiles('PC_'+f_utama.sb.Panels[3].text+'_'+formatdatetime('yyyy-MM-dd',edt_kirim.Date)+'\'+lv_harian.Items.Item[Q].Caption+'.cbQ', 0);
    end;
  end;

  if DirectoryExists(dir_simpan) then
  fungsi.hapusdir(dir_simpan);

  fungsi.SQLExec(dm.Q_Exe,'replace into tb_export_import(kd_perusahaan, data, ket, tanggal) values ("'+
  f_utama.sb.Panels[3].text+'","'+ExtractFileName(zipp.FileName)+'","kirim",now())',False);

  ShowMessage('penyimpanan data sukses...');
  pilih_data(dir_simpan+'.zip');
  
 except
  on E:exception do
  begin
    if DirectoryExists(dir_simpan) then
    fungsi.hapusdir(dir_simpan);
    messagedlg('proses penyimpanan gagal,ulangi lagi!!! '#10#13'' + e.Message, mterror, [mbOk],0);
  end;
 end;
zipp.Free; 
end;

procedure TF_kirim_data.FormShow(Sender: TObject);
var Q:Integer;
begin
pc_1.ActivePage:=ts_1;

edt_kirim.date:=Date() + 1;
edt_terima.Date:=Date();

  lv_harian.DoubleBuffered := not lv_harian.DoubleBuffered;
  lv_harian.Items.BeginUpdate;
  for Q:=0 to lv_harian.Items.Count-1 do
  begin
    fungsi.SQLExec(dm.Q_temp,'select count(*) as jumlah_data from '+lv_harian.Items[Q].Caption+' where `update`=date(now())',True);
    if dm.Q_temp.FieldByName('jumlah_data').AsInteger<>0 then
    begin
    lv_harian.Items[Q].SubItems[1]:='updated';
    end;
  end;
  lv_harian.Items.EndUpdate;

  lv_data_awal.DoubleBuffered := not lv_data_awal.DoubleBuffered;
  lv_data_awal.Items.BeginUpdate;
  for Q:=0 to lv_data_awal.Items.Count-1 do
  begin
   try
    fungsi.SQLExec(dm.Q_temp,'select count(*) as jumlah_data from '+lv_data_awal.Items[Q].Caption+' where `update`=date(now())',True);
    if dm.Q_temp.FieldByName('jumlah_data').AsInteger<>0 then
    begin
    lv_data_awal.Items[Q].SubItems[1]:='updated';
    end;
   except
   end;
  end;
  lv_data_awal.Items.EndUpdate;

  SbSegarkanClick(Self);
end;

procedure TF_kirim_data.sButton1Click(Sender: TObject);
begin
cek_dir_terima;
zv_load.BeginUpdate;

if FileExists(file_load) then
begin
zk_load.FileName:=file_load;
spnl_load.Caption:=file_load +
      '   (' + IntToStr(zv_load.Count) + ' Items)';
end else
begin
spnl_load.Caption:='Data untuk Tanggal, '+formatdatetime('dd mmmm YYYY',edt_terima.Date)+ ' Tidak Ada';
end;

zv_load.EndUpdate;
//l_terima.Items.Clear;
//GetFileList(l_terima.Items,dir_load,'*.cbT');
end;

procedure TF_kirim_data.sButton2Click(Sender: TObject);
begin
  if od_load.Execute then begin
    zv_load.BeginUpdate;
    zk_load.Filename := od_load.Filename;
    spnl_load.Caption := zk_load.Filename +
      '   ' + IntToStr(zv_load.Count) + ' items';
    zv_load.EndUpdate;
  end;
end;

procedure TF_kirim_data.sButton3Click(Sender: TObject);
var i: Integer;
uz: TAbUnZipper;
nm_tabel,nm_file:string;
begin
cek_dir_terima;

if zk_load.FileName = '' then
begin
  ShowMessage('belum ada data yang diload....');
  exit;
end;  

  fungsi.SQLExec(dm.Q_temp,'select * from tb_export_import where kd_perusahaan = "'+
  f_utama.sb.Panels[3].text+'" and data = "'+ExtractFileName(zk_load.FileName)+'" and ket = "terima"',True);

  if not(dm.Q_temp.Eof) then
  begin
    if (MessageBox(0, 'Data ini Sudah Pernah di load ke dalam data base...'+#13+#10+'Apakah '+
    'anda akan meLoad data ini lagi???', 'Load again', MB_ICONEXCLAMATION or MB_YESNO) = idNo) then
    Exit;
  end;

uz:= TabUnzipper.Create(Self);

with uz do
  begin
   FileName := zk_load.FileName;
   BaseDirectory := ExtractFilePath(zk_load.FileName);
   ExtractFiles( '*.*' );
  end;
 uz.Free;

 dm.My_conn.StartTransaction;
try
  sg_load.Visible:=True;
  sg_load.MaxValue:= zk_load.Count-1;
  for i:=0 to zk_load.Count-1 do
  begin
    nm_file:= zk_load.Items[i].FileName;
    Delete(nm_file,1,Length(zk_load.Items[i].StoredPath));
    nm_tabel:= nm_file;
    Delete(nm_tabel,Length(nm_tabel)-3,4);

    sg_load.Suffix:=' % ('+nm_file+')';

    fungsi.amankan(dir_load+nm_file,dir_load+nm_file,9966);

    fungsi.SQLExec(dm.Q_Exe,'LOAD DATA LOCAL INFILE "'+fungsi.caridanganti(dir_load+nm_file,'\','/')+'" REPLACE INTO '+
    'TABLE '+nm_tabel+' FIELDS TERMINATED BY ''&'' OPTIONALLY ENCLOSED BY ''#'' LINES '+
    'STARTING BY ''<'' TERMINATED BY ''>'' ',false);

    fungsi.amankan(dir_load+nm_file,dir_load+nm_file,9966);

    DeleteFile(dir_load+nm_file);

    sg_load.Progress:=i;
  end;

  fungsi.SQLExec(dm.Q_Exe,'insert ignore into tb_export_import(kd_perusahaan, data, ket, tanggal) values ("'+
  f_utama.sb.Panels[3].text+'","'+ExtractFileName(zk_load.FileName)+'","terima",now())',False);

  fungsi.SQLExec(dm.Q_Exe,'insert ignore into tb_mutasi_bulan(kd_perusahaan, tgl) values ("'+
  f_utama.sb.Panels[3].text+'","'+FormatDateTime('yyyy-MM-dd',edt_terima.Date)+'")',False);

  fungsi.SQLExec(dm.Q_Exe,'update tb_company set update_mutasi="YA" where kd_perusahaan="'+
  f_utama.sb.Panels[3].text+'"',False);


 dm.My_conn.Commit;

  nm_file:= zk_load.FileName;

 zv_load.BeginUpdate;
 zk_load.FileName:= '';
 zv_load.EndUpdate;

    if FileExists(nm_file) then
    DeleteFile(nm_file);
 
 sg_load.Visible:=False;
 spnl_load.Caption:='';
 ShowMessage('load data berhasil...');
except
 on E:exception do
 begin
  dm.My_conn.Rollback;
  sg_load.Visible:=False;

  for i:=0 to zk_load.Count-1 do
  begin
    nm_file:= zk_load.Items[i].FileName;
    Delete(nm_file,1,Length(zk_load.Items[i].StoredPath));

    if FileExists(dir_load+nm_file) then
    DeleteFile(dir_load+nm_file);
  end;

  messagedlg('proses load data gagal, '#10#13'Hal ini '+
  'mungkin terjadi karena data sudah pernah di LOAD... '#10#13'' + e.Message, mterror, [mbOk],0);
 end;
end;
end;

procedure TF_kirim_data.N5Click(Sender: TObject);
var x: Integer;
begin
  for x:= 0 to lv_data_awal.Items.Count - 1 do
    lv_data_awal.Items.Item[X].Checked:= True;
end;

procedure TF_kirim_data.MenuItem4Click(Sender: TObject);
var x: Integer;
begin
  for x:= 0 to lv_harian.Items.Count - 1 do
    lv_harian.Items.Item[X].Checked:= True;
end;

procedure TF_kirim_data.utupSemuaKecualiini1Click(Sender: TObject);
var x: Integer;
begin
  for x:= 0 to lv_data_awal.Items.Count - 1 do
    lv_data_awal.Items.Item[X].Checked:= False;
end;

procedure TF_kirim_data.MenuItem5Click(Sender: TObject);
var x: Integer;
begin
  for x:= 0 to lv_harian.Items.Count - 1 do
    lv_harian.Items.Item[X].Checked:= False;
end;

procedure TF_kirim_data.SbSegarkanClick(Sender: TObject);
var data: string;
begin
if cbJenis.ItemIndex = 0 then
data := 'PC_'+ f_utama.sb.Panels[3].Text +'_'
else
data := 'CP_'+ f_utama.sb.Panels[3].Text +'_';

fungsi.SQLExec(Q_export,'select * from tb_export_import where kd_perusahaan = "'+
f_utama.sb.Panels[3].Text+'" and `data` LIKE "'+data+'%" '+
'ORDER BY `data` DESC, tanggal DESC LIMIT '+ edtHari.Text,True);
end;

procedure TF_kirim_data.cbJenisChange(Sender: TObject);
begin
SbSegarkanClick(Self);
end;

end.
