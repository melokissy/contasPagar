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
    //mmResultado.Clear;
    XMLDocument1.FileName := 'https://viacep.com.br/ws/' + Trim(Cep) + '/xml/';
    XMLDocument1.Active := true;
    //mmResultado.Lines.Text := XMLDocument1.XML.Text;

    raizXML := XMLDocument1.DocumentElement;
    Result := raizXML;

    //edtLogradouro.Text := raizXML.ChildNodes.FindNode('logradouro').Text;
    //edtBairro.Text :=  raizXML.ChildNodes.FindNode('bairro').Text;
    //edtLocalidade.Text := raizXML.ChildNodes.FindNode('localidade').Text;
    //edtUF.Text := raizXML.ChildNodes.FindNode('uf').Text;
    //edtIBGE.Text := raizXML.ChildNodes.FindNode('ibge').Text;

    {
    mmResultado.Lines.Add('Logradouro: ' + raizXML.ChildNodes.FindNode('logradouro').Text);
    mmResultado.Lines.Add('Bairro: ' + raizXML.ChildNodes.FindNode('bairro').Text);
    mmResultado.Lines.Add('Localidade: ' + raizXML.ChildNodes.FindNode('localidade').Text);
    mmResultado.Lines.Add('UF: ' + raizXML.ChildNodes.FindNode('uf').Text);
    mmResultado.Lines.Add('IBGE: ' + raizXML.ChildNodes.FindNode('ibge').Text);
    }

  finally
    XMLDocument1 := nil;
  end;
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
