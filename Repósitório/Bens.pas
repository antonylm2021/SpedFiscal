unit Bens;

interface

uses Conexao,Uni,System.SysUtils,Contascontabeis,classes,Vcl.Dialogs;

type TBens = class(TContascontabeis)

private
var
Qry: TUniQuery;
Conect:TConexao;
LNr_parc:string;
LCod_prnc:string;
LDescricao:string;
LParcela:string;
LPatrimonio:string;
    function Getnrcta: string;
    function GetPrnc: string;
    procedure SetNrcta(const Value: string);
    procedure SetPrnc(const Value: string);
    function GetDescricao: string;
    procedure SetDescricao(const Value: string);
    function GetParcela: string;
    procedure SetParcela(const Value: string);
    procedure SetPatrimonio(const Value: string);
    function GetPAtrimonio: string;
public
property Nr_Cta:string read Getnrcta write SetNrcta;
property Cod_prnc:string read GetPrnc write SetPrnc;
property Descricao:string read GetDescricao write SetDescricao;
property Parcela:string read GetParcela write SetParcela;
property Patrimonio:string read GetPAtrimonio write SetPatrimonio;
constructor create;
procedure Salvarb(const Conta: TBens);
procedure Excluirb(Id:Integer);
procedure Editarb(Const Conta:TBens;Id:integer);
function Listarb:TUniQuery;
function ListarPorIdb(Id:Integer):TUniQuery;
function ValidarDadosb(Const contas:TBens):Boolean;
end;

implementation

{ TBens }

constructor TBens.create;
begin
  Conect:= TConexao.create('Local');
  Qry:= TUniQuery.Create(nil);
  Qry.Connection:= Conect.Conexao;
end;

procedure TBens.Editarb(const Conta: TBens; Id: integer);
begin
 if ValidarDadosb(Conta) then
  begin
  inherited;
  Qry.SQL.Clear;
  Qry.SQL.Add('UPDATE BENS SET COD_IND_BEM =:PCOD_IND_BEM,IDENT_MERC =:PIDENT_MERC,');
  Qry.SQL.Add('DESCR_ITEM =:PDESCR_ITEM,COD_PRNC =:PCOD_PRNC,COD_CTA =:PCOD_CTA,NR_PARC=:PNR_PARC WHERE ID=:PID');
  Qry.Params.ParamByName('PCOD_IND_BEM').AsString := Conta.Patrimonio;
  Qry.Params.ParamByName('PIDENT_MERC').AsString := Conta.Ind_Cta;
  Qry.Params.ParamByName('PDESCR_ITEM').AsString:= Conta.Descricao;
  Qry.Params.ParamByName('PCOD_PRNC').AsString:= Conta.Cod_prnc;
  Qry.Params.ParamByName('PCOD_CTA').AsString:= Conta.Cod_NAT_CC;
  Qry.Params.ParamByName('PNR_PARC').AsString:= Conta.Parcela;
  Qry.Params.ParamByName('PID').AsInteger:= Id;

  try
    Qry.ExecSQL;
    ShowMessage('Salvo com sucesso!');
  except
    on Erro: Exception do
      ShowMessage('Erro: '+Erro.Message);
  end;
  end;
end;

procedure TBens.Excluirb(Id: Integer);
begin
  inherited;
  Qry.SQL.Clear;
  Qry.SQL.Add('DELETE FROM BENS WHERE ID=:PID');
  Qry.Params.ParamByName('PID').AsInteger:= Id;
  try
    Qry.ExecSQL;
    ShowMessage('Deletado com sucesso!');
  except
    on Erro: Exception do
    ShowMessage('Erro: '+Erro.Message);
  end;
end;

function TBens.GetDescricao: string;
begin
  Result:= LDescricao;
end;

function TBens.Getnrcta: string;
begin
  Result:= LNr_parc;
end;

function TBens.GetParcela: string;
begin
  Result:= LParcela;
end;

function TBens.GetPAtrimonio: string;
begin
  Result:= LPatrimonio;
end;

function TBens.GetPrnc: string;
begin
  Result:= LCod_prnc;
end;

function TBens.Listarb: TUniQuery;
begin
   Qry.SQL.Clear;
   Qry.SQL.Add('SELECT * FROM BENS');
   try
     Qry.Open;
     Result:= Qry;
   except
     on Erro: Exception do
     ShowMessage('Erro: '+Erro.Message );

   end;
end;

function TBens.ListarPorIdb(Id: Integer): TUniQuery;
begin
   Qry.SQL.Clear;
   Qry.SQL.Add('SELECT * FROM BENS WHERE ID= :PID');
     Qry.Params.ParamByName('PID').AsInteger:= Id;
   try
     Qry.Open;
     Result:= Qry;
   except
     on Erro: Exception do
     ShowMessage('Erro: '+Erro.Message );

   end;
end;

procedure TBens.Salvarb(const Conta: TBens);
begin
  inherited;
  if ValidarDadosb(Conta) then
  begin
  Qry.SQL.Clear;
  Qry.SQL.Add('INSERT INTO BENS (COD_IND_BEM,IDENT_MERC,DESCR_ITEM,COD_PRNC,COD_CTA,NR_PARC)');
  Qry.SQL.Add(' VALUES(:PCOD_IND_BEM,:PIDENT_MERC,:PDESCR_ITEM,:PCOD_PRNC,:PCOD_CTA,:PNR_PARC);');
  Qry.Params.ParamByName('PCOD_IND_BEM').AsString := Conta.Patrimonio;
  Qry.Params.ParamByName('PIDENT_MERC').AsString := Conta.Ind_Cta;
  Qry.Params.ParamByName('PDESCR_ITEM').AsString:= Conta.Descricao;
  Qry.Params.ParamByName('PCOD_PRNC').AsString:= Conta.Cod_prnc;
  Qry.Params.ParamByName('PCOD_CTA').AsString:= Conta.Cod_NAT_CC;
  Qry.Params.ParamByName('PNR_PARC').AsString:= Conta.Parcela;

  try
    Qry.ExecSQL;
    ShowMessage('Salvo com sucesso!');
  except
    on Erro: Exception do
      ShowMessage('Erro: '+Erro.Message);
  end;
end;
end;

procedure TBens.SetDescricao(const Value: string);
begin
  LDescricao:= Value;
end;

procedure TBens.SetNrcta(const Value: string);
begin
  LNr_parc:= Value;
end;

procedure TBens.SetParcela(const Value: string);
begin
  LParcela:= Value;
end;

procedure TBens.SetPatrimonio(const Value: string);
begin
  LPatrimonio:= Value;
end;

procedure TBens.SetPrnc(const Value: string);
begin
  LCod_prnc:= Value;
end;

function TBens.ValidarDadosb(const contas: TBens): Boolean;
begin
  inherited;
  if contas.Cod_NAT_CC= '' then
  begin
    raise Exception.Create('Selecione a Conta cont�bil.');
    Exit;
  end;
  if contas.Ind_Cta = '' then
  begin
    raise Exception.Create('Preencha o indicador da mercadoria.');
    Exit;
  end ;

  if contas.Descricao = '' then
  begin
    raise Exception.Create('Preencha a descri��o da mercadoria.');
    Exit;
  end;

  if contas.Parcela = '' then
    begin
    raise Exception.Create('Preencha a quantidade de parcelas.');
    Exit;
  end;

   if contas.Cod_NAT_CC = '' then
  begin
    raise Exception.Create('Preencha o c�digo do patrim�nio.');
    Exit;
  end;

  Result:= True;

end;

end.
