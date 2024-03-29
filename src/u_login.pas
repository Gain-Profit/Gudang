unit u_Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, db, sSkinProvider, ExtCtrls, Buttons, UFungsi,
  System.UITypes;

type
  TF_Login = class(TForm)
    sb: TStatusBar;
    sg_login: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    BtnClose: TBitBtn;
    BtnLogin: TButton;
    Ed_Kd_User: TEdit;
    Ed_N_User: TEdit;
    Ed_Password: TEdit;
    sSkinProvider1: TsSkinProvider;
    l_1: TLabel;
    procedure Ed_Kd_UserKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnLoginClick(Sender: TObject);
    procedure Ed_N_UserEnter(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Ed_PasswordKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sbClick(Sender: TObject);
    procedure Ed_Kd_UserChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    OnServer, userPassword, userRealName: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Login: TF_Login;

implementation

uses
  u_dm, u_utama, u_cari;


{$R *.dfm}

function IsCapsLockOn: Boolean;
begin
  Result := 0 = (GetKeyState(VK_CAPITAL) and $01);
end;

function tempdir: string;
var
  TempDir: array[0..255] of Char;
begin
  GetTempPath(255, @TempDir);
  Result := StrPas(TempDir);
end;

procedure TF_Login.Ed_Kd_UserKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  sql: string;
begin
  if key = vk_return then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    sql := 'SELECT tb_user.n_user, tb_user.`password` ' +
      'FROM tb_user INNER JOIN ' + 'tb_user_company ON tb_user.kd_user = tb_user_company.kd_user WHERE '
      + 'tb_user.kd_user="' + ed_kd_user.Text +
      '" AND tb_user_company.gudang="Y" ' + 'AND tb_user_company.kd_perusahaan="'
      + dm.kd_perusahaan + '"';
    fungsi.SQLExec(DM.Q_Show, sql, true);
    if dm.Q_show.Eof then
    begin
      messagedlg('Kode ini tidak terdaftar...', mtError, [mbOk], 0);
      ed_kd_user.SetFocus;
    end
    else
    begin
      userRealName := dm.Q_show.FieldByName('n_user').AsString;
      userPassword := dm.Q_show.FieldByName('password').AsString;

      sql := 'SELECT `nilai` FROM `tb_settings` WHERE `parameter`="checkin"';
      fungsi.SQLExec(DM.Q_Show, sql, true);
      if dm.Q_show.FieldByName('nilai').AsBoolean then
      begin
        sql := 'SELECT user_id FROM tb_checkinout WHERE ISNULL(checkout_time) '
          + 'AND user_id="' + ed_kd_user.Text + '"';
        fungsi.SQLExec(DM.Q_Show, sql, true);
        if dm.Q_show.Eof then
        begin
          messagedlg('Tidak Dapat Login '#10#13'USER belum Check IN....',
            mtError, [mbOk], 0);
          ed_kd_user.SetFocus;
          Exit;
        end;
      end;

      ed_password.Enabled := true;
      Ed_Password.SetFocus;
      Ed_N_User.Text := userRealName;
    end;
  end;

  if key = vk_escape then
    close;
end;

procedure TF_Login.BtnLoginClick(Sender: TObject);
var
  passs: string;
begin
  if ed_n_user.Text <> '' then
  begin
    fungsi.SQLExec(dm.Q_temp, 'select md5("' + ed_password.Text + '")as passs', true);
    passs := dm.Q_temp.fieldbyname('passs').AsString;
    if compareText(userPassword, passs) <> 0 then
    begin
      messagedlg('Password salah..', mtError, [mbOk], 0);
      ed_password.Clear;
      ed_password.SetFocus;
    end
    else
    begin

      dm.kd_pengguna := UpperCase(ed_kd_user.Text);
      F_utama.Sb.Panels[0].Text := dm.kd_pengguna;
      F_utama.Sb.Panels[1].Text := ed_N_User.Text;

      F_utama.Sb.Panels[3].Text := dm.kd_perusahaan;
      fungsi.SQLExec(dm.Q_Show,
        'select * from tb_company where kd_perusahaan = "' + dm.kd_perusahaan +
        '"', true);
      F_utama.sb.Panels[4].Text := sb.Panels[1].Text;

      F_utama.sb.Panels[8].Text := dm.Q_Show.fieldbyname('ket').AsString;

      onServer := dm.Q_Show.fieldbyname('onserver').asstring;

      if F_utama.sb.Panels[8].Text = 'PUSAT' then
      begin
        F_utama.ac_update.Visible := False;

        F_utama.ac_company.Visible := True;

        F_utama.ts_transaksi.TabVisible := True;
        F_utama.ts_set_inv.TabVisible := True;

        F_utama.ac_receipt.Enabled := True;
        F_utama.ac_return.Enabled := True;
        F_utama.ac_purchase.Enabled := True;
        F_utama.ac_kirim.Enabled := True;

        fungsi.SQLExec(dm.Q_temp,
          'select kd_perusahaan from tb_company where ket = "' + dm.kd_perusahaan
          + '" and onserver ="Y"', true);
        cabang.clear;
        while not (dm.Q_temp.eof) do
        begin
          cabang.add(dm.Q_temp.fieldByName('kd_perusahaan').AsString);
          dm.Q_temp.next;
        end;

      end
      else
      begin
        F_utama.ac_update.Visible := True;

        F_utama.ac_company.Visible := False;

        F_utama.ts_transaksi.TabVisible := False;
        F_utama.ts_set_inv.TabVisible := False;

        F_utama.ac_receipt.Enabled := False;
        F_utama.ac_return.Enabled := False;
        F_utama.ac_purchase.Enabled := False;
        F_utama.ac_kirim.Enabled := false;

        if (onServer = 'Y') then
        begin
          F_utama.ac_update.Visible := False;
        end;
      end;

      F_utama.panel_auto_width;
      dm.CanLogin := True;
      close;
    end;
  end;
end;

procedure TF_Login.Ed_N_UserEnter(Sender: TObject);
begin
  ed_kd_user.SetFocus;
end;

procedure TF_Login.BtnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TF_Login.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TF_Login.FormShow(Sender: TObject);
begin
  Ed_Kd_User.Clear;
  Ed_N_User.Clear;

  Ed_Kd_User.setfocus;

  sb.Panels[2].Text := dm.db_conn.Database + '@' + dm.db_conn.Server;
end;

procedure TF_Login.Ed_PasswordKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    BtnLoginClick(Sender);
  end;
end;

procedure TF_Login.sbClick(Sender: TObject);
begin
  application.CreateForm(TF_cari, F_cari);
  with F_cari do
  try
    _SQLi := 'select kd_perusahaan, n_perusahaan from tb_company';
    tblcap[0] := 'Kode';
    tblCap[1] := 'Nama Perusahaan';
    cariT := 8;
    tampil_button(False, True);
    if ShowModal = mrOk then
    begin
      dm.kd_perusahaan := TblVal[0];
      dm.n_perusahaan := TblVal[1];
      sb.Panels[0].Text := dm.kd_perusahaan;
      sb.Panels[1].Text := dm.n_perusahaan;
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

procedure TF_Login.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_f2 then
    sbClick(self);
end;

end.


