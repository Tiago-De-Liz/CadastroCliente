program uServidorProject;
{$APPTYPE GUI}

uses
  Vcl.Forms,
  uSServidor in 'Fontes\uSServidor.pas' {frmServerPrincipal},
  uQueryPadrao in 'Fontes\uQueryPadrao.pas',
  uSConsulta in 'Fontes\uSConsulta.pas',
  uParametrosJSON in '..\Front\Fontes\uParametrosJSON.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmServerPrincipal, frmServerPrincipal);
  Application.Run;
end.
