program Project1;

uses
  Vcl.Forms,
  unContasPagar in 'unContasPagar.pas' {frmPrincipal},
  unDMConexao in 'Conexao\unDMConexao.pas' {dmConexao: TDataModule},
  unPadrao in 'Padrao\unPadrao.pas' {Form1},
  unDmUsuarios in 'Usuario\unDmUsuarios.pas' {dmUsuario: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TdmUsuario, dmUsuario);
  Application.Run;
end.
