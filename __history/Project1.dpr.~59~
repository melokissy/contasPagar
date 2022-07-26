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
  unClasseCep in 'Cep\unClasseCep.pas',
  unPesquisaCEP in 'Cep\unPesquisaCEP.pas' {frmConsultaCEP},
  unCEPView in 'Cep\unCEPView.pas' {frmCEP},
  unDmBaixa in 'Baixa\unDmBaixa.pas' {dmBaixa: TDataModule},
  unClasseBaixa in 'Baixa\unClasseBaixa.pas',
  unDmTitulo in 'Titulo\unDmTitulo.pas' {dmTitulo: TDataModule},
  unClasseTitulo in 'Titulo\unClasseTitulo.pas',
  unTituloView in 'Titulo\unTituloView.pas' {frmTitulo},
  unDmBanco in 'Banco\unDmBanco.pas' {dmBancos: TDataModule},
  unClasseBanco in 'Banco\unClasseBanco.pas',
  unBancoView in 'Banco\unBancoView.pas' {frmBanco},
  unDmSaldo in 'Saldo\unDmSaldo.pas' {dmSaldo: TDataModule},
  unClasseSaldo in 'Saldo\unClasseSaldo.pas',
  unConfirmacaoBaixa in 'Baixa\unConfirmacaoBaixa.pas' {frmConfirmacaoBaixa},
  unBaixaView in 'Baixa\unBaixaView.pas' {frmBaixa},
  unSaldoView in 'Saldo\unSaldoView.pas' {frmSaldo};

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
  Application.CreateForm(TfrmConsultaCEP, frmConsultaCEP);
  Application.CreateForm(TfrmCEP, frmCEP);
  Application.CreateForm(TdmBaixa, dmBaixa);
  Application.CreateForm(TdmTitulo, dmTitulo);
  Application.CreateForm(TfrmTitulo, frmTitulo);
  Application.CreateForm(TdmBancos, dmBancos);
  Application.CreateForm(TfrmBanco, frmBanco);
  Application.CreateForm(TdmSaldo, dmSaldo);
  Application.CreateForm(TfrmConfirmacaoBaixa, frmConfirmacaoBaixa);
  Application.CreateForm(TfrmBaixa, frmBaixa);
  Application.CreateForm(TfrmSaldo, frmSaldo);
  Application.Run;
end.
