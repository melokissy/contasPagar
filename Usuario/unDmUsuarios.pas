unit unDmUsuarios;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.DB, Datasnap.DBClient,Vcl.Dialogs;

type
  TdmUsuario = class(TDataModule)
    cdsUsuarios: TClientDataSet;
    qryUsuario: TFDQuery;
    dspUsuario: TDataSetProvider;
    qryAux: TFDQuery;
    cdsUsuariosIDUSU: TIntegerField;
    cdsUsuariosNOMEUSU: TStringField;
    cdsUsuariosLOGINUSU: TStringField;
    cdsUsuariosEMAILUSU: TStringField;
    cdsUsuariosSENHAUSU: TStringField;
    cdsUsuariosCPFUSU: TStringField;
    cdsUsuariosENDERECOUSU: TStringField;
    cdsUsuariosCEPID: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure IncluirUsuario;
    procedure AlterarUsuario;
    procedure ExcluirUsuario;
    procedure SalvarUsuario;
    procedure CancelarUsuario;
  end;

var
  dmUsuario: TdmUsuario;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses unDMConexao;

{$R *.dfm}

{ TdmUsuario }

procedure TdmUsuario.AlterarUsuario;
begin
try
  cdsUsuarios.Edit;
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar alterar o registro: ' + E.Message);
  end;
end;

procedure TdmUsuario.CancelarUsuario;
begin
try
  cdsUsuarios.Cancel;
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar cancelar o registro: ' + E.Message);
  end;
end;

procedure TdmUsuario.ExcluirUsuario;
begin
try
    cdsUsuarios.Delete;
    if (cdsUsuarios.ChangeCount > 0) then
      cdsUsuarios.ApplyUpdates(-1);
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar excluir o registro: ' + E.Message);
  end;
end;

procedure TdmUsuario.IncluirUsuario;
begin
  try
    cdsUsuarios.Append;
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar incluir o registro: ' + E.Message);
  end;
end;

procedure TdmUsuario.SalvarUsuario;
begin
  try
    cdsUsuarios.Post;
    if (cdsUsuarios.ChangeCount > 0) then
       cdsUsuarios.ApplyUpdates(-1);
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar salvar o registro: ' + E.Message);
  end;
end;

end.
