unit unPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  System.Actions, Vcl.ActnList, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls,
  Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TfrmPadrao = class(TForm)
    ActionList1: TActionList;
    actIncluir: TAction;
    actSalvar: TAction;
    actExcluir: TAction;
    actCancelar: TAction;
    actFechar: TAction;
    ImageList1: TImageList;
    actAlterar: TAction;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    Image1: TImage;
    PageControl1: TPageControl;
    tsConsulta: TTabSheet;
    tsCadastro: TTabSheet;
    dbgConsulta: TDBGrid;
    btnIncluir: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnFechar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    procedure actIncluirExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
    procedure habilitaBotoes;
    procedure DisplayHint (Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmPadrao: TfrmPadrao;

implementation

{$R *.dfm}

procedure TfrmPadrao.actAlterarExecute(Sender: TObject);
begin
  HabilitaBotoes;
  StatusBar1.Panels[0].Text := 'Mensagem: Alterando registro...';

  PageControl1.ActivePage:=tsCadastro;
end;

procedure TfrmPadrao.actCancelarExecute(Sender: TObject);
begin
  actIncluir.Enabled := True;
  actAlterar.Enabled := True;
  actExcluir.Enabled := True;
  actSalvar.Enabled := False;
  actCancelar.Enabled := False;
  actFechar.Enabled := True;

  PageControl1.ActivePage:=tsConsulta;

end;

procedure TfrmPadrao.actExcluirExecute(Sender: TObject);
begin
  //
end;

procedure TfrmPadrao.actFecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmPadrao.actIncluirExecute(Sender: TObject);
begin
  actIncluir.Enabled := False;
  actAlterar.Enabled := False;
  actExcluir.Enabled := False;
  actFechar.Enabled := False;
  actSalvar.Enabled := True;
  actCancelar.Enabled := True;

  //StatusBar1.Panels[0].Text := 'Mensagem: Incluindo registro...';
  PageControl1.ActivePage:=tsCadastro;
end;


procedure TfrmPadrao.actSalvarExecute(Sender: TObject);
begin
  PageControl1.ActivePage:=tsConsulta;

  actIncluir.Enabled := True;
  actAlterar.Enabled := True;
  actExcluir.Enabled := True;
  actSalvar.Enabled := False;
  actCancelar.Enabled := False;
  actFechar.Enabled := True;

  StatusBar1.Panels[0].Text := 'Mensagem: Incluindo registro...';
end;

procedure TfrmPadrao.DisplayHint(Sender: TObject);
begin
  if Assigned(StatusBar1) then
    StatusBar1.Panels[0].Text := 'Mensagem: ' +Application.Hint;
end;

procedure TfrmPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TfrmPadrao.FormCreate(Sender: TObject);
begin
  Application.OnHint := DisplayHint;
end;

procedure TfrmPadrao.FormShow(Sender: TObject);
begin
  PageControl1.ActivePage:=tsConsulta;

  actIncluir.Enabled := True;
  actAlterar.Enabled := True;
  actExcluir.Enabled := True;
  actSalvar.Enabled := False;
  actCancelar.Enabled := False;
  actFechar.Enabled := True;
end;

procedure TfrmPadrao.habilitaBotoes;
begin
  actIncluir.Enabled := False;
  actAlterar.Enabled := False;
  actExcluir.Enabled := False;
  actSalvar.Enabled := True;
  actCancelar.Enabled := True;
  actFechar.Enabled := False;
end;

end.
