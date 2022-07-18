unit unDmTitulo;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Datasnap.Provider, Data.DB, Datasnap.DBClient,Vcl.Dialogs;

type
  TdmTitulo = class(TDataModule)
    cdsTitulo: TClientDataSet;
    dspTitulo: TDataSetProvider;
    qryTitulo: TFDQuery;
    qryAux: TFDQuery;
    cdsTituloIDTITULO: TIntegerField;
    cdsTituloNUMEROTITULO: TIntegerField;
    cdsTituloDATAVENCIMENTO: TStringField;
    cdsTituloBANCOID: TIntegerField;
    cdsTituloCLIENTEID: TIntegerField;
    cdsTituloVALORTITULO: TSingleField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Incluir;
    procedure Alterar;
    procedure Excluir;
    procedure Salvar;
    procedure Cancelar;
  end;

var
  dmTitulo: TdmTitulo;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses unDMConexao;

{$R *.dfm}

{ TdmTitulo }

procedure TdmTitulo.Alterar;
begin
  try
  cdsTitulo.Edit;
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar alterar o registro: ' + E.Message);
  end;
end;

procedure TdmTitulo.Cancelar;
begin
  try
  cdsTitulo.Cancel;
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar cancelar o registro: ' + E.Message);
  end;
end;

procedure TdmTitulo.Excluir;
begin
  try
    cdsTitulo.Delete;
    if (cdsTitulo.ChangeCount > 0) then
      cdsTitulo.ApplyUpdates(-1);
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar excluir o registro: ' + E.Message);
  end;
end;

procedure TdmTitulo.Incluir;
begin
  try
    cdsTitulo.Append;
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar incluir o registro: ' + E.Message);
  end;
end;

procedure TdmTitulo.Salvar;
begin
  try
    cdsTitulo.Post;
    if (cdsTitulo.ChangeCount > 0) then
       cdsTitulo.ApplyUpdates(-1);
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar salvar o registro: ' + E.Message);
  end;
end;

end.
