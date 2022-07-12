object dmConexao: TdmConexao
  OldCreateOrder = False
  Height = 188
  Width = 405
  object fbDriverLink: TFDPhysFBDriverLink
    DriverID = 'fbDriverLink'
    VendorLib = 'C:\Windows\System32\FBCLIENT.DLL'
    Left = 288
    Top = 72
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 160
    Top = 72
  end
  object fdConnection: TFDConnection
    ConnectionName = 'ConexaoDB'
    Params.Strings = (
      
        'Database=C:\Users\kkkkk\Documents\Embarcadero\Studio\Projects\Co' +
        'ntas_pagar\DB\PAGAMENTO.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=localhost'
      'Port=3050'
      'CharacterSet=ISO8859_2'
      'DriverID=fbDriverLink')
    Left = 56
    Top = 72
  end
end
