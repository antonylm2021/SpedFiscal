object FrmCadastroEmpresa: TFrmCadastroEmpresa
  Left = 0
  Top = 0
  Caption = 'Cadastro de Empresas'
  ClientHeight = 340
  ClientWidth = 746
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
  object LblId: TLabeledEdit
    Left = 24
    Top = 24
    Width = 121
    Height = 21
    EditLabel.Width = 10
    EditLabel.Height = 13
    EditLabel.Caption = 'Id'
    ReadOnly = True
    TabOrder = 15
  end
  object LblRazao: TLabeledEdit
    Left = 24
    Top = 67
    Width = 713
    Height = 21
    EditLabel.Width = 59
    EditLabel.Height = 13
    EditLabel.Caption = 'Raz'#227'o social'
    TabOrder = 3
  end
  object LblFantasia: TLabeledEdit
    Left = 24
    Top = 115
    Width = 713
    Height = 21
    EditLabel.Width = 41
    EditLabel.Height = 13
    EditLabel.Caption = 'Fantasia'
    TabOrder = 4
  end
  object LblCnpj: TLabeledEdit
    Left = 151
    Top = 24
    Width = 178
    Height = 21
    EditLabel.Width = 22
    EditLabel.Height = 13
    EditLabel.Caption = 'Cnpj'
    TabOrder = 0
  end
  object LblIe: TLabeledEdit
    Left = 343
    Top = 24
    Width = 121
    Height = 21
    EditLabel.Width = 10
    EditLabel.Height = 13
    EditLabel.Caption = 'IE'
    TabOrder = 1
  end
  object LblTelefone: TLabeledEdit
    Left = 470
    Top = 24
    Width = 121
    Height = 21
    EditLabel.Width = 42
    EditLabel.Height = 13
    EditLabel.Caption = 'Telefone'
    TabOrder = 2
  end
  object LblEndereco: TLabeledEdit
    Left = 24
    Top = 163
    Width = 329
    Height = 21
    EditLabel.Width = 45
    EditLabel.Height = 13
    EditLabel.Caption = 'Endere'#231'o'
    TabOrder = 5
  end
  object LblNumero: TLabeledEdit
    Left = 359
    Top = 163
    Width = 66
    Height = 21
    EditLabel.Width = 12
    EditLabel.Height = 13
    EditLabel.Caption = 'N'#176
    TabOrder = 6
  end
  object LblBairro: TLabeledEdit
    Left = 431
    Top = 163
    Width = 146
    Height = 21
    EditLabel.Width = 28
    EditLabel.Height = 13
    EditLabel.Caption = 'Bairro'
    TabOrder = 7
  end
  object LblCidade: TLabeledEdit
    Left = 583
    Top = 163
    Width = 114
    Height = 21
    EditLabel.Width = 33
    EditLabel.Height = 13
    EditLabel.Caption = 'Cidade'
    TabOrder = 8
  end
  object LblUf: TLabeledEdit
    Left = 703
    Top = 163
    Width = 34
    Height = 21
    EditLabel.Width = 13
    EditLabel.Height = 13
    EditLabel.Caption = 'UF'
    TabOrder = 9
  end
  object Lblemail: TLabeledEdit
    Left = 519
    Top = 203
    Width = 218
    Height = 21
    EditLabel.Width = 24
    EditLabel.Height = 13
    EditLabel.Caption = 'Email'
    TabOrder = 12
  end
  object Lblcomplemento: TLabeledEdit
    Left = 184
    Top = 203
    Width = 329
    Height = 21
    EditLabel.Width = 65
    EditLabel.Height = 13
    EditLabel.Caption = 'Complemento'
    TabOrder = 11
  end
  object Lblibge: TLabeledEdit
    Left = 24
    Top = 251
    Width = 329
    Height = 21
    EditLabel.Width = 55
    EditLabel.Height = 13
    EditLabel.Caption = 'C'#237'digo IBGE'
    TabOrder = 13
  end
  object Button1: TButton
    Left = 24
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 14
    OnClick = Button1Click
  end
  object LblCep: TLabeledEdit
    Left = 24
    Top = 203
    Width = 145
    Height = 21
    EditLabel.Width = 19
    EditLabel.Height = 13
    EditLabel.Caption = 'Cep'
    TabOrder = 10
  end
end
