unit unClasseSaldo;

interface

uses
System.SysUtils, System.Classes, Vcl.Dialogs, Datasnap.DBClient, Data.DB;

type Tsaldo = class
  private
    sCodigo: integer;
    sSaldoFinal: double;
    sSaldoInicial: double;
    sValorEntrada: double;
    sValorSaida: double;
    sData: string;
    sBancoId: integer;

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

  property codigo: integer read sCodigo write sCodigo;
  property saldoInicial: double read sSaldoInicial write sSaldoInicial;
  property saldoFinal: double read sSaldoFinal write sSaldoFinal;
  property entrada: double read sValorEntrada write sValorEntrada;
  property saida: double read sValorSaida write sValorSaida;
  property dataSaldo: string read sData write sData;
  property bancoId : integer read sBancoId write sBancoId;

end;

implementation

{ Tsaldo }

uses unDmSaldo;

procedure Tsaldo.Alterar;
begin
  if Assigned(dmSaldo) then
  dmSaldo.Alterar;
end;

procedure Tsaldo.Cancelar;
begin
  if Assigned(dmSaldo) then
  dmSaldo.Cancelar;
end;

constructor Tsaldo.Create;
begin
  try
    dmSaldo := TdmSaldo.Create(nil);
    dmSaldo.cdsSaldo.Open;
  except
    showMessage('Ocorreu um erro ao tentar criar o datamodule de Usu?rios');
  end;
end;

destructor Tsaldo.Destroy;
begin
  dmSaldo.cdsSaldo.Close;
  FreeAndNil(dmSaldo);
end;

procedure Tsaldo.Excluir;
begin
  if Assigned(dmSaldo) then
  dmSaldo.Excluir;
end;

function Tsaldo.GetCds: TClientDataSet;
begin
  Result := nil;
  if Assigned(dmSaldo) then
    Result := dmSaldo.cdsSaldo;
end;

procedure Tsaldo.GetDados;
begin
    sCodigo := dmSaldo.cdsSaldoIDSALDO.Value;
    sSaldoFinal:= dmSaldo.cdsSaldoSALDOINICIAL.Value;
    sSaldoInicial := dmSaldo.cdsSaldoSALDOFINAL.Value;
    sValorEntrada := dmSaldo.cdsSaldoENTRADA.Value;
    sValorSaida := dmSaldo.cdsSaldoSAIDA.Value;
    sData := dmSaldo.cdsSaldoDATASALDO.Text;
    sBancoId := dmSaldo.cdsSaldoBANCOID.Value;
end;

procedure Tsaldo.Incluir;
begin
  if Assigned(dmSaldo) then
  dmSaldo.Incluir;
end;

procedure Tsaldo.Salvar;
begin
  dmSaldo.cdsSaldoIDSALDO.Value := sCodigo;
  dmSaldo.cdsSaldoBANCOID.Value := sBancoId;
  dmSaldo.cdsSaldoSALDOINICIAL.Value := sSaldoInicial;
  dmSaldo.cdsSaldoSALDOFINAL.Value := sSaldoFinal;
  dmSaldo.cdsSaldoENTRADA.Value := sValorEntrada;
  dmSaldo.cdsSaldoSAIDA.Value := sValorSaida;
  dmSaldo.cdsSaldoDATASALDO.Text := sData;

  if Assigned(dmSaldo) then
    dmSaldo.Salvar;
end;

end.
