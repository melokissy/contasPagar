program Project1;

uses
  Vcl.Forms,
  unContasPagar in 'unContasPagar.pas' {frmPrincipal},
  unDMConexao in 'Conexao\unDMConexao.pas' {dmConexao: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.Run;
end.
