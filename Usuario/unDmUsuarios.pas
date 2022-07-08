unit unDmUsuarios;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.DB, Datasnap.DBClient;

type
  TdmUsuario = class(TDataModule)
    cdsUsuarios: TClientDataSet;
    qryUsuario: TFDQuery;
    dspUsuario: TDataSetProvider;
    qryAux: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmUsuario: TdmUsuario;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses unDMConexao;

{$R *.dfm}

end.
