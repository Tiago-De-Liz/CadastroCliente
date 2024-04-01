unit uQueryPadrao;

interface

uses
  System.SysUtils,
  System.Classes,

  FireDAC.UI.Intf,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.Phys.Intf,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  FireDAC.Stan.Def,

  FireDAC.Phys.PG,
  FireDAC.DApt,
  FireDAC.Stan.Async,

  Data.DB,
  DBClient,

  FireDAC.Comp.Client;

type
  TQueryPadrao = class(TDataModule)
    FDConnection: TFDConnection;
    LinkPG:TFDPhysPgDriverLink;
    QPadrao:TFDQuery;
    FStream:TMemoryStream;
    procedure CreateQueryPadrao(Sender: TObject);
    procedure DestroyQueryPadrao(Sender: TObject);
  private

  public
    function NewSQuery:TFDQuery;
    function CriarConexao:TFDConnection;

    property Stream:TMemoryStream read FStream write FStream;
  end;

implementation

{ TQueryPadrao }

procedure TQueryPadrao.CreateQueryPadrao(Sender: TObject);
begin
  LinkPG :=  TFDPhysPgDriverLink.Create(nil);
  LinkPG.VendorHome := '.\';

  FDConnection := CriarConexao;
  QPadrao      := TFDQuery.Create(nil);
  QPadrao.Connection := FDConnection;

  FStream := TMemoryStream.Create;
end;

function TQueryPadrao.CriarConexao: TFDConnection;
begin
  result            := TFDConnection.Create(nil);
  result.DriverName := 'PG';
  result.Params.Add('Server=localhost');
  result.Params.Add('Database=ERP');
  result.Params.Add('User_Name=postgres');
  result.Params.Add('Password=tiagoliz');
  result.Params.Add('Port=5432');
  result.Connected  := True;
end;

procedure TQueryPadrao.DestroyQueryPadrao(Sender: TObject);
begin
  FDConnection.Connected := False;

  if (Assigned(FDConnection)) then
    FDConnection.Free;

  if (Assigned(LinkPG)) then
    LinkPG.Free;

  if (Assigned(QPadrao)) then
    QPadrao.Free;
end;

function TQueryPadrao.NewSQuery: TFDQuery;
begin
  Result            := TFDQuery.Create(nil);
  Result.Connection := FDConnection;
end;

end.
