program LopesSpedFiscal;

uses
  Vcl.Forms,
  FrmPrincipal in 'Views\FrmPrincipal.pas' {FPrincipal},
  Conexao in 'Dao\Conexao.pas',
  Frmconversor in 'Views\Frmconversor.pas' {FConversor},
  Participante in 'Rep�sit�rio\Participante.pas',
  REntradaRepositorio in 'Rep�sit�rio\REntradaRepositorio.pas',
  Empresa in 'Rep�sit�rio\Empresa.pas',
  CadastroEmpresaView in 'Views\CadastroEmpresaView.pas' {FrmCadastroEmpresa},
  Contador in 'Rep�sit�rio\Contador.pas',
  itens in 'Rep�sit�rio\itens.pas',
  Frm_SPEDFiscal in 'Views\Frm_SPEDFiscal.pas' {FrmSPEDFiscal},
  Frm_SPEDPisCofins in 'Views\Frm_SPEDPisCofins.pas' {FrmSPEDPisCofins},
  CadastroDeContador in 'Views\CadastroDeContador.pas' {frmContador},
  FrmContasContabeis in 'Views\FrmContasContabeis.pas' {FContascontabeis},
  FrmPesquisa in 'Views\FrmPesquisa.pas' {FPesquisa},
  Contascontabeis in 'Rep�sit�rio\Contascontabeis.pas',
  CentroDecustos in 'Rep�sit�rio\CentroDecustos.pas',
  FrmCadCentroDecusto in 'Views\FrmCadCentroDecusto.pas' {CadCentroDecusto},
  Bens in 'Rep�sit�rio\Bens.pas',
  FrmCadBens in 'Views\FrmCadBens.pas' {CadBens};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.Run;
end.
