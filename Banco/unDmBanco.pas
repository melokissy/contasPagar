unit unDmBanco;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.DB, Datasnap.DBClient,Vcl.Dialogs;

type
  TdmBancos = class(TDataModule)
    cdsBanco: TClientDataSet;
    qryAux: TFDQuery;
    qryBanco: TFDQuery;
    dspBanco: TDataSetProvider;
    cdsBancoIDBANCO: TIntegerField;
    cdsBancoNOMEBANCO: TStringField;
    cdsBancoCODIGOBANCO: TStringField;
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
  dmBancos: TdmBancos;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses unDMConexao;

{$R *.dfm}

{ TdmBancos }

procedure TdmBancos.Alterar;
begin
  try
  cdsBanco.Edit;
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar alterar o registro: ' + E.Message);
  end;
end;

procedure TdmBancos.Cancelar;
begin
  try
  cdsBanco.Cancel;
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar cancelar o registro: ' + E.Message);
  end;
end;

procedure TdmBancos.Excluir;
begin
  try
    cdsBanco.Delete;
    if (cdsBanco.ChangeCount > 0) then
      cdsBanco.ApplyUpdates(-1);
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar excluir o registro: ' + E.Message);
  end;
end;

procedure TdmBancos.Incluir;
begin
  try
    cdsBanco.Append;
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar incluir o registro: ' + E.Message);
  end;
end;

procedure TdmBancos.Salvar;
begin
  try
    cdsBanco.Post;
    if (cdsBanco.ChangeCount > 0) then
       cdsBanco.ApplyUpdates(-1);
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar salvar o registro: ' + E.Message);
  end;
end;

end.
