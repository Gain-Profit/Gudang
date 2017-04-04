unit u_settings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFungsi;

type
  TFrmSetting = class(TForm)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSetting: TFrmSetting;

implementation

uses u_dm;

{$R *.dfm}

procedure TFrmSetting.FormShow(Sender: TObject);
var
  LSql : string;
begin
    LSql := 'SELECT * FROM tb_settings';
    fungsi.SQLExec(dm.Q_temp, LSql, True);
end;

end.
