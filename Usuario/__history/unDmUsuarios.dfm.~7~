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
