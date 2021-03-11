unit TesteWK.View.Service.Utils;

interface

uses
  FireDAC.Comp.Client;

type
  TServiceUtils = class
  public
    function GetSequencial(Tabela: string): Integer;
  end;

var
  ServiceUtils: TServiceUtils;

implementation

uses
  TesteWK.View.Service.DM;

{ TServiceUtils }

function TServiceUtils.GetSequencial(Tabela: string): Integer;
var
  FDQuery: TFDQuery;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := ServiceDM.conTesteWK;
    try
      FDQuery.Connection.StartTransaction;

      FDQuery.Open('SELECT `get_sequencial`(:tabela)', [Tabela]);

      Result := FDQuery.Fields[0].AsInteger;

      FDQuery.Connection.Commit;
    except
      Result := 0;
      FDQuery.Connection.Rollback;
    end;
  finally
    FDQuery.Free;
  end;
end;

initialization

ServiceUtils := TServiceUtils.Create;

finalization

ServiceUtils.Free;

end.
