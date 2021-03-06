unit unBaixaView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unPadrao, Data.DB, System.ImageList,
  Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Samples.Spin,unClasseBaixa,
  Vcl.DBCtrls;

type
  TfrmBaixa = class(TfrmPadrao)
    dsBaixa: TDataSource;
    dsBanco: TDataSource;
    dsTitulo: TDataSource;
    edtCodigo: TSpinEdit;
    Label2: TLabel;
    Label3: TLabel;
    cbxTitulo: TDBLookupComboBox;
    cbxBanco: TDBLookupComboBox;
    Label4: TLabel;
    procedure actSalvarExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dsBaixaDataChange(Sender: TObject; Field: TField);
    procedure actIncluirExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
  private
    { Private declarations }
    oBaixa : TBaixa;
    procedure mostraDados;
    //procedure habilitaCampos;
  public
    { Public declarations }
  end;

var
  frmBaixa: TfrmBaixa;

implementation

{$R *.dfm}

uses unDmBanco, unDmTitulo, unDmBaixa;

procedure TfrmBaixa.actAlterarExecute(Sender: TObject);
begin
  inherited;
  ShowMessage('N?o ? poss?vel alterar uma baixa realizada');
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
end;

procedure TfrmBaixa.actSalvarExecute(Sender: TObject);
begin
  inherited;
  oBaixa.codigo := edtCodigo.Value;
  oBaixa.Salvar;
end;

procedure TfrmBaixa.dsBaixaDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if Assigned (oBaixa) then
  begin
    if (dsBaixa.DataSet.State=dsBrowse) then
      mostraDados;
  end;
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
begin
  oBaixa.GetDados;

  edtCodigo.Value := oBaixa.codigo;
end;

end.
