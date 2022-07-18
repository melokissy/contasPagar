unit unLoginView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,unClasseUsuarios;

type
  TfrmLogin = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label5: TLabel;
    Label6: TLabel;
    edtLogin: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtSenha: TEdit;
    btnAcessar: TButton;
    btnFechar: TButton;
    Label1: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnAcessarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
    oUsu: Tusuario;

    uloginID   : String;
    uloginNome : String;
    procedure SalvaLoginID(const Value: String);
    procedure SalvaloginNome(const Value: String);
  public
    { Public declarations }
    property loginID   : String read uloginID write SalvaLoginID;
    property loginNome : String read uloginNome write SalvaloginNome;
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses unDmUsuarios;



procedure TfrmLogin.btnAcessarClick(Sender: TObject);
var
  cUser: string;
  cSenha: string;
  cID: string;
begin
  cUser := oUsu.getNome(edtLogin.Text);
  cSenha := oUsu.getSenha(edtLogin.Text);
  cID := oUsu.getId(edtLogin.Text);

  SalvaLoginID(cID);

  if cUser='' then
  begin
    ShowMessage('Usu�rio inv�lido');
    edtLogin.Text:='';
    edtLogin.SetFocus;
  end;

  if (cSenha=edtSenha.Text) then
    Close
  else
  begin
    ShowMessage('A senha � inv�lida');
    edtSenha.Text:='';
    edtSenha.SetFocus;
  end;
end;

procedure TfrmLogin.btnFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  oUsu := Tusuario.Create;
end;

procedure TfrmLogin.FormDestroy(Sender: TObject);
begin
  FreeAndNil(oUsu);
end;

procedure TfrmLogin.SalvaLoginID(const Value: String);
begin
  uloginID := Value;
  dmUsuario.LoginID := uloginID;
end;

procedure TfrmLogin.SalvaloginNome(const Value: String);
begin
  uloginNome := Value;
  dmUsuario.LoginNome := uloginNome;
end;

end.
