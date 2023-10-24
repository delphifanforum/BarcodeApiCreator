program BarcodeApiDF;

uses
  Vcl.Forms,
  Main in 'Main.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
