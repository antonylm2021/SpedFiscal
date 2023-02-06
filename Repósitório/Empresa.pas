unit Empresa;

interface

uses Participante, Conexao, System.SysUtils, classes, Vcl.Dialogs, uni;

type
  TEmpresa = class(TParticipante)

  private
  var
    Conexao: Tconexao;
    Qry: TUniQuery;
  public
    function SalvarDadosEmpresa(const EmpresaP: TParticipante): Boolean;
    function DeletarEmpresa(Id: integer): Boolean;
    function ListarEmpresa: TUniQuery;
    function VerificarExistencia(CNPJ: string): Boolean;
    function EditarEmpresa(const EmpresaP: TParticipante): Boolean;
    constructor Create;
    function DeletarDados(Tipo:string):BoolEan;
    destructor destroy;
  end;

implementation

{ TEmpresa }

constructor TEmpresa.Create;
begin
  Conexao := Tconexao.Create('Local');
  Qry := TUniQuery.Create(Nil);
  Qry.Connection := Conexao.Conexao;
end;

function TEmpresa.DeletarDados(Tipo:string): BoolEan;
begin
  Qry.SQL.Clear;
  Qry.SQL.Add('DELETE FROM '+Tipo);
  Qry.Execute;
  try
    Result:=True;
  finally

  end;

end;

function TEmpresa.DeletarEmpresa(Id: integer): Boolean;
begin
  Qry.SQL.Add('DELETE FROM EMPRESA');
  Qry.SQL.Add('WHERE id =:pid');
  Qry.Params.ParamByName('pid').AsInteger := Id;
  Qry.Open;
  try
    Result := True;
  finally
    Qry.Free;
  end;
end;

destructor TEmpresa.destroy;
begin
  Conexao.Free;
  Qry.Free;
end;

function TEmpresa.EditarEmpresa(const EmpresaP: TParticipante): Boolean;
begin
  Qry.SQL.Add
    ('UPDATE EMPRESA SET CNPJ=:pCNPJ,XNOME=:pXNOME,XLGR=:pXLGR,NRO=:pNRO,XCPL=:pXCPL,XBAIRRO=:pXBAIRRO,CMUN=:pCMUN,XMUN=:pXMUN,');
  Qry.SQL.Add
    ('UF=:pUF,CEP=:pCEP,CPAIS=:pCPAIS,XPAIS=:pXPAIS,FONE=:pFONE,INDIEDEST=:pINDIEDEST,IE=:pIE,EMAIL=:pEMAIL');
  Qry.SQL.Add(' WHERE ID=:pID');
  Qry.Params.ParamByName('pCNPJ').AsString := EmpresaP.LCNPJ;
  Qry.Params.ParamByName('pXNOME').AsString := EmpresaP.LxNome;
  Qry.Params.ParamByName('pXLGR').AsString := EmpresaP.Lxlgr;
  Qry.Params.ParamByName('pNRO').AsInteger := EmpresaP.LNro;
  Qry.Params.ParamByName('pXCPL').AsString := EmpresaP.LXcpl;
  Qry.Params.ParamByName('pXBAIRRO').AsString := EmpresaP.LxBairro;
  Qry.Params.ParamByName('pCMUN').AsInteger := EmpresaP.LCMun;
  Qry.Params.ParamByName('pXMUN').AsString := EmpresaP.LXnum;
  Qry.Params.ParamByName('pUF').AsString := EmpresaP.LUf;
  Qry.Params.ParamByName('pCEP').AsString := EmpresaP.LCep;
  Qry.Params.ParamByName('pCPAIS').AsInteger := EmpresaP.LcPais;
  Qry.Params.ParamByName('pXPAIS').AsString := EmpresaP.LXPais;
  Qry.Params.ParamByName('pFONE').AsString := EmpresaP.LFone;
  Qry.Params.ParamByName('pINDIEDEST').AsString := EmpresaP.LIndDest;
  Qry.Params.ParamByName('pIE').AsString := EmpresaP.LIe;
  Qry.Params.ParamByName('pEMAIL').AsString := EmpresaP.LEmail;
  Qry.Params.ParamByName('PId').AsInteger := EmpresaP.LId;
  try
    Qry.Execute;
    Result := True;
  finally
    Qry.Free;
  end;
end;

function TEmpresa.ListarEmpresa: TUniQuery;
begin
  Qry.SQL.Add('SELECT * FROM EMPRESA');
  Qry.Open;

  if Qry.RecordCount > 0 then
    Result := Qry
  else

end;

function TEmpresa.SalvarDadosEmpresa(const EmpresaP: TParticipante): Boolean;
begin
  Qry.SQL.Clear;
  Qry.SQL.Add
    ('INSERT INTO EMPRESA (CNPJ,XNOME,XLGR,NRO,XCPL,XBAIRRO,CMUN,XMUN,');
  Qry.SQL.Add('UF,CEP,CPAIS,XPAIS,FONE,INDIEDEST,IE,EMAIL)');
  Qry.SQL.Add
    ('VALUES(:pCNPJ,:pXNOME,:pXLGR,:pNRO,:pXCPL,:pXBAIRRO,:pCMUN,:pXMUN,:pUF,');
  Qry.SQL.Add(':pCEP,:pCPAIS,:pXPAIS,:pFONE,:pINDIEDEST,:pIE,:pEMAIL)');
  Qry.Params.ParamByName('pCNPJ').AsString := EmpresaP.LCNPJ;
  Qry.Params.ParamByName('pXNOME').AsString := EmpresaP.LxNome;
  Qry.Params.ParamByName('pXLGR').AsString := EmpresaP.Lxlgr;
  Qry.Params.ParamByName('pNRO').AsInteger := EmpresaP.LNro;
  Qry.Params.ParamByName('pXCPL').AsString := EmpresaP.LXcpl;
  Qry.Params.ParamByName('pXBAIRRO').AsString := EmpresaP.LxBairro;
  Qry.Params.ParamByName('pCMUN').AsInteger := EmpresaP.LCMun;
  Qry.Params.ParamByName('pXMUN').AsString := EmpresaP.LXnum;
  Qry.Params.ParamByName('pUF').AsString := EmpresaP.LUf;
  Qry.Params.ParamByName('pCEP').AsString := EmpresaP.LCep;
  Qry.Params.ParamByName('pCPAIS').AsInteger := EmpresaP.LcPais;
  Qry.Params.ParamByName('pXPAIS').AsString := EmpresaP.LXPais;
  Qry.Params.ParamByName('pFONE').AsString := EmpresaP.LFone;
  Qry.Params.ParamByName('pINDIEDEST').AsString := EmpresaP.LIndDest;
  Qry.Params.ParamByName('pIE').AsString := EmpresaP.LIe;
  Qry.Params.ParamByName('pEMAIL').AsString := EmpresaP.LEmail;
  try
    Qry.Execute;
    Result := True;
  finally

  end;

end;

function TEmpresa.VerificarExistencia(CNPJ: string): Boolean;
begin
  Qry.SQL.Add('SELECT * FROM EMPRESA');
  Qry.SQL.Add('WHERE CNPJ =:pCNPJ');
  Qry.Params.ParamByName('pCNPJ').AsString := CNPJ;
  Qry.Open;
  Result:= Qry.IsEmpty;
end;

end.
