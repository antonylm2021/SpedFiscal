object CadBens: TCadBens
  Left = 0
  Top = 0
  Caption = 'Bens Imobilizados'
  ClientHeight = 306
  ClientWidth = 661
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 99
    Width = 62
    Height = 13
    Caption = 'Identifica'#231#227'o'
  end
  object Label2: TLabel
    Left = 192
    Top = 99
    Width = 71
    Height = 13
    Caption = 'Conta Cont'#225'bil'
  end
  object lblpatrimonio: TLabeledEdit
    Left = 16
    Top = 72
    Width = 121
    Height = 21
    EditLabel.Width = 88
    EditLabel.Height = 13
    EditLabel.Caption = 'C'#243'digo Patrimonial'
    TabOrder = 0
  end
  object Cbident: TComboBox
    Left = 16
    Top = 118
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 1
    Text = '1: Bem'
    Items.Strings = (
      '1: Bem'
      '2: Componente')
  end
  object cbconta: TComboBox
    Left = 192
    Top = 118
    Width = 153
    Height = 21
    Style = csDropDownList
    TabOrder = 2
  end
  object lblDescricao: TLabeledEdit
    Left = 16
    Top = 168
    Width = 593
    Height = 21
    EditLabel.Width = 84
    EditLabel.Height = 13
    EditLabel.Caption = 'Descri'#231#227'o do Bem'
    TabOrder = 3
  end
  object lblcodprincipal: TLabeledEdit
    Left = 16
    Top = 224
    Width = 121
    Height = 21
    EditLabel.Width = 113
    EditLabel.Height = 13
    EditLabel.Caption = 'C'#243'digo do Bem Principal'
    TabOrder = 4
  end
  object lblParcelas: TLabeledEdit
    Left = 168
    Top = 224
    Width = 121
    Height = 21
    EditLabel.Width = 40
    EditLabel.Height = 13
    EditLabel.Caption = 'Parcelas'
    TabOrder = 5
  end
  object Button1: TButton
    Left = 16
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 97
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 7
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 178
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 8
    OnClick = Button3Click
  end
  object lblid: TLabeledEdit
    Left = 16
    Top = 24
    Width = 121
    Height = 21
    EditLabel.Width = 72
    EditLabel.Height = 13
    EditLabel.Caption = 'C'#243'digo Interno'
    Enabled = False
    ReadOnly = True
    TabOrder = 9
  end
  object Button4: TButton
    Left = 143
    Top = 22
    Width = 75
    Height = 25
    Caption = 'Localizar'
    TabOrder = 10
    OnClick = Button4Click
  end
end
