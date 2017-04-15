unit u_koneksi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, sLabel, sSkinProvider, sButton;

type
  Tf_koneksi = class(TForm)
    l_1: TsLabel;
    sknprvdr1: TsSkinProvider;
    l_2: TsLabel;
    timer2: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure CreateParams(var Params: TCreateParams); override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_koneksi: Tf_koneksi;

implementation

uses u_dm;

{$R *.dfm}

procedure Tf_koneksi.CreateParams(var Params: TCreateParams);
begin
   inherited CreateParams(Params);
   with Params do
      Style := (Style or WS_POPUP) and (not WS_DLGFRAME);
end;

procedure Tf_koneksi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:= caFree;
f_koneksi:= nil;
end;

end.
