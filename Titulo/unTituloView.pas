unit unTituloView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unPadrao, Data.DB, System.ImageList,
  Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.Grids, Vcl.DBGrids,unClasseTitulo,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Samples.Spin,System.Generics.Collections,
  Vcl.DBCtrls,unDmCliente,unDmTitulo,unClasseCliente,unClasseBanco,unDmBanco;

type
  TfrmTitulo = class(TfrmPadrao)
    dsCadastro: TDataSource;
    edtCodigo: TSpinEdit;
    Label2: TLabel;
    edtNumero: TEdit;
    Label3: TLabel;
    edtValor: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtVencimento: TEdit;
    cbCliente: TDBLookupComboBox;
    dsCliente: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    dsBanco: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
    procedure actSalvarExecute(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure dsClienteDataChange(Sender: TObject; Field: TField);
    procedure dsBancoDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    oTitulo: Ttitulo;
    oCliente : TCliente;
    oBanco : TBanco;
    dmCliente : unDmCliente.TdmCliente;
    dmTitulo : unDmTitulo.TdmTitulo;

    procedure mostraDados;
    procedure limpaCampos;
  public
    { Public declarations }

  end;

var
  frmTitulo: TfrmTitulo;

implementation

{$R *.dfm}

{ TfrmTitulo }

procedure TfrmTitulo.actAlterarExecute(Sender: TObject);
begin
  inherited;
  mostraDados;
  oTitulo.Alterar;
end;

procedure TfrmTitulo.actCancelarExecute(Sender: TObject);
begin
  inherited;
  oTitulo.Cancelar;
end;

procedure TfrmTitulo.actExcluirExecute(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja mesmo excluir o registro?', mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
      oTitulo.Excluir;
    end;
end;

procedure TfrmTitulo.actIncluirExecute(Sender: TObject);
begin
  inherited;
  limpaCampos;

  oTitulo.Incluir;
end;

procedure TfrmTitulo.actSalvarExecute(Sender: TObject);
begin
  inherited;

  oTitulo.codigo := edtCodigo.Value;
  oTitulo.numero := StrToInt(edtNumero.Text);
  oTitulo.valor := StrToFloat(edtValor.Text);
  oTitulo.dataVencimento := edtVencimento.Text;

  oTitulo.Salvar;
end;

procedure TfrmTitulo.dsBancoDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if Assigned (oBanco) then
  begin
    if (dsBanco.DataSet.State=dsBrowse) then
      mostraDados;
  end;
end;

procedure TfrmTitulo.dsCadastroDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if Assigned (oTitulo) then
  begin
    if (dsCadastro.DataSet.State=dsBrowse) then
      mostraDados;
  end;
end;

procedure TfrmTitulo.dsClienteDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if Assigned (oCliente) then
  begin
    if (dsCliente.DataSet.State=dsBrowse) then
      mostraDados;
  end;
end;

procedure TfrmTitulo.FormCreate(Sender: TObject);
begin
  inherited;

  oTitulo := TTitulo.Create;
  dsCadastro.DataSet:= oTitulo.GetCds;

end;

procedure TfrmTitulo.FormShow(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage:=tsConsulta;
end;

procedure TfrmTitulo.limpaCampos;
begin
  edtNumero.Text := '';
  edtValor.Text := '';
end;

procedure TfrmTitulo.mostraDados;
var
  valor: real;
begin
  oTitulo.GetDados;

  valor := oTitulo.valor;

  edtCodigo.Value := oTitulo.codigo;
  edtNumero.Text := IntToStr(oTitulo.numero);
  edtValor.Text := formatfloat('#.##',valor);  //valor formatado mostrando somente duas casas decimais ap�s a virgula
  edtVencimento.Text := oTitulo.dataVencimento;
  //edtBanco.Value := oTitulo.banco;
end;

end.
