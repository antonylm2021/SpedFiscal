unit FrmCadBens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, System.StrUtils, Vcl.Dialogs, Contascontabeis,
  Vcl.StdCtrls, Uni, Vcl.ExtCtrls, Bens, FrmPesquisa;

type
  TCadBens = class(TForm)
    lblpatrimonio: TLabeledEdit;
    Cbident: TComboBox;
    Label1: TLabel;
    cbconta: TComboBox;
    Label2: TLabel;
    lblDescricao: TLabeledEdit;
    lblcodprincipal: TLabeledEdit;
    lblParcelas: TLabeledEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    lblid: TLabeledEdit;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    procedure PassarDados;
    procedure LimparForm;
    procedure ReceberDadosDeContas;
    procedure Excluir;

  public
    { Public declarations }
    procedure ReceberDados(Id: Integer);
  end;

var
  CadBens: TCadBens;
  Bens: TBens;
  Qry: Tuniquery;

implementation

{$R *.dfm}
{ TCadBens }

procedure TCadBens.Button1Click(Sender: TObject);
begin
  PassarDados();
  LimparForm();
end;

procedure TCadBens.Button2Click(Sender: TObject);
begin
  Excluir();
end;

procedure TCadBens.Button3Click(Sender: TObject);
begin
  LimparForm();
end;

procedure TCadBens.Button4Click(Sender: TObject);
begin
  FPesquisa := TFPesquisa.Create(Self);
  FPesquisa.TipoDePesquisa('Bens');
  FPesquisa.Free;
end;

procedure TCadBens.Excluir;
begin
  Bens := TBens.Create();
  try
    Bens.Excluirb(StrToInt(lblid.text));
  finally
    Bens.Free;
  end;
end;

procedure TCadBens.FormShow(Sender: TObject);
begin
  ReceberDadosDeContas();
end;

procedure TCadBens.LimparForm;
begin
  lblDescricao.text := '';
  lblpatrimonio.text := '';
  lblParcelas.text := '';
  cbconta.ItemIndex := 0;
  lblcodprincipal.text := '';
  Cbident.ItemIndex := 0;
  lblid.text:= '';
end;

procedure TCadBens.PassarDados;
begin
  Bens := TBens.Create();
  Bens.Descricao := lblDescricao.text;
  Bens.Patrimonio := lblpatrimonio.text;
  Bens.Parcela := lblParcelas.text;
  Bens.Cod_NAT_CC := cbconta.text;
  Bens.Cod_prnc := lblcodprincipal.text;
  Bens.Ind_Cta := Copy(Cbident.text, 0, 1);
  try
    if lblid.text <> '' then
      Bens.Editarb(Bens, StrToInt(lblid.text))
    else
      Bens.Salvarb(Bens);
  finally
    Bens.Free;
  end;
end;

procedure TCadBens.ReceberDados(Id: Integer);
begin
  Qry := Tuniquery.Create(nil);
  Bens := TBens.Create();
  Qry := Bens.ListarPorIdb(Id);

  if Not Qry.IsEmpty then
    try
      lblid.text := Qry.FieldByName('ID').AsString;
      lblDescricao.text := Qry.FieldByName('DESCR_ITEM').AsString;
      lblpatrimonio.text := Qry.FieldByName('COD_IND_BEM').AsString;
      lblParcelas.text := Qry.FieldByName('NR_PARC').AsString;
      lblcodprincipal.text := Qry.FieldByName('COD_PRNC').AsString;

      case AnsiIndexStr(Qry.FieldByName('IDENT_MERC').AsString, ['1', '2']) of
        0:
          Cbident.ItemIndex := 0;
        1:
          Cbident.ItemIndex := 1;
      end;
    finally
      Bens.Free;
      Qry.Free;
    end;
end;

procedure TCadBens.ReceberDadosDeContas;
var
  Contas: TContascontabeis;
begin
  Contas := TContascontabeis.Create();
  Qry := Tuniquery.Create(nil);
  Qry := Contas.Listar();

  if Not Qry.IsEmpty then
  begin
    Qry.First;
    try
      while Not Qry.Eof do
      begin
        cbconta.Items.Add(IntToStr(Qry.FieldByName('ID').AsInteger));
        Qry.Next;
      end;
    finally
      Qry.Free;
      Contas.Free;
      cbconta.ItemIndex := 0;
    end;
  end;

end;

end.
