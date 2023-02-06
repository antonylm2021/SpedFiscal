program LopesSpedFiscal;

uses
  Vcl.Forms,
  FrmPrincipal in 'Views\FrmPrincipal.pas' {FPrincipal},
  Conexao in 'Dao\Conexao.pas',
  Frmconversor in 'Views\Frmconversor.pas' {FConversor},
  Participante in 'Repósitório\Participante.pas',
  REntradaRepositorio in 'Repósitório\REntradaRepositorio.pas',
  Empresa in 'Repósitório\Empresa.pas',
  CadastroEmpresaView in 'Views\CadastroEmpresaView.pas' {FrmCadastroEmpresa},
  Contador in 'Repósitório\Contador.pas',
  itens in 'Repósitório\itens.pas',
  Frm_SPEDFiscal in 'Views\Frm_SPEDFiscal.pas' {FrmSPEDFiscal},
  Frm_SPEDPisCofins in 'Views\Frm_SPEDPisCofins.pas' {FrmSPEDPisCofins},
  CadastroDeContador in 'Views\CadastroDeContador.pas' {frmContador},
  FrmContasContabeis in 'Views\FrmContasContabeis.pas' {FContascontabeis},
  FrmPesquisa in 'Views\FrmPesquisa.pas' {FPesquisa},
  Contascontabeis in 'Repósitório\Contascontabeis.pas',
  CentroDecustos in 'Repósitório\CentroDecustos.pas',
  FrmCadCentroDecusto in 'Views\FrmCadCentroDecusto.pas' {CadCentroDecusto},
  Bens in 'Repósitório\Bens.pas',
  FrmCadBens in 'Views\FrmCadBens.pas' {CadBens};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.Run;
end.
