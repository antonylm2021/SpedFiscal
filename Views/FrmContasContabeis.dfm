object FContascontabeis: TFContascontabeis
  Left = 0
  Top = 0
  Caption = 'Contas Contabeis'
  ClientHeight = 232
  ClientWidth = 593
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 117
    Width = 44
    Height = 13
    Caption = 'Natureza'
  end
  object Label2: TLabel
    Left = 288
    Top = 117
    Width = 45
    Height = 13
    Caption = 'Indicador'
  end
  object LblId: TLabeledEdit
    Left = 24
    Top = 32
    Width = 153
    Height = 21
    EditLabel.Width = 33
    EditLabel.Height = 13
    EditLabel.Caption = 'C'#243'digo'
    Enabled = False
    TabOrder = 6
  end
  object LblNome: TLabeledEdit
    Left = 24
    Top = 80
    Width = 385
    Height = 21
    EditLabel.Width = 74
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome da Conta'
    TabOrder = 0
  end
  object CboxNaureza: TComboBox
    Left = 24
    Top = 136
    Width = 249
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 2
    Text = '01: Contas de ativo'
    Items.Strings = (
      '01: Contas de ativo'
      '02: Contas de passivo'
      '03: Patrim'#244'nio l'#237'quido'
      '04: Contas de resultado'
      '05: Contas de compensa'#231#227'o'
      '09: Outras')
  end
  object CbIndicador: TComboBox
    Left = 288
    Top = 136
    Width = 289
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 3
    Text = 'S: Sint'#233'tica (grupo de contas)'
    Items.Strings = (
      'S: Sint'#233'tica (grupo de contas)'
      'A: Anal'#237'tica (conta)')
  end
  object LblNivel: TLabeledEdit
    Left = 428
    Top = 80
    Width = 149
    Height = 21
    EditLabel.Width = 23
    EditLabel.Height = 13
    EditLabel.Caption = 'N'#237'vel'
    TabOrder = 1
  end
  object Button1: TButton
    Left = 24
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 105
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 5
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 183
    Top = 30
    Width = 75
    Height = 25
    Caption = 'Localizar'
    TabOrder = 7
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 186
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 8
    OnClick = Button4Click
  end
end
