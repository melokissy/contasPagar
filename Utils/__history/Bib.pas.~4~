unit Bib;

interface

uses System.SysUtils;

function Criptografar(wStri: String): String;
function ValidaCPFUSU(CPF: string): Boolean;

implementation

function Criptografar(wStri: String): String;
var Simbolos : array [0..4] of String;
x            : Integer;
begin
  Simbolos[1]:='ABCDEFGHIJLMNOPQRSTUVXZYWK ~!@#$%^&*()';
  Simbolos[2]:= 'ÂÀ©Øû×ƒçêùÿ5Üø£úñÑªº¿®¬¼ëèïÙýÄÅÉæÆôöò»Á';
  Simbolos[3]:= 'abcdefghijlmnopqrstuvxzywk1234567890';
  Simbolos[4]:= 'áâäàåíóÇüé¾¶§÷ÎÏ-+ÌÓß¸°¨·¹³²Õµþîì¡«½';

  for x := 1 to Length(Trim(wStri)) do
  begin
    if pos(copy(wStri,x,1),Simbolos[1])>0 then
    Result := Result+copy(Simbolos[2],
        pos(copy(wStri,x,1),Simbolos[1]),1)

    else
    if pos(copy(wStri,x,1),Simbolos[2])>0 then
    Result := Result+copy(Simbolos[1],
        pos(copy(wStri,x,1),Simbolos[2]),1)

    else
    if pos(copy(wStri,x,1),Simbolos[3])>0 then
    Result := Result+copy(Simbolos[4],
        pos(copy(wStri,x,1),Simbolos[3]),1)

    else
    if pos(copy(wStri,x,1),Simbolos[4])>0 then
    Result := Result+copy(Simbolos[3],
        pos(copy(wStri,x,1),Simbolos[4]),1);
  end;
end;

function ValidaCPFUSU(CPF: string): Boolean;
var
  i: Integer;
  cpfSoNumero: String;
  cpfRepetido: Boolean;
  digito1, digito2: Integer;
begin
  result := False;
  // Limpa o que não for numero
  cpfSoNumero := '';
  for i := 1 To length(CPF) do
  begin
    Case char(CPF[i]) of
      '0' .. '9':
        cpfSoNumero := cpfSoNumero + CPF[i];
    End;
  end;

  // verifica se possui os 11 digitos
  if length(cpfSoNumero) <> 11 then
  begin
    exit;
  end;

  // testar se o cpf é repetido como 000.000.000-00
  cpfRepetido := True;
  for i := 2 to length(cpfSoNumero) do
  begin
    if cpfSoNumero[1] <> cpfSoNumero[i] then
    begin
      // se o cpf possui um digito diferente ele passou no teste
      cpfRepetido := False;
      break;
    end;
  end;
  // se o CPF é composto por numeros repetido retorna true
  if (cpfRepetido) then
  begin
    exit;
  end;

  // executa o calculo para o primeiro digito verificador
  digito1 := 0;
  for i := 1 to 9 do
  begin
    digito1 := digito1 + (StrToInt(cpfSoNumero[10 - i]) * (i + 1));
  end;
  { formula do primeiro verificador soma=1°*2+2°*3+3°*4.. até 9°*10 digito1 = 11 - soma mod 11 se digito > 10 digito1 = 0 }
  digito1 := ((11 - (digito1 mod 11)) mod 11) mod 10;
  // verifica se o 1° digito confere
  if inttostr(digito1) <> cpfSoNumero[10] then
  begin
    exit;
  end;

  // executa o calculo para o segundo digito verificador
  digito2 := 0;
  for i := 1 to 10 do
  begin
    digito2 := digito2 + (StrToInt(cpfSoNumero[11 - i]) * (i + 1));
  end;
  { formula do segundo verificador soma=1°*2+2°*3+3°*4.. até 10°*11 digito2 = 11 - soma mod 11 se digito > 10 digito2 = 0 }
  digito2 := ((11 - (digito2 mod 11)) mod 11) mod 10;
  // confere o 2° digito verificador
  if inttostr(digito2) <> cpfSoNumero[11] then
  begin
    exit;
  end;

  // se chegar até aqui o CPF é valido
  result := True;
end;

end.
