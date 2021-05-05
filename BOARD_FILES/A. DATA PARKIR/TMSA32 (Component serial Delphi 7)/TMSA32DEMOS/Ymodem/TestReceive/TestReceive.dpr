program TestReceive;

uses
  Forms,
  FormMain in 'FormMain.pas' {FrmMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
