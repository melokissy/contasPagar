unit unClasseUsuarios;

interface

uses
System.SysUtils, System.Classes, Vcl.Dialogs, Datasnap.DBClient, Data.DB;

type Tusuario = class
  private

  //atributos privados da classe
  ucodigo: integer;
  unome: string;
  ulogin: string;
  uemail: string;
  usenha: string;
  ucpf: string;
  uendereco: string;
  ucepid: integer;
  senhaCrip: string;

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
  function getId(ulogin:string):string;
  function getNome(ulogin:string):string;
  function getNomeById(usuId:integer):string;
  function getSenha(ulogin:string):string;
  function validador(uCPF:string):boolean;

  //atributos publicos da classe
  property codigo: integer read ucodigo write ucodigo;
  property nome: string read unome write unome;
  property login: string read ulogin write ulogin;
  property email: string read uemail write uemail;
  property senha: string read usenha write usenha;
  property cpf: string read ucpf write ucpf;
  property endereco: string read uendereco write uendereco;
  property cep: integer read ucepid write ucepid;

end;

implementation

{ Tusuario }

uses unDmUsuarios, Bib;

procedure Tusuario.Alterar;
begin
  if Assigned(dmUsuario) then
  dmUsuario.AlterarUsuario;
end;

procedure Tusuario.Cancelar;
begin
  if Assigned(dmUsuario) then
  dmUsuario.CancelarUsuario;
end;

constructor Tusuario.Create;
begin
  try
    dmUsuario:= TdmUsuario.Create(nil);
    dmUsuario.cdsUsuarios.Open;
  except
    showMessage('Ocorreu um erro ao tentar criar o datamodule de Usu�rios');
  end;
end;

destructor Tusuario.Destroy;
begin
  dmUsuario.cdsUsuarios.Close;
  FreeAndNil(dmUsuario);
end;

procedure Tusuario.Excluir;
begin
  if Assigned(dmUsuario) then
  dmUsuario.ExcluirUsuario;
end;

function Tusuario.GetCds: TClientDataSet;
begin
  Result := nil;
  if Assigned(dmUsuario) then
    Result := dmUsuario.cdsUsuarios;
end;

procedure Tusuario.GetDados;
begin
  ucodigo := dmUsuario.cdsUsuariosIDUSU.Value;
  unome := dmUsuario.cdsUsuariosNOMEUSU.Text;
  ulogin := dmUsuario.cdsUsuariosLOGINUSU.Text;
  uemail := dmUsuario.cdsUsuariosEMAILUSU.Text;
  usenha := dmUsuario.cdsUsuariosSENHAUSU.Text;
  ucpf := dmUsuario.cdsUsuariosCPFUSU.Text;
  uendereco := dmUsuario.cdsUsuariosENDERECOUSU.Text;
  ucepid := dmUsuario.cdsUsuariosCEPID.Value;

end;

//retorna o id atraves do login
function Tusuario.getId(ulogin: string): string;
begin
  Result:='';
  dmUsuario.qryAux.sql.clear;
  dmUsuario.qryAux.sql.add('select idusu from usuarios where loginusu ='+QuotedStr(ulogin)
        +'order by nomeusu');
  dmUsuario.qryAux.Open;
  Result:= dmUsuario.qryAux.FieldByName('idusu').AsString;
  dmUsuario.qryAux.Close;
end;

function Tusuario.getNome(ulogin: string): string;
begin
  Result:='';
  dmUsuario.qryAux.sql.clear;
  dmUsuario.qryAux.sql.add('select nomeusu from usuarios where loginusu ='+QuotedStr(ulogin)
        +'order by nomeusu');
  dmUsuario.qryAux.Open;
  Result:= dmUsuario.qryAux.FieldByName('nomeusu').AsString;
  dmUsuario.qryAux.Close;
end;

function Tusuario.getNomeById(usuId: integer): string;
begin
  Result:='';
  dmUsuario.qryAux.sql.clear;
  dmUsuario.qryAux.sql.add('select * from usuarios where idusu ='+IntToStr(usuId));
  dmUsuario.qryAux.Open;
  Result:= dmUsuario.qryAux.FieldByName('nomeusu').AsString;
  dmUsuario.qryAux.Close;
end;

function Tusuario.getSenha(ulogin: string): string;
begin
  Result:='';
  dmUsuario.qryAux.sql.clear;
  dmUsuario.qryAux.sql.add('select senhausu from usuarios where loginusu ='+QuotedStr(ulogin)
        +'order by nomeusu');
  dmUsuario.qryAux.Open;
  Result:= dmUsuario.qryAux.FieldByName('senhausu').AsString;
  dmUsuario.qryAux.Close;
end;

procedure Tusuario.Incluir;
begin
  if Assigned(dmUsuario) then
  dmUsuario.IncluirUsuario;
end;

procedure Tusuario.Salvar;
begin

  //senhaCrip := Bib.Criptografar(uSenha);

if validador(uCPF) then
  begin
  if uEmail <> '' then
    begin
      dmUsuario.cdsUsuariosIDUSU.Value:= ucodigo;
      dmUsuario.cdsUsuariosNOMEUSU.Text:= unome;
      dmUsuario.cdsUsuariosLOGINUSU.Text:= ulogin;
      dmUsuario.cdsUsuariosEMAILUSU.Text:= uemail;
      dmUsuario.cdsUsuariosSENHAUSU.Text:= senhaCrip;
      dmUsuario.cdsUsuariosCPFUSU.Text:= ucpf;
      dmUsuario.cdsUsuariosENDERECOUSU.Text:= uendereco;
      dmUsuario.cdsUsuariosCEPID.Value:= ucepid;

      if Assigned(dmUsuario) then
      dmUsuario.SalvarUsuario;
  end
  else
    begin
      ShowMessage('Email n�o informado');
      dmUsuario.CancelarUsuario;
    end;
  end

  else
  begin
    ShowMessage('CPF n�o informado ou inv�lido');
    dmUsuario.CancelarUsuario;
  end;

end;

function Tusuario.validador(uCPF: string): boolean;
begin
  Result := Bib.ValidaCPFUSU(uCPF);
end;

end.
