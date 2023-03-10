unit FrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.Imaging.jpeg,Frmconversor,Frm_SPEDFiscal,CadastroEmpresaView,
  Contascontabeis,FrmContasContabeis,Empresa,FrmCadBens,CadastroDeContador,FrmCadCentroDecusto;

type
  TFPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    ConversorXml1: TMenuItem;
    SpedFiscal1: TMenuItem;
    SpedContribuies1: TMenuItem;
    Cadastro1: TMenuItem;
    Empresa1: TMenuItem;
    Contabilidade1: TMenuItem;
    LimparTabelas1: TMenuItem;
    ContasContabeis1: TMenuItem;
    BensImobilizados1: TMenuItem;
    Centrodecustos1: TMenuItem;
    procedure ConversorXml1Click(Sender: TObject);
    procedure SpedFiscal1Click(Sender: TObject);
    procedure SpedContribuies1Click(Sender: TObject);
    procedure Empresa1Click(Sender: TObject);
    procedure LimparTabelas1Click(Sender: TObject);
    procedure Contabilidade1Click(Sender: TObject);
    procedure ContasContabeis1Click(Sender: TObject);
    procedure Centrodecustos1Click(Sender: TObject);
    procedure BensImobilizados1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.dfm}

uses Frm_SPEDPisCofins;

procedure TFPrincipal.BensImobilizados1Click(Sender: TObject);
begin
  CadBens:= TCadBens.Create(Self);
  CadBens.ShowModal;
  CadBens.Free;
end;

procedure TFPrincipal.Centrodecustos1Click(Sender: TObject);
begin
  CadCentroDecusto:=  TCadCentroDecusto.Create(Self);
  CadCentroDecusto.showmodal;
  CadCentroDecusto.free;
end;

procedure TFPrincipal.Contabilidade1Click(Sender: TObject);
begin
  frmContador := TfrmContador.Create(Self);
  frmContador.ShowModal;
  frmContador.Free;
end;

procedure TFPrincipal.ContasContabeis1Click(Sender: TObject);
begin
  FContasContabeis:= TFContascontabeis.Create(self);
  FContasContabeis.ShowModal;
  FContasContabeis.Free;
end;

procedure TFPrincipal.ConversorXml1Click(Sender: TObject);
begin
  Fconversor := TFConversor.Create(Self);
  FConversor.ShowModal;
  FConversor.Free;
end;

procedure TFPrincipal.Empresa1Click(Sender: TObject);
begin
  FrmCadastroEmpresa:= TFrmCadastroEmpresa.Create(self);
  FrmCadastroEmpresa.ShowModal;
  FrmCadastroEmpresa.Free;
end;

procedure TFPrincipal.LimparTabelas1Click(Sender: TObject);
var
  Empresa: TEmpresa;
  Resposta:string;
begin
  Resposta:= InputBox('Digite SIM caso deseje deletar todos os dados j? importados no sistema','Deletar Tabelas','');
  Empresa:= TEmpresa.Create();
  if Resposta= 'SIM' then
    begin
      Empresa.DeletarDados('SAIDAS');
      Empresa.DeletarDados('ENTRADAS');
      Empresa.DeletarDados('ITENS');
      Empresa.DeletarDados('PARTICIPANTES');
      ShowMessage('Tabelas Deletadas com sucesso!');
    end
    else

end;

procedure TFPrincipal.SpedContribuies1Click(Sender: TObject);
begin

  FrmSPEDPisCofins := TFrmSPEDPisCofins.Create(Self);
  FrmSPEDPisCofins.ShowModal;
  FreeAndNil(FrmSPEDPisCofins)
end;

procedure TFPrincipal.SpedFiscal1Click(Sender: TObject);
begin
  FrmSPEDFiscal := TFrmSPEDFiscal.Create(Self);
  FrmSPEDFiscal.ShowModal;
  FreeAndNil(FrmSPEDFiscal);
end;

end.
