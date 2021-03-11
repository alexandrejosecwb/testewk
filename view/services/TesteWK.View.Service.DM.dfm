object ServiceDM: TServiceDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 372
  Width = 620
  object conTesteWK: TFDConnection
    Params.Strings = (
      'Database=alexandredb'
      'User_Name=root'
      'Server=localhost'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 40
    Top = 24
  end
  object msdTesteWK: TFDPhysMySQLDriverLink
    VendorHome = 'C:\Users\alexa\OneDrive\Desktop\TesteWK\Win32\Debug'
    VendorLib = 'libmysql.dll'
    Left = 120
    Top = 24
  end
  object fwcTesteWK: TFDGUIxWaitCursor
    Provider = 'Forms'
    ScreenCursor = gcrNone
    Left = 200
    Top = 24
  end
  object qryClientes: TFDQuery
    Connection = conTesteWK
    SQL.Strings = (
      'SELECT'
      '  cli.`cli_id`,'
      '  cli.`cli_nome`'
      'FROM'
      '  `clientes` cli'
      'ORDER BY'
      '  cli.`cli_nome`')
    Left = 40
    Top = 88
    object qryClientescli_id: TFDAutoIncField
      FieldName = 'cli_id'
      Origin = 'cli_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryClientescli_nome: TStringField
      FieldName = 'cli_nome'
      Origin = 'cli_nome'
      Required = True
      Size = 100
    end
  end
  object qryProdutos: TFDQuery
    Connection = conTesteWK
    SQL.Strings = (
      'SELECT'
      '  pro.`pro_id`,'
      '  pro.`pro_descricao`,'
      '  pro.`pro_valorvenda`'
      'FROM'
      '  `produtos` pro'
      'ORDER BY'
      '  pro.`pro_descricao`')
    Left = 40
    Top = 152
    object qryProdutospro_id: TFDAutoIncField
      FieldName = 'pro_id'
      Origin = 'pro_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryProdutospro_descricao: TStringField
      FieldName = 'pro_descricao'
      Origin = 'pro_descricao'
      Required = True
      Size = 100
    end
    object qryProdutospro_valorvenda: TSingleField
      FieldName = 'pro_valorvenda'
      Origin = 'pro_valorvenda'
      Required = True
    end
  end
  object dtsClientes: TDataSource
    DataSet = qryClientes
    Left = 120
    Top = 88
  end
  object dtsProdutos: TDataSource
    DataSet = qryProdutos
    Left = 120
    Top = 152
  end
end
