unit Contascontabeis;

interface

uses Conexao,uni,System.SysUtils,classes,Vcl.Dialogs;

type TContascontabeis = class

private

LCOD_NAT_CC :string[2];
LIND_CTA:string[1];
LNivel:string[5];
LCod_CTA:integer;
LNome_CTA:string[60];
    function GetCod_Cta: Integer;
    function GetCod_Nat_cc: string;
    function GetInd_Cta: string;
    function Getnivel: string;
    function Getnome_Cta: string;
    procedure SetCod_Cta(const Value: Integer);
    procedure SetIND_CTA(const Value: string);
    procedure Setnivel(const Value: string);
    procedure SetNome_Cta(const Value: string);
    procedure setVod_Nat_cc(const Value: string);

    var

    conect:TConexao;
    Qry:TUniQuery;

public

property Cod_NAT_CC:string read GetCod_Nat_cc write setVod_Nat_cc;
property Ind_Cta:string read GetInd_Cta write SetIND_CTA;
property Nivel:string read Getnivel write Setnivel;
property Cod_Cta:Integer read GetCod_Cta write SetCod_Cta;
property Nome_Cta:string read Getnome_Cta write SetNome_Cta;

procedure Salvar(const Conta: TContascontabeis);virtual;
procedure Excluir(Id:Integer);virtual;
procedure Editar(Const Conta:TcontasContabeis;Id:integer);virtual;
function Listar:TUniQuery;virtual;
function ListarPorId(Id:Integer):TUniQuery;virtual;
constructor Create;virtual;
function ValidarDados(Const contas:Tcontascontabeis):Boolean;virtual;



end;

implementation

{ TContascontabeis }



constructor TContascontabeis.Create;
begin
  inherited;
  Conect:= TConexao.create('Local');
  Qry:= TUniQuery.Create(nil);
  Qry.Connection:= Conect.Conexao;
end;

procedure TContascontabeis.Editar(const Conta: TcontasContabeis;Id:integer);
begin
if ValidarDados(Conta) then
begin
   Qry.SQL.Clear;
   Qry.SQL.Add('UPDATE CONTACONTABIL SET DATA=:PDATA,IND_CTA = :PIND_CTA,NIVEL=:PNIVEL, ');
   Qry.SQL.Add('NOME_CTA =:PNOME_CTA,COD_NAT_CC =:PCOD_NAT_CC WHERE ID=:PID;');

   Qry.Params.ParamByName('PDATA').AsDate:= Date();
   Qry.Params.ParamByName('PIND_CTA').AsString:= Conta.Ind_Cta;
   Qry.Params.ParamByName('PNIVEL').AsString:= Conta.Nivel;
   Qry.Params.ParamByName('PNOME_CTA').AsString:= Conta.Nome_Cta;
   Qry.Params.ParamByName('PCOD_NAT_CC').AsString:= Conta.Cod_NAT_CC;
   Qry.Params.ParamByName('PID').AsInteger:= Id;
   try
     Qry.ExecSQL;
     ShowMessage('Salvo com sucesso!');
   except
     on E: Exception do
     ShowMessage('Erro:' + E.Message );
end;

end;
end;

procedure TContascontabeis.Excluir(Id: Integer);
begin
  Qry.SQL.Clear;
  Qry.SQL.Add('DELETE FROM CONTACONTABIL WHERE ID =:pId');
  Qry.Params.ParamByName('pId').AsInteger:= Id;
  try
    Qry.ExecSQL;
    ShowMessage('Deletado com sucesso!');
  except
    on E: Exception do
    ShowMessage('Erro:' + E.Message );
  end;

end;

function TContascontabeis.GetCod_Cta: Integer;
begin
  Result:= LCod_CTA;
end;

function TContascontabeis.GetCod_Nat_cc: string;
begin
  Result:= LCOD_NAT_CC;
end;

function TContascontabeis.GetInd_Cta: string;
begin
  Result:= LIND_CTA;
end;

function TContascontabeis.Getnivel: string;
begin
  Result:=LNivel;
end;

function TContascontabeis.Getnome_Cta: string;
begin
  Result:= LNome_CTA;
end;

function TContascontabeis.Listar: TUniQuery;
begin
  Qry.SQL.Clear;
  Qry.SQL.Add('SELECT * FROM CONTACONTABIL');
  try
    Qry.Open;
    if not Qry.IsEmpty then
      Result:=Qry;
  except
    on erro:Exception do
      ShowMessage('Erro:'+erro.Message);
  end;

end;

function TContascontabeis.ListarPorId(Id: Integer):Tuniquery;
begin
  Qry.SQL.Clear;
  Qry.SQL.Add('SELECT * FROM CONTACONTABIL WHERE Id =:pId');
  Qry.Params.ParamByName('pId').AsInteger:= id;
  try
    Qry.Open;
    if not Qry.IsEmpty then
      Result:= Qry;
  except
     on Erro: Exception do
       ShowMessage('Erro: '+Erro.Message);
  end;

end;

procedure TContascontabeis.Salvar(const Conta: TContascontabeis);
begin
if ValidarDados(Conta) then
begin
   Qry.SQL.Clear;
   Qry.SQL.Add('INSERT INTO CONTACONTABIL(DATA,IND_CTA,NIVEL,NOME_CTA,COD_NAT_CC) ');
   Qry.SQL.Add('VALUES(:PDATA,:PIND_CTA,:PNIVEL,:PNOME_CTA,:PCOD_NAT_CC);');

   Qry.Params.ParamByName('PDATA').AsDate:= Date();
   Qry.Params.ParamByName('PIND_CTA').AsString:= Conta.Ind_Cta;
   Qry.Params.ParamByName('PNIVEL').AsString:= Conta.Nivel;
   Qry.Params.ParamByName('PNOME_CTA').AsString:= Conta.Nome_Cta;
   Qry.Params.ParamByName('PCOD_NAT_CC').AsString:= Conta.Cod_NAT_CC;
   try
     Qry.ExecSQL;
     ShowMessage('Salvo com sucesso!');
   except
     on E: Exception do
     ShowMessage('Erro:' + E.Message );
end;
end;
end;

procedure TContascontabeis.SetCod_Cta(const Value: Integer);
begin
  LCod_CTA:=Value;
end;

procedure TContascontabeis.SetIND_CTA(const Value: string);
begin
  LIND_CTA:=Value;
end;

procedure TContascontabeis.Setnivel(const Value: string);
begin
  LNivel:=Value;
end;

procedure TContascontabeis.SetNome_Cta(const Value: string);
begin
  LNome_CTA:=Value;
end;

procedure TContascontabeis.setVod_Nat_cc(const Value: string);
begin
  LCOD_NAT_CC:=Value;
end;

function TContascontabeis.ValidarDados(const contas: Tcontascontabeis): Boolean;
begin
  if contas.Nome_Cta = '' then
    begin
      raise Exception.Create('Preencha o nome');
      Exit;
    end;
  if contas.Nivel = '' then
   begin
      raise Exception.Create('Error Preencha o n�vel');
      exit
   end;

   Result:= True;
end;

end.
