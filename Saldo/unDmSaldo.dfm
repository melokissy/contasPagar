object dmSaldo: TdmSaldo
  OldCreateOrder = False
  Height = 178
  Width = 440
  object cdsSaldo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSaldo'
    Left = 328
    Top = 64
    object cdsSaldoIDSALDO: TIntegerField
      FieldName = 'IDSALDO'
      Required = True
    end
    object cdsSaldoBANCOID: TIntegerField
      FieldName = 'BANCOID'
    end
    object cdsSaldoSALDOINICIAL: TSingleField
      FieldName = 'SALDOINICIAL'
    end
    object cdsSaldoSALDOFINAL: TSingleField
      FieldName = 'SALDOFINAL'
    end
    object cdsSaldoENTRADA: TSingleField
      FieldName = 'ENTRADA'
    end
    object cdsSaldoSAIDA: TSingleField
      FieldName = 'SAIDA'
    end
    object cdsSaldoDATASALDO: TStringField
      FieldName = 'DATASALDO'
      Size = 11
    end
  end
  object dspSaldo: TDataSetProvider
    DataSet = qrySaldo
    Left = 224
    Top = 64
  end
  object qrySaldo: TFDQuery
    Connection = dmConexao.fdConnection
    SQL.Strings = (
      'select * from saldo')
    Left = 128
    Top = 64
  end
  object qryAux: TFDQuery
    Left = 48
    Top = 64
  end
end
