unit u_dm;

interface

uses
  SysUtils, Classes, DB, sSkinManager, dialogs, forms, ImgList, Controls,
  acAlphaImageList, frxClass, frxDBSet, inifiles, frxBarcode, cxStyles,
  Windows, frxExportXML, SHFolder, DBAccess, MyAccess, MemDS;

type
  Tdm = class(TDataModule)
    db_conn: TMyConnection;
    Q_Exe: TMyQuery;
    Q_Show: TMyQuery;
    sm: TsSkinManager;
    Q_temp: TMyQuery;
    gambar: TsAlphaImageList;
    Laporan: TfrxReport;
    q_list_purchase: TMyQuery;
    ds_list_purchase: TDataSource;
    Q_list_receipt: TMyQuery;
    ds_list_receipt: TDataSource;
    q_list_return: TMyQuery;
    ds_list_return: TDataSource;
    Q_laporan: TMyQuery;
    db_Laporan: TfrxDBDataset;
    image: TsAlphaImageList;
    ds_list_kirim: TDataSource;
    Q_list_kirim: TMyQuery;
    ds_list_sales: TDataSource;
    Q_list_sales: TMyQuery;
    ds_list_so: TDataSource;
    Q_List_SO: TMyQuery;
    ds_list_return_kirim: TDataSource;
    Q_list_return_kirim: TMyQuery;
    frxbrcdbjct1: TfrxBarCodeObject;
    stl_focus: TcxStyleRepository;
    cxstyl1: TcxStyle;
    ds_child_sales: TDataSource;
    Q_child_sales: TMyQuery;
    ds_list_return_jual: TDataSource;
    Q_list_return_jual: TMyQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure smAfterChange(Sender: TObject);
    procedure koneksikan;
  private
    function FRObject(FastReport: TfrxReport; ObjectName: string): TObject;
    { Private declarations }
  public
    PPN: Currency;
    CanLogin, metu_kabeh: boolean;
    waktu_sekarang: TDateTime;
    kd_perusahaan, kd_pengguna, WPath, AppPath, DocPath: string;
    function FRMemo(FastReport: TfrxReport; ObjectName: string): TfrxMemoView;
    { Public declarations }
  end;

var
  dm: Tdm;
  Mgs: TMsg;
  cabang: TStringList;

implementation




{$R *.dfm}

function GetAppData(Folder: Integer): string;
var
  path: array[0..MAX_PATH] of Char;
begin
  if Succeeded(SHGetFolderPath(0, Folder, 0, 0, @Path[0])) then
    Result := path + '\Gain Profit\'
  else
    Result := '';
end;

function Tdm.FRObject(FastReport: TfrxReport; ObjectName: string): TObject;
var
  i: Integer;
  AFound: Boolean;
begin
  Result := nil;
  AFound := False;
  for I := 0 to FastReport.ComponentCount - 1 do
  begin
    if LowerCase(FastReport.Components[i].Name) = LowerCase(ObjectName) then
    begin
      Result := TObject(FastReport.Components[i]);
      AFound := True;
      Break;
    end;
  end;
  if not AFound then
  begin
    Result := nil;
  end;
end;

function Tdm.FRMemo(FastReport: TfrxReport; ObjectName: string): TfrxMemoView;
begin
  Result := TfrxMemoView(FRObject(FastReport, ObjectName));
end;

function krupuk(const s: string; CryptInt: Integer): string;
var
  i: integer;
  s2: string;
begin
  if not (Length(s) = 0) then
    for i := 1 to Length(s) do
      s2 := s2 + Chr(Ord(s[i]) - cryptint);
  Result := s2;
end;

procedure Tdm.koneksikan;
var
  data, pusat, jalur1, jalur2, nama, kata: string;
  X: TextFile;
begin
  db_conn.Connected := False;
  assignfile(X, 'tools\koneksi.cbCon');
  try
    reset(X);
    readln(X, pusat);
    readln(X, data);
    readln(X, jalur2);
    readln(X, nama);
    readln(X, kata);
    closefile(X);
    db_conn.Server := krupuk(pusat, 6);
    db_conn.Database := krupuk(data, 6);
    jalur1 := krupuk(jalur2, 6);
    db_conn.Port := strtoint(jalur1);
    db_conn.Username := krupuk(nama, 6);
    db_conn.Password := krupuk(kata, 6);
    //db_conn.Connected := true;
  except
    showmessage('koneksi tidak berhasil');
    application.Terminate;
  end;
end;

procedure Tdm.DataModuleCreate(Sender: TObject);
var
  appINI: TIniFile;
begin

  WPath := ExtractFilePath(Application.ExeName);

  AppPath := GetAppData(CSIDL_COMMON_APPDATA);
  if not (DirectoryExists(AppPath)) then
    CreateDir(AppPath);

  DocPath := GetAppData(CSIDL_PERSONAL);
  if not (DirectoryExists(DocPath)) then
    CreateDir(DocPath);

  sm.SkinDirectory := WPath + 'tools\skins';
  appINI := TIniFile.Create(AppPath + 'gain.ini');
  try
    kd_perusahaan := appINI.ReadString('gudang', 'kd_perusahaan', '');
    PPN := appINI.ReadFloat('gudang', 'PPN', 10);
    sm.SkinName := appINI.ReadString('gudang', 'nama_skin', 'Air');
    sm.HueOffset := appini.ReadInteger('gudang', 'hue_skin', 0);
    sm.Saturation := appini.ReadInteger('gudang', 'sat_skin', 0);
  finally
    appINI.Free;
  end;

  CanLogin := False;
  koneksikan;
end;

procedure Tdm.smAfterChange(Sender: TObject);
var
  appINI: TIniFile;
begin
  appINI := TIniFile.Create(AppPath + 'gain.ini');
  try
    appINI.WriteString('gudang', 'nama_skin', dm.sm.SkinName);
    appINI.WriteInteger('gudang', 'hue_skin', dm.sm.HueOffset);
    appINI.WriteInteger('gudang', 'sat_skin', dm.sm.Saturation);
  finally
    appINI.Free;
  end;
end;

initialization
  cabang := TStringList.Create;

finalization
  cabang.Free;

end.


