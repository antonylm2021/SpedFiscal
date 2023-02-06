unit CadastroDeContador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,Contador;

type
  TfrmContador = class(TForm)
    nome: TLabeledEdit;
    crc: TLabeledEdit;
    reg: TLabeledEdit;
    cpf: TLabeledEdit;
    cnpj: TLabeledEdit;
    numero: TLabeledEdit;
    logradouro: TLabeledEdit;
    bairro: TLabeledEdit;
    cidade: TLabeledEdit;
    ibge: TLabeledEdit;
    cep: TLabeledEdit;
    telefone: TLabeledEdit;
    fax: TLabeledEdit;
    email: TLabeledEdit;
    btngravar: TButton;
    complemento: TLabeledEdit;
    procedure btngravarClick(Sender: TObject);
    procedure Deletarcontador;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Editarcontador;
  private
    { Private declarations }

  function GravarContador:boolean;
  public
    { Public declarations }
  end;

var
  frmContador: TfrmContador;


implementation





{$R *.dfm}

{ TForm3 }

procedure TfrmContador.btngravarClick(Sender: TObject);
var
Contador : TContador;
begin
  Contador := TContador.Create;
  Contador := TContador.Create;

  if(Contador.Listar(Contador) = False) then
    begin
      GravarContador;
    end;
    if(Contador.Listar(Contador) = True) then
    begin
      EditarContador;
    end;

end;

procedure TfrmContador.Button1Click(Sender: TObject);
begin
  Deletarcontador;
end;

procedure TfrmContador.Deletarcontador;
var
  Contador : TContador;
begin
   Contador := TContador.Create;
   Contador := Tcontador.Create;

   try
     Contador.lCPF := cpf.Text;
     Contador.Excluir(StrToInt(Contador.LCpf));
   finally
     Contador.Free;


   end;

end;

procedure TfrmContador.Editarcontador;
var
Dados : Tlist;
Contador : TContador;
begin
 Contador := TContador.Create;
  Contador := Tcontador.Create;
 try
   Contador.lNome := nome.Text;
   Contador.lCRC := crc.Text;
   Contador.lCNPJ := cnpj.Text;
   Contador.lCPF := cpf.Text;
   Contador.lEndereco := logradouro.Text;
   Contador.lNumero := strtoint(numero.Text);
   Contador.lBairro := bairro.Text;
   Contador.lComplemento := complemento.text;
   Contador.lReg := reg.Text;
   Contador.lCEP := cep.Text;
   Contador.lCodCidade := StrToInt(ibge.Text);
   Contador.lfone:= telefone.Text;
   Contador.lFax := fax.text;
   Contador.LEamil := email.Text;
   Contador.lCidade := cidade.Text;



   Contador.Editar(Contador);

 finally
   Contador.Free;

 end;
end;

procedure TfrmContador.FormCreate(Sender: TObject);
var
Dados : Tlist;
Contador : TContador;
begin
  Dados := Tlist.Create;
  Contador := TContador.Create;
  Contador := TContador.Create;

  if( Contador.Listar(Contador) = True) then
    begin
     nome.Text := Contador.lNome;
     crc.Text := Contador.lCRC;
     reg.Text := Contador.lReg;
     cpf.TEXT := Contador.lCPF;
     cnpj.Text := Contador.lCNPJ;
     logradouro.Text := Contador.lEndereco;
     numero.Text := IntToStr(Contador.lNumero);
     bairro.Text := Contador.lBairro;
     cidade.Text := Contador.lCidade;
     ibge.Text := IntToStr(Contador.lCodCidade);
     cep.Text := Contador.lCEP;
     complemento.Text := Contador.lComplemento;
     telefone.Text := Contador.lfone;
     fax.Text := Contador.lFax;
     email.Text := Contador.leamil;

    end;




end;

function TfrmContador.GravarContador: boolean;
var
Contador : TContador;
begin
  Contador := TContador.Create;
 try
   Contador.lNome := nome.Text;
   Contador.lCRC := crc.Text;
   Contador.lCNPJ := cnpj.Text;
   Contador.lCPF := cpf.Text;
   Contador.lEndereco := logradouro.Text;
   Contador.lNumero := strtoint(numero.Text);
   Contador.lBairro := bairro.Text;
   Contador.lComplemento := complemento.text;
   Contador.lReg := reg.Text;
   Contador.lCEP := cep.Text;
   Contador.lCodCidade := StrToInt(ibge.Text);
   Contador.lfone := telefone.Text;
   Contador.lFax := fax.text;
   Contador.lEamil := email.Text;
   Contador.lCidade := cidade.Text;



   Contador.SalvarContador(Contador);

 finally
   Contador.Free;

 end;

end;

end.
