object dmCliente: TdmCliente
  OldCreateOrder = False
  Height = 173
  Width = 439
  object cdsCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCliente'
    Left = 320
    Top = 64
    object cdsClienteIDCLI: TIntegerField
      FieldName = 'IDCLI'
      Required = True
    end
    object cdsClienteNOMECLI: TStringField
      FieldName = 'NOMECLI'
      Size = 45
    end
    object cdsClienteTELEFONECLI: TStringField
      FieldName = 'TELEFONECLI'
      Size = 15
    end
    object cdsClienteEMAILCLI: TStringField
      FieldName = 'EMAILCLI'
      Size = 25
    end
    object cdsClienteENDERECOCLI: TStringField
      FieldName = 'ENDERECOCLI'
      Size = 45
    end
    object cdsClienteCEPID: TIntegerField
      FieldName = 'CEPID'
    end
    object cdsClienteCPFCLI: TStringField
      FieldName = 'CPFCLI'
      Size = 11
    end
  end
  object dspCliente: TDataSetProvider
    DataSet = qryCliente
    Left = 240
    Top = 64
  end
  object qryCliente: TFDQuery
    Active = True
    Connection = dmConexao.fdConnection
    SQL.Strings = (
      'select * from clientes')
    Left = 160
    Top = 64
  end
  object qryAux: TFDQuery
    Connection = dmConexao.fdConnection
    Left = 72
    Top = 64
  end
end
