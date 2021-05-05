unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ScktComp;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Button1: TButton;
    GroupBox2: TGroupBox;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    GroupBox3: TGroupBox;
    Edit3: TEdit;
    Label3: TLabel;
    Button14: TButton;
    Button15: TButton;
    Edit4: TEdit;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    Button16: TButton;
    GroupBox4: TGroupBox;
    Memo1: TMemo;
    Button17: TButton;
    Edit5: TEdit;
    Label5: TLabel;
    Label7: TLabel;
    Button18: TButton;
    GroupBox5: TGroupBox;
    Shape1: TShape;
    Label11: TLabel;
    Label12: TLabel;
    Shape2: TShape;
    Label13: TLabel;
    Shape3: TShape;
    Label14: TLabel;
    Shape4: TShape;
    GroupBox6: TGroupBox;
    Edit8: TEdit;
    Timer1: TTimer;
    ComboBox1: TComboBox;
    Label15: TLabel;
    Edit9: TEdit;
    Label16: TLabel;
    Edit6: TEdit;
    Label6: TLabel;
    Button19: TButton;
    Button20: TButton;
    Button21: TButton;
    GroupBox7: TGroupBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    Label8: TLabel;
    ComboBox2: TComboBox;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Button26: TButton;
    Button27: TButton;
    Button28: TButton;
    Button29: TButton;
    Button30: TButton;
    Button31: TButton;
    Button32: TButton;
    Button33: TButton;
    Button34: TButton;
    GroupBox8: TGroupBox;
    Label9: TLabel;
    ComboBox3: TComboBox;
    Label10: TLabel;
    Button35: TButton;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Timer2: TTimer;
    CheckBox10: TCheckBox;
    Button36: TButton;
    GroupBox9: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    Label23: TLabel;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    Label24: TLabel;
    ComboBox8: TComboBox;
    ComboBox9: TComboBox;
    Label25: TLabel;
    Edit7: TEdit;
    Label26: TLabel;
    Edit10: TEdit;
    Button37: TButton;
    Label27: TLabel;
    ComboBox10: TComboBox;
    CheckBox14: TCheckBox;
    Button38: TButton;
    GroupBox10: TGroupBox;
    ComboBox11: TComboBox;
    Button39: TButton;
    CheckBox15: TCheckBox;
    Label28: TLabel;
    Edit11: TEdit;
    Button40: TButton;
    Button41: TButton;
    Label29: TLabel;
    Edit12: TEdit;
    Label30: TLabel;
    Edit13: TEdit;
    Label31: TLabel;
    Edit14: TEdit;
    Edit15: TEdit;
    Label32: TLabel;
    Edit16: TEdit;
    Label33: TLabel;
    Edit17: TEdit;
    Label34: TLabel;
    Button42: TButton;
    Button43: TButton;
    CheckBox16: TCheckBox;
    Button44: TButton;
    Edit18: TEdit;
    Button45: TButton;
    Label35: TLabel;
    Edit19: TEdit;
    Label36: TLabel;
    Button46: TButton;
    Button47: TButton;
    ComboBox12: TComboBox;
    Label37: TLabel;
    Button48: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ClientSocket1Connect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Disconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure Button17Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
    procedure Button29Click(Sender: TObject);
    procedure Button30Click(Sender: TObject);
    procedure Button31Click(Sender: TObject);
    procedure Button32Click(Sender: TObject);
    procedure Button33Click(Sender: TObject);
    procedure Button34Click(Sender: TObject);
    procedure Button35Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Button36Click(Sender: TObject);
    procedure Button37Click(Sender: TObject);
    procedure Button38Click(Sender: TObject);
    procedure Button39Click(Sender: TObject);
    procedure ComboBox11Change(Sender: TObject);
    procedure Button40Click(Sender: TObject);
    procedure Button41Click(Sender: TObject);
    procedure Button43Click(Sender: TObject);
    procedure Button42Click(Sender: TObject);
    procedure ComboBox4Click(Sender: TObject);
    procedure ComboBox5Click(Sender: TObject);
    procedure Button44Click(Sender: TObject);
    procedure Button45Click(Sender: TObject);
    procedure Button47Click(Sender: TObject);
    procedure Button48Click(Sender: TObject);
    procedure Button46Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Fillzero(num : byte; data : string) : string;
    function CalcCS(data : string) : string;
  end;

const
  Idle = 0;
  Header = Char($A6);
  Footer = Char($A9);
  OUT1ON = 2;
  OUT2ON = 3;
  OUT3ON = 4;
  OUT4ON = 5;
  OUT1OFF = 6;
  OUT2OFF = 7;
  OUT3OFF = 8;
  OUT4OFF = 9;
  OUT1TRIG = 10;
  OUT2TRIG = 11;
  OUT3TRIG = 12;
  OUT4TRIG = 13;
  PLAYTRACK = 14;
  STOPTRACK = 15;
  SENDDISP = 16;
  SENDPR = 17;
  SETCOUNTER = 18;
  SETCAPACITY = 19;
  SETREPLY = 20;
  READREPLY = 21;
  SENDDISPLAY = 22;
  SETPROTOCOLTYPE = 23;
  READID = 24;
  SETID = 25;
  SENDDATETIME = 26;
  SENDPOMESSAGE = 27;
  SENDTEST = 28;
  SENDTEST2 = 29;
  SENDTEST3 = 30;
  SETWG = 31;

var
  Form1: TForm1;
  PortOpened : Boolean;
  SendData : string;
  RxData : string;
  Cmd : Byte;
  SCmd : Byte;
  SocketStatus : byte;
  SendPing : Boolean;
  SendCtr, RcvCtr : Longword;
  protocol : byte;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  protocol := 0;
  PortOpened := False;
  SendData := '';
  RxData := '';
  Cmd := 0;
  SCmd := 0;
  SocketStatus := 0;
  Combobox11.Itemindex := 0;
  Combobox1.ItemIndex := 0;
  Combobox2.ItemIndex := 9;
  Combobox3.ItemIndex := 0;
  Combobox4.ItemIndex := 1;
  Combobox5.ItemIndex := 1;
  Combobox6.ItemIndex := 49;
  Combobox7.ItemIndex := 49;
  Combobox8.ItemIndex := 49;
  Combobox9.ItemIndex := 49;
  Combobox10.ItemIndex := 9;
  Combobox12.ItemIndex := 1;
end;

function TForm1.CalcCS(data : string) : string;
var
b : byte;
cs : byte;
s : string;

begin
  cs := 0;
  for b:=1 to Length(data) do begin
    cs := cs + Ord(data[b]);
  end;
  s := FillZero (3, inttostr(cs));
  result := s;
end;

function TForm1.Fillzero(num : byte; data : string) : string;
var
  b:  byte;

begin
  for b:=1 to (num-length(data)) do begin
    data := '0' + data;
  end;
  result := data;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  case SocketStatus of
    0 : begin // disconnect
      ClientSocket1.Address := Edit1.Text;
      try
        ClientSocket1.Port := strtoint(Edit2.Text);
      except
        MessageDlg('Port number must be 0 - 65535!',mtError,[mbOK],0);
        Edit2.SetFocus;
        Exit;
      end;
      ClientSocket1.Active := True;
      Button1.Caption := 'CONNECTING';
      SocketStatus := 1; // connecting
      Edit1.Enabled := False;
      Edit2.Enabled := False;
    end;
    1 : begin // coneecting
      ClientSocket1.Active := False;
      Button1.Caption := 'CONNECT';
      SocketStatus := 0; // disconnected
    end;
    2 : begin // connected
      ClientSocket1.Active := False;
      Button1.Caption := 'CONNECT';
      SocketStatus := 0; // disconnected
    end;
  end;
end;

procedure TForm1.ClientSocket1Connect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  SocketStatus := 2;
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
  Button23.Enabled := True;
  Button24.Enabled := True;
  Button25.Enabled := True;
  Button26.Enabled := True;
  Button27.Enabled := True;
  Button28.Enabled := True;
  Button29.Enabled := True;
  Button30.Enabled := True;
  Button31.Enabled := True;
  Button32.Enabled := True;
  Button33.Enabled := True;
  Button34.Enabled := True;
  Button35.Enabled := True;
  Button36.Enabled := True;
  Button37.Enabled := True;
  Button38.Enabled := True;
  Button39.Enabled := True;
  Button40.Enabled := True;
  Button41.Enabled := True;
  Button42.Enabled := True;
  Button44.Enabled := True;
  Button45.Enabled := True;
  Button46.Enabled := True;
  Button47.Enabled := True;
  Button48.Enabled := True;
  Groupbox2.Enabled := True;
  Groupbox3.Enabled := True;
  Groupbox7.Enabled := True;

  Edit1.Enabled := False;
  Edit2.Enabled := False;
  memo1.lines.add('Socket connected!');
end;

procedure TForm1.ClientSocket1Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  SocketStatus := 0;
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
  Button18.Enabled := False;
  Button19.Enabled := False;
  Button20.Enabled := False;
  Button21.Enabled := False;
  Button22.Enabled := False;
  Button23.Enabled := False;
  Button24.Enabled := False;
  Button25.Enabled := False;
  Button26.Enabled := False;
  Button27.Enabled := False;
  Button28.Enabled := False;
  Button29.Enabled := False;
  Button30.Enabled := False;
  Button31.Enabled := False;
  Button32.Enabled := False;
  Button33.Enabled := False;
  Button34.Enabled := False;
  Button35.Enabled := False;
  Button36.Enabled := False;
  Button37.Enabled := False;
  Button38.Enabled := False;
  Button39.Enabled := False;
  Button40.Enabled := False;
  Button41.Enabled := False;
  Button42.Enabled := False;
  Button44.Enabled := False;
  Button45.Enabled := False;
  Button46.Enabled := False;
  Button47.Enabled := False;
  Button48.Enabled := False;
  Button35.Caption := 'START';
  SendPing := False;
  Timer2.Enabled := False;
  Edit1.Enabled := True;
  Edit2.Enabled := True;
  memo1.lines.add('Socket disconnected!');
end;

procedure TForm1.ClientSocket1Error(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
var
  error : integer;

begin
  error := ErrorCode;
  ErrorCode := 0;
  Memo1.Lines.add('Connection failed, error ' + inttostr(error));
  SocketStatus := 0;
  Button1.Caption := 'CONNECT';
  Edit1.Enabled := True;
  Edit2.Enabled := True;
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
  Button18.Enabled := False;
  Button19.Enabled := False;
  Button20.Enabled := False;
  Button21.Enabled := False;
  Button22.Enabled := False;
  Button23.Enabled := False;
  Button24.Enabled := False;
  Button25.Enabled := False;
  Button26.Enabled := False;
  Button27.Enabled := False;
  Button28.Enabled := False;
  Button29.Enabled := False;
  Button30.Enabled := False;
  Button31.Enabled := False;
  Button32.Enabled := False;
  Button33.Enabled := False;
  Button34.Enabled := False;
  Button36.Enabled := False;
  Button37.Enabled := False;
  Button38.Enabled := False;
  Button39.Enabled := False;
  Button45.Enabled := False;
  Button46.Enabled := False;
  Button47.Enabled := False;
  if Error = 10060 then memo1.lines.add('IP address not found!');
  if Error = 10061 then memo1.lines.add('Cannot access port!');
  if Error = 10049 then memo1.lines.add('Invalid IP address!');
  memo1.lines.add('Socket disconnected!');
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  if Cmd <> Idle then memo1.Lines.Add ('Timeout : no response!');
  Cmd := Idle;
end;

procedure TForm1.ClientSocket1Read(Sender: TObject;
  Socket: TCustomWinSocket);
var
  s :  string;
  b : byte;
  li : longint;

begin
  Timer1.Enabled := False;
  s := clientsocket1.Socket.ReceiveText;
  memo1.lines.add('RECEIVE: ' + s);
  if Pos(Footer,s)<>0 then begin

    if SendPing then begin
      if pos('PINGOK',s)<>0 then begin
        Inc(RcvCtr);
        label18.caption := inttostr(RcvCtr);
      end;
      if pos('PNG',s)<>0 then begin
        Inc(RcvCtr);
        label18.caption := inttostr(RcvCtr);
      end;
    end;

    Case Cmd of
      READREPLY : begin
        Memo1.Lines.Add('Read resend success!');
        b := (ord(s[5])-$30)*10;
        b := b + ord(s[6])-$30;
        b:=b-1;
        if b>19 then b:=0;
        combobox2.itemindex := b;
        if s[7]='1' then checkbox2.Checked := true else checkbox2.checked := false;
        if s[8]='1' then checkbox3.Checked := true else checkbox3.checked := false;
        if s[9]='1' then checkbox4.Checked := true else checkbox4.checked := false;
        if s[10]='1' then checkbox5.Checked := true else checkbox5.checked := false;
        if s[11]='1' then checkbox9.Checked := true else checkbox9.checked := false;
        if s[12]='1' then checkbox8.Checked := true else checkbox8.checked := false;
        if s[13]='1' then checkbox7.Checked := true else checkbox7.checked := false;
        if s[14]='1' then checkbox6.Checked := true else checkbox6.checked := false;
        if s[15]='1' then checkbox13.Checked := true else checkbox13.checked := false;
        if s[16]='1' then checkbox12.Checked := true else checkbox12.checked := false;
        if s[17]='1' then checkbox11.Checked := true else checkbox11.checked := false;
        if s[18]='1' then checkbox10.Checked := true else checkbox10.checked := false;
        if s[19]='1' then checkbox14.Checked := true else checkbox14.checked := false;
      end;
      SETREPLY : begin
        Memo1.Lines.Add('Set resend success!');
      end;
      IDLE : begin
        b:=Pos('W',s);
        if b<>0 then begin
          edit8.text := copy (s,b+1,Length(s)-b-1);
        end;
        b:=Pos('X',s);
        if b<>0 then begin
          edit8.text := copy (s,b+1,Length(s)-b-1);
        end;
        if Pos('PLAYEND',s)<>0 then begin
        end else begin
          b:=Pos('Y',s);
          if b<>0 then begin
            edit8.text := copy (s,b+1,Length(s)-b-1);
          end;
        end;
        if Pos('IN1ON',s)<>0 then Begin
          shape1.Brush.Color := clLime;
          Label11.Caption := 'INPUT 1 : ON';
          Exit;
        end;
        if Pos('I1N',s)<>0 then Begin
          shape1.Brush.Color := clLime;
          Label11.Caption := 'INPUT 1 : ON';
          Exit;
        end;
        if Pos('IN2ON',s)<>0 then Begin
          shape2.Brush.Color := clLime;
          Label12.Caption := 'INPUT 2 : ON';
          Exit;
        end;
        if Pos('I2N',s)<>0 then Begin
          shape2.Brush.Color := clLime;
          Label12.Caption := 'INPUT 2 : ON';
          Exit;
        end;
        if Pos('IN3ON',s)<>0 then Begin
          shape3.Brush.Color := clLime;
          Label13.Caption := 'INPUT 3 : ON';
          Exit;
        end;
        if Pos('I3N',s)<>0 then Begin
          shape3.Brush.Color := clLime;
          Label13.Caption := 'INPUT 3 : ON';
          Exit;
        end;
        if Pos('IN4ON',s)<>0 then Begin
          shape4.Brush.Color := clLime;
          Label14.Caption := 'INPUT 4 : ON';
          Exit;
        end;
        if Pos('I4N',s)<>0 then Begin
          shape4.Brush.Color := clLime;
          Label14.Caption := 'INPUT 4 : ON';
          Exit;
        end;
        if Pos('IN1OFF',s)<>0 then Begin
          shape1.Brush.Color := clRed;
          Label11.Caption := 'INPUT 1 : OFF';
          Exit;
        end;
        if Pos('I1F',s)<>0 then Begin
          shape1.Brush.Color := clRed;
          Label11.Caption := 'INPUT 1 : OFF';
          Exit;
        end;
        if Pos('IN2OFF',s)<>0 then Begin
          shape2.Brush.Color := clRed;
          Label12.Caption := 'INPUT 2 : OFF';
          Exit;
        end;
        if Pos('I2F',s)<>0 then Begin
          shape2.Brush.Color := clRed;
          Label12.Caption := 'INPUT 2 : OFF';
          Exit;
        end;
        if Pos('IN3OFF',s)<>0 then Begin
          shape3.Brush.Color := clRed;
          Label13.Caption := 'INPUT 3 : OFF';
          Exit;
        end;
        if Pos('I3F',s)<>0 then Begin
          shape3.Brush.Color := clRed;
          Label13.Caption := 'INPUT 3 : OFF';
          Exit;
        end;
        if Pos('IN4OFF',s)<>0 then Begin
          shape4.Brush.Color := clRed;
          Label14.Caption := 'INPUT 4 : OFF';
          Exit;
        end;
        if Pos('I4F',s)<>0 then Begin
          shape4.Brush.Color := clRed;
          Label14.Caption := 'INPUT 4 : OFF';
          Exit;
        end;
      end;
      OUT1ON : begin
        Memo1.Lines.Add('Set OUT1=ON success!');
      end;
      OUT2ON : begin
        Memo1.Lines.Add('Set OUT2=ON success!');
      end;
      OUT3ON : begin
        Memo1.Lines.Add('Set OUT3=ON success!');
      end;
      OUT4ON : begin
        Memo1.Lines.Add('Set OUT4=ON success!');
      end;
      OUT1OFF : begin
        Memo1.Lines.Add('Set OUT1=OFF success!');
      end;
      OUT2OFF : begin
        Memo1.Lines.Add('Set OUT2=OFF success!');
      end;
      OUT3OFF : begin
        Memo1.Lines.Add('Set OUT3=OFF success!');
      end;
      OUT4OFF : begin
        Memo1.Lines.Add('Set OUT4=OFF success!');
      end;
      OUT1TRIG : begin
        Memo1.Lines.Add('Set OUT1=TRIG success!');
      end;
      OUT2TRIG : begin
        Memo1.Lines.Add('Set OUT2=TRIG success!');
      end;
      OUT3TRIG : begin
        Memo1.Lines.Add('Set OUT3=TRIG success!');
      end;
      OUT4TRIG : begin
        Memo1.Lines.Add('Set OUT4=TRIG success!');
      end;
      PLAYTRACK : begin
        Memo1.Lines.Add('Play track success!');
      end;
      STOPTRACK : begin
        Memo1.Lines.Add('Stop track success!');
      end;
      SENDPR : begin
        Memo1.Lines.Add('Send to printer success!');
      end;
      SENDDISP : begin
        Memo1.Lines.Add('Send to display success!');
      end;
      SETCOUNTER : begin
        Memo1.Lines.Add('Set counter display success!');
      end;
      SETCAPACITY : begin
        Memo1.Lines.Add('Set capacity display success!');
      end;
      SENDDISPLAY : begin
        Memo1.Lines.Add('Set running text display success!');
      end;
      SETPROTOCOLTYPE : begin
        Memo1.Lines.Add('Set protocol type success!');
      end;
      READID: begin
        Memo1.Lines.Add('Read ID success!');
        if s[5]='0' then checkbox15.checked := false else checkbox15.checked := true;
        edit11.text := copy(s,6,length(s)-6);
      end;
      SETID: begin
        Memo1.Lines.Add('Set ID success!');
      end;
      SENDDATETIME: begin
        Memo1.Lines.Add('Set date time success!');
      end;
      SENDPOMESSAGE: begin
        Memo1.Lines.Add('Show power on message success!');
      end;
      SENDTEST: begin
        if pos('PR',s)<>0 then begin
          RxData := '';
//          for li:=1 to 100000000 do begin end;
          case protocol of
            0 : SendData := HEader + 'TRIG1' + Footer;
            1 : SendData := HEader + 'TR1' + Footer;
          end;
          ClientSocket1.Socket.SendText(Senddata);
          memo1.lines.add ('SEND: ' + senddata);
          Timer1.Enabled := True;
          Cmd := SENDTEST2;
        end;
      end;
      SENDTEST2: begin
        if pos('TR',s)<>0 then begin
          RxData := '';
          case protocol of
            0 : SendData := HEader + 'MT00001' + Footer;
            1 : SendData := HEader + 'MTR00001' + Footer;
          end;
          ClientSocket1.Socket.SendText(Senddata);
          memo1.lines.add ('SEND: ' + senddata);
          Timer1.Enabled := True;
          Cmd := SENDTEST3;
        end;
      end;
      SENDTEST3: begin
        if pos('MT',s)<>0 then begin
          RxData := '';
          Cmd := Idle;
        end;
      end;
    end;
    RxData := '';
    if (Cmd<>SENDTEST2) and (Cmd<>SENDTEST3) then Cmd := Idle;
  end else begin
    Timer1.Enabled := True;
  end;
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
  Memo1.Clear;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  RxData := '';
  case protocol of
    0 : SendData := HEader + 'OUT1ON' + Footer;
    1 : SendData := HEader + 'O1N' + Footer;
  end;
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
  Timer1.Enabled := True;
  Cmd := OUT1ON;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  RxData := '';
  case protocol of
    0 : SendData := HEader + 'OUT1OFF' + Footer;
    1 : SendData := HEader + 'O1F' + Footer;
  end;
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
  Timer1.Enabled := True;
  Cmd := OUT1OFF;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  RxData := '';
  case protocol of
    0 : SendData := HEader + 'TRIG1' + Footer;
    1 : SendData := HEader + 'TR1' + Footer;
  end;
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
  Timer1.Enabled := True;
  Cmd := OUT1TRIG;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  RxData := '';
  case protocol of
    0 : SendData := HEader + 'OUT2ON' + Footer;
    1 : SendData := HEader + 'O2N' + Footer;
  end;
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
  Timer1.Enabled := True;
  Cmd := OUT2ON;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  RxData := '';
  case protocol of
    0 : SendData := HEader + 'OUT2OFF' + Footer;
    1 : SendData := HEader + 'O2F' + Footer;
  end;
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
  Timer1.Enabled := True;
  Cmd := OUT2OFF;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  RxData := '';
  case protocol of
    0 : SendData := HEader + 'TRIG2' + Footer;
    1 : SendData := HEader + 'TR2' + Footer;
  end;
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
  Timer1.Enabled := True;
  Cmd := OUT2TRIG;
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  RxData := '';
  case protocol of
    0 : SendData := HEader + 'OUT3ON' + Footer;
    1 : SendData := HEader + 'O3N' + Footer;
  end;
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
  Timer1.Enabled := True;
  Cmd := OUT3ON;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  RxData := '';
  case protocol of
    0 : SendData := HEader + 'OUT3OFF' + Footer;
    1 : SendData := HEader + 'O3F' + Footer;
  end;
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
  Timer1.Enabled := True;
  Cmd := OUT3OFF;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  RxData := '';
  case protocol of
    0 : SendData := HEader + 'TRIG3' + Footer;
    1 : SendData := HEader + 'TR3' + Footer;
  end;
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
  Timer1.Enabled := True;
  Cmd := OUT3TRIG;
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
  RxData := '';
  case protocol of
    0 : SendData := HEader + 'OUT4ON' + Footer;
    1 : SendData := HEader + 'O4N' + Footer;
  end;
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
  Timer1.Enabled := True;
  Cmd := OUT4ON;
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
  RxData := '';
  case protocol of
    0 : SendData := HEader + 'OUT4OFF' + Footer;
    1 : SendData := HEader + 'O4F' + Footer;
  end;
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
  Timer1.Enabled := True;
  Cmd := OUT4OFF;
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  RxData := '';
  case protocol of
    0 : SendData := HEader + 'TRIG4' + Footer;
    1 : SendData := HEader + 'TR4' + Footer;
  end;
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
  Timer1.Enabled := True;
  Cmd := OUT4TRIG;
end;

procedure TForm1.Button14Click(Sender: TObject);
var
 w : word;

begin
  try
    w:=strtoint(edit3.text);
  except
    messagedlg('Track number must be 0 - 65535!',mtError,[mbOK],0);
    Edit3.Setfocus;
    exit;
  end;
  case protocol of
    0 : senddata := header + 'MT' + fillzero(5,edit3.text) + Footer;
    1 : senddata := header + 'MTR' + fillzero(5,edit3.text) + Footer;
  end;
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
  Timer1.Enabled := True;
  Cmd := PLAYTRACK;
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
  case protocol of
    0 : senddata := header + 'MS' + Footer;
    1 : senddata := header + 'MST' + Footer;
  end;
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
  Timer1.Enabled := True;
  Cmd := STOPTRACK;
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
  case protocol of
    0 : senddata := header + 'PR' + inttostr(Combobox1.ItemIndex) + edit4.text;
    1 : senddata := header + 'PRI' + inttostr(Combobox1.ItemIndex) + edit4.text;
  end;
  if checkbox1.Checked then senddata := senddata + Char(13) + Char(10);
  senddata := senddata + Footer;
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
  Timer1.Enabled := True;
  Cmd := SENDPR;
end;

procedure TForm1.Button18Click(Sender: TObject);
var
  w : word;

begin
  try
    w := strtoint(edit5.text);
  except
    messagedlg('Counter must be 0 - 9999!',mtError,[mbOK],0);
    edit5.setfocus;
    exit;
  end;
  senddata := edit9.text + 'T' + fillzero(4,edit5.text);
  senddata := senddata + calccs(senddata);
  case protocol of
    0 : senddata := header + 'DS*' + senddata + '#' + footer;
    1 : senddata := header + 'DSP*' + senddata + '#' + footer;
  end;
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
  Timer1.Enabled := True;
  Cmd := SETCOUNTER;
end;

procedure TForm1.Button19Click(Sender: TObject);
var
  w : word;

begin
  try
    w := strtoint(edit6.text);
  except
    messagedlg('Capacity must be 0 - 9999!',mtError,[mbOK],0);
    edit6.setfocus;
    exit;
  end;
  senddata := edit9.text + 'S' + fillzero(4,edit6.text);
  senddata := senddata + calccs(senddata);
  case protocol of
    0 : senddata := header + 'DS*' + senddata + '#' + footer;
    1 : senddata := header + 'DSP*' + senddata + '#' + footer;
  end;
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
  Timer1.Enabled := True;
  Cmd := SETCAPACITY;
end;

procedure TForm1.Button22Click(Sender: TObject);
begin
  Cmd := READREPLY;
  case protocol of
    0 : senddata := header + 'RSR' + footer;
    1 : senddata := header + 'RPR' + footer;
  end;
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
  Timer1.Enabled := True;
end;

procedure TForm1.Button23Click(Sender: TObject);
var
  b : byte;

begin
  Cmd := SETREPLY;
  case protocol of
    0 : senddata := header + 'RSS';
    1 : senddata := header + 'RPL';
  end;  
  b := combobox2.itemindex;
  b := b + 1;
  senddata := senddata + char ((b div 10) + $30);
  senddata := senddata + char ((b mod 10) + $30);
  if Checkbox2.Checked then senddata := senddata + '1'
    else senddata := senddata + '0';
  if Checkbox3.Checked then senddata := senddata + '1'
    else senddata := senddata + '0';
  if Checkbox4.Checked then senddata := senddata + '1'
    else senddata := senddata + '0';
  if Checkbox5.Checked then senddata := senddata + '1'
    else senddata := senddata + '0';
  if Checkbox9.Checked then senddata := senddata + '1'
    else senddata := senddata + '0';
  if Checkbox8.Checked then senddata := senddata + '1'
    else senddata := senddata + '0';
  if Checkbox7.Checked then senddata := senddata + '1'
    else senddata := senddata + '0';
  if Checkbox6.Checked then senddata := senddata + '1'
    else senddata := senddata + '0';
  if Checkbox13.Checked then senddata := senddata + '1'
    else senddata := senddata + '0';
  if Checkbox12.Checked then senddata := senddata + '1'
    else senddata := senddata + '0';
  if Checkbox11.Checked then senddata := senddata + '1'
    else senddata := senddata + '0';
  if Checkbox10.Checked then senddata := senddata + '1'
    else senddata := senddata + '0';
  if Checkbox14.Checked then senddata := senddata + '1'
    else senddata := senddata + '0';
  senddata := senddata + footer;
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
  Timer1.Enabled := True;
end;

procedure TForm1.Button24Click(Sender: TObject);
begin
  case protocol of
    0 : senddata := header + 'IN1ONOK' + footer;
    1 : senddata := header + 'I1N' + footer;
  end;
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
end;

procedure TForm1.Button25Click(Sender: TObject);
begin
  case protocol of
    0 : senddata := header + 'IN1OFFOK' + footer;
    1 : senddata := header + 'I1F' + footer;
  end;
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
end;

procedure TForm1.Button26Click(Sender: TObject);
begin
  case protocol of
    0 : senddata := header + 'IN2ONOK' + footer;
    1 : senddata := header + 'I2N' + footer;
  end;
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
end;

procedure TForm1.Button27Click(Sender: TObject);
begin
  case protocol of
    0 : senddata := header + 'IN2OFFOK' + footer;
    1 : senddata := header + 'I2F' + footer;
  end;
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
end;

procedure TForm1.Button28Click(Sender: TObject);
begin
  case protocol of
    0 : senddata := header + 'IN3ONOK' + footer;
    1 : senddata := header + 'I3N' + footer;
  end;
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
end;

procedure TForm1.Button29Click(Sender: TObject);
begin
  case protocol of
    0 : senddata := header + 'IN3OFFOK' + footer;
    1 : senddata := header + 'I3F' + footer;
  end;  
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
end;

procedure TForm1.Button30Click(Sender: TObject);
begin
  case protocol of
    0 : senddata := header + 'IN4ONOK' + footer;
    1 : senddata := header + 'I4N' + footer;
  end;  
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
end;

procedure TForm1.Button31Click(Sender: TObject);
begin
  case protocol of
    0 : senddata := header + 'IN4OFFOK' + footer;
    1 : senddata := header + 'I4F' + footer;
  end;  
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
end;

procedure TForm1.Button32Click(Sender: TObject);
begin
  case protocol of
    0 : senddata := header + 'PLAYENDOK' + footer;
    1 : senddata := header + 'PLE' + footer;
  end;  
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
end;

procedure TForm1.Button33Click(Sender: TObject);
begin
  case protocol of
    0 : senddata := header + 'NOTRACKOK' + footer;
    1 : senddata := header + 'NTR' + footer;
  end;  
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
end;

procedure TForm1.Button34Click(Sender: TObject);
begin
  case protocol of
    0 : senddata := header + 'WOK' + footer;
    1 : senddata := header + 'WOK' + footer;
  end;
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
end;

procedure TForm1.Button35Click(Sender: TObject);
begin
  if SendPing then begin
    SendPing := False;
    Button35.Caption := 'START';
    Timer2.Enabled := False;
    Groupbox2.Enabled := True;
    Groupbox3.Enabled := True;
    Groupbox7.Enabled := True;
  end else begin
    SendPing := True;
    Button35.Caption := 'STOP';
    SendCtr := 0;
    RcvCtr := 0;
    Label19.Caption := InttoStr (SendCtr);
    Timer2.Interval := (Combobox3.ItemIndex + 1) * 100;
    Timer2.Enabled := True;
    Groupbox2.Enabled := False;
    Groupbox3.Enabled := False;
    Groupbox7.Enabled := False;
  end;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  Inc(SendCtr);
  case protocol of
    0 : SendData := Header + 'PING' + Footer;
    1 : SendData := Header + 'PNG' + Footer;
  end;
  ClientSocket1.Socket.SendText(Senddata);
  Memo1.lines.add ('SEND: ' + senddata);
  Label19.Caption := InttoStr (SendCtr);
end;

procedure TForm1.Button36Click(Sender: TObject);
begin
  case protocol of
    0 : senddata := header + 'XOK' + footer;
    1 : senddata := header + 'XOK' + footer;
  end;
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
end;

procedure TForm1.Button37Click(Sender: TObject);
begin
  Cmd := SENDDISPLAY;
  if checkbox16.checked = true then begin
    case protocol of
      0 : senddata := header + 'DST';
      1 : senddata := header + 'DSPT';
    end;
  end else begin
    case protocol of
      0 : senddata := header + 'DSD';
      1 : senddata := header + 'DSPD';
    end;
  end;
  senddata := senddata + inttostr(Combobox10.Itemindex) + inttostr(Combobox4.Itemindex)
    + fillzero(2,inttostr(combobox6.ItemIndex+1)) + fillzero(2,inttostr(combobox8.ItemIndex+1)) + Edit7.Text + '|'
    + inttostr(Combobox5.Itemindex)
    + fillzero(2,inttostr(combobox7.ItemIndex+1)) + fillzero(2,inttostr(combobox9.ItemIndex+1)) + Edit10.Text + Footer;
//  form1.caption := senddata;
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
  Timer1.Enabled := True;
end;

procedure TForm1.Button38Click(Sender: TObject);
begin
  case protocol of
    0 : senddata := header + 'YOK' + footer;
    1 : senddata := header + 'YOK' + footer;
  end;  
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
end;

procedure TForm1.Button39Click(Sender: TObject);
begin
  senddata := header + 'CMD' + inttostr(combobox11.Itemindex) + footer;
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
  Timer1.Enabled := True;
  Cmd := SETPROTOCOLTYPE;
end;

procedure TForm1.ComboBox11Change(Sender: TObject);
begin
  protocol := combobox11.itemindex;
end;

procedure TForm1.Button40Click(Sender: TObject);
begin
  RxData := '';
  case protocol of
    0 : SendData := HEader + 'IDR' + Footer;
    1 : SendData := HEader + 'IDR' + Footer;
  end;
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
  Timer1.Enabled := True;
  Cmd := READID;
end;

procedure TForm1.Button41Click(Sender: TObject);
var
  s : string;
  b : byte;

begin
  RxData := '';
  if Checkbox15.Checked then s := '1' else s := '0';
  s := s + Edit11.Text;
//  for b:=1 to (8-length(Edit1.text)) do
//   s := s + ' ';
  case protocol of
    0 : SendData := HEader + 'IDV' + s + Footer;
    1 : SendData := HEader + 'IDV' + s + Footer;
  end;
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
  Timer1.Enabled := True;
  Cmd := SETID;
end;

procedure TForm1.Button43Click(Sender: TObject);
var
  hour,min,sec,msec : word;
  day,date,month,year : word;
begin
  DecodeDate(Now,year,month,date);
  DecodeTime(Now,hour,min,sec,msec);
  Edit12.text := fillzero(2,inttostr(date));
  Edit13.text := fillzero(2,inttostr(month));
  Edit14.text := copy(inttostr(year),3,2);
  Edit15.text := fillzero(2,inttostr(hour));
  Edit16.text := fillzero(2,inttostr(min));
  Edit17.text := fillzero(2,inttostr(sec));
end;

procedure TForm1.Button42Click(Sender: TObject);
var
  b : byte;
begin
  try
    b:=strtoint(edit12.text);
  except
    messagedlg('Invalid date!',mterror,[mbOK],0);
    edit12.setfocus;
    exit;
  end;
  if (b<1) or (b>31) then begin
    messagedlg('Invalid date!',mterror,[mbOK],0);
    edit12.setfocus;
    exit;
  end;

  try
    b:=strtoint(edit13.text);
  except
    messagedlg('Invalid month!',mterror,[mbOK],0);
    edit13.setfocus;
    exit;
  end;
  if (b<1) or (b>12) then begin
    messagedlg('Invalid month!',mterror,[mbOK],0);
    edit13.setfocus;
    exit;
  end;

  try
    b:=strtoint(edit14.text);
  except
    messagedlg('Invalid year!',mterror,[mbOK],0);
    edit14.setfocus;
    exit;
  end;
  if (b>99) then begin
    messagedlg('Invalid year!',mterror,[mbOK],0);
    edit14.setfocus;
    exit;
  end;

  try
    b:=strtoint(edit15.text);
  except
    messagedlg('Invalid hour!',mterror,[mbOK],0);
    edit15.setfocus;
    exit;
  end;
  if (b>23) then begin
    messagedlg('Invalid hour!',mterror,[mbOK],0);
    edit15.setfocus;
    exit;
  end;

  try
    b:=strtoint(edit16.text);
  except
    messagedlg('Invalid minute!',mterror,[mbOK],0);
    edit16.setfocus;
    exit;
  end;
  if (b>59) then begin
    messagedlg('Invalid minute!',mterror,[mbOK],0);
    edit16.setfocus;
    exit;
  end;

  try
    b:=strtoint(edit17.text);
  except
    messagedlg('Invalid second!',mterror,[mbOK],0);
    edit17.setfocus;
    exit;
  end;
  if (b>59) then begin
    messagedlg('Invalid second!',mterror,[mbOK],0);
    edit17.setfocus;
    exit;
  end;
  Cmd := SENDDATETIME;
  case protocol of
    0 : senddata := header + 'DSA';
    1 : senddata := header + 'DSPA';
  end;
  senddata := senddata + edit15.text + edit16.text + edit17.text
    + edit12.text + edit13.text + edit14.text + Footer;
//  form1.caption := senddata;
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
  Timer1.Enabled := True;



end;

procedure TForm1.ComboBox4Click(Sender: TObject);
begin
  if (combobox4.itemindex>2) or (combobox4.itemindex=0) then begin
    combobox6.Enabled := false;
    combobox8.Enabled := false;
    edit7.enabled := false;
  end else begin
    combobox6.Enabled := true;
    combobox8.Enabled := true;
    edit7.enabled := true;
  end;

end;

procedure TForm1.ComboBox5Click(Sender: TObject);
begin
  if (combobox5.itemindex>2) or (combobox5.itemindex=0) then begin
    combobox7.Enabled := false;
    combobox9.Enabled := false;
    edit10.enabled := false;
  end else begin
    combobox7.Enabled := true;
    combobox9.Enabled := true;
    edit10.enabled := true;
  end;
end;

procedure TForm1.Button44Click(Sender: TObject);
begin
  Cmd := SENDPOMESSAGE;
  case protocol of
    0 : senddata := header + 'DSU' + footer;
    1 : senddata := header + 'DSPU' + footer;
  end;
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
  Timer1.Enabled := True;
end;

procedure TForm1.Button45Click(Sender: TObject);
var
  s : string;
begin
  if edit18.text<>'' then begin
    s := char(27)+char(64);
    s := s+char(29)+char(104)+char(80);
    s := s+char(29)+char(119)+char(2);
    s := s+char(29)+char(102)+char(1);
    s := s+char(29)+char(72)+char(2);
    s := s+char(29)+char(107)+char(73)+char(length(edit18.text)+2)+char(123)+char(65);
    s := s+edit18.text+char(13)+char(10);
    s := s+char(29)+char(86)+char(66)+char(25);

    case protocol of
      0 : senddata := header + 'PR' + inttostr(Combobox1.ItemIndex) + s;
      1 : senddata := header + 'PRI' + inttostr(Combobox1.ItemIndex) + s;
    end;
  //  if checkbox1.Checked then senddata := senddata + Char(13) + Char(10);
    senddata := senddata + Footer;
    ClientSocket1.Socket.SendText(Senddata);
    memo1.lines.add ('SEND: ' + senddata);
    Timer1.Enabled := True;
    Cmd := SENDPR;
  end;
end;

procedure TForm1.Button47Click(Sender: TObject);
var
  s : string;
  b : word;
begin
  s := '';
  for b:=1 to 250 do s:=s+'A';
  s:=s+char(13)+char(10);

  case protocol of
    0 : senddata := header + 'PR3' + s;
    1 : senddata := header + 'PRI3' + s;
  end;
  senddata := senddata + Footer;
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
  Timer1.Enabled := True;
  Cmd := SENDTEST;
end;

procedure TForm1.Button48Click(Sender: TObject);
var
  s : string;
  b : word;
begin
  case protocol of
    0 : senddata := header + 'WGT' + inttostr(combobox12.ItemIndex);
    1 : senddata := header + 'WGT' + inttostr(combobox12.ItemIndex);
  end;
  senddata := senddata + Footer;
  ClientSocket1.Socket.SendText(Senddata);
  memo1.lines.add ('SEND: ' + senddata);
  Timer1.Enabled := True;
  Cmd := SETWG;
end;

procedure TForm1.Button46Click(Sender: TObject);
var
  s : string;
begin
  if edit19.text<>'' then begin
    // init printer
    s := char(27)+char(64);
    // set module size = 6
    s := s+char(29)+char(40)+char(107)+char(3)+char(0)+char(49)+char(67)+char(16);
    // set error correction level = 0
    s := s+char(29)+char(40)+char(107)+char(3)+char(0)+char(49)+char(69)+char(48);
    // set character number
    s := s+char(29)+char(40)+char(107)+char(Length(edit19.text)+3)+char(0)+char(49)+char(80)+char(48);
    // data QR
    s := s+edit19.text;
    // execute QR
    s := s+char(29)+char(40)+char(107)+char(3)+char(0)+char(49)+char(81)+char(48);
    s := s+edit19.text+char(13)+char(10);
    s := s+char(29)+char(86)+char(66)+char(25);

    case protocol of
      0 : senddata := header + 'PR' + inttostr(Combobox1.ItemIndex) + s;
      1 : senddata := header + 'PRI' + inttostr(Combobox1.ItemIndex) + s;
    end;
  //  if checkbox1.Checked then senddata := senddata + Char(13) + Char(10);
    senddata := senddata + Footer;
    ClientSocket1.Socket.SendText(Senddata);
    memo1.lines.add ('SEND: ' + senddata);
    Timer1.Enabled := True;
    Cmd := SENDPR;
  end;
end;

end.
