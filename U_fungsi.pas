unit U_fungsi;

interface

uses
  Classes,mySQLDbTables,DB,sysutils,ShellAPI,windows,WinInet;

type
  TcbTread = class(TThread)
  private
    FQuery  : TmySQLQuery;
    FText   : string;
    iscari  : Boolean;
    { Private declarations }
  protected
    procedure Execute; override;
    procedure ThreadExecute;
  public
    constructor create(_query : TmySQLQuery; _text: string; is_cari:Boolean);
  end;

  type
  Tfungsi = class (TObject)//kita membuat object baru dengan nama Tfungsi
  private
    {private declaration}
  public
     function program_versi:string;
     function caridanganti(sSrc, sLookFor, sReplaceWith : string) : string;
     function UpdateApp(const Url: string): string;
     function jumlahHariBulan(bulan: Integer):Integer;
     procedure hapusdir(const DirName: string);
     procedure savetofile(aQuery:TmySQLQuery; _SQL,nm_file:string);
     procedure amankan(pathin, pathout: string; Chave: Word);
     procedure SQLExec(aQuery:TmySQLQuery; _SQL:string; isSearch: boolean);
     procedure SQLExecT(aQuery:TmySQLQuery; _SQL:string; isSearch: boolean);
  end;

var
  fungsi: Tfungsi;
  Fminta : TcbTread;
  
implementation

constructor TcbTread.create(_query : TmySQLQuery; _text: string; is_cari:Boolean);
begin
inherited create(False);
Self.FQuery:= _query;
Self.FText:= _text;
Self.iscari:= is_cari;
FreeOnTerminate := True;
Resume;
end;

procedure TcbTread.Execute;
begin
      Synchronize(ThreadExecute);
end;


function Tfungsi.program_versi:string;
var V1, V2, V3, V4: Word;
   VerInfoSize, VerValueSize, Dummy : DWORD;
   VerInfo : Pointer;
   VerValue : PVSFixedFileInfo;
begin
VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
GetMem(VerInfo, VerInfoSize);
GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo);
VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
With VerValue^ do
begin
  V1 := dwFileVersionMS shr 16;
  V2 := dwFileVersionMS and $FFFF;
  V3 := dwFileVersionLS shr 16;
  V4 := dwFileVersionLS and $FFFF;
end;
FreeMem(VerInfo, VerInfoSize);

Result := IntToStr(V1) + '.'
            + IntToStr(V2) + '.'
            + IntToStr(V3) + '.'
            + IntToStr(V4);
end;

procedure Tfungsi.hapusdir(const DirName: string);
var
  FileOp: TSHFileOpStruct;
begin
  FillChar(FileOp, SizeOf(FileOp), 0);
  FileOp.wFunc := FO_DELETE;
  FileOp.pFrom := PChar(DirName+#0);//double zero-terminated
  FileOp.fFlags := FOF_SILENT or FOF_NOERRORUI or FOF_NOCONFIRMATION;
  SHFileOperation(FileOp);
end;

procedure Tfungsi.amankan(pathin, pathout: string; Chave: Word);
var
  InMS, OutMS: TMemoryStream;
  cnt: Integer;
  C: byte;
begin
  InMS  := TMemoryStream.Create;
  OutMS := TMemoryStream.Create;
  try
    InMS.LoadFromFile(pathin);
    InMS.Position := 0;
    for cnt := 0 to InMS.Size - 1 DO
      begin
        InMS.Read(C, 1);
        C := (C xor not (ord(chave shr cnt)));
        OutMS.Write(C, 1);
      end;
    OutMS.SaveToFile(pathout);
  finally
    InMS.Free;
    OutMS.Free;
  end;
end;


function Tfungsi.caridanganti(sSrc, sLookFor, sReplaceWith : string) : string;
var
  nPos, nLenLookFor : integer;
begin
  nPos        := Pos(sLookFor, sSrc);
  nLenLookFor := Length(sLookFor);
  while (nPos > 0) do begin
    Delete(sSrc, nPos, nLenLookFor);
    Insert(sReplaceWith, sSrc, nPos);
    nPos := Pos(sLookFor, sSrc);
  end;
  Result := sSrc;
end;

procedure Tfungsi.savetofile(aQuery:TmySQLQuery; _SQL,nm_file:string);
var I:Integer;
  X: TextFile;
  S1:string;
begin
assignfile(X,nm_file);
rewrite(X);

SQLExec(aQuery,_SQL,True);
  while not aQuery.Eof do
  begin
  S1:='';
    for I:=0 to aQuery.FieldCount-2 do
    begin
        if aQuery.Fields[I].DataType in [ftSmallint, ftInteger, ftFloat, ftCurrency, ftLargeint]  then
           S1 := S1 +floattostr(aQuery.Fields[I].AsFloat)+'&' else
        if aQuery.Fields[I].DataType in [ftDate]  then
           S1 := S1 + '#'+formatdatetime('yyyy-MM-dd', aQuery.Fields[I].AsDateTime)+'#&' else
        if aQuery.Fields[I].DataType in [ftDateTime]  then
           S1 := S1 + '#'+formatdatetime('yyyy-MM-dd hh:nn:ss', aQuery.Fields[I].AsDateTime)+'#&' else
           S1 := S1 + '#'+aQuery.Fields[I].AsString+'#&';
    end;

    if aQuery.Fields.FieldByNumber(aQuery.FieldCount-1)<>nil then
        begin
        if aQuery.Fields[I].DataType in [ftSmallint, ftInteger, ftFloat, ftCurrency, ftLargeint]  then
           S1 := S1 +floattostr(aQuery.Fields[I].AsFloat) else
        if aQuery.Fields[I].DataType in [ftDate]  then
           S1 := S1 + '#'+formatdatetime('yyyy-MM-dd', aQuery.Fields[I].AsDateTime)+'#' else
        if aQuery.Fields[I].DataType in [ftDateTime]  then
           S1 := S1 + '#'+formatdatetime('yyyy-MM-dd hh:nn:ss', aQuery.Fields[I].AsDateTime)+'#' else
           S1 := S1 + '#'+aQuery.Fields[I].AsString+'#';
        end;

     // Added for ExtendInsert support
        S1 := Format('%s%s%s',['<',S1,'>']);
        Write(X,S1);

     // End modification
//        Result := Trunc(aQuery.RecNo*100/(aQuery.RecordCount-1));
        aQuery.Next;
  end;
closefile(X);
amankan(nm_file,nm_file,9966);
end;


  procedure Tfungsi.SQLExec(aQuery:TmySQLQuery; _SQL:string; isSearch: boolean);
  begin
   with aQuery  do
	   begin
	    Close;
      sql.Clear;
	    SQL.Text := _SQL;
      if isSearch then
	     Open
	    else
	     ExecSQL;
	   end;
{
    if isSearch then
    begin
     with aQuery  do
	   begin
	    Close;
      sql.Clear;
	    SQL.Text := _SQL;
      Open
	   end;
    end else
    Fminta := TcbTread.Create(aQuery,_SQL,isSearch);
}
	end;

procedure TcbTread.ThreadExecute();
begin
   with FQuery  do
	   begin
	    Close;
      sql.Clear;
	    SQL.Text := FText;
      if iscari then
      Open else
      ExecSQL;
	   end;
end;

procedure Tfungsi.SQLExecT(aQuery: TmySQLQuery; _SQL: string;
  isSearch: boolean);
begin
    Fminta := TcbTread.Create(aQuery,_SQL,isSearch);
end;


function Tfungsi.UpdateApp(const Url: string): string;
var
  NetHandle: HINTERNET;
  UrlHandle: HINTERNET;
  Buffer: array[0..1024] of Char;
  BytesRead: dWord;
begin
  //cek koneksi
  Result := '';

  if not(InternetGetConnectedState(nil,0))then
  begin
    Exit;
  end;

  NetHandle := InternetOpen('Delphi 5.x', INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);

  if Assigned(NetHandle) then 
  begin
    UrlHandle := InternetOpenUrl(NetHandle, PChar(Url), nil, 0, INTERNET_FLAG_RELOAD, 0);

    if Assigned(UrlHandle) then
      { UrlHandle valid? Proceed with download }
    begin
      FillChar(Buffer, SizeOf(Buffer), 0);
      repeat
        Result := Result + Buffer;
        FillChar(Buffer, SizeOf(Buffer), 0);
        InternetReadFile(UrlHandle, @Buffer, SizeOf(Buffer), BytesRead);
      until BytesRead = 0;
      InternetCloseHandle(UrlHandle);
    end
    else
      { UrlHandle is not valid. Raise an exception. }
      raise Exception.CreateFmt('Cannot open URL %s', [Url]);

    InternetCloseHandle(NetHandle);
  end
  else
    { NetHandle is not valid. Raise an exception }
    raise Exception.Create('Unable to initialize Wininet');
end;

function Tfungsi.jumlahHariBulan(bulan: Integer): Integer;
var
  hasil:Integer;
begin
  case bulan of
    1  : hasil:= 31;
    2  : hasil:= 29;
    3  : hasil:= 31;
    4  : hasil:= 30;
    5  : hasil:= 31;
    6  : hasil:= 30;
    7  : hasil:= 31;
    8  : hasil:= 31;
    9  : hasil:= 30;
    10 : hasil:= 31;
    11 : hasil:= 30;
    12 : hasil:= 31;
  else hasil:= 0;
  end;
  Result:= hasil;
end;

end.
