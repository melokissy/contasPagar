object dmBancos: TdmBancos
  OldCreateOrder = False
  Height = 148
  Width = 362
  object cdsBanco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBanco'
    Left = 280
    Top = 48
    object cdsBancoIDBANCO: TIntegerField
      FieldName = 'IDBANCO'
      Required = True
    end
    object cdsBancoNOMEBANCO: TStringField
      FieldName = 'NOMEBANCO'
      Size = 45
    end
    object cdsBancoCODIGOBANCO: TStringField
      FieldName = 'CODIGOBANCO'
      Size = 5
    end
  end
  object qryAux: TFDQuery
    Connection = dmConexao.fdConnection
    Left = 48
    Top = 48
  end
  object qryBanco: TFDQuery
    Connection = dmConexao.fdConnection
    SQL.Strings = (
      'select * from bancos')
    Left = 112
    Top = 48
  end
  object dspBanco: TDataSetProvider
    DataSet = qryBanco
    Left = 192
    Top = 48
  end
end
