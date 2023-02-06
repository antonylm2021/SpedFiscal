unit FrmPesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids,Uni,Contascontabeis, MemDS,Bens, DBAccess,CentroDecustos;

type
  TFPesquisa = class(TForm)
    Panel1: TPanel;
    Dbgrid: TDBGrid;
    Pesquisa: TLabeledEdit;
    Dts: TDataSource;
    procedure DbgridCellClick(Column: TColumn);



  private
    { Private declarations }
    var
    TipoPesquisa:string;
    contas:TContascontabeis;
    Qry:Tuniquery;
    Custos:TCentroDecusto;
    Bens: TBens;


  public
    { Public declarations }
    procedure TipoDePesquisa(Tipo:string);
  end;

var
  FPesquisa: TFPesquisa;



implementation

{$R *.dfm}

uses FrmContasContabeis,FrmCadCentroDecusto,FrmCadBens;





{ TFPesquisa }

procedure TFPesquisa.DbgridCellClick(Column: TColumn);
begin
  if TipoPesquisa = 'Contas' then
    FContasContabeis.LocalizarRegistro(Strtoint(Dbgrid.Columns.Items[0].field.text));
  if TipoPesquisa = 'Custo' then
    CadCentroDecusto.LocalizarregistroPorId(Strtoint(Dbgrid.Columns.Items[2].field.text));
  if TipoPesquisa = 'Bens' then
    CadBens.ReceberDados(Strtoint(Dbgrid.Columns.Items[0].field.text));

    Close();
end;

procedure TFPesquisa.TipoDePesquisa(Tipo: string);
begin
  TipoPesquisa:= Tipo;

  if TipoPesquisa= 'Contas' then
    begin
      Contas:= TContascontabeis.Create();
      Qry:=Contas.Listar();
      Dts.DataSet:=Qry;
    end;

     if TipoPesquisa= 'Custo' then
    begin
      Custos:= TCentroDecusto.Create();
      Qry:=Custos.Listarc();
      Dts.DataSet:=Qry;
    end;

    if TipoPesquisa = 'Bens' then
      begin
       Bens:= TBens.Create();
       Qry:=Bens.Listarb();
       Dts.DataSet:=Qry;


      end;

    Self.ShowModal;
end;

end.




