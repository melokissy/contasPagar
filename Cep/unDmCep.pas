unit unDmCep;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Datasnap.Provider, Data.DB, Datasnap.DBClient,Vcl.Dialogs;

type
  TdmCep = class(TDataModule)
    cdsCep: TClientDataSet;
    dspCep: TDataSetProvider;
    qryCep: TFDQuery;
    qryAux: TFDQuery;
    cdsCepIDCEP: TIntegerField;
    cdsCepCIDADECEP: TStringField;
    cdsCepESTADOCEP: TStringField;
    cdsCepNUMEROCEP: TStringField;
    cdsCepLOGRADOUROCEP: TStringField;
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
  dmCep: TdmCep;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses unDMConexao;

{$R *.dfm}

{ TdmCep }

procedure TdmCep.Alterar;
begin
  try
  cdsCep.Edit;
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar alterar o registro: ' + E.Message);
  end;
end;

procedure TdmCep.Cancelar;
begin
  try
  cdsCep.Cancel;
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar cancelar o registro: ' + E.Message);
  end;
end;

procedure TdmCep.Excluir;
begin
  try
    cdsCep.Delete;
    if (cdsCep.ChangeCount > 0) then
      cdsCep.ApplyUpdates(-1);
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar excluir o registro: ' + E.Message);
  end;
end;

procedure TdmCep.Incluir;
begin
  try
    cdsCep.Append;
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar incluir o registro: ' + E.Message);
  end;
end;

procedure TdmCep.Salvar;
begin
  try
    cdsCep.Post;
    if (cdsCep.ChangeCount > 0) then
       cdsCep.ApplyUpdates(-1);
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar salvar o registro: ' + E.Message);
  end;
end;

end.
