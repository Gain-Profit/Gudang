unit u_settings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFungsi, StdCtrls, ExtCtrls;

type
  TFrmSetting = class(TForm)
    pnlFooter: TPanel;
    btnBatal: TButton;
    btnSimpan: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
  private
    FCheck : TStringList;
    { Private declarations }
  public
    { Public declarations }
  end;

  TSetting = class
  private
    FNilai : Boolean;
    FKeterangan : string;
  public
    constructor Create(AKeterangan: string);
    property Nilai: Boolean read FNilai write FNilai;
    property Keterangan: string read FKeterangan;
  end;

var
  FrmSetting: TFrmSetting;

implementation

uses u_dm;

{$R *.dfm}

function ChangeBoolToStr(AValue: Boolean): string;
begin
  if AValue then
    result := 'Y'
  else
    result := 'N';
end;

procedure TFrmSetting.FormCreate(Sender: TObject);
var
  i, LPosisi : Integer;
  LSql : string;
  LCheck : TCheckBox;
  LParam : string;
  LSetting : TSetting;
begin
  FCheck := TStringList.Create;

  FCheck.AddObject('canoutonstockout',
    TSetting.Create('Barang Dapat Keluar Ketika Stok Habis'));

  FCheck.AddObject('warnonstocklow',
    TSetting.Create('Peringatkan Kasir jika Stok Kurang Dari Minimal Stok'));

  FCheck.AddObject('checkin',
    TSetting.Create('User Hanya Dapat Login Setelah Melakukan checkin'));

  FCheck.AddObject('fingerprint',
    TSetting.Create('CheckIN dilakukan dengan Alat Finger Print'));

  LPosisi := 8;

  for i := 0 to Pred(FCheck.Count) do
  begin
    LParam := FCheck.Strings[i];
    LSetting := TSetting(FCheck.Objects[i]);
    LSql := Format('SELECT * FROM tb_settings WHERE parameter = "%s"', [LParam]);
    fungsi.SQLExec(dm.Q_temp, LSql, True);
    LSetting.Nilai := dm.Q_temp.FieldByName('nilai').AsBoolean;

    LCheck := TCheckBox.Create(Self);
    LCheck.Name := Format('CB_%s', [LParam]);
    LCheck.Parent := Self;
    LCheck.Left := 8;
    LCheck.Top := LPosisi;
    LCheck.Width := 370;
    LCheck.Height := 17;
    LCheck.TabOrder := i;
    LCheck.Caption := LSetting.Keterangan;
    LCheck.Checked := LSetting.Nilai;
    LCheck.Show;

    LPosisi := LPosisi + 24;
    dm.Q_temp.Next;
  end;
  Self.Height := LPosisi + 100;
end;

procedure TFrmSetting.FormDestroy(Sender: TObject);
begin
  FCheck.Free;
end;

procedure TFrmSetting.btnSimpanClick(Sender: TObject);
var
  i: Integer;
  LParam, LSql, LValues : string;
  LSetting : TSetting;
begin
  for i:= 0 to FCheck.Count - 1 do
  begin
    LParam := FCheck.Strings[i];
    LSetting := TSetting(FCheck.Objects[i]);
    LSetting.Nilai := TCheckBox(FindComponent(Format('CB_%s', [LParam]))).Checked;

    LValues := LValues + Format('("%s", "%s"), ', [LParam, ChangeBoolToStr(Lsetting.Nilai)]);

  end;
  SetLength(LValues, Length(LValues) - 2);

  LSql := Format('REPLACE INTO tb_settings(parameter, nilai) VALUES %s', [LValues]);

  fungsi.SQLExec(dm.Q_Exe, LSql, False);
  ShowMessage('Penyimpan Data Setting Berhasil...');
end;

{ TSetting }

constructor TSetting.Create(AKeterangan: string);
begin
  FNilai := False;
  FKeterangan := AKeterangan;
end;

end.
