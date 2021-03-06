object dmUsuario: TdmUsuario
  OldCreateOrder = False
  Height = 202
  Width = 484
  object cdsUsuarios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsuario'
    Left = 352
    Top = 64
    object cdsUsuariosIDUSU: TIntegerField
      FieldName = 'IDUSU'
      Required = True
    end
    object cdsUsuariosNOMEUSU: TStringField
      FieldName = 'NOMEUSU'
      Size = 150
    end
    object cdsUsuariosLOGINUSU: TStringField
      FieldName = 'LOGINUSU'
      Size = 10
    end
    object cdsUsuariosEMAILUSU: TStringField
      FieldName = 'EMAILUSU'
      Size = 30
    end
    object cdsUsuariosSENHAUSU: TStringField
      FieldName = 'SENHAUSU'
      Size = 30
    end
    object cdsUsuariosCPFUSU: TStringField
      FieldName = 'CPFUSU'
      Size = 11
    end
    object cdsUsuariosENDERECOUSU: TStringField
      FieldName = 'ENDERECOUSU'
      Size = 45
    end
    object cdsUsuariosCEPID: TIntegerField
      FieldName = 'CEPID'
    end
  end
  object qryUsuario: TFDQuery
    Connection = dmConexao.fdConnection
    SQL.Strings = (
      'select * from usuarios')
    Left = 120
    Top = 64
  end
  object dspUsuario: TDataSetProvider
    DataSet = qryUsuario
    Left = 248
    Top = 64
  end
  object qryAux: TFDQuery
    Connection = dmConexao.fdConnection
    Left = 48
    Top = 64
  end
end
