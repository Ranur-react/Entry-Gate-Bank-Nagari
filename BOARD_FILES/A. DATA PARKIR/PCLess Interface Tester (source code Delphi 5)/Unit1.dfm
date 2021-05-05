object Form1: TForm1
  Left = 377
  Top = 22
  Width = 707
  Height = 788
  Caption = 'PCLess Interface Tester Software'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 289
    Height = 81
    Caption = 'LAN Settings'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 51
      Height = 13
      Caption = 'IP Address'
    end
    object Label2: TLabel
      Left = 120
      Top = 24
      Width = 19
      Height = 13
      Caption = 'Port'
    end
    object Edit1: TEdit
      Left = 16
      Top = 40
      Width = 89
      Height = 21
      MaxLength = 15
      TabOrder = 0
      Text = '192.168.1.100'
    end
    object Edit2: TEdit
      Left = 120
      Top = 40
      Width = 49
      Height = 21
      MaxLength = 5
      TabOrder = 1
      Text = '5000'
    end
    object Button1: TButton
      Left = 190
      Top = 39
      Width = 75
      Height = 25
      Caption = 'CONNECT'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 96
    Width = 289
    Height = 193
    Caption = 'Outputs'
    TabOrder = 1
    object Button2: TButton
      Left = 16
      Top = 24
      Width = 75
      Height = 25
      Caption = 'OUT1 ON'
      Enabled = False
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 104
      Top = 24
      Width = 75
      Height = 25
      Caption = 'OUT1 OFF'
      Enabled = False
      TabOrder = 1
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 192
      Top = 24
      Width = 75
      Height = 25
      Caption = 'OUT1 TRIG'
      Enabled = False
      TabOrder = 2
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 192
      Top = 64
      Width = 75
      Height = 25
      Caption = 'OUT2 TRIG'
      Enabled = False
      TabOrder = 3
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 104
      Top = 64
      Width = 75
      Height = 25
      Caption = 'OUT2 OFF'
      Enabled = False
      TabOrder = 4
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 16
      Top = 64
      Width = 75
      Height = 25
      Caption = 'OUT2 ON'
      Enabled = False
      TabOrder = 5
      OnClick = Button7Click
    end
    object Button8: TButton
      Left = 192
      Top = 104
      Width = 75
      Height = 25
      Caption = 'OUT3 TRIG'
      Enabled = False
      TabOrder = 6
      OnClick = Button8Click
    end
    object Button9: TButton
      Left = 104
      Top = 104
      Width = 75
      Height = 25
      Caption = 'OUT3 OFF'
      Enabled = False
      TabOrder = 7
      OnClick = Button9Click
    end
    object Button10: TButton
      Left = 16
      Top = 104
      Width = 75
      Height = 25
      Caption = 'OUT3 ON'
      Enabled = False
      TabOrder = 8
      OnClick = Button10Click
    end
    object Button11: TButton
      Left = 192
      Top = 144
      Width = 75
      Height = 25
      Caption = 'OUT4 TRIG'
      Enabled = False
      TabOrder = 9
      OnClick = Button11Click
    end
    object Button12: TButton
      Left = 104
      Top = 144
      Width = 75
      Height = 25
      Caption = 'OUT4 OFF'
      Enabled = False
      TabOrder = 10
      OnClick = Button12Click
    end
    object Button13: TButton
      Left = 16
      Top = 144
      Width = 75
      Height = 25
      Caption = 'OUT4 ON'
      Enabled = False
      TabOrder = 11
      OnClick = Button13Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 296
    Width = 289
    Height = 241
    Caption = 'Sound, Printer, Display'
    TabOrder = 2
    object Label3: TLabel
      Left = 16
      Top = 16
      Width = 62
      Height = 13
      Caption = 'track number'
    end
    object Label4: TLabel
      Left = 16
      Top = 64
      Width = 59
      Height = 13
      Caption = 'Serial Printer'
    end
    object Label5: TLabel
      Left = 16
      Top = 144
      Width = 74
      Height = 13
      Caption = 'Counter Display'
    end
    object Label7: TLabel
      Left = 64
      Top = 160
      Width = 55
      Height = 13
      Caption = 'Set counter'
    end
    object Label15: TLabel
      Left = 128
      Top = 64
      Width = 46
      Height = 13
      Caption = 'Baud rate'
    end
    object Label16: TLabel
      Left = 16
      Top = 160
      Width = 22
      Height = 13
      Caption = 'Addr'
    end
    object Label6: TLabel
      Left = 136
      Top = 192
      Width = 59
      Height = 13
      Caption = 'Set capacity'
    end
    object Label35: TLabel
      Left = 130
      Top = 109
      Width = 52
      Height = 13
      Caption = 'BARCODE'
    end
    object Label36: TLabel
      Left = 130
      Top = 149
      Width = 49
      Height = 13
      Caption = 'QR CODE'
    end
    object Edit3: TEdit
      Left = 16
      Top = 32
      Width = 41
      Height = 21
      MaxLength = 5
      TabOrder = 0
      Text = '1'
    end
    object Button14: TButton
      Left = 90
      Top = 29
      Width = 75
      Height = 25
      Caption = 'PLAY'
      Enabled = False
      TabOrder = 1
      OnClick = Button14Click
    end
    object Button15: TButton
      Left = 178
      Top = 29
      Width = 75
      Height = 25
      Caption = 'STOP'
      Enabled = False
      TabOrder = 2
      OnClick = Button15Click
    end
    object Edit4: TEdit
      Left = 16
      Top = 80
      Width = 97
      Height = 21
      TabOrder = 3
    end
    object CheckBox1: TCheckBox
      Left = 208
      Top = 64
      Width = 73
      Height = 17
      Caption = 'Add CR-LF'
      TabOrder = 4
    end
    object Button16: TButton
      Left = 216
      Top = 80
      Width = 57
      Height = 25
      Caption = 'SEND'
      Enabled = False
      TabOrder = 5
      OnClick = Button16Click
    end
    object Edit5: TEdit
      Left = 64
      Top = 176
      Width = 41
      Height = 21
      MaxLength = 4
      TabOrder = 6
      Text = '1000'
    end
    object Button18: TButton
      Left = 16
      Top = 205
      Width = 41
      Height = 25
      Caption = 'SEND'
      Enabled = False
      TabOrder = 7
      OnClick = Button18Click
    end
    object ComboBox1: TComboBox
      Left = 128
      Top = 80
      Width = 73
      Height = 21
      ItemHeight = 13
      TabOrder = 8
      Items.Strings = (
        '1200'
        '2400'
        '4800'
        '9600'
        '19200'
        '38400'
        '57600'
        '115200')
    end
    object Edit9: TEdit
      Left = 16
      Top = 176
      Width = 33
      Height = 21
      MaxLength = 2
      TabOrder = 9
      Text = '00'
    end
    object Edit6: TEdit
      Left = 136
      Top = 208
      Width = 41
      Height = 21
      MaxLength = 4
      TabOrder = 10
      Text = '1000'
    end
    object Button19: TButton
      Left = 184
      Top = 205
      Width = 41
      Height = 25
      Caption = 'SEND'
      Enabled = False
      TabOrder = 11
      OnClick = Button19Click
    end
    object Button20: TButton
      Left = 64
      Top = 205
      Width = 41
      Height = 25
      Caption = 'READ'
      Enabled = False
      TabOrder = 12
      Visible = False
    end
    object Button21: TButton
      Left = 232
      Top = 205
      Width = 41
      Height = 25
      Caption = 'READ'
      Enabled = False
      TabOrder = 13
      Visible = False
    end
    object Edit18: TEdit
      Left = 130
      Top = 124
      Width = 65
      Height = 21
      TabOrder = 14
    end
    object Button45: TButton
      Left = 216
      Top = 120
      Width = 57
      Height = 25
      Caption = 'SEND'
      Enabled = False
      TabOrder = 15
      OnClick = Button45Click
    end
    object Edit19: TEdit
      Left = 130
      Top = 164
      Width = 65
      Height = 21
      MaxLength = 250
      TabOrder = 16
    end
    object Button46: TButton
      Left = 216
      Top = 160
      Width = 57
      Height = 25
      Caption = 'SEND'
      Enabled = False
      TabOrder = 17
      OnClick = Button46Click
    end
  end
  object GroupBox4: TGroupBox
    Left = 304
    Top = 264
    Width = 249
    Height = 273
    Caption = 'Response'
    TabOrder = 3
    object Memo1: TMemo
      Left = 16
      Top = 24
      Width = 217
      Height = 233
      TabOrder = 0
    end
    object Button17: TButton
      Left = 208
      Top = 24
      Width = 25
      Height = 25
      Caption = 'C'
      TabOrder = 1
      OnClick = Button17Click
    end
  end
  object GroupBox5: TGroupBox
    Left = 304
    Top = 8
    Width = 249
    Height = 161
    Caption = 'Inputs'
    TabOrder = 4
    object Shape1: TShape
      Left = 8
      Top = 24
      Width = 25
      Height = 25
      Brush.Color = clRed
      Shape = stCircle
    end
    object Label11: TLabel
      Left = 42
      Top = 30
      Width = 71
      Height = 13
      Caption = 'INPUT 1 : OFF'
    end
    object Label12: TLabel
      Left = 42
      Top = 62
      Width = 71
      Height = 13
      Caption = 'INPUT 2 : OFF'
    end
    object Shape2: TShape
      Left = 8
      Top = 56
      Width = 25
      Height = 25
      Brush.Color = clRed
      Shape = stCircle
    end
    object Label13: TLabel
      Left = 42
      Top = 94
      Width = 71
      Height = 13
      Caption = 'INPUT 3 : OFF'
    end
    object Shape3: TShape
      Left = 8
      Top = 88
      Width = 25
      Height = 25
      Brush.Color = clRed
      Shape = stCircle
    end
    object Label14: TLabel
      Left = 42
      Top = 126
      Width = 71
      Height = 13
      Caption = 'INPUT 4 : OFF'
    end
    object Shape4: TShape
      Left = 8
      Top = 120
      Width = 25
      Height = 25
      Brush.Color = clRed
      Shape = stCircle
    end
    object Label28: TLabel
      Left = 128
      Top = 40
      Width = 89
      Height = 13
      Caption = 'ID : (max 16 chars)'
    end
    object CheckBox15: TCheckBox
      Left = 128
      Top = 16
      Width = 89
      Height = 17
      Caption = 'ID Enabled'
      TabOrder = 0
    end
    object Edit11: TEdit
      Left = 128
      Top = 56
      Width = 105
      Height = 21
      MaxLength = 16
      TabOrder = 1
    end
    object Button40: TButton
      Left = 160
      Top = 88
      Width = 75
      Height = 25
      Caption = 'Read ID'
      Enabled = False
      TabOrder = 2
      OnClick = Button40Click
    end
    object Button41: TButton
      Left = 160
      Top = 120
      Width = 75
      Height = 25
      Caption = 'Set ID'
      Enabled = False
      TabOrder = 3
      OnClick = Button41Click
    end
  end
  object GroupBox6: TGroupBox
    Left = 304
    Top = 176
    Width = 385
    Height = 81
    Caption = 'Card Reader'
    TabOrder = 5
    object Label37: TLabel
      Left = 248
      Top = 16
      Width = 66
      Height = 13
      Caption = 'Wiegand type'
    end
    object Edit8: TEdit
      Left = 16
      Top = 32
      Width = 217
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object ComboBox12: TComboBox
      Left = 248
      Top = 32
      Width = 57
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      Items.Strings = (
        'DEC'
        'HEX')
    end
    object Button48: TButton
      Left = 321
      Top = 29
      Width = 49
      Height = 25
      Caption = 'SEND'
      Enabled = False
      TabOrder = 2
      OnClick = Button48Click
    end
  end
  object GroupBox7: TGroupBox
    Left = 8
    Top = 680
    Width = 545
    Height = 169
    Caption = 'Resend Features'
    TabOrder = 6
    object Label8: TLabel
      Left = 16
      Top = 112
      Width = 81
      Height = 13
      Caption = 'Resend time (ms)'
    end
    object CheckBox2: TCheckBox
      Left = 16
      Top = 24
      Width = 65
      Height = 17
      Caption = 'IN1ON'
      TabOrder = 0
    end
    object CheckBox3: TCheckBox
      Left = 16
      Top = 40
      Width = 65
      Height = 17
      Caption = 'IN1OFF'
      TabOrder = 1
    end
    object CheckBox4: TCheckBox
      Left = 16
      Top = 56
      Width = 65
      Height = 17
      Caption = 'IN2ON'
      TabOrder = 2
    end
    object CheckBox5: TCheckBox
      Left = 16
      Top = 72
      Width = 65
      Height = 17
      Caption = 'IN2OFF'
      TabOrder = 3
    end
    object CheckBox6: TCheckBox
      Left = 80
      Top = 72
      Width = 65
      Height = 17
      Caption = 'IN4OFF'
      TabOrder = 4
    end
    object CheckBox7: TCheckBox
      Left = 80
      Top = 56
      Width = 65
      Height = 17
      Caption = 'IN4ON'
      TabOrder = 5
    end
    object CheckBox8: TCheckBox
      Left = 80
      Top = 40
      Width = 65
      Height = 17
      Caption = 'IN3OFF'
      TabOrder = 6
    end
    object CheckBox9: TCheckBox
      Left = 80
      Top = 24
      Width = 65
      Height = 17
      Caption = 'IN3ON'
      TabOrder = 7
    end
    object CheckBox11: TCheckBox
      Left = 144
      Top = 56
      Width = 81
      Height = 17
      Caption = 'WG1DATA'
      TabOrder = 8
    end
    object CheckBox12: TCheckBox
      Left = 144
      Top = 40
      Width = 81
      Height = 17
      Caption = 'NOTRACK'
      TabOrder = 9
    end
    object CheckBox13: TCheckBox
      Left = 144
      Top = 24
      Width = 81
      Height = 17
      Caption = 'PLAYEND'
      TabOrder = 10
    end
    object ComboBox2: TComboBox
      Left = 104
      Top = 108
      Width = 65
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 11
      Items.Strings = (
        '100'
        '200'
        '300'
        '400'
        '500'
        '600'
        '700'
        '800'
        '900'
        '1000'
        '1100'
        '1200'
        '1300'
        '1400'
        '1500'
        '1600'
        '1700'
        '1800'
        '1900'
        '2000')
    end
    object Button22: TButton
      Left = 8
      Top = 136
      Width = 75
      Height = 25
      Caption = 'READ'
      Enabled = False
      TabOrder = 12
      OnClick = Button22Click
    end
    object Button23: TButton
      Left = 96
      Top = 136
      Width = 75
      Height = 25
      Caption = 'SET'
      Enabled = False
      TabOrder = 13
      OnClick = Button23Click
    end
    object Button24: TButton
      Left = 232
      Top = 24
      Width = 81
      Height = 25
      Caption = 'IN1ON RESP'
      Enabled = False
      TabOrder = 14
      OnClick = Button24Click
    end
    object Button25: TButton
      Left = 232
      Top = 56
      Width = 81
      Height = 25
      Caption = 'IN1OFF RESP'
      Enabled = False
      TabOrder = 15
      OnClick = Button25Click
    end
    object Button26: TButton
      Left = 232
      Top = 88
      Width = 81
      Height = 25
      Caption = 'IN2ON RESP'
      Enabled = False
      TabOrder = 16
      OnClick = Button26Click
    end
    object Button27: TButton
      Left = 232
      Top = 120
      Width = 81
      Height = 25
      Caption = 'IN2OFF RESP'
      Enabled = False
      TabOrder = 17
      OnClick = Button27Click
    end
    object Button28: TButton
      Left = 328
      Top = 24
      Width = 81
      Height = 25
      Caption = 'IN3ON RESP'
      Enabled = False
      TabOrder = 18
      OnClick = Button28Click
    end
    object Button29: TButton
      Left = 328
      Top = 56
      Width = 81
      Height = 25
      Caption = 'IN3OFF RESP'
      Enabled = False
      TabOrder = 19
      OnClick = Button29Click
    end
    object Button30: TButton
      Left = 328
      Top = 88
      Width = 81
      Height = 25
      Caption = 'IN4ON RESP'
      Enabled = False
      TabOrder = 20
      OnClick = Button30Click
    end
    object Button31: TButton
      Left = 328
      Top = 120
      Width = 81
      Height = 25
      Caption = 'IN4OFF RESP'
      Enabled = False
      TabOrder = 21
      OnClick = Button31Click
    end
    object Button32: TButton
      Left = 424
      Top = 16
      Width = 97
      Height = 25
      Caption = 'PLAYEND RESP'
      Enabled = False
      TabOrder = 22
      OnClick = Button32Click
    end
    object Button33: TButton
      Left = 424
      Top = 45
      Width = 97
      Height = 25
      Caption = 'NOTRACK RESP'
      Enabled = False
      TabOrder = 23
      OnClick = Button33Click
    end
    object Button34: TButton
      Left = 424
      Top = 76
      Width = 97
      Height = 25
      Caption = 'WG1DATA RESP'
      Enabled = False
      TabOrder = 24
      OnClick = Button34Click
    end
    object CheckBox10: TCheckBox
      Left = 144
      Top = 72
      Width = 81
      Height = 17
      Caption = 'WG2DATA'
      TabOrder = 25
    end
    object Button36: TButton
      Left = 424
      Top = 106
      Width = 97
      Height = 25
      Caption = 'WG2DATA RESP'
      Enabled = False
      TabOrder = 26
      OnClick = Button36Click
    end
    object CheckBox14: TCheckBox
      Left = 144
      Top = 88
      Width = 81
      Height = 17
      Caption = 'WG3DATA'
      TabOrder = 27
    end
    object Button38: TButton
      Left = 424
      Top = 136
      Width = 97
      Height = 25
      Caption = 'WG3DATA RESP'
      Enabled = False
      TabOrder = 28
      OnClick = Button38Click
    end
  end
  object GroupBox8: TGroupBox
    Left = 8
    Top = 856
    Width = 417
    Height = 81
    Caption = 'Communication test'
    TabOrder = 7
    object Label9: TLabel
      Left = 16
      Top = 24
      Width = 83
      Height = 13
      Caption = 'Send PING every'
    end
    object Label10: TLabel
      Left = 184
      Top = 24
      Width = 54
      Height = 13
      Caption = 'miliseconds'
    end
    object Label17: TLabel
      Left = 344
      Top = 32
      Width = 52
      Height = 13
      Caption = 'RECEIVE :'
    end
    object Label18: TLabel
      Left = 400
      Top = 32
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label19: TLabel
      Left = 400
      Top = 16
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label20: TLabel
      Left = 344
      Top = 16
      Width = 36
      Height = 13
      Caption = 'SEND :'
    end
    object ComboBox3: TComboBox
      Left = 107
      Top = 21
      Width = 73
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        '100'
        '200'
        '300'
        '400'
        '500'
        '600'
        '700'
        '800'
        '900'
        '1000')
    end
    object Button35: TButton
      Left = 250
      Top = 18
      Width = 75
      Height = 25
      Caption = 'START'
      Enabled = False
      TabOrder = 1
      OnClick = Button35Click
    end
  end
  object GroupBox9: TGroupBox
    Left = 8
    Top = 544
    Width = 665
    Height = 129
    Caption = 'Running text 16x64'
    TabOrder = 8
    object Label21: TLabel
      Left = 8
      Top = 36
      Width = 33
      Height = 13
      Caption = 'ROW1'
    end
    object Label22: TLabel
      Left = 8
      Top = 68
      Width = 33
      Height = 13
      Caption = 'ROW2'
    end
    object Label23: TLabel
      Left = 120
      Top = 16
      Width = 48
      Height = 13
      Caption = 'Blink Spd.'
    end
    object Label24: TLabel
      Left = 192
      Top = 16
      Width = 45
      Height = 13
      Caption = 'Run Spd.'
    end
    object Label25: TLabel
      Left = 48
      Top = 16
      Width = 27
      Height = 13
      Caption = 'Mode'
    end
    object Label26: TLabel
      Left = 264
      Top = 16
      Width = 21
      Height = 13
      Caption = 'Text'
    end
    object Label27: TLabel
      Left = 400
      Top = 16
      Width = 30
      Height = 13
      Caption = 'Bright.'
    end
    object Label29: TLabel
      Left = 472
      Top = 16
      Width = 23
      Height = 13
      Caption = 'Date'
    end
    object Label30: TLabel
      Left = 512
      Top = 16
      Width = 30
      Height = 13
      Caption = 'Month'
    end
    object Label31: TLabel
      Left = 552
      Top = 16
      Width = 22
      Height = 13
      Caption = 'Year'
    end
    object Label32: TLabel
      Left = 472
      Top = 56
      Width = 23
      Height = 13
      Caption = 'Hour'
    end
    object Label33: TLabel
      Left = 512
      Top = 56
      Width = 17
      Height = 13
      Caption = 'Min'
    end
    object Label34: TLabel
      Left = 552
      Top = 56
      Width = 19
      Height = 13
      Caption = 'Sec'
    end
    object ComboBox4: TComboBox
      Left = 48
      Top = 32
      Width = 57
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnClick = ComboBox4Click
      Items.Strings = (
        'No change'
        'Normal'
        'Blinking'
        'Time'
        'Date')
    end
    object ComboBox5: TComboBox
      Left = 48
      Top = 64
      Width = 57
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnClick = ComboBox5Click
      Items.Strings = (
        'No change'
        'Normal'
        'Blinking'
        'Time'
        'Date')
    end
    object ComboBox6: TComboBox
      Left = 120
      Top = 32
      Width = 57
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      Items.Strings = (
        '01'
        '02'
        '03'
        '04'
        '05'
        '06'
        '07'
        '08'
        '09'
        '10'
        '11'
        '12'
        '13'
        '14'
        '15'
        '16'
        '17'
        '18'
        '19'
        '20'
        '21'
        '22'
        '23'
        '24'
        '25'
        '26'
        '27'
        '28'
        '29'
        '30'
        '31'
        '32'
        '33'
        '34'
        '35'
        '36'
        '37'
        '38'
        '39'
        '40'
        '41'
        '42'
        '43'
        '44'
        '45'
        '46'
        '47'
        '48'
        '49'
        '50'
        '51'
        '52'
        '53'
        '54'
        '55'
        '56'
        '57'
        '58'
        '59'
        '60'
        '61'
        '62'
        '63'
        '64'
        '65'
        '66'
        '67'
        '68'
        '69'
        '70'
        '71'
        '72'
        '73'
        '74'
        '75'
        '76'
        '77'
        '78'
        '79'
        '80'
        '81'
        '82'
        '83'
        '84'
        '85'
        '86'
        '87'
        '88'
        '89'
        '90'
        '91'
        '92'
        '93'
        '94'
        '95'
        '96'
        '97'
        '98'
        '99')
    end
    object ComboBox7: TComboBox
      Left = 120
      Top = 64
      Width = 57
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      Items.Strings = (
        '01'
        '02'
        '03'
        '04'
        '05'
        '06'
        '07'
        '08'
        '09'
        '10'
        '11'
        '12'
        '13'
        '14'
        '15'
        '16'
        '17'
        '18'
        '19'
        '20'
        '21'
        '22'
        '23'
        '24'
        '25'
        '26'
        '27'
        '28'
        '29'
        '30'
        '31'
        '32'
        '33'
        '34'
        '35'
        '36'
        '37'
        '38'
        '39'
        '40'
        '41'
        '42'
        '43'
        '44'
        '45'
        '46'
        '47'
        '48'
        '49'
        '50'
        '51'
        '52'
        '53'
        '54'
        '55'
        '56'
        '57'
        '58'
        '59'
        '60'
        '61'
        '62'
        '63'
        '64'
        '65'
        '66'
        '67'
        '68'
        '69'
        '70'
        '71'
        '72'
        '73'
        '74'
        '75'
        '76'
        '77'
        '78'
        '79'
        '80'
        '81'
        '82'
        '83'
        '84'
        '85'
        '86'
        '87'
        '88'
        '89'
        '90'
        '91'
        '92'
        '93'
        '94'
        '95'
        '96'
        '97'
        '98'
        '99')
    end
    object ComboBox8: TComboBox
      Left = 192
      Top = 32
      Width = 57
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      Items.Strings = (
        '01'
        '02'
        '03'
        '04'
        '05'
        '06'
        '07'
        '08'
        '09'
        '10'
        '11'
        '12'
        '13'
        '14'
        '15'
        '16'
        '17'
        '18'
        '19'
        '20'
        '21'
        '22'
        '23'
        '24'
        '25'
        '26'
        '27'
        '28'
        '29'
        '30'
        '31'
        '32'
        '33'
        '34'
        '35'
        '36'
        '37'
        '38'
        '39'
        '40'
        '41'
        '42'
        '43'
        '44'
        '45'
        '46'
        '47'
        '48'
        '49'
        '50'
        '51'
        '52'
        '53'
        '54'
        '55'
        '56'
        '57'
        '58'
        '59'
        '60'
        '61'
        '62'
        '63'
        '64'
        '65'
        '66'
        '67'
        '68'
        '69'
        '70'
        '71'
        '72'
        '73'
        '74'
        '75'
        '76'
        '77'
        '78'
        '79'
        '80'
        '81'
        '82'
        '83'
        '84'
        '85'
        '86'
        '87'
        '88'
        '89'
        '90'
        '91'
        '92'
        '93'
        '94'
        '95'
        '96'
        '97'
        '98'
        '99')
    end
    object ComboBox9: TComboBox
      Left = 192
      Top = 64
      Width = 57
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
      Items.Strings = (
        '01'
        '02'
        '03'
        '04'
        '05'
        '06'
        '07'
        '08'
        '09'
        '10'
        '11'
        '12'
        '13'
        '14'
        '15'
        '16'
        '17'
        '18'
        '19'
        '20'
        '21'
        '22'
        '23'
        '24'
        '25'
        '26'
        '27'
        '28'
        '29'
        '30'
        '31'
        '32'
        '33'
        '34'
        '35'
        '36'
        '37'
        '38'
        '39'
        '40'
        '41'
        '42'
        '43'
        '44'
        '45'
        '46'
        '47'
        '48'
        '49'
        '50'
        '51'
        '52'
        '53'
        '54'
        '55'
        '56'
        '57'
        '58'
        '59'
        '60'
        '61'
        '62'
        '63'
        '64'
        '65'
        '66'
        '67'
        '68'
        '69'
        '70'
        '71'
        '72'
        '73'
        '74'
        '75'
        '76'
        '77'
        '78'
        '79'
        '80'
        '81'
        '82'
        '83'
        '84'
        '85'
        '86'
        '87'
        '88'
        '89'
        '90'
        '91'
        '92'
        '93'
        '94'
        '95'
        '96'
        '97'
        '98'
        '99')
    end
    object Edit7: TEdit
      Left = 264
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 6
    end
    object Edit10: TEdit
      Left = 264
      Top = 64
      Width = 121
      Height = 21
      TabOrder = 7
    end
    object Button37: TButton
      Left = 400
      Top = 64
      Width = 49
      Height = 25
      Caption = 'SEND'
      Enabled = False
      TabOrder = 8
      OnClick = Button37Click
    end
    object ComboBox10: TComboBox
      Left = 400
      Top = 32
      Width = 57
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 9
      Items.Strings = (
        '0'
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9')
    end
    object Edit12: TEdit
      Left = 472
      Top = 32
      Width = 33
      Height = 21
      MaxLength = 2
      TabOrder = 10
    end
    object Edit13: TEdit
      Left = 512
      Top = 32
      Width = 33
      Height = 21
      MaxLength = 2
      TabOrder = 11
    end
    object Edit14: TEdit
      Left = 552
      Top = 32
      Width = 33
      Height = 21
      MaxLength = 2
      TabOrder = 12
    end
    object Edit15: TEdit
      Left = 472
      Top = 72
      Width = 33
      Height = 21
      MaxLength = 2
      TabOrder = 13
    end
    object Edit16: TEdit
      Left = 512
      Top = 72
      Width = 33
      Height = 21
      MaxLength = 2
      TabOrder = 14
    end
    object Edit17: TEdit
      Left = 552
      Top = 72
      Width = 33
      Height = 21
      MaxLength = 2
      TabOrder = 15
    end
    object Button42: TButton
      Left = 600
      Top = 32
      Width = 49
      Height = 25
      Caption = 'SET'
      TabOrder = 16
      OnClick = Button42Click
    end
    object Button43: TButton
      Left = 600
      Top = 64
      Width = 49
      Height = 25
      Caption = 'NOW'
      TabOrder = 17
      OnClick = Button43Click
    end
    object CheckBox16: TCheckBox
      Left = 8
      Top = 96
      Width = 153
      Height = 17
      Caption = 'Save as power on message'
      TabOrder = 18
    end
    object Button44: TButton
      Left = 173
      Top = 93
      Width = 172
      Height = 25
      Caption = 'SHOW POWER ON MESSAGE'
      TabOrder = 19
      OnClick = Button44Click
    end
  end
  object GroupBox10: TGroupBox
    Left = 432
    Top = 848
    Width = 121
    Height = 81
    Caption = 'Protocol Type'
    TabOrder = 9
    object ComboBox11: TComboBox
      Left = 8
      Top = 24
      Width = 97
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = ComboBox11Change
      Items.Strings = (
        'DEFAULT'
        'COMPASS')
    end
    object Button39: TButton
      Left = 8
      Top = 48
      Width = 75
      Height = 25
      Caption = 'SET'
      Enabled = False
      TabOrder = 1
      OnClick = Button39Click
    end
  end
  object Button47: TButton
    Left = 584
    Top = 24
    Width = 75
    Height = 89
    Caption = 'TEST'
    Enabled = False
    TabOrder = 10
    Visible = False
    OnClick = Button47Click
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 176
    Top = 96
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer2Timer
    Left = 208
    Top = 96
  end
end
