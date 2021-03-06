unit unClasseBaixa;

interface

uses
System.SysUtils, System.Classes, Vcl.Dialogs, Datasnap.DBClient, Data.DB;

type Tbaixa = class
  private

  bCodigo: integer;
  bTituloId: integer;
  bUsuarioId: integer;
  bDataBaixa: string;
  bBancoId: integer;

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
  property titulo: integer read bTituloId write bTituloId;
  property usuario: integer read bUsuarioId write bUsuarioId;
  property dataBaixa: string read bDataBaixa write bDataBaixa;
  property banco: integer read bBancoId write bBancoId;

end;

implementation

uses unDmBaixa, unDmUsuarios;

{ Tbaixa }

procedure Tbaixa.Alterar;
begin
  if Assigned(dmBaixa) then
  dmBaixa.Alterar;
end;

procedure Tbaixa.Cancelar;
begin
  if Assigned(dmBaixa) then
  dmBaixa.Cancelar;
end;

constructor Tbaixa.Create;
begin
  try
    dmBaixa := TdmBaixa.Create(nil);
    dmBaixa.cdsBaixa.Open;
  except
    showMessage('Ocorreu um erro ao tentar criar o datamodule de Usu?rios');
  end;
end;

destructor Tbaixa.Destroy;
begin
  dmBaixa.cdsBaixa.Close;
  FreeAndNil(dmBaixa);
end;

procedure Tbaixa.Excluir;
begin
  if Assigned(dmBaixa) then
  dmBaixa.Excluir;
end;

function Tbaixa.GetCds: TClientDataSet;
begin
  Result := nil;
  if Assigned(dmBaixa) then
    Result := dmBaixa.cdsBaixa;
end;

procedure Tbaixa.GetDados;
begin
  bCodigo := dmBaixa.cdsBaixaIDBAIXA.Value;
  bTituloId := dmBaixa.cdsBaixaTITULOID.Value;
  bUsuarioId := dmBaixa.cdsBaixaUSUARIOID.Value;
  bDataBaixa := dmBaixa.cdsBaixaDATABAIXA.Text;
  bBancoId := dmBaixa.cdsBaixaBANCOID.Value;
end;

procedure Tbaixa.Incluir;
begin
  if Assigned(dmBaixa) then
  dmBaixa.Incluir;
end;

procedure Tbaixa.Salvar;
begin
  dmBaixa.cdsBaixaIDBAIXA.Value := bCodigo;
  //dmBaixa.cdsBaixaTITULOID.Value := bTituloId;
  dmBaixa.cdsBaixaUSUARIOID.Value := StrToInt(dmUsuario.LoginID);
  dmBaixa.cdsBaixaDATABAIXA.Text := DateToStr(Date());
  //dmBaixa.cdsBaixaBANCOID.Value := bBancoId;

  if Assigned(dmBaixa) then
    dmBaixa.Salvar;

end;

end.
