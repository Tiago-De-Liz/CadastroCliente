unit uParametrosJSON;

interface

uses
  System.JSON,
  System.SysUtils;

type
  TParametros = class(TObject)
  private
    FNome: string;
    FTipo:  String;
    FValor: string;
  public
    property Nome:String read FNome write FNome;
    property Tipo:String read FTipo write FTipo;
    property Valor:String read FValor write FValor;
  end;

  TParametrosList = class(TObject)
  private
    FParametros:TArray<TParametros>;
  public
    function ToJSON: string;

    property Parametros:TArray<TParametros> read FParametros write FParametros;
  end;

implementation

{ TParametrosList }

function TParametrosList.ToJSON: string;
var
  JSONArr: TJSONArray;
  ParamObj: TJSONObject;
  FPram: TParametros;
begin
  JSONArr := TJSONArray.Create;
  try
    for FPram in FParametros do
    begin
      ParamObj := TJSONObject.Create;
      ParamObj.AddPair('nome', FPram.Nome);
      ParamObj.AddPair('tipo', FPram.Tipo);
      ParamObj.AddPair('valor', FPram.Valor);
      JSONArr.AddElement(ParamObj);
    end;
    Result := JSONArr.ToString;
  finally
    JSONArr.Free;
  end;
end;

end.
