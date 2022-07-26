unit unSaldoView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unPadrao, Data.DB, System.ImageList,
  Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,unClasseSaldo,unDmBanco,unDmSaldo,
  Vcl.Samples.Spin, Vcl.DBCtrls;

type
  TfrmSaldo = class(TfrmPadrao)
    Label2: TLabel;
    edtCodigo: TSpinEdit;
    edtSaldoInicial: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    dsSaldo: TDataSource;
    dsBanco: TDataSource;
    edtSaldoFinal: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edtEntrada: TEdit;
    edtSaida: TEdit;
    Label7: TLabel;
    cbxBancos: TDBLookupComboBox;
    procedure FormShow(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure dsSaldoDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    oSaldo : Tsaldo;

    procedure mostraDados;
    procedure limpaCampos;
  public
    { Public declarations }
  end;

var
  frmSaldo: TfrmSaldo;

implementation

{$R *.dfm}

procedure TfrmSaldo.actAlterarExecute(Sender: TObject);
begin
  inherited;
  ShowMessage('N�o � poss�vel alterar um saldo cadastrado');
  PageControl1.ActivePage:=tsConsulta;
  actCancelarExecute(Sender);
end;

procedure TfrmSaldo.actCancelarExecute(Sender: TObject);
begin
  inherited;
  oSaldo.Cancelar;
end;

procedure TfrmSaldo.actExcluirExecute(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja mesmo excluir o registro?', mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
      oSaldo.Excluir;
    end;
end;

procedure TfrmSaldo.actFecharExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmSaldo.actIncluirExecute(Sender: TObject);
begin
  inherited;
  limpaCampos;
  oSaldo.Incluir;
end;

procedure TfrmSaldo.actSalvarExecute(Sender: TObject);
begin
  inherited;
  oSaldo.codigo := edtCodigo.Value;
  oSaldo.entrada := StrToFloat(edtEntrada.Text);
  osaldo.saida := StrToFloat(edtSaida.Text);
  osaldo.saldoInicial := StrToFloat(edtSaldoInicial.Text);
  osaldo.saldoFinal := StrToFloat(edtSaldoInicial.Text) + (StrToFloat(edtEntrada.Text) - StrToFloat(edtSaida.Text));

  oSaldo.Salvar;
end;

procedure TfrmSaldo.dsSaldoDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if Assigned (oSaldo) then
  begin
    if (dsSaldo.DataSet.State=dsBrowse) then
      mostraDados;
  end;
end;

procedure TfrmSaldo.FormCreate(Sender: TObject);
begin
  inherited;
  oSaldo := TSaldo.Create;
  dsSaldo.DataSet:= oSaldo.GetCds;
end;

procedure TfrmSaldo.FormShow(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage:=tsConsulta;
end;

procedure TfrmSaldo.limpaCampos;
begin
  edtEntrada.Text := '';
  edtSaida.Text := '';
  edtSaldoInicial.Text := '';
  edtSaldoFinal.Text := '';
end;

procedure TfrmSaldo.mostraDados;
begin
  oSaldo.GetDados;

  edtCodigo.Value := oSaldo.codigo;
  edtEntrada.Text := formatfloat('#.##',oSaldo.entrada);
  edtSaida.Text :=  formatfloat('#.##',oSaldo.saida);
  edtSaldoInicial.Text := formatfloat('#.##',oSaldo.saldoInicial);
  edtSaldoFinal.Text :=  formatfloat('#.##',oSaldo.saldoFinal);
end;

end.