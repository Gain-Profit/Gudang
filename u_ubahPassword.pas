unit u_ubahPassword;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sLabel, sButton, sEdit,u_fungsi;

type
  TF_ubahPassword = class(TForm)
    l_1: TsLabel;
    l_2: TsLabel;
    l_3: TsLabel;
    ed_pass2: TsEdit;
    ed_pass: TsEdit;
    edpassLama: TsEdit;
    btnpass: TsButton;
    procedure btnpassClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ubahPassword: TF_ubahPassword;
  fungsi:tfungsi;

implementation

uses u_dm, u_utama;

{$R *.dfm}

procedure TF_ubahPassword.btnpassClick(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_temp,'SELECT STRCMP(`password`,MD5("'+edpassLama.Text+'")) as sama FROM tb_user where kd_user="'+
f_utama.sb.Panels[0].Text+'"',true);
  if dm.Q_temp.FieldByName('sama').AsInteger <> 0 then
  begin
  showmessage('Password Lama Tidak Sesuai....');
  edpassLama.SetFocus;
  exit;
  end;

  if (ed_pass.Text='') or (ed_pass2.Text='') then
  begin
  showmessage('password tidak boleh kosong....');
  exit;
  end;

  if ed_pass.Text<>ed_pass2.Text then
  begin
  showmessage('password dan konfirmasi tidak sama');
  exit;
  end;

fungsi.SQLExec(dm.Q_Exe,'update tb_user set `update`="'+formatdatetime('yyyy-MM-dd', date())
+'",password=md5("'+ed_pass.Text+'") where kd_user="'+f_utama.sb.Panels[0].text+'"',false);
showmessage('Proses Pengubahan Password sukses....');
Close;                                                                             
end;

end.
