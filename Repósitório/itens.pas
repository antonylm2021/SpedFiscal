unit itens;

interface

uses Conexao, uni, System.SysUtils, classes, Vcl.Dialogs;

type TItens = class

private

Id: integer;
Cprod: string;
Cean: string;
Xprod: string;
Ncm: string;
Cbenef: string;
Cfop: currency;
Ucom: string;
Qcom: currency;
Vuncom: currency;
Vprod: currency;
Ceantrib: string;
Utrib: string;
Qtrib: currency;
Vuntrib: currency;
Indtot: currency;
Orig: currency;
Cst: currency;
Modbc: currency;
Vbc: currency;
Picms: currency;
Vicms: currency;
Vbcfcp: currency;
Pfcp: currency;
Vfcp: currency;
Modbcst: currency;
Pmvast: currency;
Vbcst: currency;
Picmsst: currency;
Vicmsst: currency;
Vbcfcpst: currency;
Pfcpst: currency;
Vfcpst: currency;
Vicmsdeson: currency;
Motdesicms: currency;
Cstpis: currency;
Vbcpis: currency;
Ppis: currency;
Vpis: currency;
Cstcofins: currency;
Vbccofins: currency;
Pcofins: currency;
Vcofins: currency;
Cstipi: currency;
Vbcipi: currency;
Pipi: currency;
Vipi: currency;
Vbcstret: currency;
Pst: currency;
Vicmssubstituto: currency;
Vicmsstret: currency;
Vbcfcpstret: currency;
Pfcpstret: currency;
Vfcpstret: currency;
QUnid: currency;
VUnid: currency;
Clenq: currency;
CnpjProd: string;
CSelo: string;
QSelo: currency;
Cenq: currency;
ValiqProdCofins: currency;
QbcProdCofins: currency;
ValiqProdPis: currency;
QbcProdPis: currency;
MotdesIcmsSt: currency;
cest: string;



function GetId: integer;
procedure SetId(const Value: integer);
function GetCprod: string;
procedure SetCprod(const Value: string);
function GetCean: string;
procedure SetCean(const Value: string);
function GetXprod: string;
procedure SetXprod(const Value: string);
function GetNcm: string;
procedure SetNcm(const Value: string);
function GetCbenef: string;
procedure SetCbenef(const Value: string);
function GetCfop: currency;
procedure SetCfop(const Value: currency);
function GetUcom: string;
procedure SetUcom(const Value: string);
function GetQcom: currency;
procedure SetQcom(const Value: currency);
function GetVuncom: currency;
procedure SetVuncom(const Value: currency);
function GetVprod: currency;
procedure SetVprod(const Value: currency);
function GetCeantrib: string;
procedure SetCeantrib(const Value: string);
function GetUtrib: string;
procedure SetUtrib(const Value: string);
function GetQtrib: currency;
procedure SetQtrib(const Value: currency);
function GetVuntrib: currency;
procedure SetVuntrib(const Value: currency);
function GetIndtot: currency;
procedure SetIndtot(const Value: currency);
function GetOrig: currency;
procedure SetOrig(const Value: currency);
function GetCst: currency;
procedure SetCst(const Value: currency);
function GetModBc: currency;
procedure SetModBc(const Value: currency);
function GetVBc: currency;
procedure SetVBc(const Value: currency);
function GetPIcms: currency;
procedure SetPIcms(const Value: currency);
function GetVIcms: currency;
procedure SetVIcms(const Value: currency);
function GetVBcfcp: currency;
procedure SetVBcfcp(const Value: currency);
function GetPFcp: currency;
procedure SetPFcp(const Value: currency);
function GetVFcp: currency;
procedure SetVFcp(const Value: currency);
function GetModBcSt: currency;
procedure SetModBcSt(const Value: currency);
function GetPmVast: currency;
procedure SetPmVast(const Value: currency);
function GetVBcsT: currency;
procedure SetVBcsT(const Value: currency);
function GetPIcmsSt: currency;
procedure SetPIcmsSt(const Value: currency);
function GetVIcmsSt: currency;
procedure SetVIcmsSt(const Value: currency);
function GetVBcFcpSt: currency;
procedure SetVBcFcpSt(const Value: currency);
function GetPFcpSt: currency;
procedure SetPFcpSt(const Value: currency);
function GetVFcpSt: currency;
procedure SetVFcpSt(const Value: currency);
function GetVIcmsdeson: currency;
procedure SetVIcmsdeson(const Value: currency);
function GetMotDesIcms: currency;
procedure SetMotDesIcms(const Value: currency);
function GetCstPis: currency;
procedure SetCstPis(const Value: currency);
function GetVBcPis: currency;
procedure SetVBcPis(const Value: currency);
function GetPPis: currency;
procedure SetPPis(const Value: currency);
function GetVPis: currency;
procedure SetVPis(const Value: currency);
function GetCstCofins: currency;
procedure SetCstCofins(const Value: currency);
function GetVBcCofins: currency;
procedure SetVBcCofins(const Value: currency);
function GetPCofins: currency;
procedure SetPCofins(const Value: currency);
function GetVCofins: currency;
procedure SetVCofins(const Value: currency);
function GetCstIpi: currency;
procedure SetCstIpi(const Value: currency);
function GetVBcIpi: currency;
procedure SetVBcIpi(const Value: currency);
function GetPipi: currency;
procedure SetPipi(const Value: currency);
function GetVIpi: currency;
procedure SetVIpi(const Value: currency);
function GetVBcStret: currency;
procedure SetVBcStret(const Value: currency);
function GetPSt: currency;
procedure SetPSt(const Value: currency);
function GetVIcmsSubstituto: currency;
procedure SetVIcmsSubstituto(const Value: currency);
function GetVicmsStret: currency;
procedure SetVicmsStret(const Value: currency);
function GetVBcFcpStret: currency;
procedure SetVBcFcpStret(const Value: currency);
function GetPFcpStret: currency;
procedure SetPFcpStret(const Value: currency);
function GetVFcpStret: currency;
procedure SetVFcpStret(const Value: currency);
function GetQUnid: currency;
procedure SetQUnid(const Value: currency);
function GetVUnid: currency;
procedure SetVUnid(const Value: currency);
function GetClenq: currency;
procedure SetClenq(const Value: currency);
function GetCnpjProd: string;
procedure SetCnpjProd(const Value: string);
function GetCSelo: string;
procedure SetCSelo(const Value: string);
function GetQSelo: currency;
procedure SetQSelo(const Value: currency);
function GetCenq: currency;
procedure SetCenq(const Value: currency);
function GetValiqProdCofins: currency;
procedure SetValiqProdCofins(const Value: currency);
function GetQbcProdCofins: currency;
procedure SetQbcProdCofins(const Value: currency);
function GetValiqProdPis: currency;
procedure SetValiqProdPis(const Value: currency);
function GetQbcProdPis: currency;
procedure SetQbcProdPis(const Value: currency);
function GetMotdesIcmsSt: currency;
procedure SetMotdesIcmsSt(const Value: currency);
function GetCest: string;
procedure SetCest(const Value: string);

var
conect : tconexao;
Qry: Tuniquery;

public

property LId: Integer read GetId write SetId;
property LCprod: string read GetCprod write SetCprod;
property LCean: string read GetCean write SetCean;
property LXProd: string read GetXProd write SetXProd;
property LNcm: string read GetNcm write SetNcm;
property LCbeNef: string read GetCbeNef write SetCbeNef;
property LCfop: currency read GetCfop write SetCfop;
property LUCom: string read GetUCom write SetUCom;
property LQCom: currency read QCom write SetQCom;
property LVunCom: currency read GetVunCom write SetVunCom;
property LVProd: currency read GetVProd write SetVProd;
property LCeanTrib: string read GetCeanTrib write SetCeanTrib;
property LUTrib: string read GetUTrib write SetUTrib;
property LQTrib: currency read GetQTrib write SetQTrib;
property LVunTrib: currency read GetVunTrib write SetVunTrib;
property LIndTot: currency read GetIndTot write SetIndTot;
property LOrig: currency read GetOrig write SetOrig;
property LCst: currency read GetCst write SetCst;
property LModBc: currency read GetModBc write SetModBc;
property LVBc: currency read GetVBc write SetVBc;
property LPIcms: currency read GetPIcms write SetPIcms;
property LVIcms: currency read GetVIcms write SetVIcms;
property LVbcfcp: currency read GetVbcfcp write SetVbcfcp;
property LPFcp: currency read GetPFcp write SetPFcp;
property LVfcp: currency read GetVfcp write SetVfcp;
property LModBcSt: currency read GetModBcSt write SetModBcSt;
property LPmVast: currency read GetPmVast write SetPmVast;
property LVBcSt: currency read GetVBcSt write SetVBcSt;
property LPIcmsSt: currency read GetPIcmsSt write SetPIcmsSt;
property LVIcmsSt: currency read GetVIcmsSt write SetVIcmsSt;
property LVBcfcpSt: currency read GetVBcfcpSt write SetVBcfcpSt;
property LPFcpSt: currency read GetPFcpSt write SetPFcpSt;
property LVFcpSt: currency read GetVFcpSt write SetVFcpSt;
property LVIcmsdeson: currency read GetVIcmsdeson write SetVIcmsdeson;
property LMotDesIcms: currency read GetMotDesIcms write SetMotDesIcms;
property LCstPis: currency read GetCstPis write SetCstPis;
property LVbcPis: currency read GetVbcPis write SetVbcPis;
property LPpis: currency read GetPpis write SetPpis;
property LVpis: currency read GetVpis write SetVpis;
property LCstCofins: currency read GetCstCofins write SetCstCofins;
property LVbCofins: currency read GetVbcCofins write SetVbcCofins;
property LPCofins: currency read GetPCofins write SetPCofins;
property LVCofins: currency read GetVCofins write SetVCofins;
property LCstIpi: currency read GetCstIpi write SetCstIpi;
property LVbcIpi: currency read GetVbcIpi write SetVbcIpi;
property LPipi: currency read GetPipi write SetPipi;
property LVIpi: currency read GetVIpi write SetVIpi;
property LVBcStret: currency read GetVBcStret write SetVBcStret;
property LPSt: currency read GetPSt write SetPSt;
property LVIcmsSubstituto: currency read GetVIcmsSubstituto write SetVIcmsSubstituto;
property LVIcmsStret: currency read GetVIcmsStret write SetVIcmsStret;
property LVBcfcpStret: currency read GetVBcfcpStret write SetVBcfcpStret;
property LPFcpStret: currency read GetPFcpStret write SetPFcpStret;
property LVFcpStret: currency read GetVFcpStret write SetVFcpStret;
property LQUnid: currency read GetQUnid write SetQUnid;
property LVUnid: currency read GetVUnid write SetVUnid;
property LClenq: currency read GetClenq write SetClenq;
property LCnpjProd: string read GetCnpjProd write SetCnpjProd;
property LCSelo: string read GetCSelo write SetCSelo;
property LQSelo: currency read GetQSelo write SetQSelo;
property LCenq: currency read GetCenq write SetCenq;
property LValiqProdCofins: currency read GetValiqProdCofins write SetValiqProdCofins;
property LQbcProdCofins: currency read GetQbcProdCofins write SetQbcProdCofins;
property LValiqProdPis: currency read GetValiqProdPis write SetValiqProdPis;
property LQbcProdPis: currency read GetQbcProdPis write SetQbcProdPis;
property LMotdesIcmsSt: currency read GetMotdesIcmsSt write SetMotdesIcmsSt;
property LCest: string read GetCest write SetCest;

constructor create;
function SalvarItens(const Itens: TItens;Idnota:integer;Tipo:string): boolean;
function Listar(Id:integer;Tipo:string) : TUniQuery;
function Editar(Const Itens: TItens):boolean;
destructor destroy;
function ListaUnidadeDeMedida:TUniQuery;
function ListaProdutosPorPeriodo:TUniQuery;


end;



implementation


{ TItens }

constructor TItens.create;
begin
  conect := tconexao.create('Local');
  Qry := Tuniquery.create(nil);
  Qry.Connection := conect.Conexao;
end;

destructor TItens.destroy;
begin
  conect.Free;
  Qry.Free;
end;

function TItens.Editar(const Itens: TItens):boolean;
begin
  try
    try
      qry.SQL.Clear;
      qry.SQL.Add('UPDATE ITENS SET CPROD = :pCPROD,CEAN = :pCEAN,XPROD = :pXPROD,NCM'+
      '= :pNCM,CEBNEF = :pCEBNEF,CFOP = :pCFOP,UCOM = :pUCOM,QCOM = :pQCOM,VUNCOM'+
      '= :pVUNCOM,VPROD = :pVPROD,CEANTRIB = :pCEANTRIB,UTRIB = :pUTRIB,QTRIB'+
      '= :pQTRIB,VUNTRIB = :pVUNTRIB,INDTOT = :pINDTOT,ORIG = :pORIG,CST = :pCST,MODBC'+
      '= :pMODBC,VBC = :pVBC,PICMS = :PICMS,VCIMS :pVICMS,VBCFCP = :pVBCFCP,PFCP'+
      '= :pPFCP,VFCP = :pFCP,MODBCST = :pMODBCST,PMVAST = :pPMVAST,VBCST = VBCST,PICMSST'+
      '= :pPICMSST,VICMSST = :pVICMSST,VBCFCPST = :pVBCFCPST,PFCPST = :pPFCPST,VFCPST'+
      '= :pVFPCST,VICMSDESON = :pVICMSDESOM,MOTDESICMS = :pMOTDESCIMS,CSTPIS'+
      '= :pCSTPIS,VBCPIS = :pVBCPIS,PPIS = :pPPIS,VPIS = :pVPIS,CSTCOFINS = :pCSTCOFINS,VBCCOFINS'+
      '= :pVBCCOFINS,PCOFINS = :pPCOFINS,VCOFINS = :pVCOFINS,CSTIPI = :pCSTIPI,VBCIPI'+
      '= :pVBCIPI,PIPI = :pPIPI,VIPI = :pVIPI,VBCSTRET,PST = :pPST,VICMSSUBSTITUTO'+
      '= :pVICMSSUBSTITUTO,VICMSSTRET = :pVICMSSTRET,VBCFCPSTRET = :pVBCFCPSTRET,PFCPSTRET'+
      '= :pPFCPSTRET,VFCPSTRET = :pVFCPSTRET,QUNID = :pQUNID,VUNID :pVUNID,CLENQ'+
      '= :pCLENQ,CNPJPROD = :pCNPJPROD,CSELO = :pCSELO,QSELO = :pQSELO,CENQ = :pCENQ,VALIQPRODCOFINS'+
      '= :pVALIQPRODCOFINS,QBCPRODCOFINS = :pQBCPRODCOFINS,VALIQPRODPIS'+
      '= :pVALIQPRODPIS,MOTDESICMSST = :pMOTDESCIMSST,CEST = :pCEST');

          qry.Params.ParamByName('pCPROD').AsString := itens.cprod;
          qry.Params.ParamByName('pCEAN').AsString := itens.cean;
          qry.Params.ParamByName('pXPROD').AsString := itens.xprod;
          qry.Params.ParamByName('pNCM').AsString := itens.ncm;
          qry.Params.ParamByName('pCBENEF').AsString := itens.cbenef;
          qry.Params.ParamByName('pCEST').AsString := itens.cest;
          qry.Params.ParamByName('pUCOM').AsString := itens.ucom;
          qry.Params.ParamByName('pCSELO').AsString := itens.cselo;
          qry.Params.ParamByName('pCFOP').AsCurrency := itens.cfop;
          qry.Params.ParamByName('pQCOM').AsCurrency := itens.qcom;
          qry.Params.ParamByName('pVUNCOM').AsCurrency := itens.vuncom;
          qry.Params.ParamByName('pVPROD').AsCurrency := itens.vprod;
          qry.Params.ParamByName('pCEANTRIB').AsString := itens.ceantrib;
          qry.Params.ParamByName('pUTRIB').AsString := itens.utrib;
          qry.Params.ParamByName('pQTRIB').AsCurrency := itens.qtrib;
          qry.Params.ParamByName('pVUNTRIB').AsCurrency := itens.vuntrib;
          qry.Params.ParamByName('pINDTOT').AsCurrency := itens.indtot;
          qry.Params.ParamByName('pORIG').AsCurrency := itens.orig;
          qry.Params.ParamByName('pCST').AsCurrency := itens.cst;
          qry.Params.ParamByName('pMODBC').AsCurrency := itens.modbc;
          qry.Params.ParamByName('pVBC').AsCurrency := itens.vbc;
          qry.Params.ParamByName('pPICMS').AsCurrency := itens.picms;
          qry.Params.ParamByName('pVICMS').AsCurrency := itens.vicms;
          qry.Params.ParamByName('pVBCFCP').AsCurrency := itens.vbcfcp;
          qry.Params.ParamByName('pPFCP').AsCurrency := itens.pfcp;
          qry.Params.ParamByName('pVFCP').AsCurrency := itens.vfcp;
          qry.Params.ParamByName('pMODBCST').AsCurrency := itens.modbcst;
          qry.Params.ParamByName('pPMVAST').AsCurrency := itens.pmvast;
          qry.Params.ParamByName('pVBCST').AsCurrency := itens.vbcst;
          qry.Params.ParamByName('pPICMSST').AsCurrency := itens.picmsst;
          qry.Params.ParamByName('pVICMSST').AsCurrency := itens.vicmsst;
          qry.Params.ParamByName('pVBCFCPST').AsCurrency := itens.vbcfcpst;
          qry.Params.ParamByName('pPFCPST').AsCurrency := itens.pfcpst;
          qry.Params.ParamByName('pVFCPST').AsCurrency := itens.vfcpst;
          qry.Params.ParamByName('pVICMSDESON').AsCurrency := itens.vicmsdeson;
          qry.Params.ParamByName('pMOTDESICMS').AsCurrency := itens.motdesicms;
          qry.Params.ParamByName('pCSTPIS').AsCurrency := itens.cstpis;
          qry.Params.ParamByName('pVBCPIS').AsCurrency := itens.vbcpis;
          qry.Params.ParamByName('pPPIS').AsCurrency := itens.ppis;
          qry.Params.ParamByName('pVPIS').AsCurrency := itens.vpis;
          qry.Params.ParamByName('pCSTCOFINS').AsCurrency := itens.cstcofins;
          qry.Params.ParamByName('pVBCCOFINS').AsCurrency := itens.vbccofins;
          qry.Params.ParamByName('pPCOFINS').AsCurrency := itens.pcofins;
          qry.Params.ParamByName('pVCOFINS').AsCurrency := itens.vcofins;
          qry.Params.ParamByName('pCSTIPI').AsCurrency := itens.cstipi;
          qry.Params.ParamByName('pVBCIPI').AsCurrency := itens.vbcipi;
          qry.Params.ParamByName('pPIPI').AsCurrency := itens.pipi;
          qry.Params.ParamByName('pVIPI').AsCurrency := itens.vipi;
          qry.Params.ParamByName('pVBCSTRET').AsCurrency := itens.vbcstret;
          qry.Params.ParamByName('pPST').AsCurrency := itens.pst;
          qry.Params.ParamByName('pVICMSSUBSTITUTO').AsCurrency := itens.vicmssubstituto;
          qry.Params.ParamByName('pVICMSSTRET').AsCurrency := itens.vicmsstret;
          qry.Params.ParamByName('pVBCFCPSTRET').AsCurrency := itens.vbcfcpstret;
          qry.Params.ParamByName('pPFCPSTRET').AsCurrency := itens.pfcpstret;
          qry.Params.ParamByName('pVFCPSTRET').AsCurrency := itens.vfcpstret;
          qry.Params.ParamByName('pQUNID').AsCurrency := itens.qunid;
          qry.Params.ParamByName('pVUNID').AsCurrency := itens.vunid;
          qry.Params.ParamByName('pCLENQ').AsCurrency := itens.clenq;
          qry.Params.ParamByName('pCNPJPROD').AsString := itens.cnpjprod;
          qry.Params.ParamByName('pQSELO').AsCurrency := itens.qselo;
          qry.Params.ParamByName('pCENQ').AsCurrency := itens.cenq;
          qry.Params.ParamByName('pVALIQPRODCOFINS').AsCurrency := itens.valiqprodcofins;
          qry.Params.ParamByName('pQBCPRODCOFINS').AsCurrency := itens.qbcprodcofins;
          qry.Params.ParamByName('pVALIQPRODPIS').AsCurrency := itens.valiqprodpis;
          qry.Params.ParamByName('pQBCPRODPIS').AsCurrency := itens.qbcprodpis;
          qry.Params.ParamByName('pMOTDESICMSST').AsCurrency := itens.motdesicmsst;

           try
            Qry.Execute;
            Result := True;
         finally

         end;


     except



     end;

  finally


  end;
end;

function TItens.GetCbenef: string;
begin
Result := Cbenef;
end;

function TItens.GetCean: string;
begin
Result := Cean;
end;

function TItens.GetCeantrib: string;
begin
Result := Ceantrib;
end;

function TItens.GetCenq: currency;
begin
Result := Cenq;
end;

function TItens.GetCest: string;
begin
Result := Cest;
end;

function TItens.GetCfop: currency;
begin
Result := Cfop;
end;

function TItens.GetClenq: currency;
begin
Result := Clenq;
end;

function TItens.GetCnpjProd: string;
begin
Result := CnpjProd;
end;

function TItens.GetCprod: string;
begin
Result := Cprod;
end;

function TItens.GetCSelo: string;
begin
Result := CSelo;
end;

function TItens.GetCst: currency;
begin
Result := Cst;
end;

function TItens.GetCstCofins: currency;
begin
Result := CstCofins;
end;

function TItens.GetCstIpi: currency;
begin
Result := CstIpi;
end;

function TItens.GetCstPis: currency;
begin
Result := CstPis;
end;

function TItens.GetId: integer;
begin
Result := Id;
end;

function TItens.GetIndtot: currency;
begin
Result := Indtot;
end;

function TItens.GetModBc: currency;
begin
Result := ModBc;
end;

function TItens.GetModBcSt: currency;
begin
Result := ModBcSt;
end;

function TItens.GetMotDesIcms: currency;
begin
Result := MotDesIcms;
end;

function TItens.GetMotdesIcmsSt: currency;
begin
Result := MotdesIcmsSt;
end;

function TItens.GetNcm: string;
begin
Result := Ncm;
end;

function TItens.GetOrig: currency;
begin
Result := Orig;
end;

function TItens.GetPCofins: currency;
begin
Result := PCofins;
end;

function TItens.GetPFcp: currency;
begin
Result := PFcp;
end;

function TItens.GetPFcpSt: currency;
begin
Result := PFcpSt;
end;

function TItens.GetPFcpStret: currency;
begin
Result := PFcpStret;
end;

function TItens.GetPIcms: currency;
begin
Result := PIcms;
end;

function TItens.GetPIcmsSt: currency;
begin
Result := PIcmsSt;
end;

function TItens.GetPipi: currency;
begin
Result := Pipi;
end;

function TItens.GetPmVast: currency;
begin
Result := PmVast;
end;

function TItens.GetPPis: currency;
begin
Result := PPis;
end;

function TItens.GetPSt: currency;
begin
Result := PSt;
end;

function TItens.GetQbcProdCofins: currency;
begin
Result := QbcProdCofins;
end;

function TItens.GetQbcProdPis: currency;
begin
Result := QbcProdPis;
end;

function TItens.GetQcom: currency;
begin
Result := Qcom;
end;

function TItens.GetQSelo: currency;
begin
Result := QSelo;
end;

function TItens.GetQtrib: currency;
begin
Result := Qtrib;
end;

function TItens.GetQUnid: currency;
begin
Result :=QUnid;
end;

function TItens.GetUcom: string;
begin
Result := Ucom;
end;

function TItens.GetUtrib: string;
begin
Result := Utrib;
end;

function TItens.GetValiqProdCofins: currency;
begin
Result := ValiqProdCofins;
end;

function TItens.GetValiqProdPis: currency;
begin
Result := ValiqProdPis;
end;

function TItens.GetVBc: currency;
begin
Result := VBc;
end;

function TItens.GetVBcCofins: currency;
begin
Result := VBcCofins;
end;

function TItens.GetVBcfcp: currency;
begin
Result := VBcfcp;
end;

function TItens.GetVBcFcpSt: currency;
begin
Result := VBcFcpSt;
end;

function TItens.GetVBcFcpStret: currency;
begin
Result := VBcFcpStret;
end;

function TItens.GetVBcIpi: currency;
begin
Result := VBcIpi;
end;

function TItens.GetVBcPis: currency;
begin
Result := VBcPis;
end;

function TItens.GetVBcsT: currency;
begin
Result := VBcsT;
end;

function TItens.GetVBcStret: currency;
begin
Result := VBcStret;
end;

function TItens.GetVCofins: currency;
begin
Result := VCofins;
end;

function TItens.GetVFcp: currency;
begin
Result := VFcp;
end;

function TItens.GetVFcpSt: currency;
begin
Result := VFcpSt;
end;

function TItens.GetVFcpStret: currency;
begin
Result := VFcpStret;
end;

function TItens.GetVIcms: currency;
begin
Result := VIcms;
end;

function TItens.GetVIcmsdeson: currency;
begin
Result := VIcmsdeson;
end;

function TItens.GetVIcmsSt: currency;
begin
Result := GetVIcmsSt;
end;

function TItens.GetVicmsStret: currency;
begin
Result := VicmsStret;
end;

function TItens.GetVIcmsSubstituto: currency;
begin
Result := VIcmsSubstituto;
end;

function TItens.GetVIpi: currency;
begin
Result := VIpi;
end;

function TItens.GetVPis: currency;
begin
Result := VPis;
end;

function TItens.GetVprod: currency;
begin
Result := Vprod;
end;

function TItens.GetVuncom: currency;
begin
Result := Vuncom;
end;

function TItens.GetVUnid: currency;
begin
Result :=VUnid;
end;

function TItens.GetVuntrib: currency;
begin
Result := Vuntrib;
end;

function TItens.GetXprod: string;
begin
Result := Xprod;
end;

function TItens.ListaProdutosPorPeriodo: TUniQuery;
begin
  Qry.SQL.Clear;
  Qry.SQL.Add('select XPROD,NCM,UCOM,cean,PICMS from itens group by XPROD,NCM,UCOM,cean,PICMS');
  Qry.Open;
  if Not Qry.IsEmpty then
    Result:= Qry
    else

end;

function TItens.Listar(Id:Integer;Tipo:string):TUniQuery;
begin
  Qry.SQL.Clear;
  Qry.SQL.Add('SELECT * FROM ITENS WHERE IDNOTA =:PID AND TIPO =:PTipo');
  Qry.Params.ParamByName('PID').AsInteger:= Id;
  Qry.Params.ParamByName('PTipo').AsString:= Tipo;
  try
    Qry.Open;
    Result:= Qry;
  except
    on Erro: Exception do
    ShowMessage('Erro: '+Erro.Message);

  end;
end;

function TItens.ListaUnidadeDeMedida: TUniQuery;
begin
  Qry.SQL.Clear;
  Qry.SQL.Add('select distinct ucom from itens');
  Qry.Open;
  if Not Qry.IsEmpty then
    Result:=Qry
    else

end;

function TItens.Salvaritens(const Itens: TItens;IdNota:integer;Tipo:string): boolean;
begin
  Qry.SQL.Clear;
  Qry.SQL.Add
    ('INSERT INTO ITENS (CPROD,CEAN,XPROD,NCM,CBENEF,CFOP,UCOM,QCOM,VUNCOM,CEANTRIB,UTRIB');
  Qry.SQL.Add(',QTRIB,VUNTRIB,INDTOT,ORIG,CST,MODBC,VBC,PICMS,VICMS,VBCFCP,PFCP,MODBCST,');
  Qry.SQL.Add('PMVAST,VBCST,PICMSST,VICMSST,VBCFCPST,PFCPST,VFCPST,VICMSDESON,MOTDESICMS,CSTPIS,');
  Qry.SQL.Add('VBCPIS,PPIS,VPIS,CSTCOFINS,VBCCOFINS,PCOFINS,VCOFINS,CSTIPI,VBCIPI,PIPI,VIPI,');
  Qry.SQL.Add('VBCSTRET,PST,VICMSSTRET,VBCFCPSTRET,PFCPSTRET,VFCPSTRET,QUNID,VUNID,');
  Qry.SQL.Add('CLENQ,CSELO,QSELO,CENQ,VALIQPRODCOFINS,QBCPRODCOFINS,VALIQPRODPIS,');
  Qry.SQL.Add('QBCPRODPIS,MOTDESICMSST,CEST,VPROD,VFCP,VICMSSUBSTITUTO,CNPJPROD,IDNOTA,TIPO)');

  Qry.SQL.Add('VALUES(:PCPROD,:pCEAN,:pXPROD,:pNCM,:pCBENEF,:pCFOP,:pUCOM,:pQCOM,:pVUNCOM,:pCEANTRIB,:pUTRIB');
  Qry.SQL.Add(',:pQTRIB,:pVUNTRIB,:pINDTOT,:pORIG,:pCST,:pMODBC,:pVBC,:pPICMS,:pVICMS,:pVBCFCP,:pPFCP,:pMODBCST,');
  Qry.SQL.Add(' :pPMVAST,:pVBCST,:pPICMSST,:pVICMSST,:pVBCFCPST,:pPFCPST,:pVFCPST,:pVICMSDESON,:pMOTDESICMS,:pCSTPIS,');
  Qry.SQL.Add(':pVBCPIS,:pPPIS,:pVPIS,:pCSTCOFINS,:pVBCCOFINS,:pPCOFINS,:pVCOFINS,:pCSTIPI,:pVBCIPI,:pPIPI,:pVIPI,');
  Qry.SQL.Add(':pVBCSTRET,:pPST,:pVICMSSTRET,:pVBCFCPSTRET,:pPFCPSTRET,:pVFCPSTRET,:pQUNID,:pVUNID,');
  Qry.SQL.Add(':pCLENQ,:pCSELO,:pQSELO,:pCENQ,:pVALIQPRODCOFINS,:pQBCPRODCOFINS,:pVALIQPRODPIS,');
  Qry.SQL.Add(':pQBCPRODPIS,:pMOTDESICMSST,:pCEST,:pVPROD,:pVFCP,:pVICMSSUBSTITUTO,:pCNPJPROD,:pIDNOTA,:pTipo)');
          qry.Params.ParamByName('pCPROD').AsString := itens.cprod;
          qry.Params.ParamByName('pCEAN').AsString := itens.cean;
          qry.Params.ParamByName('pXPROD').AsString := itens.xprod;
          qry.Params.ParamByName('pNCM').AsString := itens.ncm;
          qry.Params.ParamByName('pCEST').AsString := itens.cest;
          qry.Params.ParamByName('pCBENEF').AsString := itens.cbenef;
          qry.Params.ParamByName('pCEANTRIB').AsString := itens.ceantrib;
          qry.Params.ParamByName('pUTRIB').AsString := itens.utrib;
          qry.Params.ParamByName('pUCOM').AsString := itens.ucom;
          qry.Params.ParamByName('pCNPJPROD').AsString := itens.cnpjprod;
          qry.Params.ParamByName('pCSELO').AsString:= itens.cselo;

          qry.Params.ParamByName('pCFOP').AsCurrency := itens.cfop;
          qry.Params.ParamByName('pQCOM').AsCurrency := itens.qcom;
          qry.Params.ParamByName('pVUNCOM').AsCurrency := itens.vuncom;
          qry.Params.ParamByName('pVPROD').AsCurrency := itens.vprod;
          qry.Params.ParamByName('pQTRIB').AsCurrency := itens.qtrib;
          qry.Params.ParamByName('pVUNTRIB').AsCurrency := itens.vuntrib;
          qry.Params.ParamByName('pINDTOT').AsCurrency := itens.indtot;
          qry.Params.ParamByName('pORIG').AsCurrency := itens.orig;
          qry.Params.ParamByName('pCST').AsCurrency := itens.cst;
          qry.Params.ParamByName('pMODBC').AsCurrency := itens.modbc;
          qry.Params.ParamByName('pVBC').AsCurrency := itens.vbc;
          qry.Params.ParamByName('pPICMS').AsCurrency := itens.picms;
          qry.Params.ParamByName('pVICMS').AsCurrency := itens.vicms;
          qry.Params.ParamByName('pVBCFCP').AsCurrency := itens.vbcfcp;
          qry.Params.ParamByName('pPFCP').AsCurrency := itens.pfcp;
          qry.Params.ParamByName('pVFCP').AsCurrency := itens.vfcp;
          qry.Params.ParamByName('pMODBCST').AsCurrency := itens.modbcst;
          qry.Params.ParamByName('pPMVAST').AsCurrency := itens.pmvast;
          qry.Params.ParamByName('pVBCST').AsCurrency := itens.vbcst;
          qry.Params.ParamByName('pPICMSST').AsCurrency := itens.picmsst;
          qry.Params.ParamByName('pVBCFCPST').AsCurrency := itens.vbcfcpst;
          qry.Params.ParamByName('pPFCPST').AsCurrency := itens.pfcpst;
          qry.Params.ParamByName('pVFCPST').AsCurrency := itens.vfcpst;
          qry.Params.ParamByName('pVICMSDESON').AsCurrency := itens.vicmsdeson;
          qry.Params.ParamByName('pMOTDESICMS').AsCurrency := itens.motdesicms;
          qry.Params.ParamByName('pCSTPIS').AsCurrency := itens.cstpis;
          qry.Params.ParamByName('pVBCPIS').AsCurrency := itens.vbcpis;
          qry.Params.ParamByName('pPPIS').AsCurrency := itens.ppis;
          qry.Params.ParamByName('pVPIS').AsCurrency := itens.vpis;
          qry.Params.ParamByName('pCSTCOFINS').AsCurrency := itens.cstcofins;
          qry.Params.ParamByName('pVBCCOFINS').AsCurrency := itens.vbccofins;
          qry.Params.ParamByName('pPCOFINS').AsCurrency := itens.pcofins;
          qry.Params.ParamByName('pVCOFINS').AsCurrency := itens.vcofins;
          qry.Params.ParamByName('pCSTIPI').AsCurrency := itens.cstipi;
          qry.Params.ParamByName('pVBCIPI').AsCurrency := itens.vbcipi;
          qry.Params.ParamByName('pPIPI').AsCurrency := itens.pipi;
          qry.Params.ParamByName('pVIPI').AsCurrency := itens.vipi;
          qry.Params.ParamByName('pVBCSTRET').AsCurrency := itens.vbcstret;
          qry.Params.ParamByName('pPST').AsCurrency := itens.pst;
          qry.Params.ParamByName('pVICMSSUBSTITUTO').AsCurrency := itens.vicmssubstituto;
          qry.Params.ParamByName('pVICMSSTRET').AsCurrency := itens.vicmsstret;
          qry.Params.ParamByName('pVBCFCPSTRET').AsCurrency := itens.vbcfcpstret;
          qry.Params.ParamByName('pPFCPSTRET').AsCurrency := itens.pfcpstret;
          qry.Params.ParamByName('pVFCPSTRET').AsCurrency := itens.vfcpstret;
          qry.Params.ParamByName('pQUNID').AsCurrency := itens.qunid;
          qry.Params.ParamByName('pVUNID').AsCurrency := itens.vunid;
          qry.Params.ParamByName('pCLENQ').AsCurrency := itens.clenq;

          qry.Params.ParamByName('pQSELO').AsCurrency := itens.qselo;
          qry.Params.ParamByName('pCENQ').AsCurrency := itens.cenq;
          qry.Params.ParamByName('pVALIQPRODCOFINS').AsCurrency := itens.valiqprodcofins;
          qry.Params.ParamByName('pQBCPRODCOFINS').AsCurrency := itens.qbcprodcofins;
          qry.Params.ParamByName('pVALIQPRODPIS').AsCurrency := itens.valiqprodpis;
          qry.Params.ParamByName('pQBCPRODPIS').AsCurrency := itens.qbcprodpis;
          qry.Params.ParamByName('pMOTDESICMSST').AsCurrency := itens.motdesicmsst;
          qry.Params.ParamByName('pIDNOTA').AsInteger:= IdNota;

          if Tipo ='Terceiros' then
            Qry.Params.ParamByName('pTIPO').AsString := 'E'
          else
            Qry.Params.ParamByName('pTIPO').AsString := 'S';

          qry.ExecSQL;

  try
    Qry.Execute;
    Result := True;
  finally

  end;
end;

procedure TItens.SetCbenef(const Value: string);
begin
Cbenef:= Value;
end;

procedure TItens.SetCean(const Value: string);
begin
Cean:= Value;
end;

procedure TItens.SetCeantrib(const Value: string);
begin
Ceantrib:= Value;
end;

procedure TItens.SetCenq(const Value: currency);
begin
Cenq:= Value;
end;

procedure TItens.SetCest(const Value: string);
begin
Cest:= Value;
end;

procedure TItens.SetCfop(const Value: currency);
begin
Cfop:= Value;
end;

procedure TItens.SetClenq(const Value: currency);
begin
Clenq:= Value;
end;

procedure TItens.SetCnpjProd(const Value: string);
begin
CnpjProd:= Value;
end;

procedure TItens.SetCprod(const Value: string);
begin
Cprod:= Value;
end;

procedure TItens.SetCSelo(const Value: string);
begin
CSelo:= Value;
end;

procedure TItens.SetCst(const Value: currency);
begin
Cst:= Value;
end;

procedure TItens.SetCstCofins(const Value: currency);
begin
CstCofins:= Value;
end;

procedure TItens.SetCstIpi(const Value: currency);
begin
CstIpi:= Value;
end;

procedure TItens.SetCstPis(const Value: currency);
begin
CstPis:= Value;
end;

procedure TItens.SetId(const Value: integer);
begin
Id:= Value;
end;

procedure TItens.SetIndtot(const Value: currency);
begin
Indtot:= Value;
end;

procedure TItens.SetModBc(const Value: currency);
begin
ModBc:= Value;
end;

procedure TItens.SetModBcSt(const Value: currency);
begin
ModBcSt:= Value;
end;

procedure TItens.SetMotDesIcms(const Value: currency);
begin
MotDesIcms:= Value;
end;

procedure TItens.SetMotdesIcmsSt(const Value: currency);
begin
MotdesIcmsSt:= Value;
end;

procedure TItens.SetNcm(const Value: string);
begin
Ncm:= Value;
end;

procedure TItens.SetOrig(const Value: currency);
begin
Orig:= Value;
end;

procedure TItens.SetPCofins(const Value: currency);
begin
PCofins:= Value;
end;

procedure TItens.SetPFcp(const Value: currency);
begin
PFcp:= Value;
end;

procedure TItens.SetPFcpSt(const Value: currency);
begin
PFcpSt:= Value;
end;

procedure TItens.SetPFcpStret(const Value: currency);
begin
PFcpStret:= Value;
end;

procedure TItens.SetPIcms(const Value: currency);
begin
PIcms:= Value;
end;

procedure TItens.SetPIcmsSt(const Value: currency);
begin
PIcmsSt:= Value;
end;

procedure TItens.SetPipi(const Value: currency);
begin
Pipi:= Value;
end;

procedure TItens.SetPmVast(const Value: currency);
begin
PmVast:= Value;
end;

procedure TItens.SetPPis(const Value: currency);
begin
PPis:= Value;
end;

procedure TItens.SetPSt(const Value: currency);
begin
PSt:= Value;
end;

procedure TItens.SetQbcProdCofins(const Value: currency);
begin
QbcProdCofins:= Value;
end;

procedure TItens.SetQbcProdPis(const Value: currency);
begin
QbcProdPis:= Value;
end;

procedure TItens.SetQcom(const Value: currency);
begin
Qcom:= Value;
end;

procedure TItens.SetQSelo(const Value: currency);
begin
QSelo:= Value;
end;

procedure TItens.SetQtrib(const Value: currency);
begin
Qtrib:= Value;
end;

procedure TItens.SetQUnid(const Value: currency);
begin
QUnid:= Value;
end;

procedure TItens.SetUcom(const Value: string);
begin
Ucom:= Value;
end;

procedure TItens.SetUtrib(const Value: string);
begin
Utrib:= Value;
end;

procedure TItens.SetValiqProdCofins(const Value: currency);
begin
ValiqProdCofins:= Value;
end;

procedure TItens.SetValiqProdPis(const Value: currency);
begin
ValiqProdPis:= Value;
end;

procedure TItens.SetVBc(const Value: currency);
begin
VBc:= Value;
end;

procedure TItens.SetVBcCofins(const Value: currency);
begin
VBcCofins:= Value;
end;

procedure TItens.SetVBcfcp(const Value: currency);
begin
VBcfcp:= Value;
end;

procedure TItens.SetVBcFcpSt(const Value: currency);
begin
VBcFcpSt:= Value;
end;

procedure TItens.SetVBcFcpStret(const Value: currency);
begin
VBcFcpStret:= Value;
end;

procedure TItens.SetVBcIpi(const Value: currency);
begin
VBcIpi:= Value;
end;

procedure TItens.SetVBcPis(const Value: currency);
begin
VBcPis:= Value;
end;

procedure TItens.SetVBcsT(const Value: currency);
begin
VBcsT:= Value;
end;

procedure TItens.SetVBcStret(const Value: currency);
begin
VBcStret:= Value;
end;

procedure TItens.SetVCofins(const Value: currency);
begin
VCofins:= Value;
end;

procedure TItens.SetVFcp(const Value: currency);
begin
VFcp:= Value;
end;

procedure TItens.SetVFcpSt(const Value: currency);
begin
VFcpSt:= Value;
end;

procedure TItens.SetVFcpStret(const Value: currency);
begin
VFcpStret:= Value;
end;

procedure TItens.SetVIcms(const Value: currency);
begin
VIcms:= Value;
end;

procedure TItens.SetVIcmsdeson(const Value: currency);
begin
VIcmsdeson:= Value;
end;

procedure TItens.SetVIcmsSt(const Value: currency);
begin
VIcmsSt:= Value;
end;

procedure TItens.SetVicmsStret(const Value: currency);
begin
VicmsStret:= Value;
end;

procedure TItens.SetVIcmsSubstituto(const Value: currency);
begin
VIcmsSubstituto:= Value;
end;

procedure TItens.SetVIpi(const Value: currency);
begin
VIpi:= Value;
end;

procedure TItens.SetVPis(const Value: currency);
begin
VPis:= Value;
end;

procedure TItens.SetVprod(const Value: currency);
begin
Vprod:= Value;
end;

procedure TItens.SetVuncom(const Value: currency);
begin
Vuncom:= Value;
end;

procedure TItens.SetVUnid(const Value: currency);
begin
VUnid:= Value;
end;

procedure TItens.SetVuntrib(const Value: currency);
begin
Vuntrib:= Value;
end;

procedure TItens.SetXprod(const Value: string);
begin
Xprod:= Value;
end;

end.
