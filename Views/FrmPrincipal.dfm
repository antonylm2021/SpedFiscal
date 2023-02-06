object FPrincipal: TFPrincipal
  Left = 0
  Top = 0
  Caption = 'Gerador Lopes Escritura'#231#227'o Fiscal'
  ClientHeight = 391
  ClientWidth = 642
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 16
    Top = 56
    object Cadastro1: TMenuItem
      Caption = 'Cadastro B'#225'sico'
      object Empresa1: TMenuItem
        Caption = 'Empresa'
        OnClick = Empresa1Click
      end
      object Contabilidade1: TMenuItem
        Caption = 'Contabilidade'
        OnClick = Contabilidade1Click
      end
      object ContasContabeis1: TMenuItem
        Caption = 'Contas Contabeis'
        OnClick = ContasContabeis1Click
      end
      object Centrodecustos1: TMenuItem
        Caption = 'Centro de Custos'
        OnClick = Centrodecustos1Click
      end
      object BensImobilizados1: TMenuItem
        Caption = 'Bens Imobilizados'
        OnClick = BensImobilizados1Click
      end
      object LimparTabelas1: TMenuItem
        Caption = 'Limpar Tabelas'
        OnClick = LimparTabelas1Click
      end
    end
    object ConversorXml1: TMenuItem
      Caption = 'Conversor Xml'
      OnClick = ConversorXml1Click
    end
    object SpedFiscal1: TMenuItem
      Caption = 'Sped Fiscal'
      OnClick = SpedFiscal1Click
    end
    object SpedContribuies1: TMenuItem
      Caption = 'Sped Contribui'#231#245'es'
      OnClick = SpedContribuies1Click
    end
  end
end
