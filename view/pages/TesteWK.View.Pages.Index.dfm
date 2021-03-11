object PageIndex: TPageIndex
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Teste WK'
  ClientHeight = 585
  ClientWidth = 995
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  Font.Quality = fqClearType
  KeyPreview = True
  Padding.Left = 5
  Padding.Top = 5
  Padding.Right = 5
  Padding.Bottom = 5
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 16
  object pgcIndex: TPageControl
    Left = 5
    Top = 5
    Width = 985
    Height = 575
    ActivePage = tbsData
    Align = alClient
    TabOrder = 0
    OnChange = pgcIndexChange
    object tbsPesquisar: TTabSheet
      Caption = 'Pesquisar'
      object grdPesquisar: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 818
        Height = 538
        Align = alClient
        DataSource = dtsPesquisar
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        Font.Quality = fqClearType
        Options = [dgTitles, dgIndicator, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Verdana'
        TitleFont.Style = [fsBold]
        TitleFont.Quality = fqClearType
        OnDblClick = grdPesquisarDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'ped_id'
            Title.Alignment = taRightJustify
            Title.Caption = 'N'#250'mero'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ped_emissao'
            Title.Caption = 'Emiss'#227'o'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cli_nome'
            Title.Caption = 'Cliente'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tot_items'
            Title.Alignment = taRightJustify
            Title.Caption = 'Total de Itens'
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ped_valortotal'
            Title.Alignment = taRightJustify
            Title.Caption = 'Valor Total'
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'est_estado'
            Title.Caption = 'Estado'
            Width = 150
            Visible = True
          end>
      end
      object pnlToolPesquisar: TPanel
        Left = 824
        Top = 0
        Width = 153
        Height = 544
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object btnNovoPedido: TSpeedButton
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 147
          Height = 30
          Align = alTop
          Caption = 'Novo Pedido (F1)'
          OnClick = btnNovoPedidoClick
          ExplicitWidth = 118
        end
        object btnAtualizarPedidos: TSpeedButton
          AlignWithMargins = True
          Left = 3
          Top = 511
          Width = 147
          Height = 30
          Align = alBottom
          Caption = 'Atualizar'
          OnClick = btnAtualizarPedidosClick
          ExplicitLeft = 11
          ExplicitTop = 115
        end
      end
    end
    object tbsData: TTabSheet
      Caption = 'Editar'
      ImageIndex = 1
      object dbtped_id: TDBText
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 971
        Height = 25
        Align = alTop
        Alignment = taCenter
        DataField = '_id'
        DataSource = dtsPedidos
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Font.Quality = fqClearType
        ParentFont = False
        ExplicitWidth = 162
      end
      object dbtped_emissao: TDBText
        AlignWithMargins = True
        Left = 3
        Top = 34
        Width = 971
        Height = 16
        Align = alTop
        Alignment = taCenter
        DataField = '_emissao'
        DataSource = dtsPedidos
        ExplicitWidth = 152
      end
      object lblCliente: TLabel
        Left = 16
        Top = 70
        Width = 51
        Height = 16
        Caption = 'Cliente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Font.Quality = fqClearType
        ParentFont = False
      end
      object btnIniciarPedido: TSpeedButton
        Left = 407
        Top = 89
        Width = 146
        Height = 30
        Caption = 'Iniciar pedido'
        OnClick = btnIniciarPedidoClick
      end
      object dbtped_valortotal: TDBText
        AlignWithMargins = True
        Left = 3
        Top = 516
        Width = 971
        Height = 25
        Align = alBottom
        Alignment = taRightJustify
        DataField = '_valortotal'
        DataSource = dtsPedidos
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Font.Quality = fqClearType
        ParentFont = False
        ExplicitLeft = 6
        ExplicitTop = 11
        ExplicitWidth = 945
      end
      object shp01: TShape
        AlignWithMargins = True
        Left = 3
        Top = 56
        Width = 971
        Height = 1
        Align = alTop
        ExplicitLeft = 272
        ExplicitTop = 264
        ExplicitWidth = 65
      end
      object shp02: TShape
        AlignWithMargins = True
        Left = 3
        Top = 509
        Width = 971
        Height = 1
        Align = alBottom
        ExplicitLeft = 272
        ExplicitTop = 264
        ExplicitWidth = 65
      end
      object btnEfetivarPedido: TSpeedButton
        Left = 559
        Top = 89
        Width = 146
        Height = 30
        Caption = 'Efetivar pedido'
        OnClick = btnEfetivarPedidoClick
      end
      object btnExcluirPedido: TSpeedButton
        Left = 711
        Top = 89
        Width = 146
        Height = 30
        Caption = 'Excluir pedido'
        OnClick = btnExcluirPedidoClick
      end
      object btnPesquisar: TSpeedButton
        Left = 815
        Top = 3
        Width = 146
        Height = 30
        Caption = 'Pesquisar (F10)'
        OnClick = btnPesquisarClick
      end
      object dlcCliente: TDBLookupComboBox
        Left = 16
        Top = 92
        Width = 385
        Height = 24
        DataField = '_cliente'
        DataSource = dtsPedidos
        KeyField = 'cli_id'
        ListField = 'cli_nome'
        ListSource = ServiceDM.dtsClientes
        TabOrder = 0
      end
      object grpItems: TGroupBox
        Left = 16
        Top = 128
        Width = 945
        Height = 375
        Caption = ' Items '
        TabOrder = 1
        object grdItems: TDBGrid
          AlignWithMargins = True
          Left = 5
          Top = 126
          Width = 935
          Height = 244
          Align = alClient
          DataSource = dtsItems
          Options = [dgTitles, dgIndicator, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
          TitleFont.Quality = fqClearType
          OnDblClick = grdItemsDblClick
          OnKeyDown = grdItemsKeyDown
          Columns = <
            item
              Expanded = False
              FieldName = '_seq'
              Title.Alignment = taRightJustify
              Title.Caption = '#'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = '_produto'
              Title.Alignment = taRightJustify
              Title.Caption = 'C'#243'digo'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = '_descricao'
              Title.Caption = 'Descri'#231#227'o'
              Width = 370
              Visible = True
            end
            item
              Expanded = False
              FieldName = '_quantidade'
              Title.Alignment = taRightJustify
              Title.Caption = 'Quantidade'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = '_valorunitario'
              Title.Alignment = taRightJustify
              Title.Caption = 'Valor Unit'#225'rio'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = '_valortotal'
              Title.Alignment = taRightJustify
              Title.Caption = 'Valor Total'
              Width = 120
              Visible = True
            end>
        end
        object pnlItem: TPanel
          Left = 2
          Top = 54
          Width = 941
          Height = 69
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object lblpit_produto: TLabel
            Left = 3
            Top = 3
            Width = 57
            Height = 16
            Caption = 'Produto'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            Font.Quality = fqClearType
            ParentFont = False
          end
          object lblpit_quantidade: TLabel
            Left = 394
            Top = 3
            Width = 84
            Height = 16
            Caption = 'Quantidade'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            Font.Quality = fqClearType
            ParentFont = False
          end
          object lblpit_valorunitario: TLabel
            Left = 521
            Top = 3
            Width = 99
            Height = 16
            Caption = 'Valor Unit'#225'rio'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            Font.Quality = fqClearType
            ParentFont = False
          end
          object dlc_produto: TDBLookupComboBox
            Left = 3
            Top = 25
            Width = 385
            Height = 24
            DataField = '_produto'
            DataSource = dtsItems
            KeyField = 'pro_id'
            ListField = 'pro_descricao'
            ListSource = ServiceDM.dtsProdutos
            TabOrder = 0
          end
          object dbe_quantidade: TDBEdit
            Left = 394
            Top = 25
            Width = 121
            Height = 24
            DataField = '_quantidade'
            DataSource = dtsItems
            TabOrder = 1
          end
          object dbe_valorunitario: TDBEdit
            Left = 521
            Top = 25
            Width = 121
            Height = 24
            DataField = '_valorunitario'
            DataSource = dtsItems
            TabOrder = 2
          end
        end
        object pnlAction: TPanel
          Left = 2
          Top = 18
          Width = 941
          Height = 36
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object btnNovoItem: TSpeedButton
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 118
            Height = 30
            Align = alLeft
            Caption = 'Novo Item'
            OnClick = btnNovoItemClick
            ExplicitHeight = 36
          end
          object btnExcluirItem: TSpeedButton
            AlignWithMargins = True
            Left = 375
            Top = 3
            Width = 118
            Height = 30
            Align = alLeft
            Caption = 'Excluir Item'
            OnClick = btnExcluirItemClick
            ExplicitLeft = 251
            ExplicitHeight = 36
          end
          object btnCancelarItem: TSpeedButton
            AlignWithMargins = True
            Left = 251
            Top = 3
            Width = 118
            Height = 30
            Align = alLeft
            Caption = 'Cancelar Item'
            OnClick = btnCancelarItemClick
            ExplicitLeft = 115
            ExplicitTop = 0
            ExplicitHeight = 36
          end
          object btnSalvarItem: TSpeedButton
            AlignWithMargins = True
            Left = 127
            Top = 3
            Width = 118
            Height = 30
            Align = alLeft
            Caption = 'Salvar Item'
            OnClick = btnSalvarItemClick
            ExplicitLeft = 95
            ExplicitTop = 0
            ExplicitHeight = 36
          end
          object dbnItems: TDBNavigator
            AlignWithMargins = True
            Left = 726
            Top = 3
            Width = 212
            Height = 30
            DataSource = dtsItems
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
            Align = alRight
            TabOrder = 0
          end
        end
      end
    end
  end
  object qryPesquisar: TFDQuery
    Connection = ServiceDM.conTesteWK
    SQL.Strings = (
      'SELECT'
      '  ped.*,'
      '  cli.`cli_nome`,'
      '  est.`est_estado`,'
      '  (SELECT '
      '     COUNT(*)'
      '   FROM'
      '     `pedidos_item` pit '
      '   WHERE'
      '     pit.`pit_pedido` = ped.`ped_id`'
      '  ) tot_items'
      'FROM'
      '  `pedidos` ped '
      
        '  INNER JOIN `clientes` cli ON (cli.`cli_id` = ped.`ped_cliente`' +
        ')'
      
        '  INNER JOIN `estados` est ON (est.`est_sigla` = cli.`cli_estado' +
        '`)'
      'ORDER BY '
      '  ped.`ped_id`')
    Left = 856
    Top = 336
    object qryPesquisarped_id: TFDAutoIncField
      FieldName = 'ped_id'
      ReadOnly = True
      DisplayFormat = '00000'
    end
    object qryPesquisarped_emissao: TDateField
      FieldName = 'ped_emissao'
      Required = True
    end
    object qryPesquisarped_cliente: TIntegerField
      FieldName = 'ped_cliente'
      Required = True
    end
    object qryPesquisarped_valortotal: TSingleField
      FieldName = 'ped_valortotal'
      DisplayFormat = 'R$ ,0.00'
    end
    object qryPesquisarcli_nome: TStringField
      FieldName = 'cli_nome'
      ReadOnly = True
      Size = 100
    end
    object qryPesquisarest_estado: TStringField
      FieldName = 'est_estado'
      ReadOnly = True
      Size = 100
    end
    object qryPesquisartot_items: TLargeintField
      FieldName = 'tot_items'
      ReadOnly = True
      DisplayFormat = ',0.00'
    end
  end
  object dtsPesquisar: TDataSource
    DataSet = qryPesquisar
    Left = 888
    Top = 336
  end
  object dtsPedidos: TDataSource
    DataSet = memPedidos
    OnStateChange = dtsPedidosStateChange
    Left = 888
    Top = 368
  end
  object dtsItems: TDataSource
    DataSet = memItems
    OnStateChange = dtsItemsStateChange
    Left = 888
    Top = 400
  end
  object memItems: TFDMemTable
    BeforePost = memItemsBeforePost
    AfterPost = memItemsAfterPost
    BeforeDelete = memItemsBeforeDelete
    AfterDelete = memItemsAfterDelete
    OnNewRecord = memItemsNewRecord
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 856
    Top = 400
    object memItems_seq: TIntegerField
      FieldName = '_seq'
    end
    object memItems_pedido: TIntegerField
      FieldName = '_pedido'
    end
    object memItems_produto: TIntegerField
      FieldName = '_produto'
      OnChange = memItems_produtoChange
    end
    object memItems_quantidade: TIntegerField
      FieldName = '_quantidade'
      OnChange = memItems_quantidadeChange
    end
    object memItems_valorunitario: TCurrencyField
      FieldName = '_valorunitario'
      OnChange = memItems_valorunitarioChange
    end
    object memItems_valortotal: TCurrencyField
      FieldName = '_valortotal'
    end
    object memItems_descricao: TStringField
      FieldName = '_descricao'
      Size = 100
    end
  end
  object memPedidos: TFDMemTable
    AfterOpen = memPedidosAfterOpen
    AfterPost = memPedidosAfterPost
    OnNewRecord = memPedidosNewRecord
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 856
    Top = 368
    object memPedidos_id: TIntegerField
      FieldName = '_id'
      OnGetText = memPedidos_idGetText
    end
    object memPedidos_emissao: TDateField
      FieldName = '_emissao'
      OnGetText = memPedidos_emissaoGetText
    end
    object memPedidos_cliente: TIntegerField
      FieldName = '_cliente'
      OnChange = memPedidos_clienteChange
    end
    object memPedidos_valortotal: TCurrencyField
      FieldName = '_valortotal'
      OnGetText = memPedidos_valortotalGetText
    end
    object memPedidos_efetivado: TStringField
      FieldName = '_efetivado'
      Size = 1
    end
  end
end
