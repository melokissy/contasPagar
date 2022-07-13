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
  unLoginView in 'Login\unLoginView.pas' {frmLogin},
  unDmCliente in 'Cliente\unDmCliente.pas' {dmCliente: TDataModule},
  unClasseCliente in 'Cliente\unClasseCliente.pas',
  unClienteView in 'Cliente\unClienteView.pas' {frmClientes},
  unDmCep in 'Cep\unDmCep.pas' {dmCep: TDataModule},
  unClasseCep in 'Cep\unClasseCep.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmUsuarios, frmUsuarios);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TdmCliente, dmCliente);
  Application.CreateForm(TfrmClientes, frmClientes);
  Application.CreateForm(TdmCep, dmCep);
  Application.Run;
end.
