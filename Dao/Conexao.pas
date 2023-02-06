unit Conexao;

interface

uses
Uni,System.SysUtils,System.Classes,Data.Db,DBAccess,MemDs,UniProvider,Data.Win.ADODB,Vcl.Forms,inifiles,pcnconversao,
MySQLUniProvider,Vcl.Dialogs,PostgreSQLUniProvider,InterBaseUniProvider;

Type TConexao = class

public
Conexao: TUniConnection;
MySQLUniProvider1: TMySQLUniProvider;
PostgreSQLUniProvider1:TPostgreSQLUniProvider;
InterBaseUniProvider1:TInterBaseUniProvider;
constructor create(Tipo:string);
destructor destroy;

end;
implementation

{ TConexao }

constructor TConexao.create(Tipo:string);
var
 arqini : tInifile;
 aux:string;
begin
aux:=extractfilepath(application.ExeName) +'config.ini';
arqini:=tinifile.create(aux);

  if(Tipo = 'Web')then
    begin
      Conexao:= TUniConnection.Create(Nil);
      Conexao.ProviderName:=arqini.readString('remoto', 'provedor', '');
      Conexao.Port:= StrToInt(arqini.readString('remoto', 'porta', ''));
      Conexao.Server:= arqini.readString('remoto', 'server', '');
      Conexao.Database:=arqini.readString('remoto', 'database', '');
      Conexao.Username:= arqini.readString('remoto', 'usuario', '');
      Conexao.Password:=arqini.readString('remoto', 'senha', '');
      Conexao.AutoCommit:= True;
      Conexao.Connected:= True;
    end;
    if(Tipo = 'Local')then
    begin
      Conexao:= TUniConnection.Create(Nil);
      Conexao.ProviderName:=arqini.readString('server', 'provedor', '');
      Conexao.Port:= StrToInt(arqini.readString('server', 'porta', ''));
      Conexao.Server:= arqini.readString('server', 'server', '');
      Conexao.Database:=arqini.readString('server', 'database', '');
      Conexao.Username:= arqini.readString('server', 'usuario', '');
      Conexao.Password:=arqini.readString('server', 'senha', '');
      Conexao.AutoCommit:= True;
      Conexao.Connected:= True;
    end;

    arqini.Free;

end;




destructor TConexao.destroy;
begin
  Conexao.Connected:=False;
end;

end.
