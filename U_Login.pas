unit U_Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sLabel,UFungsi, sEdit, sGroupBox, Buttons, sBitBtn,
  sButton, Mask, sMaskEdit, sCustomComboEdit, 
  ComCtrls, sStatusBar, sTooledit, cxControls, cxContainer,
  cxEdit, cxImage,mySQLDbTables,db,Registry, sSkinProvider, jpeg, ExtCtrls,
  sPanel,XPMan;

type
  TF_Login = class(TForm)
    sb: TsStatusBar;
    sg_login: TsGroupBox;
    sLabel4: TsLabel;
    sLabel5: TsLabel;
    sLabel6: TsLabel;
    sBitBtn2: TsBitBtn;
    sButton1: TsButton;
    Ed_Kd_User: TsEdit;
    Ed_N_User: TsEdit;
    Ed_Password: TsEdit;
    gambar: TcxImage;
    sSkinProvider1: TsSkinProvider;
    l_1: TsLabel;
    procedure Ed_Kd_UserKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sButton1Click(Sender: TObject);
    procedure Ed_N_UserEnter(Sender: TObject);
    procedure sBitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Ed_PasswordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbClick(Sender: TObject);
    procedure Ed_Kd_UserChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    OnServer: string;
    { Public declarations }
  end;

var
  F_Login: TF_Login;
  userPassword,userRealName:string;
  isAdmin : Boolean;

implementation

uses u_dm, u_utama, u_cari;


{$R *.dfm}

function IsCapsLockOn : Boolean;
begin
  Result := 0  =(GetKeyState(VK_CAPITAL) and $01);
end;

function tempdir: String;
var
  TempDir: array[0..255] of Char;
begin
  GetTempPath(255, @TempDir);
  Result := StrPas(TempDir);
end;

function GetBlobStream(dataset : TmySQLQuery; kolom_image:string):string;
begin
 TBlobField(dataset.FieldByName(kolom_image)).SaveToFile(tempdir + 'login.jpg');
 result:= tempdir+'login.jpg';
end;

procedure TF_Login.Ed_Kd_UserKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sql : string;
begin
if key=vk_return then
begin
  PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE );
  sql:= 'SELECT tb_user.n_user, tb_user.`password`, tb_user_company.admin ' +
      'FROM tb_user INNER JOIN ' +
      'tb_user_company ON tb_user.kd_user = tb_user_company.kd_user WHERE ' +
      'tb_user.kd_user="'+ed_kd_user.Text+'" AND tb_user_company.gudang="Y" ' +
      'AND tb_user_company.kd_perusahaan="'+sb.Panels[0].Text+'"';
  fungsi.SQLExec(DM.Q_Show,sql,true);
  if dm.Q_show.Eof then
  Begin
    messagedlg('Kode ini tidak terdaftar...',mtError,[mbOk],0);
    ed_kd_user.SetFocus;
  End else
  begin
    userRealName := dm.Q_show.FieldByName('n_user').AsString;
    userPassword := dm.Q_show.FieldByName('password').AsString;
    isAdmin      := dm.Q_show.FieldByName('admin').AsBoolean;

    sql:= 'SELECT `nilai` FROM `tb_settings` WHERE `parameter`="checkin"';
    fungsi.SQLExec(DM.Q_Show,sql,true);
    if dm.Q_show.FieldByName('nilai').AsBoolean then
    begin
      sql:= 'SELECT user_id FROM tb_checkinout WHERE ISNULL(checkout_time) ' +
            'AND user_id="'+ed_kd_user.Text+'"';
      fungsi.SQLExec(DM.Q_Show,sql,true);
      if dm.Q_show.Eof then
      begin
        messagedlg('Tidak Dapat Login '#10#13'USER belum Check IN....',mtError,[mbOk],0);
        ed_kd_user.SetFocus;
        Exit;
      end;
    end;

    ed_password.Enabled:= true;
    Ed_Password.SetFocus;
    Ed_N_User.Text:= userRealName;
    f_utama.ac_user.visible:=isAdmin;

    if FileExists(dm.AppPath+'image/'+ed_kd_user.Text+'.jpg') then
      gambar.Picture.LoadFromFile(dm.AppPath+'image/'+ed_kd_user.Text+'.jpg')
    else
    begin
      if FileExists(dm.AppPath+'image/login.jpg') then
      gambar.Picture.LoadFromFile(dm.AppPath+'image/login.jpg');
    end;
  end;
end;

if key=vk_escape then close;
end;

procedure TF_Login.sButton1Click(Sender: TObject);
var passs:string;
begin
if ed_n_user.Text<>'' then
begin
fungsi.SQLExec(dm.Q_temp,'select md5("'+ed_password.Text+'")as passs',true);
passs:=dm.Q_temp.fieldbyname('passs').AsString;
if compareText(userPassword,passs)<>0 then
begin
messagedlg('Password salah..',mtError,[mbOk],0);
ed_password.Clear;
ed_password.SetFocus;
end else
begin

F_utama.Sb.Panels[0].Text:= UpperCase(ed_kd_user.Text);
F_utama.Sb.Panels[1].Text:= ed_N_User.Text;

F_utama.sb.Panels[3].Text:=sb.Panels[0].Text;
fungsi.SQLExec(dm.Q_Show,'select * from tb_company where kd_perusahaan = "'+sb.Panels[0].Text+'"',true);
F_utama.sb.Panels[4].Text:=sb.Panels[1].Text;

F_utama.sb.Panels[8].Text:=dm.Q_Show.fieldbyname('ket').AsString;

onServer := dm.Q_Show.fieldbyname('onserver').asstring;

if F_utama.sb.Panels[8].Text='PUSAT' then
begin
  F_utama.ac_kirim_data.Visible:=False;
  F_utama.ac_update.Visible:=False;

  f_utama.ac_company.Visible:=True;

  F_utama.ts_transaksi.TabVisible:=True;
  F_utama.ts_set_inv.TabVisible:=True;

  F_utama.ac_receipt.Enabled:=True;
  F_utama.ac_return.Enabled:=True;
  F_utama.ac_purchase.Enabled:=True;
  f_utama.ac_kirim.Enabled:=True;

  fungsi.SQLExec(dm.Q_temp,'select kd_perusahaan from tb_company where ket = "'+sb.Panels[0].Text+'" and onserver ="Y"',true);
  cabang.clear;
  while not(dm.Q_temp.eof) do
  begin
    cabang.add(dm.Q_temp.fieldByName('kd_perusahaan').AsString);
    dm.Q_temp.next;
  end;

end else
begin
  F_utama.ac_kirim_data.Visible:=True;
  F_utama.ac_update.Visible:=True;

  f_utama.ac_company.Visible:=False;

  F_utama.ts_transaksi.TabVisible:=False;
  F_utama.ts_set_inv.TabVisible:=False;

  F_utama.ac_receipt.Enabled:=False;
  F_utama.ac_return.Enabled:=False;
  F_utama.ac_purchase.Enabled:=False;
  f_utama.ac_kirim.Enabled:=false;

  if (onServer = 'Y') then
  begin
  F_utama.ac_kirim_data.Visible:=False;
  F_utama.ac_update.Visible:=False;
  end;
end;

f_utama.panel_auto_width;
dm.sop:= false;
close;
end;
end;
end;

procedure TF_Login.Ed_N_UserEnter(Sender: TObject);
begin
ed_kd_user.SetFocus;
end;

procedure TF_Login.sBitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TF_Login.FormClose(Sender: TObject; var Action: TCloseAction);
begin
turun:= false;
f_utama.animasi.Enabled:= turun;
f_utama.AlphaBlendValue:=255;

if dm.sop=true then
f_utama.time_out.Enabled:= true;

action:= cafree;
end;

function SetCueBanner(const Edit: TEdit; const Placeholder: String): Boolean;
const
  EM_SETCUEBANNER = $1501;
var
  UniStr: WideString;
begin
  UniStr := Placeholder;
  SendMessage(Edit.Handle, EM_SETCUEBANNER, WParam(True),LParam(UniStr));
  Result := GetLastError() = ERROR_SUCCESS;
end;

procedure TF_Login.FormShow(Sender: TObject);
begin
turun:= true;
f_utama.animasi.Enabled:= turun;

Ed_Kd_User.Clear;
Ed_N_User.Clear;

Ed_Kd_User.setfocus;

sb.Panels[2].Text:=dm.My_conn.DatabaseName+'@'+dm.My_conn.Host;
end;

procedure TF_Login.Ed_PasswordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
begin
PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE );
sButton1Click(Sender);
end;
end;

procedure TF_Login.sbClick(Sender: TObject);
begin
  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi:= 'select kd_perusahaan, n_perusahaan from tb_company';
    tblcap[0]:= 'Kode';
    tblCap[1]:= 'Nama Perusahaan';
    cariT:= 8;
    tampil_button(False,True);
    if ShowModal = mrOk then
    begin
        sb.Panels[0].Text:=TblVal[0];
        sb.Panels[1].Text:=TblVal[1];
        F_Login.FormShow(Sender);
    end;
  finally
  close;
  end;
end;

procedure TF_Login.Ed_Kd_UserChange(Sender: TObject);
begin
Ed_N_User.Clear;
ed_password.clear;
end;

procedure TF_Login.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_f2 then
    sbClick(self);
end;

end.
