{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera��o com equipa- }
{ mentos de Automa��o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2020 Daniel Simoes de Almeida               }
{																			   }
{  Voc� pode obter a �ltima vers�o desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{  Esta biblioteca � software livre; voc� pode redistribu�-la e/ou modific�-la }
{ sob os termos da Licen�a P�blica Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a vers�o 2.1 da Licen�a, ou (a seu crit�rio) }
{ qualquer vers�o posterior.                                                   }
{                                                                              }
{  Esta biblioteca � distribu�da na expectativa de que seja �til, por�m, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia impl�cita de COMERCIABILIDADE OU      }
{ ADEQUA��O A UMA FINALIDADE ESPEC�FICA. Consulte a Licen�a P�blica Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICEN�A.TXT ou LICENSE.TXT)              }
{                                                                              }
{  Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral Menor do GNU junto}
{ com esta biblioteca; se n�o, escreva para a Free Software Foundation, Inc.,  }
{ no endere�o 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Voc� tamb�m pode obter uma copia da licen�a em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Sim�es de Almeida - daniel@projetoacbr.com.br - www.projetoacbr.com.br}
{       Rua Coronel Aureliano de Camargo, 963 - Tatu� - SP - 18270-170         }
{******************************************************************************}

unit Frm_SPEDFiscal;

{$IFDEF FPC}
{$mode objfpc}{$H+}
{$ENDIF}

interface

uses
{$IFNDEF FPC}
  Windows, Messages,
{$ENDIF}
  SysUtils, Variants, Classes, Graphics, Controls, Forms, ACBrEFDBlocos,
  StrUtils, Dialogs, StdCtrls, ACBrSpedFiscal, ExtCtrls, ComCtrls,
  ACBrUtil, ACBrTXTClass, DateUtils, Bens,Contascontabeis,CentroDecustos,ACBrBase,Uni,Empresa,itens,Participante,REntradaRepositorio,Contador;

type

  { TFrmSPEDFiscal }

  TFrmSPEDFiscal = class(TForm)
    btnB_0: TButton;
    btnB_1: TButton;
    btnB_C: TButton;
    btnB_D: TButton;
    btnB_E: TButton;
    btnB_H: TButton;
    btnError: TButton;
    btnTXT: TButton;
    btnB_9: TButton;
    cbConcomitante: TCheckBox;
    edBufNotas: TEdit;
    edNotas: TEdit;
    edBufLinhas: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    memoError: TMemo;
    edtFile: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    memoTXT: TMemo;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    ProgressBar1: TProgressBar;
    ACBrSPEDFiscal1: TACBrSPEDFiscal;
    btnB_G: TButton;
    btnB_Completo: TButton;
    btnCancelaGeracao: TButton;
    btnB_K: TButton;
    Label9: TLabel;
    DtRef: TDateTimePicker;
    btnB_B: TButton;
    cbEstado: TComboBox;
    Label10: TLabel;
    Inicial: TDateTimePicker;
    final: TDateTimePicker;
    Label11: TLabel;
    Label12: TLabel;
    procedure ACBrSPEDFiscal1Error(const MsnError: string);
    procedure btnB_KClick(Sender: TObject);
    procedure btnB_0Click(Sender: TObject);
    procedure btnB_9Click(Sender: TObject);
    procedure btnTXTClick(Sender: TObject);
    procedure btnB_1Click(Sender: TObject);
    procedure btnB_BClick(Sender: TObject);
    procedure btnB_CClick(Sender: TObject);
    procedure btnB_DClick(Sender: TObject);
    procedure btnB_EClick(Sender: TObject);
    procedure btnB_HClick(Sender: TObject);
    procedure btnErrorClick(Sender: TObject);
    procedure edtFileChange(Sender: TObject);
    procedure cbConcomitanteClick(Sender: TObject);
    procedure btnB_CompletoClick(Sender: TObject);
    procedure btnB_GClick(Sender: TObject);
    procedure btnCancelaGeracaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure LoadToMemo;
    function AnoToVersao: TACBrVersaoLeiauteSPEDFiscal;
    var
    Empresa:TEmpresa;
    Notas:TEntradaRepositorio;
    Itens:TItens;
    Contador:TContador;
    Participantes:TParticipante;
    Bens:TBens;
    Custos:TCentroDecusto;
    Contas:TContascontabeis;
    QEmpresa:TUniQuery;
    QNotas:TUniQuery;
    QItens:TUniQuery;
    QContador:TUniQuery;
    QParticipantes:TUniQuery;
    Qbens:TUniQuery;
    QContas:TUniQuery;
    QCustos:TUniQuery;
    RepositorioNotas :TFabricaNotas;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSPEDFiscal: TFrmSPEDFiscal;

implementation

uses ACBrEFDBloco_K_Class, ACBrEFDBloco_K, ACBrEFDBloco_0, ACBrEFDBloco_0_Class;

{$IFDEF FPC}
{$R *.lfm}
{$ELSE}
{$R *.dfm}
{$ENDIF}

const
  strUNID: array [0 .. 4] of string = ('PC', 'UN', 'LT', 'PC', 'MT');
  FCod_Item = '000001';

procedure TFrmSPEDFiscal.ACBrSPEDFiscal1Error(const MsnError: string);
begin
  memoError.Lines.Add(MsnError);
end;

function TFrmSPEDFiscal.AnoToVersao: TACBrVersaoLeiauteSPEDFiscal;
var
  xVer: string;
begin
  if (DtRef.DateTime >= StrToDate('01/01/2009')) and (DtRef.DateTime <= StrToDate('31/12/2009')) then
    xVer := '002'
  else if (DtRef.DateTime >= StrToDate('01/01/2010')) and (DtRef.DateTime <= StrToDate('31/12/2010')) then
    xVer := '003'
  else if (DtRef.DateTime >= StrToDate('01/01/2011')) and (DtRef.DateTime <= StrToDate('31/12/2011')) then
    xVer := '004'
  else if (DtRef.DateTime >= StrToDate('01/01/2012')) and (DtRef.DateTime <= StrToDate('30/06/2012')) then
    xVer := '005'
  else if (DtRef.DateTime >= StrToDate('01/07/2012')) and (DtRef.DateTime <= StrToDate('31/12/2012')) then
    xVer := '006'
  else if (DtRef.DateTime >= StrToDate('01/01/2013')) and (DtRef.DateTime <= StrToDate('31/12/2013')) then
    xVer := '007'
  else if (DtRef.DateTime >= StrToDate('01/01/2014')) and (DtRef.DateTime <= StrToDate('31/12/2014')) then
    xVer := '008'
  else if (DtRef.DateTime >= StrToDate('01/01/2015')) and (DtRef.DateTime <= StrToDate('31/12/2015')) then
    xVer := '009'
  else if (DtRef.DateTime >= StrToDate('01/01/2016')) and (DtRef.DateTime <= StrToDate('31/12/2016')) then
    xVer := '010'
  else if (DtRef.DateTime >= StrToDate('01/01/2017')) and (DtRef.DateTime <= StrToDate('31/12/2017')) then
    xVer := '011'
  else if (DtRef.DateTime >= StrToDate('01/01/2018')) and (DtRef.DateTime <= StrToDate('31/12/2018')) then
    xVer := '012'
  else if (DtRef.DateTime >= StrToDate('01/01/2019')) and (DtRef.DateTime <= StrToDate('31/12/2019')) then
    xVer := '013'
  else if (DtRef.DateTime >= StrToDate('01/01/2020')) and (DtRef.DateTime <= StrToDate('31/12/2020')) then
    xVer := '014'
  else if (DtRef.DateTime >= StrToDate('01/01/2021')) and (DtRef.DateTime <= StrToDate('31/12/2021')) then
    xVer := '015'
  else if (DtRef.DateTime >= StrToDate('01/01/2022')) then
    xVer := '016';
  Result := StrToCodVer(xVer);
end;

procedure TFrmSPEDFiscal.btnB_0Click(Sender: TObject);

var
  int0150: integer;
//  int0175: integer;
  int0300: integer;
  int0190: integer;
  int0500: Integer;
  int0600: Integer;
  int0200: Integer;
  int0400,int0450,int460:Integer;
begin
  // Alimenta o componente com informa��es para gerar todos os registros do
  // Bloco 0.
  cbConcomitante.Enabled := False;
  btnB_0.Enabled := False;
  btnB_B.Enabled := True;

  ACBrSPEDFiscal1.DT_INI := Inicial.Date;
  ACBrSPEDFiscal1.DT_FIN := final.Date;

  if cbConcomitante.Checked then
  begin
    ACBrSPEDFiscal1.LinhasBuffer := StrToIntDef(edBufLinhas.Text, 0);
    ACBrSPEDFiscal1.IniciaGeracao;
    LoadToMemo;
  end;

  with ACBrSPEDFiscal1.Bloco_0 do
  begin
    // Dados da Empresa
    Empresa:= TEmpresa.Create;
    QEmpresa:= TUniQuery.Create(Nil);
    QEmpresa:= Empresa.ListarEmpresa();

    if QEmpresa.IsEmpty then
         ShowMessage('Cadastre a empresa')
       else
        with Registro0000New do
          begin
            COD_VER := AnoToVersao;
            COD_FIN := raOriginal;
            NOME := QEmpresa.FieldByName('XNome').AsString;
            CNPJ := QEmpresa.FieldByName('CNPJ').AsString;
            CPF := '';
            UF := cbEstado.Text;
            IE := QEmpresa.FieldByName('IE').AsString;
            COD_MUN := QEmpresa.FieldByName('CMUN').AsInteger;
            IM := '';
            SUFRAMA := '';
            IND_PERFIL := pfPerfilA;
            IND_ATIV := atOutros;
          end;

          with Registro0001New do
            begin
               IND_MOV := imComDados;

                // FILHO - Dados complementares da Empresa
                 with Registro0005New do
                   begin
                      FANTASIA := QEmpresa.FieldByName('xnome').AsString;
                      CEP := QEmpresa.FieldByName('Cep').AsString;
                      ENDERECO := QEmpresa.FieldByName('xlgr').AsString;
                      NUM := (QEmpresa.FieldByName('nro').AsString);
                      COMPL := QEmpresa.FieldByName('xcpl').AsString;
                      BAIRRO := QEmpresa.FieldByName('xbairro').AsString;
                      FONE := QEmpresa.FieldByName('fone').AsString;
                      FAX := '';
                      EMAIL := QEmpresa.FieldByName('email').AsString;
                    end;
                    QEmpresa.Free;
                    Empresa.Free;


//
//      with Registro0015New do
//      begin
//        UF_ST := 'SC';
//        IE_ST := '254504230';
//      end;
//
      // FILHO - Dados do contador.

      Contador:= TContador.create();
      QContador:=TUniQuery.Create(nil);
      QContador:= Contador.ListarContador();
      if QContador.IsEmpty then
        ShowMessage('Cadastre a contabilidade para continuar.')
        else
          begin
            with Registro0100New do
              begin
                NOME := qContador.FieldByName('NOME').AsString;
                CPF := qContador.FieldByName('CPF').AsString; // Deve ser uma informa��o valida
                CRC := qContador.FieldByName('CRC').AsString;
                CNPJ := qContador.FieldByName('CNPJ').AsString;
                CEP := qContador.FieldByName('CEP').AsString;
                ENDERECO := qContador.FieldByName('ENDERECO').AsString;
                NUM :=qContador.FieldByName('NUMERO').AsString;
                COMPL := qContador.FieldByName('COMPLEMENTO').AsString;
                BAIRRO := qContador.FieldByName('BAIRRO').AsString;
                FONE := qContador.FieldByName('FONE').AsString;
                FAX := qContador.FieldByName('FAX').AsString;
                EMAIL := qContador.FieldByName('EMAIL').AsString;
                COD_MUN := qContador.FieldByName('CODCIDADE').AsInteger;
              end;
          end;
          QContador.Free;
          Contador.Free;
      // Check(Reg0001.Registro0190.LocalizaRegistro(UNID), '(0-0190) UNIDADE MEDIDA: A unidade de medida "%s" foi duplicada na lista de registros 0190!', [UNID]);

      // FILHO
      Participantes:= TParticipante.create;
      QParticipantes:= TUniQuery.Create(nil);
      QParticipantes:= Participantes.ListarParticipantesPorPeriodo();

      if QParticipantes.IsEmpty then
       ShowMessage('N�o h� Participantes neste per�odo fa�as a importan��o dos XMLS')
       else
      begin
        QParticipantes.First;
        while Not QParticipantes.Eof do
         begin
        if QParticipantes.FieldByName('XLGR').AsString <> '' then
          begin
        with Registro0150New do
        begin
          COD_PART := IntToStr(QParticipantes.FieldByName('ID').Asinteger);
          NOME := QParticipantes.FieldByName('XNOME').AsString;

          if QParticipantes.FieldByName('CPAIS').AsString <>'1058' then
          begin
            COD_PAIS := QParticipantes.FieldByName('CPAIS').AsString;
            CNPJ := '';
            CPF := '';
          end
          else
          begin
          if Length(QParticipantes.FieldByName('CNPJ').AsString) > 11 then
            begin
            CNPJ :=QParticipantes.FieldByName('CNPJ').AsString;
            IE := QParticipantes.FieldByName('IE').AsString;
            end
            else
            CPF := QParticipantes.FieldByName('CNPJ').AsString;
          end;


          COD_MUN := StrToInt(QParticipantes.FieldByName('CMUN').AsString);
          SUFRAMA := '';
          ENDERECO := QParticipantes.FieldByName('XLGR').AsString;
          NUM := QParticipantes.FieldByName('NRO').AsString;
          COMPL := QParticipantes.FieldByName('XCPL').AsString;
          BAIRRO := QParticipantes.FieldByName('XBAIRRO').AsString;
          COD_PAIS := '1058';

          // Altera��o de nome para Participantes 2 e 4
         { if (int0150 = 2) or (int0150 = 4) then
          begin
            with Registro0175New do
            begin
              DT_ALT := DT_INI + 1;
              NR_CAMPO := '03'; //03 -> Nome
              CONT_ANT := 'Nome anterior do Participante' + IntToStr(int0150);
            end;
          end;    }
          QParticipantes.Next;
        end;

        end
        else
           QParticipantes.Next;
      end;

      end;
      QParticipantes.Free;
      Participantes.Free;
      // FILHO Unidades de Medida

      QItens:= TUniQuery.Create(nil);
      Itens:= TItens.create();
      QItens:= Itens.ListaUnidadeDeMedida();

      if Not QItens.IsEmpty then
        begin
          QItens.First;
          while Not QItens.Eof do
            begin
              if not Registro0190.LocalizaRegistro(strUNID[int0190]) then
                begin
                  with Registro0190New do
                   begin
                     UNID := QItens.FieldByName('UCOM').AsString;
                     DESCR := 'Descricao ' + QItens.FieldByName('UCOM').AsString;
                   end;

                end;
                 QItens.Next;
            end;
        end;
        QItens.Free;
        Itens.Free;

      Itens:= TItens.create();
      Qitens:= TUniQuery.Create(nil);
      QItens:= Itens.ListaProdutosPorPeriodo();

      if Not QItens.IsEmpty then
        begin
           QItens.First;
           while Not QItens.Eof do
             begin
             int0200 := 1;
               with Registro0200New do
                 begin
                   COD_ITEM   := IntToStr(int0200);
                   DESCR_ITEM := QItens.FieldByName('XPROD').AsString;
                   COD_BARRA := QItens.FieldByName('CEAN').AsString;
                   UNID_INV  := QItens.FieldByName('UCOM').AsString;
                   TIPO_ITEM := tiMercadoriaRevenda;
                   COD_NCM := QItens.FieldByName('NCM').AsString;
                   COD_GEN := '00';
                   ALIQ_ICMS := StrToCurr(QItens.FieldByName('PICMS').AsString);

                 with Registro0220New do
                   begin
                     UNID_CONV := QItens.FieldByName('UCOM').AsString;
                     FAT_CONV := 1;
                   end;

                  //REGISTRO 0206: C�DIGO DE PRODUTO CONFORME TABELA PUBLICADA PELA ANP (COMBUST�VEIS)
  //                 With Registro0206New do
  //                   begin
  //                  COD_COMB := '910101001';
  //                  end;

               end;
                QItens.Next;
                int0200:= int0200+1;
            end;
        end;
             QItens.Free;
             Itens.Free;

      // FILHO

      QBens:= TUniQuery.Create(nil);
      Bens:= TBens.create();
      Qbens:=  Bens.Listarb();

      if not Qbens.IsEmpty then
      begin
      Qbens.First;
      while Not Qbens.eof do
      begin

        // Bens Imobilizados

        with Registro0300New do
        begin
          COD_IND_BEM := IntToStr(Qbens.FieldByName('ID').AsInteger);
          IDENT_MERC :=StrToInt(Qbens.FieldByName('IDENT_MERC').AsString);
          DESCR_ITEM := (Qbens.FieldByName('DESCR_ITEM').AsString);
          COD_PRNC := (Qbens.FieldByName('COD_PRNC').Asstring);
          COD_CTA := Qbens.FieldByName('COD_CTA').AsString;
          NR_PARC := StrToFloat(Qbens.FieldByName('NR_PARC').asstring);
          // FILHO
          with Registro0305New do
          begin
            COD_CCUS := (Qbens.FieldByName('COD_CCUS').AsString);
            FUNC := (Qbens.FieldByName('FUNCAO').AsString);
            VIDA_UTIL := StrToInt(Qbens.FieldByName('VIDAUTIL').AsString);
          end;
        end;
        Qbens.Next;
      end;
      end;
      Qbens.Free;
      Bens.Free;

      QNotas := TUniQuery.Create(nil);
      Notas:= TEntradaRepositorio.create;
      QNotas:= Notas.ListarNotas('ENTRADAS');
      int0400 := 1;
      if Not QNotas.IsEmpty then
        begin
        QNotas.First;
        while Not QNotas.Eof do
          begin
           with Registro0400New do
             begin
               COD_NAT := 'E/'+QNotas.FieldByName('ID').AsString;
               DESCR_NAT := QNotas.FieldByName('ID').AsString;

             end;
             QNotas.Next;
          end;
        end;
        QNotas.Free;
        Notas.Free;

       QNotas := TUniQuery.Create(nil);
       Notas:= TEntradaRepositorio.create;
       QNotas:= Notas.ListarNotas('SAIDAS');
       QNotas.First;
       if Not QNotas.IsEmpty then
        begin
        QNotas.First;
        while Not QNotas.Eof do
          begin
           with Registro0400New do
             begin
               COD_NAT := 'S/'+QNotas.FieldByName('ID').AsString;
               DESCR_NAT := QNotas.FieldByName('NATOP').AsString;
               int0400 := int0400 + 1;

             end;
             QNotas.Next;
          end;
        end;
        QNotas.Free;
        Notas.Free;

      QNotas := TUniQuery.Create(nil);
      Notas:= TEntradaRepositorio.create;
      QNotas:= Notas.ListarObserva��esComplementar('ENTRADAS');
      int0450:=0;

      if Not QNotas.IsEmpty then
        begin
          QNotas.First;
           while Not QNotas.Eof do
             begin
             with Registro0450New do
              begin
                COD_INF := 'E/'+QNotas.FieldByName('ID').AsString;
                TXT := QNotas.FieldByName('COMPLEMENTAR').AsString;
              end;
               QNotas.Next;
             end;

        end;
        QNotas.Free;
        Notas.Free;

       QNotas := TUniQuery.Create(nil);
       Notas:= TEntradaRepositorio.create;
       QNotas:= Notas.ListarObserva��esComplementar('SAIDAS');
       int0450:=0;

      if Not QNotas.IsEmpty then
        begin
         QNotas.First;
          while Not QNotas.Eof do
          begin
            with Registro0450New do
              begin
                COD_INF := 'S/'+QNotas.FieldByName('ID').AsString;
                TXT := QNotas.FieldByName('COMPLEMENTAR').AsString;
              end;
              QNotas.Next;
          end;

        end;
        QNotas.Free;
        Notas.Free;

       QNotas := TUniQuery.Create(nil);
       Notas:= TEntradaRepositorio.create;

       QNotas:= Notas.ListarObservacaoFisco('ENTRADAS');
       int460:=0;

      if Not QNotas.IsEmpty then
        begin

          QNotas.First;
           while Not QNotas.Eof do
          begin
             with Registro0460New do
              begin
                COD_OBS := 'E/'+QNotas.FieldByName('ID').AsString;
                TXT := QNotas.FieldByName('FISCO').AsString;

              end;
              qnotas.Next;
          end;
          end;
        QNotas.Free;
        Notas.Free;

       QNotas := TUniQuery.Create(nil);
       Notas:= TEntradaRepositorio.create;

      QNotas:= Notas.ListarObservacaoFisco('SAIDAS');
      int460:=0;

      if Not QNotas.IsEmpty then
        begin

          QNotas.First;
           while Not QNotas.Eof do
          begin
             with Registro0460New do
              begin
                COD_OBS := 'S/'+QNotas.FieldByName('ID').AsString;
                TXT := QNotas.FieldByName('FISCO').AsString;

              end;
              qnotas.Next;
          end;
        end;

       QNotas.Free;
       Notas.Free;

       Contas:= TContascontabeis.Create();
       QContas:= TUniQuery.Create(nil);
       QContas:= Contas.Listar();
       QContas.First;

       if Not Qcontas.IsEmpty then
       begin

        while Not Qcontas.Eof do
          begin
            with Registro0500New do
              begin
                DT_ALT := Qcontas.FieldByName('DATA').AsDateTime;
                COD_NAT_CC := Qcontas.FieldByName('COD_NAT_CC').AsString;
                IND_CTA :=Qcontas.FieldByName('IND_CTA').AsString;
                NIVEL := Qcontas.FieldByName('NIVEL').AsString;
                COD_CTA := Qcontas.FieldByName('ID').AsString;
                NOME_CTA := Qcontas.FieldByName('NOME_CTA').AsString;
              end;
            Qcontas.Next;
          end;
       end;
       QContas.Free;
       Contas.Free;

       QCustos:= TUniQuery.Create(nil);
       Custos:= TCentroDecusto.Create();
       QCustos:= Custos.Listarc();
       QCustos.First;
       if not QCustos.IsEmpty then
         begin
          while Not QCustos.Eof do
            begin
              with Registro0600New do
                begin
                  DT_ALT := QCustos.FieldByName('DT_ALT').AsDateTime;
                  COD_CCUS := IntToStr(QCustos.FieldByName('ID').AsInteger);
                  CCUS :=  QCustos.FieldByName('CCUS').AsString;
                end;
                QCustos.Next;
            end;
         end;

  end;
  end;

  if cbConcomitante.Checked then
  begin
    ACBrSPEDFiscal1.WriteBloco_0;
    LoadToMemo;
  end;
end;

procedure TFrmSPEDFiscal.btnB_9Click(Sender: TObject);
begin
  btnB_9.Enabled := False;
  ACBrSPEDFiscal1.WriteBloco_9;
  LoadToMemo;

  // Habilita os bot�es
  btnB_0.Enabled := True;
  btnB_1.Enabled := True;
  btnB_B.Enabled := True;
  btnB_C.Enabled := True;
  btnB_D.Enabled := True;
  btnB_E.Enabled := True;
  btnB_G.Enabled := True;
  btnB_H.Enabled := True;
  btnB_K.Enabled := True;

  cbConcomitante.Enabled := True;
end;

procedure TFrmSPEDFiscal.btnB_BClick(Sender: TObject);
begin
  // Alimenta o componente com informa��es para gerar todos os registros do
  // Bloco C.
  btnB_B.Enabled := False;
  btnB_C.Enabled := True;

  with ACBrSPEDFiscal1.Bloco_B do
  begin
    with RegistroB001New do
    begin
      IND_MOV := imComDados;
      with RegistroB020New do
      begin
        IND_OPER           := tpEntradaAquisicao;
        IND_EMIT           := edTerceiros;
        COD_PART           := '1';
        COD_MOD            := '8';
        COD_SIT            := sdRegular;
        SER                := '1';
        NUM_DOC            := '123456';
        CHV_NFE            := '';
        VL_CONT            := 50.00;
        VL_ISS             := 2.5;
        with RegistroB025New do
        begin
          COD_SERV := '7.12';
          ALIQ_ISS := 5;
          VL_ISS_P := 2.5;
        end;
      end;
    end;
  end;
  if cbConcomitante.Checked then
  begin
    ACBrSPEDFiscal1.WriteBloco_B;
    LoadToMemo;
  end;
end;

procedure TFrmSPEDFiscal.btnTXTClick(Sender: TObject);
begin
  btnTXT.Enabled := False;

  ACBrSPEDFiscal1.LinhasBuffer := StrToIntDef(edBufLinhas.Text, 0);

  // Limpa a lista de erros.
  memoError.Lines.Clear;
  // Informa o pata onde ser� salvo o arquivo TXT.
  // ACBrSpedFiscal1.Path := '.\Arquivo Sped TXT\';

  // M�todo que gera o arquivo TXT.
  ACBrSPEDFiscal1.SaveFileTXT;

  // Carrega o arquivo TXT no memo.
  LoadToMemo;

  // Habilita os bot�es
  btnB_0.Enabled := True;
  btnTXT.Enabled := True;
  cbConcomitante.Enabled := True;
end;

procedure TFrmSPEDFiscal.btnCancelaGeracaoClick(Sender: TObject);
begin
  ACBrSPEDFiscal1.CancelaGeracao;
  btnTXT.Enabled := True;
end;

procedure TFrmSPEDFiscal.btnErrorClick(Sender: TObject);
begin
  // Limpa a lista de erros.
  memoError.Lines.Clear;

  // M�todo que gera o arquivo TXT.
  ACBrSPEDFiscal1.SaveFileTXT;

  // Habilita os bot�es
  btnB_0.Enabled := True;
  btnB_1.Enabled := True;
  btnB_C.Enabled := True;
  btnB_D.Enabled := True;
  btnB_E.Enabled := True;
  btnB_H.Enabled := True;
  btnB_K.Enabled := True;
end;

procedure TFrmSPEDFiscal.btnB_1Click(Sender: TObject);
begin
  btnB_1.Enabled := False;
  btnB_9.Enabled := cbConcomitante.Checked;

  // Alimenta o componente com informa��es para gerar todos os registros do Bloco 1.
  with ACBrSPEDFiscal1.Bloco_1 do
  begin
    with Registro1001New do
    begin
      IND_MOV := imComDados;

      with Registro1010New do
      begin
        IND_EXP   := 'N'; // Reg. 1100 - Ocorreu averba��o (conclus�o) de exporta��o no per�odo:
        IND_CCRF  := 'N'; // Reg. 1200 � Existem informa��es acerca de cr�ditos de ICMS a serem controlados, definidos pela Sefaz:
        IND_COMB  := 'N'; // Reg. 1300 � � comercio varejista de combust�veis:
        IND_USINA := 'N'; // Reg. 1390 � Usinas de a��car e/�lcool � O estabelecimento � produtor de a��car e/ou �lcool carburante:
        IND_VA    := 'N'; // Reg. 1400 � Existem informa��es a serem prestadas neste registro e o registro � obrigat�rio em sua Unidade da Federa��o:
        IND_EE    := 'N'; // Reg. 1500 - A empresa � distribuidora de energia e ocorreu fornecimento de energia el�trica para consumidores de outra UF:
        IND_CART  := 'N'; // Reg. 1600 - Realizou vendas com Cart�o de Cr�dito ou de d�bito:
        IND_FORM  := 'N'; // Reg. 1700 - � obrigat�rio em sua unidade da federa��o o controle de utiliza��o de documentos  fiscais em papel:
        IND_AER   := 'N'; // Reg. 1800 � A empresa prestou servi�os de transporte a�reo de cargas e de passageiros:
        IND_GIAF1 := ifthen(cbEstado.Text = 'PE', 'S', 'N');
        IND_GIAF3 := ifthen(cbEstado.Text = 'PE', 'S', 'N');
        IND_GIAF4 := 'N';
      end;

      with Registro1960New do
      begin
        IND_AP := '1';
        G1_01  := 0.15;
        G1_02  := 5;
        G1_03  := 0.6;
        G1_04  := 0;
        G1_05  := 0;
        G1_06  := 0;
        G1_07  := 0;
        G1_08  := 0;
        G1_09  := 0;
        G1_10  := 0;
        G1_11  := 0;
      end;

      with Registro1970New do
      begin
        IND_AP := '12';
        G3_01  := 1.15;
        G3_02  := 25;
        G3_03  := 0.6;
        G3_04  := 0;
        G3_05  := 0;
        G3_06  := 3;
        G3_07  := 0;
        G3_T   := 0;
        G3_08  := 0;
        G3_09  := 0;
        with Registro1975new do
        begin
          ALIQ_IMP_BASE := 3.5;
          G3_10         := 0.15;
          G3_11         := 6;
          G3_12         := 2;
        end;
        with Registro1975new do
        begin
          ALIQ_IMP_BASE := 10;
          G3_10         := 19;
          G3_11         := 0;
          G3_12         := 3;
        end;
      end;
      with Registro1970New do
      begin
        IND_AP := '10';
        G3_01  := 25;
        G3_02  := 125;
        G3_03  := 3.6;
        G3_04  := 0;
        G3_05  := 0;
        G3_06  := 3;
        G3_07  := 0;
        G3_T   := 0;
        G3_08  := 0;
        G3_09  := 0;
        with Registro1975new do
        begin
          ALIQ_IMP_BASE := 3.5;
          G3_10         := 125;
          G3_11         := 25;
          G3_12         := 3.6;
        end;
      end;


    end;
  end;

  if cbConcomitante.Checked then
  begin
    ACBrSPEDFiscal1.WriteBloco_1;
    LoadToMemo;
  end;
end;

procedure TFrmSPEDFiscal.btnB_CClick(Sender: TObject);
var
  INotas: integer;
  IItens: integer;
  NNotas: integer;
  BNotas: integer;
begin
  // Alimenta o componente com informa��es para gerar todos os registros do
  // Bloco C.
  btnB_C.Enabled := False;
  btnB_D.Enabled := True;

  NNotas := StrToInt64Def(edNotas.Text, 1);
  BNotas := StrToInt64Def(edBufNotas.Text, 1);

  ProgressBar1.Visible := cbConcomitante.Checked;
  ProgressBar1.Max := NNotas;
  ProgressBar1.Position := 0;

  with ACBrSPEDFiscal1.Bloco_C do
  begin
    with RegistroC001New do
    begin
      IND_MOV := imComDados;
      //
      QNotas:= TUniQuery.Create(nil);
      RepositorioNotas := TFabricaNotas.create();
      QNotas:=RepositorioNotas.ListarSaidas(Inicial.Date,final.Date);
      Participantes:= TParticipante.create();
      QParticipantes := TUniQuery.Create(Nil);
      if Not QNotas.isEmpty then
        begin
        QNotas.First;
      while Not QNotas.eof do
      begin
        with RegistroC100New do
        begin
        if QNotas.FieldByName('Tipo').AsString <> 'Terceiros' then
        begin
          IND_OPER := tpSaidaPrestacao;
          IND_EMIT := edEmissaoPropria;
        end
        else
        begin
          IND_OPER := tpEntradaAquisicao;
          IND_EMIT := edTerceiros;
        end;


          COD_PART :=  (Participantes.LocalizarParticipantePorCNPJ(QNotas.FieldByName('CNPJ').AsString));

          if QNotas.FieldByName('Tipo').AsString = 'Terceiros' then
            COD_MOD := '55'
          else
            COD_MOD := QNotas.FieldByName('Tipo').AsString;

          COD_SIT := sdRegular;
          SER := FloatToStr(QNotas.FieldByName('SERIE').AsFloat);
          NUM_DOC := QNotas.FieldByName('CNF').AsString;
          CHV_NFE := QNotas.FieldByName('CHAVE').AsString;
          DT_DOC := QNotas.FieldByName('DHEMI').AsDateTime;
          DT_E_S := QNotas.FieldByName('DHSAIENT').AsDateTime;
          VL_DOC := QNotas.FieldByName('VNF').AsFloat;
          IND_PGTO := tpVista;
          VL_DESC := QNotas.FieldByName('VDESC').AsFloat;
          VL_ABAT_NT := 0;
          VL_MERC := QNotas.FieldByName('VPROD').AsFloat;
          IND_FRT := tfSemCobrancaFrete;
          VL_SEG := QNotas.FieldByName('VSEG').AsFloat;
          VL_OUT_DA := QNotas.FieldByName('VOUTRO').AsFloat;
          VL_BC_ICMS := QNotas.FieldByName('VBC').AsFloat;
          VL_ICMS := QNotas.FieldByName('VICMS').AsFloat;
          VL_BC_ICMS_ST := QNotas.FieldByName('VBCST').AsFloat;
          VL_ICMS_ST := QNotas.FieldByName('VST').AsFloat;
          VL_IPI := QNotas.FieldByName('VIPI').AsFloat;
          VL_PIS := QNotas.FieldByName('VPIS').AsFloat;
          VL_COFINS := QNotas.FieldByName('VCOFINS').AsFloat;
          VL_PIS_ST :=  0;
          VL_COFINS_ST := 0;


          { Gera registros espec�ficos para notas emitidas por terceiros }
           if QNotas.FieldByName('Tipo').AsString = 'Terceiros' then
          begin
            With RegistroC110New do
            begin
              COD_INF := 'S/'+QNotas.FieldByName('ID').AsString;
              TXT_COMPL := QNotas.FieldByName('COMPLEMENTAR').AsString;

              {
              with RegistroC113New do
              begin
                IND_OPER := tpEntradaAquisicao;
                IND_EMIT := edEmissaoPropria;
                COD_PART := '2';
                COD_MOD := '01';
                SER := '1';
                SUB := '1';
                NUM_DOC := '333';
                DT_DOC := StrToDate('02/11/' + IntToStr(YearOf(DtRef.Date)));
              end;
//              with RegistroC114New do
//              begin
//                COD_MOD := 'a';
//              end;
}
            end;

          end;

          { Gera o registro de importa��o apenas para notas de entrada }
          {
          if IND_OPER = tpEntradaAquisicao then
          begin
            with RegistroC120New do
            begin
              COD_DOC_IMP := diSimplificadaImport;
              NUM_DOC__IMP := '1024879531';
              PIS_IMP := 0.00;
              COFINS_IMP := 0.00;
              NUM_ACDRAW := '';
            end;
          end;
              }
          { Gera registros espec�ficos para notas emitidas por terceiros e de presta��o }
         {
          if (IND_EMIT = edTerceiros) and (IND_OPER = tpSaidaPrestacao) then
          begin
            with RegistroC130New do
            begin
              VL_SERV_NT := 10.12;
              VL_BC_ISSQN := 10.12;
              VL_ISSQN := 10.12;
              VL_BC_IRRF := 10.12;
              VL_IRRF := 10.12;
              VL_BC_PREV := 10.12;
              VL_PREV := 10.12;
            end;
          end;

           }
          // REGISTRO C170: ITENS DO DOCUMENTO (C�DIGO 01, 1B, 04 e 55).
          QItens := TUniQuery.Create(Nil);
          itens := TItens.create();

          if QNotas.FieldByName('TIPO').AsString ='Terceiros' then
           QItens := Itens.Listar(QNotas.FieldByName('ID').AsInteger,'S')
           else
           QItens := Itens.Listar(QNotas.FieldByName('ID').AsInteger,'E');

          for IItens := 1 to 10 do
          begin
            with RegistroC170New do // Inicio Adicionar os Itens:
            begin
              NUM_ITEM := FormatFloat('000', IItens);
              COD_ITEM := FormatFloat('000000', StrToInt(NUM_ITEM));
              //DESCR_COMPL := 'Nota:'FormatFloat('11000000', INotas) + ' -> ITEM ' + COD_ITEM;
              DESCR_COMPL := 'DESCRI��O Complementar DO ITEM' + FormatFloat('000000', IItens);
              QTD := 1;
              UNID := 'UN';
              VL_ITEM := 1;
              VL_DESC := 0;
              IND_MOV := mfNao;
              CST_ICMS := '010';
              CFOP := '1102';
              COD_NAT := '99991'; //0400
              VL_BC_ICMS := 1;
              ALIQ_ICMS := 17;
              VL_ICMS := 0.17;
              VL_BC_ICMS_ST := 0;
              ALIQ_ST := 0;
              VL_ICMS_ST := 0;
              IND_APUR := iaMensal;
              CST_IPI := CstIpiToStr(stipiEntradaIsenta);
              COD_ENQ := '';
              VL_BC_IPI := 0;
              ALIQ_IPI := 0;
              VL_IPI := 0;
              CST_PIS := CstPisToStr(stpisOutrasOperacoes);
              VL_BC_PIS := 0;
              ALIQ_PIS_PERC := 0;
              QUANT_BC_PIS := 0;
              ALIQ_PIS_R := 0;
              VL_PIS := 0;
              CST_COFINS := CstCofinsToStr(stcofinsOutrasOperacoes);
              VL_BC_COFINS := 0;
              ALIQ_COFINS_PERC := 0;
              QUANT_BC_COFINS := 0;
              ALIQ_COFINS_R := 0;
              VL_COFINS := 0;
              COD_CTA := '000';
              VL_ABAT_NT := 1.39;

              //REGISTRO C171: ARMAZENAMENTO DE COMBUSTIVEIS (c�digo 01, 55)
              { S� gera para opera��es de aquisi��o }
//              if IND_OPER = tpEntradaAquisicao then
//              begin
//                with RegistroC171New do
//                begin
//                  NUM_TANQUE := '115';
//                  QTDE := 1.00;
//                end;
//              end;

              //REGISTRO C176: RESSARCIMENTO DE ICMS EM OPERA��ES COM
              //SUBSTITUI��O TRIBUT�RIA (C�DIGO 01, 55).
//              with RegistroC176New do
//              begin
//                COD_MOD_ULT_E := '55';
//                NUM_DOC_ULT_E := '124567';
//                SER_ULT_E := '1';
//                DT_ULT_E := Now;
//                COD_PART_ULT_E := '000001';
//                QUANT_ULT_E := 10.00;
//                VL_UNIT_ULT_E := 1.00;
//                VL_UNIT_BC_ST := 5.00;
//              end;
            end; // Fim dos Itens;
          end;

          // REGISTRO C190: REGISTRO ANAL�TICO DO DOCUMENTO (C�DIGO 01, 1B, 04 E 55).
          for IItens := 1 to 1 do
          begin
            with RegistroC190New do
            begin
              CST_ICMS := '010';
              CFOP := '1102';
              ALIQ_ICMS := 17;
              VL_OPR := 0;
              VL_BC_ICMS := 10;
              VL_ICMS := 1.7;
              VL_BC_ICMS_ST := 0;
              VL_ICMS_ST := 0;
              VL_RED_BC := 0;
              VL_IPI := 0;
              COD_OBS := '000001';
              // REGISTRO C191: INFORMA��ES DO FUNDO DE COMBATE � POBREZA � FCP � NA NFe (C�DIGO 55)
              with RegistroC191New do
              begin
                VL_FCP_OP :=  0.34;
                VL_FCP_ST :=  0;
                VL_FCP_RET := 0;
              end; // Fim dos Itens;
            end; // Fim dos Itens;
          end;


        end;

        if cbConcomitante.Checked then
        begin
          if (INotas mod BNotas) = 0 then // Gravar a cada N notas
          begin
            // Grava registros na memoria para o TXT, e limpa memoria
            ACBrSPEDFiscal1.WriteBloco_C(False); // False, NAO fecha o Bloco
            ProgressBar1.Position := INotas;
            Application.ProcessMessages;
          end;
        end;

        QNotas.Next;
      end;

      //REGISTRO C400 - EQUIPAMENTO ECF (C�DIGO 02 e 2D).
      With RegistroC400New do
      begin
        COD_MOD := '2D';
        ECF_MOD := 'DARUMA FS600';
        ECF_FAB := '21098765432123456789';
        ECF_CX := '001';

        With RegistroC405New do
        begin
          DT_DOC := DT_FIN; //StrToDate('30/11/2014');
          CRO := 1;
          CRZ := 1;
          NUM_COO_FIN := 1;
          GT_FIN := 100.00;
          VL_BRT := 100.00;

          With RegistroC410New do
          begin
            VL_PIS := 0.00;
            VL_COFINS := 0.00;
          end;

          With RegistroC420New do
          begin
            COD_TOT_PAR := 'T1700';
            VLR_ACUM_TOT := 100.00;
            NR_TOT := 1;
            DESCR_NR_TOT := 'TOTALIZADOR T1700';

            { Gera este registro somente para empresas do pergil B de apresenta��o }
            if Bloco_0.Registro0000.IND_PERFIL = pfPerfilB then
            begin
              With RegistroC425New do
              begin
                COD_ITEM := FCod_Item;
                QTD := 1;
                UNID := 'PC';
                VL_ITEM := 100.00;
                VL_PIS := 0.00;
                VL_COFINS := 0.00;
              end;
            end;
          end;

          if Bloco_0.Registro0000.IND_PERFIL <> pfPerfilB then
          begin
            with REgistroC460New do
            begin
              COD_MOD := '2D';
              COD_SIT := sdRegular;
              NUM_DOC := '000001';
              DT_DOC := ACBrSPEDFiscal1.DT_FIN;
              VL_DOC := 100.00;
              VL_PIS := 0.00;
              VL_COFINS := 0.00;
              CPF_CNPJ := '12345678909';
              NOM_ADQ := 'TESTE';

              with RegistroC470New do
              begin
                COD_ITEM := FCod_Item;
                QTD := 1;
                QTD_CANC := 0;
                UNID := 'UN';
                VL_ITEM := 100.00;
                CST_ICMS := '000';
                CFOP := '5102';
                ALIQ_ICMS := 17.00;
                VL_PIS := 0.00;
                VL_COFINS := 0.00;
              end;
            end;
          end;

          with RegistroC490New do
          begin
            CST_ICMS := '000';
            CFOP := '5102';
            ALIQ_ICMS := 17.00;
            VL_OPR := 100.00;
            VL_BC_ICMS := 100.00;
            VL_ICMS := 17.00;
            COD_OBS := '000001'
          end;

          { S� envia este registro se o contribuinte for da BA }
          if Bloco_0.Registro0000.UF = 'BA' then
          begin
            with RegistroC495New do
            begin
              ALIQ_ICMS := 17.00;
              COD_ITEM := FCod_Item;
              QTD := 1.00;
              QTD_CANC := 0.00;
              UNID := 'UN';
              VL_ITEM := 100.00;
              VL_DESC := 0.00;
              VL_CANC := 0.00;
              VL_ACMO := 0.00;
              VL_BC_ICMS := 100.00;
              VL_ICMS := 17.00;
              VL_ISEN := 0.00;
              VL_ICMS_ST := 0.00;
            end;
          end;
        end;
      end;

    end;
  end;
  end;

  if cbConcomitante.Checked then
  begin
    ACBrSPEDFiscal1.WriteBloco_C(True); // True, fecha o Bloco
    LoadToMemo;
  end;

  ProgressBar1.Visible := False;


end;

procedure TFrmSPEDFiscal.btnB_CompletoClick(Sender: TObject);
begin
  btnB_0Click(Self);
  btnB_BClick(Self);
  btnB_CClick(Self);
  btnB_DClick(Self);
  btnB_EClick(Self);
  btnB_GClick(Self);
  btnB_HClick(Self);
  btnB_KClick(Self);
  btnB_1Click(Self);
end;

procedure TFrmSPEDFiscal.btnB_DClick(Sender: TObject);
begin
  btnB_D.Enabled := False;
  btnB_E.Enabled := True;

  // Alimenta o componente com informa��es para gerar todos os registros do Bloco D.
  with ACBrSPEDFiscal1.Bloco_D do
  begin
    with RegistroD001New do
    begin
      IND_MOV := imComDados;

      with RegistroD100New do
      begin
        IND_OPER := tpEntradaAquisicao;
        IND_EMIT := edTerceiros;
        COD_PART := '3';
        COD_MOD := '08';
        COD_SIT := sdRegular;
        SER := '1';
        NUM_DOC := '012345';
        CHV_CTE := '';
        DT_DOC := DT_FIN - 1;
        DT_A_P := DT_FIN - 1;
        TP_CT_e := '1';
        VL_DOC := 100.00;
        VL_DESC := 0.00;
        IND_FRT := tfPorContaEmitente;
        VL_SERV := 100.00;
        VL_BC_ICMS := 100.00;
        VL_ICMS := 17.00;
        VL_NT := 10.10;
        COD_INF := '000001';
        COD_CTA := '111';
      end;

      with RegistroD190New do
      begin
        CST_ICMS := '000';
        CFOP := '1252';
        ALIQ_ICMS := 17.00;
        VL_OPR := 100.00;
        VL_BC_ICMS := 100.00;
        VL_ICMS := 17.00;
        VL_RED_BC := 0.00;
        COD_OBS := '000001';
      end;
    end;
  end;

  if cbConcomitante.Checked then
  begin
    ACBrSPEDFiscal1.WriteBloco_D;
    LoadToMemo;
  end;
end;

procedure TFrmSPEDFiscal.btnB_EClick(Sender: TObject);
const
  ESTADOS: array [0 .. 1] of String = ('RS', 'SC');
var
  I: Integer;
begin
  // Alimenta o componente com informa��es para gerar todos os registros do Bloco E.
  btnB_E.Enabled := False;
  btnB_G.Enabled := True;

  with ACBrSPEDFiscal1.Bloco_E do
  begin
    with RegistroE001New do
    begin
      IND_MOV := imComDados;

      with RegistroE100New do
      begin
        DT_INI := ACBrSPEDFiscal1.DT_INI;
        DT_FIN := ACBrSPEDFiscal1.DT_FIN;

        with RegistroE110New do
        begin
          VL_TOT_DEBITOS := 17.00;
          VL_AJ_DEBITOS := 0.00;
          VL_TOT_AJ_DEBITOS := 0.00;
          VL_ESTORNOS_CRED := 0;
          VL_TOT_CREDITOS := 20.4;
          VL_AJ_CREDITOS := 0;
          VL_TOT_AJ_CREDITOS := 0;
          VL_ESTORNOS_DEB := 0;
          VL_SLD_CREDOR_ANT := 0;
          VL_SLD_APURADO := 0.00;
          VL_TOT_DED := 0.00;
          VL_ICMS_RECOLHER := 0.00;
          VL_SLD_CREDOR_TRANSPORTAR := 3.4;
          DEB_ESP := 0;

          // with RegistroE111New do begin
          // COD_AJ_APUR    := 'RS009999';
          // DESCR_COMPL_AJ := '';
          // VL_AJ_APUR     := 1.00;
          //
          // with RegistroE112New do begin
          // NUM_DA    := '123';
          // NUM_PROC  := '123';
          // IND_PROC  := opOutros;
          // PROC      := 'DESCRI��O RESUMIDA';
          // TXT_COMPL := 'COMPLEMENTO';
          // end;
          //
          // with RegistroE113New do begin
          // COD_PART := '000001';
          // COD_MOD  := '01';
          // SER      := 'SERI';
          // SUB      := '';
          // NUM_DOC  := '123456789';
          // DT_DOC   := Now;
          // COD_ITEM := '000001';
          // VL_AJ_ITEM := 0;
          // end;
          // end;

          { Rio Grande do Sul n�o possui as tabelas do registro E115, ent�o este n�o precisa ser gerado }
          // with RegistroE115New do begin
          // COD_INF_ADIC   := 'RS000001';
          // VL_INF_ADIC    := 0;
          // DESCR_COMPL_AJ := '';
          // end;

          with RegistroE116New do
          begin
            COD_OR := '000';
            VL_OR := 0;
            DT_VCTO := Now;
            COD_REC := '0057';
            NUM_PROC := '10';
            IND_PROC := opSefaz;
            PROC := 'DESCRI��O DO PROCESSO';
            TXT_COMPL := '';
            MES_REF := '112011';
          end;
        end;
      end;

      { Gera um registro E200 e filhos para cada estado onde o contribuinte possui inscri��o estadual }
      for I := Low(ESTADOS) to High(ESTADOS) do
      begin
        with RegistroE200New do
        begin
          DT_INI := ACBrSPEDFiscal1.DT_INI;
          DT_FIN := ACBrSPEDFiscal1.DT_FIN;
          UF := ESTADOS[I];

          with RegistroE210New do
          begin
            IND_MOV_ST := mstSemOperacaoST;
            VL_SLD_CRED_ANT_ST := 0;
            VL_DEVOL_ST := 0;
            VL_RESSARC_ST := 0;
            VL_OUT_CRED_ST := 0;
            VL_AJ_CREDITOS_ST := 0;
            VL_SLD_DEV_ANT_ST := 0.00;
            VL_DEDUCOES_ST := 0;
            VL_ICMS_RECOL_ST := 0.00;
            VL_SLD_CRED_ST_TRANSPORTAR := 0;
            VL_OUT_DEB_ST := 0.00;
            DEB_ESP_ST := 0;

            // with RegistroE220New do begin
            // COD_AJ_APUR    := 'RS109999';
            // DESCR_COMPL_AJ := '';
            // VL_AJ_APUR     := 0.00;
            //
            // with RegistroE230New do begin
            // NUM_DA    := '123';
            // NUM_PROC  := '123';
            // IND_PROC  := opOutros;
            // PROC      := 'DESCRI��O RESUMIDA';
            // TXT_COMPL := 'COMPLEMENTO';
            // end;
            //
            // with RegistroE240New do begin
            // COD_PART   := '000001';
            // COD_MOD    := '01';
            // SER        := 'SERI';
            // SUB        := '';
            // NUM_DOC    := '123456789';
            // DT_DOC     := Now;
            // COD_ITEM   := '000001';
            // VL_AJ_ITEM := 0;
            // end;
            // end;

            with RegistroE250New do
            begin
              COD_OR := '001';
              VL_OR := 0;
              DT_VCTO := Now;
              COD_REC := '600016';
              NUM_PROC := '1020304050';
              IND_PROC := opOutros;
              PROC := 'DESCRI��O RESUMIDA';
              TXT_COMPL := '';
              MES_REF := '112011';
            end;
          end;
        end;
      end;


      //S� deve gerar o bloco E em caso de atividades Industriais
      if ACBrSPEDFiscal1.Bloco_0.Registro0000.IND_ATIV = atIndustrial then
      begin
        with RegistroE500New do
        begin
          IND_APUR := iaMensal;
          DT_INI := ACBrSPEDFiscal1.DT_INI;
          DT_FIN := ACBrSPEDFiscal1.DT_FIN;

          with RegistroE510New do
          begin
            CFOP := '5120';
            CST_IPI := '50';
            VL_CONT_IPI := 0;
            VL_BC_IPI := 0;
            VL_IPI := 0;
          end;

          with RegistroE520New do
          begin
            VL_SD_ANT_IPI := 0;
            VL_DEB_IPI := 0;
            VL_CRED_IPI := 0;
            VL_OD_IPI := 10.00;
            VL_OC_IPI := 0;
            VL_SC_IPI := 0;
            VL_SD_IPI := 10.00;

            with RegistroE530New do
            begin
              IND_AJ := ajDebito;
              VL_AJ := 10;
              COD_AJ := '001';
              IND_DOC := odOutros;
              NUM_DOC := '123';
              DESCR_AJ := 'DESCRI��O DETALHADA';
            end;
          end;
          { fim registro E500 }
        end;
      end;
    end;
  end;

  if cbConcomitante.Checked then
  begin
    ACBrSPEDFiscal1.WriteBloco_E;
    LoadToMemo;
  end;
end;

procedure TFrmSPEDFiscal.btnB_GClick(Sender: TObject);
begin
  btnB_G.Enabled := False;
  btnB_H.Enabled := True;

  // Alimenta o componente com informa��es para gerar todos os registros do Bloco G.
  with ACBrSPEDFiscal1.Bloco_G do
  begin
    with RegistroG001New do
    begin
      IND_MOV := imComDados;

      With RegistroG110New do
      begin
        DT_INI := ACBrSPEDFiscal1.DT_INI;
        DT_FIN := ACBrSPEDFiscal1.DT_FIN;
        SALDO_IN_ICMS := 44.00;
        SOM_PARC := 4.40;
        VL_TRIB_EXP := 10.999;
        VL_TOTAL := 10.999;
        IND_PER_SAI := 1.00;
        ICMS_APROP := 4.40;
        SOM_ICMS_OC := 10.999;

        With RegistroG125New do
        begin
          COD_IND_BEM := '000001';
          DT_MOV := ACBrSPEDFiscal1.DT_INI;
          TIPO_MOV := mbcSI;
          VL_IMOB_ICMS_OP := 10.999;
          VL_IMOB_ICMS_ST := 10.999;
          VL_IMOB_ICMS_FRT := 10.999;
          VL_IMOB_ICMS_DIF := 10.999;
          NUM_PARC := 10;
          VL_PARC_PASS := 4.40;

          With RegistroG126New do
          begin
            DT_INI := StrToDate('01/10/' + IntToStr(YearOf(DtRef.Date)));;
            DT_FIN := StrToDate('30/10/' + IntToStr(YearOf(DtRef.Date)));;
            NUM_PARC := 1234;
            VL_PARC_PASS := 10.999;
            VL_TRIB_OC := 10.999;
            VL_TOTAL := 10.999;
            IND_PER_SAI := 1.00;
            VL_PARC_APROP := 10.999;
          end;

          With RegistroG130New do
          begin
            IND_EMIT := edEmissaoPropria;
            COD_PART := '4';
            COD_MOD := '55';
            SERIE := '1';
            NUM_DOC := '000068849';
            CHV_NFE_CTE := '35100260318797000100550010000688490882775007';
            DT_DOC := DT_INI;

            With RegistroG140New do
            begin
              NUM_ITEM := '9999';
              COD_ITEM := FCod_Item;
            end;
          end;
        end;
      end;
    end;
  end;

  if cbConcomitante.Checked then
  begin
    ACBrSPEDFiscal1.WriteBloco_G;
    LoadToMemo;
  end;

end;

procedure TFrmSPEDFiscal.btnB_HClick(Sender: TObject);
var
  IInvent: integer;
begin
  btnB_H.Enabled := False;
  btnB_K.Enabled := True;

  // Alimenta o componente com informa��es para gerar todos os registros do
  // Bloco H.
  with ACBrSPEDFiscal1.Bloco_H do
  begin
    with RegistroH001New do
    begin
      IND_MOV := imComDados;
      //
      with RegistroH005New do
      begin
        DT_INV := DT_FIN; //o valor informado no campo deve ser menor ou igual ao valor no campo DT_FIN do registro 0000
        VL_INV := 1000;
        // FILHO
        for IInvent := 1 to 10 do
        begin
          with RegistroH010New do
          begin
            COD_ITEM := FormatFloat('000000', IInvent);
            UNID := strUNID[IInvent mod (High(strUNID)+1)];
            QTD := 1;
            VL_UNIT := 100;
            VL_ITEM := 100;
            IND_PROP := piInformante;
            COD_PART := '';
            TXT_COMPL := '';
            COD_CTA := '1';

            with RegistroH020New do
            begin
              CST_ICMS := '010';
              BC_ICMS  := 1;
              VL_ICMS := 2;
            end;

          end;
        end;
      end;
    end;
  end;

  if cbConcomitante.Checked then
  begin
    ACBrSPEDFiscal1.WriteBloco_H;
    LoadToMemo;
  end;
end;

procedure TFrmSPEDFiscal.btnB_KClick(Sender: TObject);
begin
  btnB_K.Enabled := False;
  btnB_1.Enabled := True;


  // Alimenta o componente com informa��es para gerar todos os registros do
  // Bloco K.
  with ACBrSPEDFiscal1.Bloco_K do
  begin
    with RegistroK001New do
    begin
      IND_MOV := imComDados;

      with RegistroK100New do
      begin
        DT_INI := ACBrSPEDFiscal1.DT_INI;
        DT_FIN := ACBrSPEDFiscal1.DT_FIN;

        with RegistroK200New do
        begin
          COD_ITEM := FCod_Item;
          QTD := 1;
          IND_EST := estPropInformantePoder;
          COD_PART := '';
          DT_EST := ACBrSPEDFiscal1.DT_FIN;

          with RegistroK220New do
          begin
            DT_MOV := ACBrSPEDFiscal1.DT_INI;
            COD_ITEM_ORI := '000008';
            COD_ITEM_DEST := '000010';
            QTD := 1;
            QTD_DEST := 1;            
          end;
          with RegistroK260New do
          begin
            COD_OP_OS := '00035';
            COD_ITEM  := '00006';
            DT_SAIDA  :=  ACBrSPEDFiscal1.DT_INI;
            QTD_SAIDA :=  1;
            DT_RET    := ACBrSPEDFiscal1.DT_INI;
            QTD_RET   :=  1;
            with RegistroK265New do
            begin
              COD_ITEM := '000008';
              QTD_CONS := 1;
              QTD_RET := 1;
            end;
          end;
        end;
      end;
    end;
  end;

  if cbConcomitante.Checked then
  begin
    ACBrSPEDFiscal1.WriteBloco_K;
    LoadToMemo;
  end;
end;

procedure TFrmSPEDFiscal.edtFileChange(Sender: TObject);
begin
  ACBrSPEDFiscal1.Arquivo := edtFile.Text;
end;

procedure TFrmSPEDFiscal.FormCreate(Sender: TObject);
begin
  Inicial.DateTime := Now;
  final.DateTime := Now;
end;

procedure TFrmSPEDFiscal.LoadToMemo;
begin
  memoTXT.Lines.Clear;
  if FileExists(ACBrSPEDFiscal1.Path + ACBrSPEDFiscal1.Arquivo) then
    memoTXT.Lines.LoadFromFile(ACBrSPEDFiscal1.Path + ACBrSPEDFiscal1.Arquivo);
end;

procedure TFrmSPEDFiscal.cbConcomitanteClick(Sender: TObject);
begin
  btnTXT.Enabled := not cbConcomitante.Checked;
  btnError.Enabled := btnTXT.Enabled;

  edBufNotas.Enabled := cbConcomitante.Checked;

  if not cbConcomitante.Checked then
  begin
    btnB_0.Enabled := True;
    btnB_C.Enabled := False;
    btnB_D.Enabled := False;
    btnB_E.Enabled := False;
    btnB_H.Enabled := False;
    btnB_K.Enabled := False;
    btnB_1.Enabled := False;
    btnB_9.Enabled := False;
  end;
end;

end.
