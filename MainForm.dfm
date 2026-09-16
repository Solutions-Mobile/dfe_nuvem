object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Teste NF-e - Firebird / DTO / JSON'
  ClientHeight = 720
  ClientWidth = 1100
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBanco: TPanel
    Left = 0
    Top = 0
    Width = 1100
    Height = 82
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lblDatabase: TLabel
      Left = 12
      Top = 14
      Width = 51
      Height = 13
      Caption = 'Database:'
    end
    object lblUser: TLabel
      Left = 590
      Top = 14
      Width = 26
      Height = 13
      Caption = 'User:'
    end
    object lblPassword: TLabel
      Left = 750
      Top = 14
      Width = 52
      Height = 13
      Caption = 'Password:'
    end
    object edtDatabase: TEdit
      Left = 72
      Top = 10
      Width = 500
      Height = 21
      TabOrder = 0
      Text = 'C:\MZInfo\BANCO\Testes\Galego\CONTROL_Nuvem.FDB'
    end
    object edtUser: TEdit
      Left = 625
      Top = 10
      Width = 110
      Height = 21
      TabOrder = 1
      Text = 'SYSDBA'
    end
    object edtPassword: TEdit
      Left = 810
      Top = 10
      Width = 130
      Height = 21
      PasswordChar = '*'
      TabOrder = 2
      Text = 'masterkey'
    end
    object btnConectar: TButton
      Left = 148
      Top = 42
      Width = 125
      Height = 27
      Caption = 'Gerar JSON'
      TabOrder = 3
      OnClick = btnConectarClick
    end
    object edtNumeroNF: TEdit
      Left = 12
      Top = 45
      Width = 130
      Height = 21
      AutoSize = False
      NumbersOnly = True
      TabOrder = 4
      Text = '1900'
    end
  end
  object PageControl: TPageControl
    Left = 0
    Top = 82
    Width = 1100
    Height = 638
    ActivePage = TabJSON
    Align = alClient
    TabOrder = 1
    object TabJSON: TTabSheet
      Caption = 'JSON'
      object MemoJSON: TMemo
        Left = 0
        Top = 0
        Width = 1092
        Height = 610
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
      end
    end
    object TabLog: TTabSheet
      Caption = 'Log'
      object MemoLog: TMemo
        Left = 0
        Top = 0
        Width = 1092
        Height = 610
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object FDQuery1: TFDQuery
    Left = 640
    Top = 64
  end
end
