unit TesteWK.View.Service.DM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.UI, Vcl.Forms, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TServiceDM = class(TDataModule)
    conTesteWK: TFDConnection;
    msdTesteWK: TFDPhysMySQLDriverLink;
    fwcTesteWK: TFDGUIxWaitCursor;
    qryClientes: TFDQuery;
    qryClientescli_id: TFDAutoIncField;
    qryClientescli_nome: TStringField;
    qryProdutos: TFDQuery;
    qryProdutospro_id: TFDAutoIncField;
    qryProdutospro_descricao: TStringField;
    qryProdutospro_valorvenda: TSingleField;
    dtsClientes: TDataSource;
    dtsProdutos: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ServiceDM: TServiceDM;

implementation

uses
  TesteWK.View.Service.Consts;

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TServiceDM.DataModuleCreate(Sender: TObject);
begin
  // Configuração de conexão:
  conTesteWK.Connected := False;

  conTesteWK.Params.Clear;
  conTesteWK.Params.Add('Database=' + _DB_DATABASENAME);
  conTesteWK.Params.Add('DriverID=MySQL');
  conTesteWK.Params.Add('Server=' + _DB_SERVER);
  conTesteWK.Params.Add('User_Name=' + _DB_USERNAME);

  msdTesteWK.VendorHome := ExtractFilePath(Application.ExeName);
  msdTesteWK.VendorLib := 'libmysql.dll';

  // Abertura das tabelas de suporte:
  qryClientes.Open;
  qryProdutos.Open;
end;

end.
