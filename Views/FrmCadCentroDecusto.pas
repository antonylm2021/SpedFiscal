unit FrmCadCentroDecusto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,FrmPesquisa, Vcl.StdCtrls,Uni,CentroDecustos, Vcl.ExtCtrls;

type
  TCadCentroDecusto = class(TForm)
    LblId: TLabeledEdit;
    nome: TLabeledEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    procedure PassarDados;
    procedure Excluir;
    procedure LimparForm;


    var
    Qry:TUniQuery;
    Custo:TCentroDecusto;
  public
    { Public declarations }
    procedure LocalizarregistroPorId(Id:Integer);
  end;

var
  CadCentroDecusto: TCadCentroDecusto;

implementation

{$R *.dfm}

procedure TCadCentroDecusto.Button1Click(Sender: TObject);
begin
  PassarDados();
  LimparForm();
end;

procedure TCadCentroDecusto.Button2Click(Sender: TObject);
begin
  Excluir();
  LimparForm();
end;

procedure TCadCentroDecusto.Button3Click(Sender: TObject);
begin
  LimparForm();
end;

procedure TCadCentroDecusto.Button4Click(Sender: TObject);
begin
  FPesquisa:= TFPesquisa.Create(Self);
  FPesquisa.TipoDePesquisa('Custo');
  FPesquisa.Free;
end;

procedure TCadCentroDecusto.Excluir;
begin
  Custo:= TCentroDecusto.Create();
  Custo.Excluirc(StrToInt(LblId.text));
end;

procedure TCadCentroDecusto.LimparForm;
begin
  LblId.Text:= '';
  nome.Text:='';
end;



procedure TCadCentroDecusto.LocalizarregistroPorId(Id: Integer);
begin
  Custo:= TCentroDecusto.Create();
  Qry:= TUniQuery.Create(nil);
  Qry:= Custo.ListarPorIdc(id);

  if Not Qry.IsEmpty then
    begin
    try
       LblId.Text:= IntToStr(Qry.FieldByName('ID').AsInteger);
       nome.Text:= Qry.FieldByName('CCUS').AsString;
    finally
      Qry.Free;
      Custo.Free;
    end;
    end;

end;

procedure TCadCentroDecusto.PassarDados;
begin
  Custo:= TCentroDecusto.Create();
  Custo.Nome_Cta:= nome.Text;

  if LblId.Text <> '' then
    begin
        Custo.Editarc(Custo,StrToInt(LblId.Text));
    end
      else
        Custo.Salvarc(Custo);

end;



end.
