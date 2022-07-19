unit unClasseBanco;

interface

uses
System.SysUtils, System.Classes, Vcl.Dialogs, Datasnap.DBClient, Data.DB;

type Tbanco = class
  private
    bCodigo: integer;
    bNome: string;
    bNumero: string;

public
  constructor Create;
  destructor Destroy;

  procedure Incluir;
  procedure Alterar;
  procedure Excluir;
  procedure Cancelar;
  procedure Salvar;
  procedure GetDados;

  function GetCds: TClientDataSet;

  property codigo: integer read bCodigo write bCodigo;
  property numero: string read bNumero write bNumero;
  property nome: string read bNome write bNome;
end;

implementation

{ Tbanco }

uses unDmBanco;

procedure Tbanco.Alterar;
begin
  if Assigned(dmBancos) then
  dmBancos.Alterar;
end;

procedure Tbanco.Cancelar;
begin
  if Assigned(dmBancos) then
  dmBancos.Cancelar;
end;

constructor Tbanco.Create;
begin
  try
    dmBancos := TdmBancos.Create(nil);
    dmBancos.cdsBanco.Open;
  except
    showMessage('Ocorreu um erro ao tentar criar o datamodule de Usu�rios');
  end;
end;

destructor Tbanco.Destroy;
begin
  dmBancos.cdsBanco.Close;
  FreeAndNil(dmBancos);
end;

procedure Tbanco.Excluir;
begin
  if Assigned(dmBancos) then
  dmBancos.Excluir;
end;

function Tbanco.GetCds: TClientDataSet;
begin
  Result := nil;
  if Assigned(dmBancos) then
    Result := dmBancos.cdsBanco;
end;

procedure Tbanco.GetDados;
begin
  bCodigo := dmBancos.cdsBancoIDBANCO.Value;
  bNumero := dmBancos.cdsBancoCODIGOBANCO.Text;
  bNome := dmBancos.cdsBancoNOMEBANCO.Text;
end;

procedure Tbanco.Incluir;
begin
  if Assigned(dmBancos) then
  dmBancos.Incluir;
end;

procedure Tbanco.Salvar;
begin
  dmBancos.cdsBancoIDBANCO.Value := bCodigo;
  dmBancos.cdsBancoCODIGOBANCO.Text := bNumero;
  dmBancos.cdsBancoNOMEBANCO.Text := bNome;

  if Assigned(dmBancos) then
    dmBancos.Salvar;
end;

end.
