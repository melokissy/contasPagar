program Project1;

uses
  Vcl.Forms,
  unContasPagar in 'unContasPagar.pas' {frmPrincipal},
  unDMConexao in 'Conexao\unDMConexao.pas' {dmConexao: TDataModule},
  unPadrao in 'Padrao\unPadrao.pas' {frmPadrao},
  unDmUsuarios in 'Usuario\unDmUsuarios.pas' {dmUsuario: TDataModule},
  unClasseUsuarios in 'Usuario\unClasseUsuarios.pas',
  unUsuarioView in 'Usuario\unUsuarioView.pas' {frmUsuarios},
  Bib in 'Utils\Bib.pas',
  unLoginView in 'Login\unLoginView.pas' {frmLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmUsuarios, frmUsuarios);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.
