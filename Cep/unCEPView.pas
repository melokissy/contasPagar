unit unCEPView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unPadrao, Data.DB, System.ImageList,
  Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Samples.Spin,unClasseCep,xmldom, XMLIntf, XMLDoc;

type
  TfrmCEP = class(TfrmPadrao)
    dsCadastro: TDataSource;
    edtCodigo: TSpinEdit;
    Label2: TLabel;
    edtLogradouro: TEdit;
    Logradouro: TLabel;
    Label3: TLabel;
    edtCidade: TEdit;
    edtUF: TEdit;
    Label4: TLabel;
    edtCEPNumero: TEdit;
    Label5: TLabel;
    btnPesquisaWeb: TSpeedButton;
    procedure btnPesquisaWebClick(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
    procedure actIncluirExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
  private
    { Private declarations }
    oCEP: Tcep;

    procedure mostraDados;
    procedure limpaCampos;
  public
    { Public declarations }
    raizXML: IXMLNode;
    qtdRegistros: integer;
  end;

var
  frmCEP: TfrmCEP;

implementation

{$R *.dfm}

procedure TfrmCEP.actAlterarExecute(Sender: TObject);
begin
  inherited;
  mostraDados;
  ocep.Alterar;
end;

procedure TfrmCEP.actCancelarExecute(Sender: TObject);
begin
  inherited;
  oCep.Cancelar;
end;

procedure TfrmCEP.actExcluirExecute(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja mesmo excluir o registro?', mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
      oCep.Excluir;
    end;
end;

procedure TfrmCEP.actIncluirExecute(Sender: TObject);
begin
  inherited;

  limpaCampos;
  oCep.Incluir;
end;

procedure TfrmCEP.actSalvarExecute(Sender: TObject);
begin
  inherited;
  oCEP.codigo := qtdRegistros+1;
  oCEP.logradouro := edtLogradouro.Text;
  oCEP.estado := edtUF.Text;
  oCEP.numero := edtCEPNumero.Text;
  oCEP.cidade := edtCidade.Text;

  oCEP.Salvar;
end;

procedure TfrmCEP.btnPesquisaWebClick(Sender: TObject);
begin
  raizXML := oCEP.GetCEP(edtCEPNumero.Text);

  edtLogradouro.Text := raizXML.ChildNodes.FindNode('logradouro').Text;
  edtCidade.Text := raizXML.ChildNodes.FindNode('localidade').Text;
  edtUF.Text := raizXML.ChildNodes.FindNode('uf').Text;
end;

procedure TfrmCEP.dsCadastroDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if Assigned (oCep) then
  begin
    if (dsCadastro.DataSet.State=dsBrowse) then
      mostraDados;
  end;
    qtdRegistros := dbgConsulta.DataSource.DataSet.RecordCount;
end;

procedure TfrmCEP.FormCreate(Sender: TObject);
begin
  inherited;
  oCEP:= Tcep.Create;
  dsCadastro.DataSet:= oCEP.GetCds;
end;

procedure TfrmCEP.FormShow(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage:=tsConsulta;
end;

procedure TfrmCEP.limpaCampos;
begin

  edtLogradouro.Text:= '';
  edtCidade.Text := '';
  edtUF.Text := '';
  edtCEPNumero.Text := '';
end;

procedure TfrmCEP.mostraDados;
begin
  oCEP.GetDados;

  edtCodigo.Value := oCep.codigo;
  edtLogradouro.Text:= oCep.logradouro;
  edtCidade.Text := oCep.cidade;
  edtUF.Text := oCep.estado;
  edtCEPNumero.Text := oCep.numero;
end;

end.
