unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, VaComm, VaProtocol, VaClasses;

type
  TFrmMain = class(TForm)
    VaComm1: TVaComm;
    VaYModem1: TVaYModem;
    BtnReceive: TButton;
    BtnCancel: TButton;
    Memo1: TMemo;
    Button1: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure VaYModem1PacketEvent(Sender: TObject; Packet,
      ByteCount: Integer);
    procedure BtnReceiveClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure VaYModem1FileInfo(Sender: TObject; const Name: String;
      Size: Integer);
    procedure VaYModem1TransferStart(Sender: TObject);
    procedure VaYModem1TransferEnd(Sender: TObject; ExitCode: Integer);
    procedure VaYModem1Error(Sender: TObject; ErrorCode,
      ErrorCount: Integer);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.DFM}

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  VaComm1.Open;
end;

procedure TFrmMain.BtnReceiveClick(Sender: TObject);
begin
  VaYModem1.Files.Clear;
  VaYModem1.Files.Add(Edit1.Text);
  VaYModem1.Mode := tmUpload;
  VaYModem1.Execute;
end;

procedure TFrmMain.BtnCancelClick(Sender: TObject);
begin
  VaYModem1.Cancel;
end;

procedure TFrmMain.VaYModem1FileInfo(Sender: TObject; const Name: String;
  Size: Integer);
begin
  Memo1.Lines.Add('File '+ Name + ' ' + IntToStr(Size) + ' bytes');
end;

procedure TFrmMain.VaYModem1TransferStart(Sender: TObject);
begin
  Memo1.Lines.Clear;
  Memo1.Lines.Add('Transfer start');
end;

procedure TFrmMain.VaYModem1TransferEnd(Sender: TObject;
  ExitCode: Integer);
begin
  Memo1.Lines.Add('Transfer finished ('+IntToStr(ExitCode)+')');
end;

procedure TFrmMain.VaYModem1PacketEvent(Sender: TObject; Packet,
  ByteCount: Integer);
begin
  Memo1.Lines.Add(Format('Packet %d, %d bytes', [Packet, ByteCount]));
end;

procedure TFrmMain.VaYModem1Error(Sender: TObject; ErrorCode,
  ErrorCount: Integer);
begin
  Memo1.Lines.Add(Format('Error %d, Total %d', [ErrorCode, ErrorCount]));
end;

procedure TFrmMain.Button1Click(Sender: TObject);
begin
  Application.Terminate;
end;


end.
