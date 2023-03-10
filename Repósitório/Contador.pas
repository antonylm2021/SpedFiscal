unit Contador;

interface

uses Conexao, uni, System.SysUtils, classes, Vcl.Dialogs;

type TContador = class

private

id: integer;
nome: string;
cpf: string;
cnpj: string;
endereco: string;
crc: string;
numero: integer;
complemento: string;
bairro: string;
fone: string;
fax: string;
email: string;
codcidade: integer;
cep: string;
reg: string;
cidade: string;
envio: string;

function GetId: integer;
procedure SetId(const Value: integer);
function GetNome: string;
procedure SetNome(const Value: string);
function GetCpf: string;
procedure SetCpf(const Value: string);
function GetCnpj: string;
procedure SetCnpj(const Value: string);
function GetEndereco: string;
procedure SetEndereco(const Value: string);
function GetCrc: string;
procedure SetCrc(const Value: string);
function GetNumero: integer;
procedure SetNumero(const Value: integer);
function GetComplemento: string;
procedure SetComplemento(const Value: string);
function GetBairro: string;
procedure SetBairro(const Value: string);
function GetFone: string;
procedure SetFone(const Value: string);
function GetFax: string;
procedure SetFax(const Value: string);
function GetEmail: string;
procedure SetEmail(const Value: string);
function GetCodCidade: integer;
procedure SetCodCidade(const Value: integer);
function GetCep: string;
procedure SetCep(const Value: string);
function GetReg: string;
procedure SetReg(const Value: string);
function GetCidade: string;
procedure SetCidade(const Value: string);
function GetEnvio: string;
procedure SetEnvio(const Value: string);

var
conect : tconexao;
Qry: Tuniquery;

public

property LId: Integer read GetId write SetId;
property LNome: string read GetNome write SetNome;
property LCpf: string read GetCpf write SetCpf;
property LCnpj: string read GetCnpj write SetCnpj;
property LEndereco: string read GetEndereco write SetEndereco;
property LCrc: string read GetCrc write SetCrc;
property LNumero: integer read GetNumero write SetNumero;
property LComplemento: string read GetComplemento write SetComplemento;
property LBairro: string read GetBairro write SetBairro;
property LFone: string read GetFone write SetFone;
property LFax: string read GetFax write SetFax;
property LEamil: string read GetEmail write SetEmail;
property LCodCidade: integer read GetCodCidade write SetCodCidade;
property LCep: string read GetCep write SetCep;
property LReg: string read GetReg write SetReg;
property LCidade: string read GetCidade write SetCidade;
property LEnvio: string read GetEnvio write SetEnvio;

constructor create;
function SalvarContador(const Contador: TContador): boolean;
function Listar(Const Contador :TContador) : Boolean;
procedure Editar(Const Contador : Tcontador);
procedure Excluir(Id:integer);
function ListarContador():TUniQuery;
destructor destroy;

end;

implementation

{ TContador }

constructor TContador.create;
begin
  conect := tconexao.create('Local');
  Qry := Tuniquery.create(nil);
  Qry.Connection := conect.Conexao;
end;

destructor TContador.destroy;
begin
  conect.Free;
  Qry.Free;
end;

procedure TContador.Editar(const Contador: Tcontador);
begin
  try
      try
       qry.SQL.Clear;
       qry.SQL.Add('UPDATE CONTADOR SET NOME = :pNOME,CRC = :pCRC,CNPJ= :pCNPJ,CPF= :pCPF,'+
       'ENDERECO = :pENDERECO ,CEP = :pCEP,NUMERO = :pNUMERO,COMPLEMENTO = :pCOMPLEMENTO,BAIRRO = :pBAIRRO,'+
       'FONE = :pFONE ,FAX = :pFAX,EMAIL = :pEMAIL,CODCIDADE = :pCODCIDADE,REG = :pREG ,CIDADE = :pCIDADE,ENVIO = :pENVIO');
          qry.Params.ParamByName('pNOME').AsString := Contador.Nome;
          qry.Params.ParamByName('pCRC').AsString := Contador.CRC;
          qry.Params.ParamByName('pCNPJ').AsString := Contador.CNPJ;
          qry.Params.ParamByName('pCPF').AsString := Contador.CPF;
          qry.Params.ParamByName('pENDERECO').AsString := Contador.Endereco;
          qry.Params.ParamByName('pCEP').AsString := Contador.CEP;
          qry.Params.ParamByName('pNUMERO').AsInteger := Contador.Numero;
          qry.Params.ParamByName('pCOMPLEMENTO').AsString := Contador.Complemento;
          qry.Params.ParamByName('pBAIRRO').AsString := Contador.Bairro;
          qry.Params.ParamByName('pFONE').AsString := Contador.fone;
          qry.Params.ParamByName('pFAX').AsString := Contador.Fax;
          qry.Params.ParamByName('pEMAIL').AsString := Contador.Email;
          qry.Params.ParamByName('pCODCIDADE').AsString := IntToStr(Contador.CodCidade);
          qry.Params.ParamByName('pREG').AsString := Contador.Reg;
          qry.Params.ParamByName('pCIDADE').AsString := Contador.Cidade;
          qry.Params.ParamByName('pENVIO').AsString := Contador.Envio;
          qry.ExecSQL;
          showmessage(' Salvo com sucesso!' );

     except



     end;

  finally


  end;
end;

procedure TContador.Excluir(Id:integer);
begin
  Qry.SQL.Clear;
  Qry.SQL.Add('DELETE FROM CONTADOR WHERE ID=pid;')
end;

function TContador.GetBairro: string;
begin
Result := Bairro;
end;

function TContador.GetCep: string;
begin
Result := Cep;
end;

function TContador.GetCidade: string;
begin
Result := Cidade;
end;

function TContador.GetCnpj: string;
begin
Result := Cnpj;
end;

function TContador.GetCodCidade: integer;
begin
Result := CodCidade;
end;

function TContador.GetComplemento: string;
begin
Result := Complemento;
end;

function TContador.GetCpf: string;
begin
Result := Cpf;
end;

function TContador.GetCrc: string;
begin
Result := Crc;
end;

function TContador.GetEmail: string;
begin
Result := Email;
end;

function TContador.GetEndereco: string;
begin
Result := Endereco;
end;

function TContador.GetEnvio: string;
begin
Result := Envio;
end;

function TContador.GetFax: string;
begin
Result := Fax;
end;

function TContador.GetFone: string;
begin
Result := Fone;
end;

function TContador.GetId: integer;
begin
Result := Id;
end;

function TContador.GetNome: string;
begin
Result := Nome;
end;

function TContador.GetNumero: integer;
begin
Result := Numero;
end;

function TContador.GetReg: string;
begin
Result := Reg;
end;

function TContador.Listar(const Contador: TContador): Boolean;
begin
  try
     try
      qry.SQL.Clear;
      qry.SQL.Add('SELECT * FROM CONTADOR');
      qry.Open;

      if( not qry.IsEmpty) then
        begin
          Contador.Nome := (qry.FieldByName('NOME').AsString);
          Contador.CRC := (qry.FieldByName('CRC').AsString);
          Contador.Reg := (qry.FieldByName('REG').AsString);
          Contador.CPF :=   (qry.FieldByName('CPF').AsString);
          Contador.CNPJ := (qry.FieldByName('CNPJ').AsString);
          Contador.Endereco :=  (qry.FieldByName('ENDERECO').AsString);
          Contador.Numero := (qry.FieldByName('NUMERO').AsInteger);
          Contador.Bairro := (qry.FieldByName('BAIRRO').AsString);
          Contador.Cidade := (qry.FieldByName('CIDADE').AsString);
          Contador.CodCidade := StrToInt(qry.FieldByName('CODCIDADE').AsString);
          Contador.CEP := (qry.FieldByName('CEP').AsString);
          Contador.Complemento := (qry.FieldByName('COMPLEMENTO').AsString);
          Contador.fone := (qry.FieldByName('FONE').AsString);
          Contador.Fax := (qry.FieldByName('FAX').AsString);
          Contador.Email := (qry.FieldByName('EMAIL').AsString);
          Contador.Envio := qry.FieldByName('ENVIO').AsString;

          Result := True;

        end
        else
          begin
            Result := False;
          end;

     except

     end;

   finally


  end;
end;

function TContador.ListarContador: TUniQuery;
begin
  Qry.SQL.Clear;
  Qry.SQL.Add('SELECT * FROM CONTADOR');
  Qry.Open;
  try
    if Not Qry.IsEmpty then
      Result:= Qry
    else
      ShowMessage('n?o h? Dados na Tabela contador.');
  finally

  end;
end;

function TContador.SalvarContador(const Contador: TContador): boolean;
begin
  try
     try
       qry.SQL.Clear;
       qry.SQL.Add('INSERT INTO CONTADOR'+
       '(ID,NOME,CRC,CNPJ,CPF,ENDERECO,CEP,NUMERO,COMPLEMENTO,BAIRRO,FONE,FAX,EMAIL,CODCIDADE,REG,CIDADE,ENVIO)'
       +'VALUES(1,:pNOME,:pCRC,:pCNPJ,:pCPF,:pENDERECO,:pCEP,:pNUMERO,:pCOMPLEMENTO,:pBAIRRO,:pFONE,:pFAX,:pEMAIL,:pCODCIDADE,:pREG,:pCIDADE,:pENVIO)');
       qry.Params.ParamByName('pNOME').AsString := Contador.Nome;
       qry.Params.ParamByName('pCRC').AsString := Contador.CRC;
       qry.Params.ParamByName('pCNPJ').AsString := Contador.CNPJ;
       qry.Params.ParamByName('pCPF').AsString := Contador.CPF;
       qry.Params.ParamByName('pENDERECO').AsString := Contador.Endereco;
       qry.Params.ParamByName('pCEP').AsString := Contador.CEP;
       qry.Params.ParamByName('pNUMERO').AsInteger := (Contador.Numero);
       qry.Params.ParamByName('pCOMPLEMENTO').AsString := Contador.Complemento;
       qry.Params.ParamByName('pBAIRRO').AsString := Contador.Bairro;
       qry.Params.ParamByName('pFONE').AsString := Contador.fone;
       qry.Params.ParamByName('pFAX').AsString := Contador.Fax;
       qry.Params.ParamByName('pEMAIL').AsString := Contador.Email;
       qry.Params.ParamByName('pCODCIDADE').AsInteger := (Contador.CodCidade);
       qry.Params.ParamByName('pREG').AsString := Contador.Reg;
       qry.Params.ParamByName('pCIDADE').AsString := Contador.Cidade;
       qry.Params.ParamByName('pENVIO').AsString := Contador.Envio;
       qry.ExecSQL;

       showmessage(' Salvo com sucesso!' );
     except

     end;

  finally

  end;
end;

procedure TContador.SetBairro(const Value: string);
begin
Bairro:= Value;
end;

procedure TContador.SetCep(const Value: string);
begin
Cep:= Value;
end;

procedure TContador.SetCidade(const Value: string);
begin
Cidade:= Value;
end;

procedure TContador.SetCnpj(const Value: string);
begin
Cnpj:= Value;
end;

procedure TContador.SetCodCidade(const Value: integer);
begin
CodCidade:= Value;
end;

procedure TContador.SetComplemento(const Value: string);
begin
Complemento:= Value;
end;

procedure TContador.SetCpf(const Value: string);
begin
Cpf:= Value;
end;

procedure TContador.SetCrc(const Value: string);
begin
Crc:= Value;
end;

procedure TContador.SetEmail(const Value: string);
begin
Email:= Value;
end;

procedure TContador.SetEndereco(const Value: string);
begin
Endereco:= Value;
end;

procedure TContador.SetEnvio(const Value: string);
begin
Envio:= Value;
end;

procedure TContador.SetFax(const Value: string);
begin
Fax:= Value;
end;

procedure TContador.SetFone(const Value: string);
begin
Fone:= Value;
end;

procedure TContador.SetId(const Value: integer);
begin
Id:= Value;
end;

procedure TContador.SetNome(const Value: string);
begin
Nome:= Value;
end;

procedure TContador.SetNumero(const Value: integer);
begin
Numero:= Value;
end;

procedure TContador.SetReg(const Value: string);
begin
Reg:= Value;
end;

end.
