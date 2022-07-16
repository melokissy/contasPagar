unit unClasseCep;

interface

uses
System.SysUtils, System.Classes, Vcl.Dialogs, Datasnap.DBClient, Data.DB, xmldom, XMLIntf, XMLDoc;

type Tcep = class
  private

  cCodigo: integer;
  cCidade: string;
  cEstado: string;
  cLogradouro: string;
  cNumero: string;

public
  constructor Create;
  destructor Destroy;

  procedure Incluir;
  procedure Alterar;
  procedure Excluir;
  procedure Cancelar;
  procedure Salvar;
  procedure GetDados;

  function GetCEP(CEP: string):IXMLNode;
  function GetCds: TClientDataSet;

  function getCepBD(NUMEROCEP:string):string;

  property codigo: integer read cCodigo write cCodigo;
  property cidade: string read cCidade write cCidade;
  property estado: string read cEstado write cEstado;
  property logradouro: string read cLogradouro write cLogradouro;
  property numero: string read cNumero write cNumero;

end;

implementation

{ Tcep }

uses unDmCep;

procedure Tcep.Alterar;
begin
  if Assigned(dmCep) then
  dmCep.Alterar;
end;

procedure Tcep.Cancelar;
begin
  if Assigned(dmCep) then
  dmCep.Cancelar;
end;

constructor Tcep.Create;
begin
  try
    dmCep := TdmCep.Create(nil);
    dmCep.cdsCep.Open;
  except
    showMessage('Ocorreu um erro ao tentar criar o datamodule de Usu�rios');
  end;
end;

destructor Tcep.Destroy;
begin
  dmCep.cdsCep.Close;
  FreeAndNil(dmCep);
end;

procedure Tcep.Excluir;
begin
  if Assigned(dmCep) then
  dmCep.Excluir;
end;

function Tcep.GetCds: TClientDataSet;
begin
  Result := nil;
  if Assigned(dmCep) then
    Result := dmCep.cdsCep;
end;

function Tcep.GetCEP(CEP: string):IXMLNode;
var
  XMLDocument1: IXMLDocument;
  raizXML: IXMLNode;
begin
  XMLDocument1 := TXMLDocument.Create(nil);
  try
    XMLDocument1.FileName := 'https://viacep.com.br/ws/' + Trim(Cep) + '/xml/';
    XMLDocument1.Active := true;
    raizXML := XMLDocument1.DocumentElement;
    Result := raizXML;

  finally
    XMLDocument1 := nil;
  end;
end;

function Tcep.getCepBD(NUMEROCEP: string): string;
var
  logrouroBD : string;
  cidadeBD: string;
  estadoBD : string;
begin
  Result:='';
  dmCep.qryAux.sql.clear;
  dmCep.qryAux.sql.add('select * from cep where NUMEROCEP ='+QuotedStr(NUMEROCEP));
  dmCep.qryAux.Open;
  logrouroBD:= dmCep.qryAux.FieldByName('logradourocep').AsString;
  cidadeBD:= dmCep.qryAux.FieldByName('cidadecep').AsString;
  estadoBD:= dmCep.qryAux.FieldByName('estadocep').AsString;
  Result:= dmCep.qryAux.FieldByName('cidadecep').AsString;
  dmCep.qryAux.Close;
end;

procedure Tcep.GetDados;
begin
  cCodigo := dmCep.cdsCepIDCEP.Value;
  cLogradouro :=  dmCep.cdsCepLOGRADOUROCEP.Text;
  cCidade := dmCep.cdsCepCIDADECEP.Text;
  cEstado := dmCep.cdsCepESTADOCEP.Text;
  cNumero := dmCep.cdsCepNUMEROCEP.Text;
end;

procedure Tcep.Incluir;
begin
  if Assigned(dmCep) then
  dmCep.Incluir;
end;

procedure Tcep.Salvar;
begin
  dmCep.cdsCepIDCEP.Value := cCodigo;
  dmCep.cdsCepLOGRADOUROCEP.Text := cLogradouro;
  dmCep.cdsCepCIDADECEP.Text := cCidade;
  dmCep.cdsCepESTADOCEP.Text := cEstado;
  dmCep.cdsCepNUMEROCEP.Text := cNumero;

  if Assigned(dmCep) then
    dmCep.Salvar;

end;

end.
