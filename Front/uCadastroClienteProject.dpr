program uCadastroClienteProject;

uses
  Vcl.Forms,
  uCadastroClientes in 'Fontes\uCadastroClientes.pas' {frnPrincipal},
  Vcl.Themes,
  Vcl.Styles,
  uParametrosJSON in 'Fontes\uParametrosJSON.pas',
  uProc in 'Fontes\uProc.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Cadastro de Clientes';
  TStyleManager.TrySetStyle('Tablet Dark');
  Application.CreateForm(TfrnPrincipal, frnPrincipal);
  Application.Run;
end.
