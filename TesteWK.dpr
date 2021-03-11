program TesteWK;

uses
  Vcl.Forms,
  TesteWK.View.Service.DM in 'view\services\TesteWK.View.Service.DM.pas' {ServiceDM: TDataModule},
  TesteWK.View.Pages.Index in 'view\pages\TesteWK.View.Pages.Index.pas' {PageIndex},
  TesteWK.View.Service.Utils in 'view\services\TesteWK.View.Service.Utils.pas',
  Vcl.Themes,
  Vcl.Styles,
  TesteWK.View.Service.Consts in 'view\services\TesteWK.View.Service.Consts.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Teste WK';
  Application.CreateForm(TServiceDM, ServiceDM);
  Application.CreateForm(TPageIndex, PageIndex);
  Application.Run;
end.
