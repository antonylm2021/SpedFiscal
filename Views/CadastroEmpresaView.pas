unit CadastroEmpresaView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Uni,Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,Empresa;

type
  TFrmCadastroEmpresa = class(TForm)
    LblId: TLabeledEdit;
    LblRazao: TLabeledEdit;
    LblFantasia: TLabeledEdit;
    LblCnpj: TLabeledEdit;
    LblIe: TLabeledEdit;
    LblTelefone: TLabeledEdit;
    LblEndereco: TLabeledEdit;
    LblNumero: TLabeledEdit;
    LblBairro: TLabeledEdit;
    LblCidade: TLabeledEdit;
    LblUf: TLabeledEdit;
    Lblemail: TLabeledEdit;
    Lblcomplemento: TLabeledEdit;
    Lblibge: TLabeledEdit;
    Button1: TButton;
    LblCep: TLabeledEdit;
    procedure AlimentarDados;
    procedure SalvarDados;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AlimentarCampos;
  private
    { Private declarations }
    var
    Empresa :TEmpresa;
    QryEmpresa: Tuniquery;
  public
    { Public declarations }
  end;

var
  FrmCadastroEmpresa: TFrmCadastroEmpresa;

implementation

{$R *.dfm}

{ TFrmCadastroEmpresa }

procedure TFrmCadastroEmpresa.AlimentarCampos;
begin
  LblId.text:= InttoStr(QryEmpresa.Fields[16].AsInteger);
  LblRazao.text := QryEmpresa.Fields[1].AsString;
  LblCnpj.text:= QryEmpresa.Fields[0].AsString;
  LblEndereco.text:= QryEmpresa.Fields[2].AsString;
  Lblcomplemento.text:= QryEmpresa.Fields[4].AsString;
  LblBairro.text:= QryEmpresa.Fields[5].AsString;
  Lblibge.text:= (QryEmpresa.Fields[6].AsString);
  LblCidade.text:= QryEmpresa.Fields[7].AsString;
  LblUf.text:= QryEmpresa.Fields[8].AsString;
  LblCep.text:= QryEmpresa.Fields[9].AsString;
  LblTelefone.text:= QryEmpresa.Fields[12].AsString;
  LblNumero.text:= (QryEmpresa.Fields[3].AsString);
  LblIe.text:= QryEmpresa.Fields[14].AsString;
  Lblemail.text:= QryEmpresa.Fields[15].AsString;
end;

procedure TFrmCadastroEmpresa.AlimentarDados;
begin
  Empresa:= Tempresa.Create;
  Empresa.LXnome := LblRazao.text;
  Empresa.LCNPJ:= LblCnpj.text;
  Empresa.LXlgr:= LblEndereco.text;
  Empresa.LXcpl:= Lblcomplemento.text;
  Empresa.LXBairro:= LblBairro.text;
  if Lblibge.text ='' then
    Empresa.LCMun:=0
  else
    Empresa.LCMun:= StrToInt(Lblibge.text);
  Empresa.LXnum:= LblCidade.text;
  Empresa.LUf:= LblUf.text;
  Empresa.LCep:= lblcep.text;
  Empresa.LcPais:= 33;
  Empresa.LXPais:= 'Brasil';
  Empresa.LFone:= LblTelefone.text;
  Empresa.LIe:= LblIe.Text;
  Empresa.LEmail:=Lblemail.Text;
  Empresa.LId:= StrToInt(LblId.Text);
  if LblNumero.text ='' then
    Empresa.LNro:= 0
  else
    Empresa.LNro:= StrToInt(LblNumero.text);
end;

procedure TFrmCadastroEmpresa.Button1Click(Sender: TObject);
begin
  AlimentarDados();
  SalvarDados();
end;

procedure TFrmCadastroEmpresa.FormShow(Sender: TObject);
begin
  Empresa:= TEmpresa.Create;
  QryEmpresa:= TUniQuery.Create(Nil);
  QryEmpresa:= Empresa.ListarEmpresa();
  if QryEmpresa.RecordCount > 0 then
    AlimentarCampos()
    else
    LblId.Text:= '0';


end;

procedure TFrmCadastroEmpresa.SalvarDados;
begin
  try
  if LblId.Text = '0' then
    begin
    if Empresa.SalvarDadosEmpresa(Empresa) then
      ShowMessage('Cadastro da empresa Salvo com sucesso!')
      else
        ShowMessage('N�o foi poss�vel salvar os dados,Verifique os dados ou a conex�o com a base de dados.');
    end
    else
      begin
        if Empresa.EditarEmpresa(Empresa) then
          ShowMessage('Atualiza��o da empresa Salva com sucesso!')
        else
          ShowMessage('N�o foi poss�vel salvar os dados,Verifique os dados ou a conex�o com a base de dados.');
      end;

    finally
       Empresa.Free;
    end;


end;

end.
