unit unLoginView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,unClasseUsuarios;

type
  TfrmLogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtLogin: TEdit;
    edtSenha: TEdit;
    btnAcessar: TButton;
    btnFechar: TButton;
    Panel1: TPanel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnAcessarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
    oUsu: Tusuario;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}



procedure TfrmLogin.btnAcessarClick(Sender: TObject);
var
  cUser: string;
  cSenha: string;
  cID: string;
begin
  cUser := oUsu.getNome(edtLogin.Text);
  cSenha := oUsu.getSenha(edtLogin.Text);
  cID := oUsu.getId(edtLogin.Text);

  //SalvaLoginID(cID);

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

end.
