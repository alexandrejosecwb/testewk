unit TesteWK.View.Pages.Index;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Mask, System.UITypes;

type
  TPageIndex = class(TForm)
    pgcIndex: TPageControl;
    tbsPesquisar: TTabSheet;
    tbsData: TTabSheet;
    grdPesquisar: TDBGrid;
    qryPesquisar: TFDQuery;
    dtsPesquisar: TDataSource;
    qryPesquisarped_id: TFDAutoIncField;
    qryPesquisarped_emissao: TDateField;
    qryPesquisarped_cliente: TIntegerField;
    qryPesquisarped_valortotal: TSingleField;
    qryPesquisarcli_nome: TStringField;
    qryPesquisarest_estado: TStringField;
    qryPesquisartot_items: TLargeintField;
    dbtped_id: TDBText;
    dbtped_emissao: TDBText;
    pnlToolPesquisar: TPanel;
    btnNovoPedido: TSpeedButton;
    lblCliente: TLabel;
    dlcCliente: TDBLookupComboBox;
    btnIniciarPedido: TSpeedButton;
    dtsPedidos: TDataSource;
    dbtped_valortotal: TDBText;
    shp01: TShape;
    shp02: TShape;
    grpItems: TGroupBox;
    grdItems: TDBGrid;
    pnlItem: TPanel;
    pnlAction: TPanel;
    btnNovoItem: TSpeedButton;
    btnExcluirItem: TSpeedButton;
    dtsItems: TDataSource;
    dbnItems: TDBNavigator;
    lblpit_produto: TLabel;
    dlc_produto: TDBLookupComboBox;
    lblpit_quantidade: TLabel;
    dbe_quantidade: TDBEdit;
    lblpit_valorunitario: TLabel;
    dbe_valorunitario: TDBEdit;
    memItems: TFDMemTable;
    btnCancelarItem: TSpeedButton;
    memItems_seq: TIntegerField;
    memItems_pedido: TIntegerField;
    memItems_produto: TIntegerField;
    memItems_quantidade: TIntegerField;
    memItems_valorunitario: TCurrencyField;
    memItems_valortotal: TCurrencyField;
    memItems_descricao: TStringField;
    memPedidos: TFDMemTable;
    memPedidos_id: TIntegerField;
    memPedidos_emissao: TDateField;
    memPedidos_cliente: TIntegerField;
    memPedidos_valortotal: TCurrencyField;
    btnEfetivarPedido: TSpeedButton;
    btnSalvarItem: TSpeedButton;
    memPedidos_efetivado: TStringField;
    btnExcluirPedido: TSpeedButton;
    btnPesquisar: TSpeedButton;
    btnAtualizarPedidos: TSpeedButton;
    procedure pgcIndexChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure grdPesquisarDblClick(Sender: TObject);
    procedure btnNovoPedidoClick(Sender: TObject);
    procedure btnIniciarPedidoClick(Sender: TObject);
    procedure memPedidosNewRecord(DataSet: TDataSet);
    procedure memPedidos_idGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure memPedidos_emissaoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure memPedidos_valortotalGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure memItemsNewRecord(DataSet: TDataSet);
    procedure memPedidos_clienteChange(Sender: TField);
    procedure memPedidosAfterPost(DataSet: TDataSet);
    procedure dtsPedidosStateChange(Sender: TObject);
    procedure btnNovoItemClick(Sender: TObject);
    procedure memPedidosAfterOpen(DataSet: TDataSet);
    procedure dtsItemsStateChange(Sender: TObject);
    procedure btnSalvarItemClick(Sender: TObject);
    procedure btnCancelarItemClick(Sender: TObject);
    procedure memItems_produtoChange(Sender: TField);
    procedure memItems_quantidadeChange(Sender: TField);
    procedure memItems_valorunitarioChange(Sender: TField);
    procedure memItemsBeforePost(DataSet: TDataSet);
    procedure memItemsAfterPost(DataSet: TDataSet);
    procedure btnEfetivarPedidoClick(Sender: TObject);
    procedure memItemsBeforeDelete(DataSet: TDataSet);
    procedure memItemsAfterDelete(DataSet: TDataSet);
    procedure btnExcluirItemClick(Sender: TObject);
    procedure btnExcluirPedidoClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAtualizarPedidosClick(Sender: TObject);
    procedure grdItemsDblClick(Sender: TObject);
    procedure grdItemsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure AbrirData(Id: Integer);
    procedure AbrirPesquisa;
    procedure AtualizarGridPedido;
  public
    { Public declarations }
  end;

var
  PageIndex: TPageIndex;

implementation

uses
  TesteWK.View.Service.DM,
  TesteWK.View.Service.Utils;

{$R *.dfm}
{ TPageIndex }

procedure TPageIndex.AbrirData(Id: Integer);
var
  FDQuery: TFDQuery;
begin
  if Id = -1 then
    begin
      if not memPedidos.Active then
        memPedidos.Open;

      btnIniciarPedido.Enabled := False;

      memPedidos.Insert;
    end
  else
    begin
      memPedidos.Close;

      FDQuery := TFDQuery.Create(nil);
      try
        FDQuery.Connection := ServiceDM.conTesteWK;
        FDQuery.Open('SELECT * FROM pedidos WHERE ped_id = :ped_id', [qryPesquisarped_id.AsInteger]);

        if not FDQuery.IsEmpty then
          begin
            memPedidos.Open;
            memPedidos.Insert;
            memPedidos_id.Value := FDQuery.FieldByName('ped_id').Value;
            memPedidos_emissao.Value := FDQuery.FieldByName('ped_emissao').Value;
            memPedidos_cliente.Value := FDQuery.FieldByName('ped_cliente').Value;
            memPedidos_valortotal.Value := FDQuery.FieldByName('ped_valortotal').Value;
            memPedidos_efetivado.AsString := FDQuery.FieldByName('ped_efetivado').AsString;

            memPedidos.Post;

            FDQuery.Close;
            FDQuery.Open
              ('SELECT *, pro_descricao FROM pedidos_item INNER JOIN produtos ON (pro_id = pit_produto) WHERE pit_pedido = :pit_pedido ORDER BY pit_id',
              [qryPesquisarped_id.AsInteger]);

            while not FDQuery.Eof do
              begin
                memItems.Append;
                memItems_seq.Value := FDQuery.FieldByName('pit_seq').Value;
                memItems_pedido.Value := FDQuery.FieldByName('pit_pedido').Value;
                memItems_produto.Value := FDQuery.FieldByName('pit_produto').Value;
                memItems_quantidade.Value := FDQuery.FieldByName('pit_quantidade').Value;
                memItems_valorunitario.Value := FDQuery.FieldByName('pit_valorunitario').Value;
                memItems_valortotal.Value := FDQuery.FieldByName('pit_valortotal').Value;
                memItems_descricao.AsString := FDQuery.FieldByName('pro_descricao').AsString;
                memItems.Post;

                FDQuery.Next;
              end;
          end;
      finally
        FDQuery.Free;
      end;
    end;

  pgcIndex.ActivePage := tbsData;
end;

procedure TPageIndex.AbrirPesquisa;
begin
  if memPedidos_efetivado.AsString = 'N' then
    if MessageDlg('Efetuar a pesquisa sem efetivar este pedido excluirá o mesmo. Deseja continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      begin
        Exit;
      end;

  pgcIndex.ActivePage := tbsPesquisar;

  memItems.Close;
  memPedidos.Close;

  AtualizarGridPedido;
end;

procedure TPageIndex.AtualizarGridPedido;
begin
  qryPesquisar.DisableControls;

  TThread.CreateAnonymousThread(
    procedure
    begin
      TThread.Synchronize(TThread.CurrentThread,
        procedure
        begin
          qryPesquisar.Close;

          try
            qryPesquisar.Open;
            qryPesquisar.EnableControls;
          except
            on E: Exception do
              begin
                ShowMessage('Erro ao pesquisar pedidos de venda. - ' + E.Message);
                qryPesquisar.EnableControls;
              end;
          end;
        end);
    end).Start;
end;

procedure TPageIndex.btnAtualizarPedidosClick(Sender: TObject);
begin
  AbrirPesquisa;
end;

procedure TPageIndex.btnCancelarItemClick(Sender: TObject);
begin
  memItems.Cancel;
end;

procedure TPageIndex.btnEfetivarPedidoClick(Sender: TObject);
var
  FDQuery: TFDQuery;
begin
  if memItems.IsEmpty then
    begin
      ShowMessage('Não é possível efetivar um pedido sem items.');
      Exit;
    end;

  if MessageDlg('Deseja realmente efetivar este pedido?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      FDQuery := TFDQuery.Create(nil);
      try
        FDQuery.Connection := ServiceDM.conTesteWK;
        try
          FDQuery.Connection.StartTransaction;

          FDQuery.SQL.Text := 'INSERT INTO pedidos(ped_id, ped_emissao, ped_cliente, ped_valortotal, ped_efetivado) VALUES (:p0, :p1, :p2, :p3, :p4)';
          FDQuery.ParamByName('p0').AsInteger := memPedidos_id.AsInteger;
          FDQuery.ParamByName('p1').AsDateTime := memPedidos_emissao.AsDateTime;
          FDQuery.ParamByName('p2').AsInteger := memPedidos_cliente.AsInteger;
          FDQuery.ParamByName('p3').AsCurrency := memPedidos_valortotal.AsCurrency;
          FDQuery.ParamByName('p4').AsString := 'S';
          FDQuery.ExecSQL;

          FDQuery.SQL.Text := 'INSERT INTO pedidos_item(pit_seq, pit_pedido, pit_produto, pit_quantidade, pit_valorunitario, pit_valortotal) ' +
            ' VALUES (:p0, :p1, :p2, :p3, :p4, :p5)';

          memItems.First;
          while not memItems.Eof do
            begin
              FDQuery.ParamByName('p0').AsInteger := memItems_seq.AsInteger;
              FDQuery.ParamByName('p1').AsInteger := memItems_pedido.AsInteger;
              FDQuery.ParamByName('p2').AsInteger := memItems_produto.AsInteger;
              FDQuery.ParamByName('p3').AsInteger := memItems_quantidade.AsInteger;
              FDQuery.ParamByName('p4').AsCurrency := memItems_valorunitario.AsCurrency;
              FDQuery.ParamByName('p5').AsCurrency := memItems_valortotal.AsCurrency;

              FDQuery.ExecSQL;

              memItems.Next;
            end;

          FDQuery.Connection.Commit;

          memPedidos.Edit;
          memPedidos_efetivado.AsString := 'S';
          memPedidos.Post;
        except
          FDQuery.Connection.Rollback;
        end;
      finally
        FDQuery.Free;
      end;
    end;
end;

procedure TPageIndex.btnExcluirItemClick(Sender: TObject);
begin
  if memPedidos_efetivado.AsString = 'N' then
    memItems.Delete;
end;

procedure TPageIndex.btnExcluirPedidoClick(Sender: TObject);
var
  FDQuery: TFDQuery;
begin
  if MessageDlg('Deseja realmente excluir este pedido?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      FDQuery := TFDQuery.Create(nil);
      try
        FDQuery.Connection := ServiceDM.conTesteWK;

        FDQuery.SQL.Text := 'DELETE FROM pedidos WHERE ped_id = :ped_id';
        FDQuery.Params[0].AsInteger := memPedidos_id.AsInteger;
        FDQuery.ExecSQL;

        AbrirPesquisa;
      finally
        FDQuery.Free;
      end;
    end;
end;

procedure TPageIndex.btnIniciarPedidoClick(Sender: TObject);
begin
  try
    memPedidos.Post;
  except
    ShowMessage('Erro ao iniciar novo pedido.');
  end;
end;

procedure TPageIndex.btnNovoItemClick(Sender: TObject);
begin
  pnlItem.Visible := True;

  if not memItems.Active then
    memItems.Open;

  memItems.Last;
  memItems.Append;

  dlc_produto.SetFocus;
end;

procedure TPageIndex.btnNovoPedidoClick(Sender: TObject);
begin
  AbrirData(-1);
end;

procedure TPageIndex.btnPesquisarClick(Sender: TObject);
begin
  AbrirPesquisa;
end;

procedure TPageIndex.btnSalvarItemClick(Sender: TObject);
begin
  memItems.Post;
end;

procedure TPageIndex.dtsItemsStateChange(Sender: TObject);
begin
  grdItems.Enabled := (memItems.State = dsBrowse);
  dbnItems.Enabled := (memItems.State = dsBrowse);
  pnlItem.Visible := (memItems.State in [dsEdit, dsInsert]);

  btnNovoItem.Enabled := (memItems.State = dsBrowse) and (memPedidos_efetivado.AsString = 'N');
  btnSalvarItem.Enabled := (memItems.State in [dsEdit, dsInsert]) and (memPedidos_efetivado.AsString = 'N');
  btnCancelarItem.Enabled := (memItems.State in [dsEdit, dsInsert]) and (memPedidos_efetivado.AsString = 'N');
  btnExcluirItem.Enabled := (memItems.State = dsBrowse) and (memPedidos_efetivado.AsString = 'N') and (memItems.RecordCount > 0);
end;

procedure TPageIndex.dtsPedidosStateChange(Sender: TObject);
begin
  grpItems.Visible := memPedidos.State in [dsBrowse];
  dlcCliente.Enabled := (memPedidos.State = dsInsert);
  btnEfetivarPedido.Enabled := (memPedidos_efetivado.AsString = 'N');
  btnExcluirPedido.Enabled := (memPedidos_efetivado.AsString = 'S');
end;

procedure TPageIndex.FormCreate(Sender: TObject);
begin
  tbsPesquisar.TabVisible := False;
  tbsData.TabVisible := False;

  pgcIndex.ActivePage := tbsPesquisar;
  AtualizarGridPedido;
end;

procedure TPageIndex.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
  VK_F1:
    AbrirData(-1);
  VK_F10:
    AbrirPesquisa;
  end;
end;

procedure TPageIndex.grdItemsDblClick(Sender: TObject);
begin
  if memPedidos_efetivado.AsString = 'N' then
    begin
      memItems.Edit;
      dlc_produto.SetFocus;
    end;
end;

procedure TPageIndex.grdItemsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
  VK_DELETE:
    btnExcluirItemClick(Sender);
  VK_RETURN:
    grdItemsDblClick(Sender);
  end;
end;

procedure TPageIndex.grdPesquisarDblClick(Sender: TObject);
begin
  if not qryPesquisar.IsEmpty then
    begin
      if qryPesquisar.RecNo > 0 then
        AbrirData(qryPesquisarped_id.AsInteger);
    end;
end;

procedure TPageIndex.memItemsAfterDelete(DataSet: TDataSet);
var
  FCount: Integer;
begin
  FCount := 1;

  memItems.First;
  while not memItems.Eof do
    begin
      memItems.Edit;
      memItems_seq.AsInteger := FCount;
      memItems.Post;

      FCount := FCount + 1;

      memItems.Next;
    end;
end;

procedure TPageIndex.memItemsAfterPost(DataSet: TDataSet);
var
  FTotal: Currency;
begin
  FTotal := 0;

  memItems.First;
  while not memItems.Eof do
    begin
      FTotal := FTotal + memItems_valortotal.AsCurrency;
      memItems.Next;
    end;

  memPedidos.Edit;
  memPedidos_valortotal.AsCurrency := FTotal;
  memPedidos.Post;
end;

procedure TPageIndex.memItemsBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('Deseja realmente excluir o item selecionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      memPedidos.Edit;
      memPedidos_valortotal.AsCurrency := memPedidos_valortotal.AsCurrency - memItems_valortotal.AsCurrency;
      memPedidos.Post;
    end
  else
    begin
      Abort;
    end;
end;

procedure TPageIndex.memItemsBeforePost(DataSet: TDataSet);
begin
  if memItems.State in [dsEdit, dsInsert] then
    begin
      memItems_valortotal.AsCurrency := memItems_quantidade.AsInteger * memItems_valorunitario.AsCurrency;
    end;
end;

procedure TPageIndex.memItemsNewRecord(DataSet: TDataSet);
begin
  if memItems.State = dsInsert then
    begin
      memItems_seq.AsInteger := memItems.RecordCount + 1;
      memItems_pedido.AsInteger := memPedidos_id.AsInteger;
      memItems_quantidade.AsInteger := 1;
      memItems_valorunitario.AsCurrency := 0;
      memItems_valortotal.AsCurrency := 0;
    end;
end;

procedure TPageIndex.memItems_produtoChange(Sender: TField);
begin
  if memItems.State in [dsEdit, dsInsert] then
    begin
      memItems_descricao.AsString := ServiceDM.qryProdutospro_descricao.AsString;
      memItems_valorunitario.AsCurrency := ServiceDM.qryProdutospro_valorvenda.AsCurrency;
    end;
end;

procedure TPageIndex.memItems_quantidadeChange(Sender: TField);
begin
  if memItems.State in [dsEdit, dsInsert] then
    begin
      memItems_valortotal.AsCurrency := memItems_quantidade.AsInteger * memItems_valorunitario.AsCurrency;
    end;
end;

procedure TPageIndex.memItems_valorunitarioChange(Sender: TField);
begin
  if memItems.State in [dsEdit, dsInsert] then
    begin
      memItems_valortotal.AsCurrency := memItems_quantidade.AsInteger * memItems_valorunitario.AsCurrency;
    end;
end;

procedure TPageIndex.memPedidosAfterOpen(DataSet: TDataSet);
begin
  memItems.Close;
  memItems.Open;
end;

procedure TPageIndex.memPedidosAfterPost(DataSet: TDataSet);
begin
  btnIniciarPedido.Enabled := False;
  dtsItemsStateChange(nil);
end;

procedure TPageIndex.memPedidosNewRecord(DataSet: TDataSet);
begin
  memPedidos_id.AsInteger := ServiceUtils.GetSequencial('pedidos');
  memPedidos_emissao.AsDateTime := Now();
  memPedidos_valortotal.AsCurrency := 0;
  memPedidos_efetivado.AsString := 'N';
end;

procedure TPageIndex.memPedidos_clienteChange(Sender: TField);
begin
  btnIniciarPedido.Enabled := (Sender.DataSet.State = dsInsert) and (not Sender.IsNull);
end;

procedure TPageIndex.memPedidos_emissaoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if Sender.DataSet.State = dsInsert then
    begin
      Text := '';
    end
  else
    begin
      Text := 'Emitido em: ' + FormatDateTime('dd/mm/yyyy', Sender.AsDateTime);
    end;
end;

procedure TPageIndex.memPedidos_idGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if Sender.DataSet.State = dsInsert then
    begin
      Text := 'Inserindo Novo Pedido';
    end
  else
    begin
      Text := 'Pedido ' + FormatFloat('00000', Sender.AsInteger);
    end;
end;

procedure TPageIndex.memPedidos_valortotalGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if Sender.DataSet.State = dsInsert then
    begin
      Text := '';
    end
  else
    begin
      Text := 'Total do pedido: R$ ' + FormatCurr(',0.00', Sender.AsCurrency);
    end;
end;

procedure TPageIndex.pgcIndexChange(Sender: TObject);
begin
  if pgcIndex.ActivePage = tbsPesquisar then
    AtualizarGridPedido;
end;

end.
