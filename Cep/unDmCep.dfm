object dmCep: TdmCep
  OldCreateOrder = False
  Height = 174
  Width = 402
  object cdsCep: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCep'
    Left = 312
    Top = 72
    object cdsCepIDCEP: TIntegerField
      FieldName = 'IDCEP'
      Required = True
    end
    object cdsCepCIDADECEP: TStringField
      FieldName = 'CIDADECEP'
      Size = 15
    end
    object cdsCepESTADOCEP: TStringField
      FieldName = 'ESTADOCEP'
      Size = 3
    end
    object cdsCepNUMEROCEP: TStringField
      FieldName = 'NUMEROCEP'
      Size = 10
    end
    object cdsCepLOGRADOUROCEP: TStringField
      FieldName = 'LOGRADOUROCEP'
      Size = 45
    end
  end
  object dspCep: TDataSetProvider
    DataSet = qryCep
    Left = 224
    Top = 72
  end
  object qryCep: TFDQuery
    Connection = dmConexao.fdConnection
    SQL.Strings = (
      'select * from cep')
    Left = 128
    Top = 72
  end
  object qryAux: TFDQuery
    Connection = dmConexao.fdConnection
    Left = 40
    Top = 72
  end
end
