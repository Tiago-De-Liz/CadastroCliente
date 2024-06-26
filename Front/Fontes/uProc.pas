unit uProc;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,

  IdHTTP,
  IdURI,
  IdSSLOpenSSL,

  Data.DB,
  DBClient;

type
  TProc = class
    Constructor Create;
    Destructor  Destroy; override;
  private
    FReqProc:TIdHTTP;
    FProcedimento:String;
    FParametros:TStringlist;
    FStream:TMemoryStream;
    FJSonResultado:String;
    FTipoAPI:String;

    function URLEncode(const AStr:String): String;
  public
    procedure Execute;

    property Procedimento:String read FProcedimento write FProcedimento;
    property Parametros:TStringlist read FParametros write FParametros;
    property Stream:TMemoryStream read FStream write FStream;
    property JSonResultado:String read FJSonResultado write FJSonResultado;
    property TipoAPI:String read FTipoAPI write FTipoAPI;
  end;

implementation

uses uParametrosJSON;

{ TProc }

constructor TProc.Create;
begin
  FReqProc    := TIdHTTP.Create(nil);
  FParametros := TStringList.Create;
  Stream      := TMemoryStream.Create;
end;

destructor TProc.Destroy;
begin
  if (Assigned(FReqProc)) then
    FReqProc.Free;

  FParametros.Free;
  Stream.Free;

  inherited;
end;

procedure TProc.Execute;
var URL:String;
begin
  try
    if not (Procedimento <> EmptyStr) then
      raise Exception.Create('Faltou informar o Procedimeto');

    // Requsi��o e procedimento;
    URL := 'http://localhost:2134/'+Procedimento;

    if (FParametros.count > 0) then
    begin
      var Params := TParametrosList.Create;
      try
        var ListObj:TArray<TParametros>;
        SetLength(ListObj,FParametros.Count);
        for var i := 0 to FParametros.Count - 1 do
        begin
          ListObj[i] := TParametros.Create;
          ListObj[i].Nome  := FParametros.Names[i];
          ListObj[i].Valor := FParametros.ValueFromIndex[i];
        end;

        Params.Parametros := ListObj;
        var JSONResult:String := Params.ToJSON;
        if (JSONResult <> EmptyStr) then
          URL := URL + '?' + URLEncode(JSONResult);
      finally
        Params.Free;
      end;
    end;

    if (TipoAPI = 'POSTStream') then
      FReqProc.Post(URL,Stream)
    else
    if (TipoAPI = 'GETResultaJSON') then
      FJSonResultado := FReqProc.Get(URL)
    else
    begin
      Stream.Clear;
      FReqProc.Get(URL,Stream);
      Stream.Position := 0;
    end;
  except
    on E: Exception do
    begin
      Raise Exception.Create(E.Message);
    end;
  end;
end;

function TProc.URLEncode(const AStr:String): String;
const
  UnsafeChars = [' ', '"', '<', '>', '#', '%', '{', '}', '|', '\', '^', '~', '[', ']', '`'];
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(AStr) do
  begin
    if AStr[I] in UnsafeChars then
      Result := Result + '%' + IntToHex(Ord(AStr[I]), 2)
    else
      Result := Result + AStr[I];
  end;
end;

end.
