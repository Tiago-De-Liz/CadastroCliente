unit uSServidor;

interface

uses
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.AppEvnts,
  Vcl.StdCtrls,

  Data.DB,

  REST.Json,

  IdContext,
  IdCustomHTTPServer,
  IdHTTPServer,
  IdBaseComponent,
  IdComponent,
  IdTCPConnection,
  IdTCPClient,
  IdHTTP,
  IdCustomTCPServer,

  FireDAC.Stan.StorageBin,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmServerPrincipal = class(TForm)
    FServer: TIdHTTPServer;
    Button1: TButton;
    procedure FServerCommandGet(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    procedure Button1Click(Sender: TObject);
  private
    function URLDecode(Const AStr:String):String;
  public

  end;

var
  frmServerPrincipal: TfrmServerPrincipal;

implementation

{$R *.dfm}

uses
{$IFDEF MSWINDOWS}
  WinApi.Windows, Winapi.ShellApi,
{$ENDIF}
  System.Generics.Collections,

  uSConsulta;

procedure TfrmServerPrincipal.Button1Click(Sender: TObject);
begin
  if (FServer.Active) then
  begin
    Button1.Caption := 'Start';
    FServer.Active  := False;
  end else
  begin
    Button1.Caption := 'Stop';
    FServer.Active  := True;
  end;
end;

procedure TfrmServerPrincipal.FServerCommandGet(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
begin
  try
    if (ARequestInfo.Command = 'GET') then
    begin
      var ConObj := TConsulta.Create;
      try
        if (ARequestInfo.Document = '/ConsultaPessoa') then
        begin
          ConObj.Parametros := URLDecode(ARequestInfo.QueryParams);
          ConObj.RealizarConsultaPessoa;

          AResponseInfo.ContentType   := 'application/octet-stream';
          AResponseInfo.ContentStream := ConObj.Stream;

          AResponseInfo.ResponseNo   := 200;
          AResponseInfo.ResponseText := 'OK';
        end else
        if (ARequestInfo.Document = '/RetornarNewCodigo') then
        begin
          AResponseInfo.ContentText := IntToStr(ConObj.RetornaNewCodigoPessoa);
          AResponseInfo.ContentType := 'text/plain';

          AResponseInfo.ResponseNo   := 200;
          AResponseInfo.ResponseText := 'OK';
        end else
        if (ARequestInfo.Document = '/ExcluirRegistro') then
        begin
          ConObj.Parametros := URLDecode(ARequestInfo.QueryParams);
          ConObj.ExcluirRegistros;

          AResponseInfo.ResponseNo   := 200;
          AResponseInfo.ResponseText := 'OK';
        end else
        if (ARequestInfo.Document = '/RetornaInformacoesTabela') then
        begin
          ConObj.Parametros := URLDecode(ARequestInfo.QueryParams);
          ConObj.RealizarConsultaTabelas;

          AResponseInfo.ContentType   := 'application/octet-stream';
          AResponseInfo.ContentStream := ConObj.Stream;

          AResponseInfo.ResponseNo   := 200;
          AResponseInfo.ResponseText := 'OK';
        end
        else
        begin
          AResponseInfo.ResponseNo   := 400;
          AResponseInfo.ResponseText := 'Procedimento n�o encontrado';
        end;
      finally
        ConObj.Free;
      end;
    end else
    if (ARequestInfo.Command = 'POST') then
    begin
      if (ARequestInfo.Document = '/SalvarRegistro') then
      begin
        var ConObj := TConsulta.Create;
        try
          ConObj.SalvarRegistros(ARequestInfo.PostStream);

          AResponseInfo.ResponseNo   := 200;
          AResponseInfo.ResponseText := 'OK';
        finally
          ConObj.Free;
        end;
      end else
      begin
        AResponseInfo.ResponseNo   := 400;
        AResponseInfo.ResponseText := 'Procedimento n�o encontrado';
      end;
    end else
    begin
      AResponseInfo.ResponseNo   := 400;
      AResponseInfo.ResponseText := 'Procedimento n�o encontrado';
    end;
  except
    on E:exception do
    begin
      AResponseInfo.ResponseNo   := 400;
      AResponseInfo.ResponseText := E.Message;
    end;
  end;
end;

function TfrmServerPrincipal.URLDecode(const AStr: String): String;
var
  I: Integer;
  HexValue: string;
  CharValue: Char;
begin
  Result := '';
  I := 1;
  while I <= Length(AStr) do
  begin
    if AStr[I] = '%' then
    begin
      HexValue := Copy(AStr, I + 1, 2);
      CharValue := Chr(StrToIntDef('$' + HexValue, 0));
      Result := Result + CharValue;
      Inc(I, 3);
    end
    else if AStr[I] = '+' then
    begin
      Result := Result + ' ';
      Inc(I);
    end
    else
    begin
      Result := Result + AStr[I];
      Inc(I);
    end;
  end;
end;

end.
