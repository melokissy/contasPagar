unit unUsuarioView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unPadrao, Data.DB, System.ImageList,
  Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,UnClasseUsuarios,
  Vcl.Samples.Spin;

type
  TfrmUsuarios = class(TfrmPadrao)
    Label2: TLabel;
    edtNome: TEdit;
    Label3: TLabel;
    edtLogin: TEdit;
    Label4: TLabel;
    edtEmail: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edtSenha: TEdit;
    edtCPF: TMaskEdit;
    Label7: TLabel;
    Label9: TLabel;
    edtEndereco: TEdit;
    edtCEP: TMaskEdit;
    Label10: TLabel;
    dsCadastro: TDataSource;
    edtCodigo: TSpinEdit;
    edtCidade: TEdit;
    Label8: TLabel;
    edtUF: TEdit;
    Label11: TLabel;
    SpeedButton1: TSpeedButton;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
    procedure actIncluirExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    oUsuario: Tusuario;

    procedure mostraDados;
    procedure limpaCampos;

  public
    { Public declarations }
  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

{$R *.dfm}

procedure TfrmUsuarios.actAlterarExecute(Sender: TObject);
begin
  inherited;

  mostraDados;
  oUsuario.Alterar;

end;

procedure TfrmUsuarios.actCancelarExecute(Sender: TObject);
begin
  inherited;
  oUsuario.Cancelar;
end;

procedure TfrmUsuarios.actExcluirExecute(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja mesmo excluir o registro?', mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
      oUsuario.Excluir;
    end;
end;

procedure TfrmUsuarios.actIncluirExecute(Sender: TObject);
begin

  inherited;
  limpaCampos;

  oUsuario.Incluir;
  //ShowMessage('Voce tem acesso hehe: '+cUserLogado)

end;

procedure TfrmUsuarios.actSalvarExecute(Sender: TObject);
begin
  inherited;

  oUsuario.codigo := edtCodigo.Value;
  oUsuario.nome := edtNome.Text;
  oUsuario.cpf := edtCPF.Text;
  oUsuario.cep := 1;
  oUsuario.login := edtLogin.Text;
  oUsuario.email := edtEmail.Text;
  oUsuario.endereco := edtEndereco.Text;
  oUsuario.senha := edtSenha.Text;

  oUsuario.Salvar;
end;

procedure TfrmUsuarios.dsCadastroDataChange(Sender: TObject; Field: TField);
begin
  //mostra os daods quando muda o registro
  if Assigned (oUsuario) then
  begin
    if (dsCadastro.DataSet.State=dsBrowse) then
      mostraDados;
  end;

end;

procedure TfrmUsuarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(oUsuario);
end;

procedure TfrmUsuarios.FormCreate(Sender: TObject);
begin
  oUsuario:= Tusuario.Create;
  dsCadastro.DataSet:= oUsuario.GetCds;
end;

procedure TfrmUsuarios.FormShow(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage:=tsConsulta;
end;

procedure TfrmUsuarios.limpaCampos;
begin

  edtNome.Text:= '';
  edtLogin.Text := '';
  edtEmail.Text := '';
  edtSenha.Text := '';
  edtCEP.Text := '';
  edtCPF.Text := '';
  edtEndereco.Text := '';
end;

procedure TfrmUsuarios.mostraDados;
begin
  oUsuario.GetDados;

  edtCodigo.Value := oUsuario.codigo;
  edtNome.Text:= oUsuario.nome;
  edtLogin.Text := oUsuario.login;
  edtEmail.Text := oUsuario.email;
  edtSenha.Text := oUsuario.senha;
  //edtCEP.Text := oUsuario.cep;
  edtCPF.Text := oUsuario.cpf;
  edtEndereco.Text := oUsuario.endereco;
end;

procedure TfrmUsuarios.PageControlChange(Sender: TObject);
begin
  mostraDados;
end;

end.
