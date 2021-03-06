unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, VaClasses, VaComm;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    Button1: TButton;
    GroupBox2: TGroupBox;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Shape2: TShape;
    Label3: TLabel;
    Shape3: TShape;
    GroupBox3: TGroupBox;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    GroupBox4: TGroupBox;
    Memo1: TMemo;
    VaComm1: TVaComm;
    Timer1: TTimer;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Shape4: TShape;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure VaComm1Data(Sender: TObject; Count: Integer);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  IDLE = 0;
  OPEN1 = 1;
  OPEN2 = 2;
  OPEN3 = 3;
  CLOSE1 = 4;
  CLOSE2 = 5;
  CLOSE3 = 6;
  STOP1 = 7;
  STOP2 = 8;
  STOP3 = 9;
  OUT1ON = 10;
  OUT2ON = 11;
  OUT3ON = 12;
  OUT4ON = 13;
  OUT5ON = 14;
  OUT1OFF = 15;
  OUT2OFF = 16;
  OUT3OFF = 17;
  OUT4OFF = 18;
  OUT5OFF = 19;
  INFO = 20;
  TEST = 21;
  
var
  Form1: TForm1;
  SrData : string;
  PortOpened : Boolean;
  Command : Byte;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  PortOpened := False;
  Combobox1.ItemIndex := 0;
  SrData := ''
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  If PortOpened then begin
    Vacomm1.Close;
    PortOpened := False;
    Button1.Caption := 'CONNECT';
    Button2.Enabled := False;
    Button3.Enabled := False;
    Button4.Enabled := False;
    Button5.Enabled := False;
    Button6.Enabled := False;
    Button7.Enabled := False;
    Button8.Enabled := False;
    Button9.Enabled := False;
    Button10.Enabled := False;
    Button11.Enabled := False;
    Button12.Enabled := False;
    Button13.Enabled := False;
    Button14.Enabled := False;
    Button15.Enabled := False;
    Button16.Enabled := False;
    Button17.Enabled := False;
    Button18.Enabled := False;
    Button19.Enabled := False;
    Button20.Enabled := False;
    Button21.Enabled := False;
    Button22.Enabled := False;
    Combobox1.Enabled := True;
  end else begin
    Vacomm1.PortNum := Combobox1.ItemIndex + 1;
    Vacomm1.Open;
    PortOpened := True;
    Button1.Caption := 'CLOSE';
    Button2.Enabled := True;
    Button3.Enabled := True;
    Button4.Enabled := True;
    Button5.Enabled := True;
    Button6.Enabled := True;
    Button7.Enabled := True;
    Button8.Enabled := True;
    Button9.Enabled := True;
    Button10.Enabled := True;
    Button11.Enabled := True;
    Button12.Enabled := True;
    Button13.Enabled := True;
    Button14.Enabled := True;
    Button15.Enabled := True;
    Button16.Enabled := True;
    Button17.Enabled := True;
    Button18.Enabled := True;
    Button19.Enabled := True;
    Button20.Enabled := True;
    Button21.Enabled := True;
    Button22.Enabled := True;
    Combobox1.Enabled := False;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  if Command <> IDLE then begin
    MessageDlg ('Communication error or device not ready!',mtError,[mbOK],0);
  end;
  SrData := '';
  Command := Idle;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Vacomm1.WriteText ('*OPEN1#');
  Command := OPEN1;
  Timer1.Enabled := True;
  SrData := '';
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Vacomm1.WriteText ('*OPEN2#');
  Command := OPEN2;
  Timer1.Enabled := True;
  SrData := '';
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  Vacomm1.WriteText ('*OPEN3#');
  Command := OPEN3;
  Timer1.Enabled := True;
  SrData := '';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Vacomm1.WriteText ('*CLOSE1#');
  Command := CLOSE1;
  Timer1.Enabled := True;
  SrData := '';
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  Vacomm1.WriteText ('*CLOSE2#');
  Command := CLOSE2;
  Timer1.Enabled := True;
  SrData := '';
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  Vacomm1.WriteText ('*CLOSE3#');
  Command := CLOSE3;
  Timer1.Enabled := True;
  SrData := '';
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Vacomm1.WriteText ('*STOP1#');
  Command := STOP1;
  Timer1.Enabled := True;
  SrData := '';
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  Vacomm1.WriteText ('*STOP2#');
  Command := STOP2;
  Timer1.Enabled := True;
  SrData := '';
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  Vacomm1.WriteText ('*STOP3#');
  Command := STOP3;
  Timer1.Enabled := True;
  SrData := '';
end;

procedure TForm1.VaComm1Data(Sender: TObject; Count: Integer);
begin
  Timer1.Enabled := False;
  SrData := SrData + Vacomm1.ReadText;
  if Pos('#',SrData) <> 0 then begin
    if Pos('*IN1ON#',SrData)<>0 then begin
      Label1.Caption := 'INPUT1 ON';
      Shape1.Brush.Color := ClLime;
    end;
    if Pos('*IN2ON#',SrData)<>0 then begin
      Label2.Caption := 'INPUT2 ON';
      Shape2.Brush.Color := ClLime;
    end;
    if Pos('*IN3ON#',SrData)<>0 then begin
      Label3.Caption := 'INPUT3 ON';
      Shape3.Brush.Color := ClLime;
    end;
    if Pos('*IN4ON#',SrData)<>0 then begin
      Label4.Caption := 'INPUT4 ON';
      Shape4.Brush.Color := ClLime;
    end;
    if Pos('*IN1OFF#',SrData)<>0 then begin
      Label1.Caption := 'INPUT1 OFF';
      Shape1.Brush.Color := ClRed;
    end;
    if Pos('*IN2OFF#',SrData)<>0 then begin
      Label2.Caption := 'INPUT2 OFF';
      Shape2.Brush.Color := ClRed;
    end;
    if Pos('*IN3OFF#',SrData)<>0 then begin
      Label3.Caption := 'INPUT3 OFF';
      Shape3.Brush.Color := ClRed;
    end;
    if Pos('*IN4OFF#',SrData)<>0 then begin
      Label4.Caption := 'INPUT4 OFF';
      Shape4.Brush.Color := ClRed;
    end;
    Memo1.Lines.Add (SrDAta);
    Command := IDLE;
    SrData := '';
  end else Timer1.Enabled  := True;
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
  Vacomm1.WriteText ('*OUT1ON#');
  Command := OUT1ON;
  Timer1.Enabled := True;
  SrData := '';
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
  Vacomm1.WriteText ('*OUT2ON#');
  Command := OUT2ON;
  Timer1.Enabled := True;
  SrData := '';
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
  Vacomm1.WriteText ('*OUT3ON#');
  Command := OUT3ON;
  Timer1.Enabled := True;
  SrData := '';
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
  Vacomm1.WriteText ('*OUT4ON#');
  Command := OUT4ON;
  Timer1.Enabled := True;
  SrData := '';
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
  Vacomm1.WriteText ('*OUT5ON#');
  Command := OUT5ON;
  Timer1.Enabled := True;
  SrData := '';
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  Vacomm1.WriteText ('*PING#');
  Command := TEST;
  Timer1.Enabled := True;
  SrData := '';
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
  Vacomm1.WriteText ('*OUT1OFF#');
  Command := OUT1OFF;
  Timer1.Enabled := True;
  SrData := '';
end;

procedure TForm1.Button19Click(Sender: TObject);
begin
  Vacomm1.WriteText ('*OUT2OFF#');
  Command := OUT2OFF;
  Timer1.Enabled := True;
  SrData := '';
end;

procedure TForm1.Button20Click(Sender: TObject);
begin
  Vacomm1.WriteText ('*OUT3OFF#');
  Command := OUT3OFF;
  Timer1.Enabled := True;
  SrData := '';
end;

procedure TForm1.Button21Click(Sender: TObject);
begin
  Vacomm1.WriteText ('*OUT4OFF#');
  Command := OUT4OFF;
  Timer1.Enabled := True;
  SrData := '';
end;

procedure TForm1.Button22Click(Sender: TObject);
begin
  Vacomm1.WriteText ('*OUT5OFF#');
  Command := OUT5OFF;
  Timer1.Enabled := True;
  SrData := '';
end;

procedure TForm1.Button23Click(Sender: TObject);
begin
memo1.clear;
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
  Vacomm1.WriteText ('*STAT#');
  Command := INFO;
  Timer1.Enabled := True;
  SrData := '';
end;

end.
