unit u_ganti_hari;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sLabel, StdCtrls;

type
  TF_hari = class(TForm)
    l_1: TsLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_hari: TF_hari;

implementation

{$R *.dfm}

procedure TF_hari.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  F_hari := nil;
end;

end.


