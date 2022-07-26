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

  procedure descontaSaldo(bancoId: string; valorTit: double);
 // procedure somaSaldo(bancoId: string; valorTit: double);

  function GetCds: TClientDataSet;
  function getSaldo(bancoId: string): string;

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

procedure Tsaldo.descontaSaldo(bancoId: string; valorTit: double);
var
  saldoAtualizado: double;
  saldoIni : double;
begin
  saldoIni := StrToFloat(getSaldo(bancoId));
  saldoAtualizado := saldoIni - valorTit;

  dmSaldo.Incluir;

  dmSaldo.cdsSaldoIDSALDO.Value := 10;
  dmSaldo.cdsSaldoSALDOINICIAL.Value := saldoIni;
  dmSaldo.cdsSaldoBANCOID.Value := StrToInt(bancoId);
  dmSaldo.cdsSaldoSALDOFINAL.Value := saldoAtualizado;
  dmSaldo.cdsSaldoENTRADA.Value := 0;
  dmSaldo.cdsSaldoSAIDA.Value := valorTit;
  dmSaldo.cdsSaldoDATASALDO.Text := DateToStr(Date());

  if Assigned(dmSaldo) then
    dmSaldo.Salvar;

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
    showMessage('Ocorreu um erro ao tentar criar o datamodule de Usuários');
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
    sSaldoFinal:= dmSaldo.cdsSaldoSALDOFINAL.Value;
    sSaldoInicial := dmSaldo.cdsSaldoSALDOINICIAL.Value;
    sValorEntrada := dmSaldo.cdsSaldoENTRADA.Value;
    sValorSaida := dmSaldo.cdsSaldoSAIDA.Value;
    sData := dmSaldo.cdsSaldoDATASALDO.Text;
    sBancoId := dmSaldo.cdsSaldoBANCOID.Value;
end;

function Tsaldo.getSaldo(bancoId: string): string;
begin
  Result:='';
  dmSaldo.qryAux.sql.clear;
  dmSaldo.qryAux.sql.add('select SALDOFINAL from saldo where idsaldo = (select max(idsaldo) from saldo) and bancoid='+QuotedStr(bancoId));
  dmSaldo.qryAux.Open;
  Result:= dmSaldo.qryAux.FieldByName('SALDOFINAL').AsString;
  dmSaldo.qryAux.Close;
end;

procedure Tsaldo.Incluir;
begin
  if Assigned(dmSaldo) then
    dmSaldo.Incluir;
end;

procedure Tsaldo.Salvar;
begin
  dmSaldo.cdsSaldoIDSALDO.Value := sCodigo;
  dmSaldo.cdsSaldoSALDOINICIAL.Value := sSaldoInicial;
  dmSaldo.cdsSaldoSALDOFINAL.Value := sSaldoFinal;
  dmSaldo.cdsSaldoENTRADA.Value := sValorEntrada;
  dmSaldo.cdsSaldoSAIDA.Value := sValorSaida;
  dmSaldo.cdsSaldoDATASALDO.Text := DateToStr(Date());

  if Assigned(dmSaldo) then
    dmSaldo.Salvar;
end;

end.
