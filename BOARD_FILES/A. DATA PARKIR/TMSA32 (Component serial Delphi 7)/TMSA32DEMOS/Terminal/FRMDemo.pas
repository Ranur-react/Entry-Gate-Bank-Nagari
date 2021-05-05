{***************************************************************************}
{ TMS Async32 demo                                                          }
{ for Delphi 4.0,5.0,6.0 & C++Builder 4.0,5.0,6.0                           }
{                                                                           }
{ Copyright 2002 by TMS Software                                            }
{ Email : info@tmssoftware.com                                              }
{ Web : http://www.tmssoftware.com                                          }
{                                                                           }
{ The source code is given as is. The author is not responsible             }
{ for any possible damage done due to the use of this code.                 }
{ The component can be freely used in any application. The complete         }
{ source code remains property of the author and may not be distributed,    }
{ published, given or sold in any form as such. No parts of the source      }
{ code can be included in any other component or application without        }
{ written authorization of the author.                                      }
{***************************************************************************}

unit FRMDemo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  VaClasses, VaComm, ExtCtrls, VaTerminal, StdCtrls, VaUtils;

type
  TForm1 = class(TForm)
    ComboBox1: TComboBox;
    Label2: TLabel;
    Button3: TButton;
    VaTTYEmulation1: TVaTTYEmulation;
    VaTerminal1: TVaTerminal;
    VaComm1: TVaComm;
    Button6: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    Panel2: TPanel;
    Button5: TButton;
    Button4: TButton;
    CheckBox2: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  ComboBox1.ItemIndex := 0;
  VaTerminal1.Emulation := VaTTYEmulation1;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  VaComm1.PortNum:=ComboBox1.ItemIndex;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if not VaComm1.Active then
    Exit;

  if not VaComm1.WriteText('ATZ'#13) then
   Application.MessageBox('Could not Write to Comm - Make sure you have selected '+
   'the right port and parameters','Transmit Error',MB_OK);
   SysDelay(3000,true);
  if not VaComm1.WriteText('ATA'#13) then
   Application.MessageBox('Could not Write to Comm - Make sure you have selected '+
   'the right port and parameters','Transmit Error',MB_OK);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if not VaComm1.Active then
    Exit;
  if CheckBox1.Checked then
  begin
    if not VaComm1.WriteText('ATZ'#13) then
      Application.MessageBox('Could not Write to Comm - Make sure you have selected '+
      'the right port and parameters','Transmit Error',MB_OK);
      SysDelay(3000,true);
      vacomm1.WriteText('ATDP'+Edit1.Text+#13);
  end
  else
  begin
    if not VaComm1.WriteText('ATZ'#13) then
      Application.MessageBox('Could not Write to Comm - Make sure you have selected '+
      'the right port and parameters','Transmit Error',MB_OK);
    SysDelay(3000,true);
    vacomm1.WriteText('ATDT'+Edit1.Text+#13);
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if ComboBox1.ItemIndex > 0 then
  begin
    VaComm1.Open;
    Button3.Enabled := False;
    Button6.Enabled := True;
    Panel1.visible := True;
    ComboBox1.Enabled := False;
  end
  else
    MessageDlg(ComboBox1.Text, mtWarning, [mbOK], 0);
end;

procedure TForm1.Button4Click(Sender: TObject);
var
   c, r: Integer;
begin
  for c := 0 to VaTerminal1.Columns - 1 do
    for r := 0 to VaTerminal1.Rows - 1 do
    begin
      VaTerminal1.Character[c, r]:=IntToStr((c+1) mod 10)[1];
      if (c+1) mod 10=0 then
      begin
        VaTerminal1.CharacterBackground[c, r]:=clNavy;
      end;
    end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
   VaTerminal1.Clear;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  if VaComm1.Active then
    VaComm1.Close
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  VaComm1.Close;
  Button3.Enabled := True;
  ComboBox1.Enabled := True;
  Button6.Enabled := False;
  Panel1.visible := False;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
  VaTerminal1.ScrollBack := CheckBox2.Checked;
end;

end.
