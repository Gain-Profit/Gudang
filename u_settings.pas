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

var
  FrmSetting: TFrmSetting;

implementation

uses u_dm;

{$R *.dfm}

function ubahCB(checkbox: TCheckBox): string;
begin
  if checkbox.Checked = true then
    result := 'Y'
  else
    result := 'N';
end;

procedure TFrmSetting.FormCreate(Sender: TObject);
var
  i, LPosisi : Integer;
  LSql : string;
  LCheck : TCheckBox;
begin
  FCheck := TStringList.Create;

  LPosisi := 8;
  LSql := 'SELECT * FROM tb_settings';
  fungsi.SQLExec(dm.Q_temp, LSql, True);
  for i := 0 to dm.Q_temp.RecordCount - 1 do
  begin
    LCheck := TCheckBox.Create(Self);
    LCheck.Parent := Self;
    LCheck.Left := 8;
    LCheck.Top := LPosisi;
    LCheck.Width := 370;
    LCheck.Height := 17;
    LCheck.TabOrder := i;
    LCheck.Caption := dm.Q_temp.FieldByName('keterangan').AsString;
    LCheck.Checked := dm.Q_temp.FieldByName('nilai').AsBoolean;
    LCheck.Show;

    FCheck.AddObject(dm.Q_temp.FieldByName('id').AsString, LCheck);

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
  Lid, Lids, LNilai, LNilais, LSql :string;
begin
  for i:= 0 to FCheck.Count - 1 do
  begin
    Lid := FCheck.Strings[i];
    LNilai := ubahCB(TCheckBox(FCheck.Objects[i]));

    LNilais := LNilais + Format('WHEN "%s" THEN "%s" ', [Lid, LNilai]);
    Lids := Lids + Format('"%s", ', [Lid]);
  end;
  SetLength(LNilais, Length(LNilais) - 1);
  SetLength(Lids, Length(Lids) - 2);

  LSql := Format('UPDATE tb_settings SET nilai = (CASE id %s END) WHERE id IN (%s)',
    [LNilais, Lids]);

  fungsi.SQLExec(dm.Q_Exe, LSql, False);
  ShowMessage('Penyimpan Data Setting Berhasil...');
end;

end.
