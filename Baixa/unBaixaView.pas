unit unBaixaView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unPadrao, Data.DB, System.ImageList,
  Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.Grids, Vcl.DBGrids,unClasseTitulo,unClasseUsuarios,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Samples.Spin,unClasseBaixa,unClasseBanco,unClasseSaldo,
  Vcl.DBCtrls;

type
  TfrmBaixa = class(TfrmPadrao)
    dsBaixa: TDataSource;
    dsBanco: TDataSource;
    dsTitulo: TDataSource;
    edtCodigo: TSpinEdit;
    Label2: TLabel;
    Label3: TLabel;
    cbxBanco: TDBLookupComboBox;
    Label4: TLabel;
    lblValor: TLabel;
    cbxTitulo: TDBLookupComboBox;
    lblSaldoBanco: TLabel;
    lblDataBaixa: TLabel;
    lblUsuario: TLabel;
    procedure actSalvarExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dsBaixaDataChange(Sender: TObject; Field: TField);
    procedure actIncluirExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure cbxTituloExit(Sender: TObject);
    procedure CarregarLabelValorTit;
    procedure CarregarLabelSaldoBanco;
    procedure cbxTituloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbxTituloClick(Sender: TObject);
    procedure cbxBancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbxBancoExit(Sender: TObject);
    procedure cbxBancoClick(Sender: TObject);
  private
    { Private declarations }
    oBaixa : TBaixa;
    oBanco : Tbanco;
    oSaldo : Tsaldo;
    oTitulo : Ttitulo;
    oUsuario : Tusuario;
    procedure mostraDados;
  public
    { Public declarations }
    saldoBanco : double;
    valorTit : double;
    codidoBanco : string;
    qtdRegistros:integer;
  end;

var
  frmBaixa: TfrmBaixa;

implementation

{$R *.dfm}

uses unDmBanco, unDmTitulo, unDmBaixa;

procedure TfrmBaixa.actAlterarExecute(Sender: TObject);
begin
  inherited;
  ShowMessage('N�o � poss�vel alterar uma baixa realizada');
  PageControl1.ActivePage:=tsConsulta;
  actCancelarExecute(Sender);
end;

procedure TfrmBaixa.actCancelarExecute(Sender: TObject);
begin
  inherited;
    oBaixa.Cancelar;
end;

procedure TfrmBaixa.actExcluirExecute(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja mesmo excluir o registro?', mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
      oBaixa.Excluir;
    end;
end;

procedure TfrmBaixa.actFecharExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmBaixa.actIncluirExecute(Sender: TObject);
begin
  inherited;
  oBaixa.Incluir;

  lblValor.Caption := '';
  lblSaldoBanco.Caption := '';
end;

procedure TfrmBaixa.actSalvarExecute(Sender: TObject);
var
  nomeBanco : string;
  tituloId : string;
begin
  nomeBanco := cbxBanco.ListSource.DataSet.FieldByName(cbxBanco.ListField).Value;
  codidoBanco := oBanco.getBancoId(nomeBanco);
  saldoBanco := StrToFloat(oSaldo.getSaldo(codidoBanco));

  tituloId := oTitulo.getId(cbxTitulo.ListSource.DataSet.FieldByName(cbxTitulo.ListField).Value);

  if saldoBanco > valorTit then
  begin
    if oBaixa.GetBaixa(tituloId) = 0 then
    begin
      oBaixa.codigo := qtdRegistros+1;
      oBaixa.Salvar;
      oSaldo.descontaSaldo(codidoBanco,valorTit);
      PageControl1.ActivePage:=tsConsulta;
    end
    else
    begin
      ShowMessage('O t�tulo j� foi pago');
      actCancelarExecute(sender);
    end;
  end
  else
  begin
    ShowMessage('O banco selecionado n�o possui saldo suficiente');
    actCancelarExecute(Sender);
  end;
    actCancelarExecute(sender);
end;

procedure TfrmBaixa.CarregarLabelSaldoBanco;
var
  nomeBanco : string;
  saldo : string;
begin
  inherited;
  nomeBanco := cbxBanco.ListSource.DataSet.FieldByName(cbxBanco.ListField).Value;
  codidoBanco := oBanco.getBancoId(nomeBanco);
  saldo := oSaldo.getSaldo(codidoBanco);

  if saldo <> '' then
  begin
    saldoBanco := StrToFloat(saldo);
    lblSaldoBanco.Caption := 'Saldo do banco: R$ '+formatfloat('#.##',saldoBanco);
    exit;
  end;
    lblSaldoBanco.Caption := 'Saldo do banco: R$ 0,00';

end;

procedure TfrmBaixa.CarregarLabelValorTit;
var
  numeroTit : string;
begin
  inherited;
  numeroTit := cbxTitulo.ListSource.DataSet.FieldByName(cbxTitulo.ListField).Value;
  valorTit := StrToFloat(oTitulo.getValor(numeroTit));
  lblValor.Caption := 'Valor do t�tulo: R$ '+formatfloat('#.##',valorTit);
end;

procedure TfrmBaixa.cbxBancoClick(Sender: TObject);
begin
  CarregarLabelSaldoBanco;
end;

procedure TfrmBaixa.cbxBancoExit(Sender: TObject);
begin
  CarregarLabelSaldoBanco;
end;

procedure TfrmBaixa.cbxBancoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CarregarLabelSaldoBanco;
end;

procedure TfrmBaixa.cbxTituloClick(Sender: TObject);
begin
  CarregarLabelValorTit;

end;

procedure TfrmBaixa.cbxTituloExit(Sender: TObject);
begin
  CarregarLabelValorTit;
end;

procedure TfrmBaixa.cbxTituloKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin
  CarregarLabelValorTit;
end;

procedure TfrmBaixa.dsBaixaDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if Assigned (oBaixa) then
  begin
    if (dsBaixa.DataSet.State=dsBrowse) then
      mostraDados;
  end;
    qtdRegistros := dbgConsulta.DataSource.DataSet.RecordCount;
end;

procedure TfrmBaixa.FormCreate(Sender: TObject);
begin
  inherited;
  oBaixa := Tbaixa.Create;
  dsBaixa.DataSet:= oBaixa.GetCds;
end;

procedure TfrmBaixa.FormShow(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage:=tsConsulta;
end;

procedure TfrmBaixa.mostraDados;
var
  usuId: integer;
begin
  oBaixa.GetDados;

  edtCodigo.Value := oBaixa.codigo;
  lblDataBaixa.Caption := 'Data da baixa: '+oBaixa.dataBaixa;

  usuId := oBaixa.usuario;
  lblUsuario.Caption := 'Usuario que efetuou a baixa: '+oUsuario.getNomeById(usuId);

  CarregarLabelValorTit;
  CarregarLabelSaldoBanco;

  lblValor.Caption := 'Valor do t�tulo: R$ '+formatfloat('#.##',valorTit);
  lblSaldoBanco.Caption := 'Saldo do banco: R$ '+formatfloat('#.##',saldoBanco);

end;

end.
