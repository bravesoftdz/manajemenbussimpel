program Bus;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  mnewbus in 'mnewbus.pas' {fNewBus};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Manajemen Bus';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfNewBus, fNewBus);
  Application.Run;
end.
