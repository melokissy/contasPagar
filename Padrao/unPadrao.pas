unit unPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  System.Actions, Vcl.ActnList, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls,
  Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TForm1 = class(TForm)
    ActionList1: TActionList;
    actIncluir: TAction;
    actSalvar: TAction;
    actExcluir: TAction;
    actCancelar: TAction;
    actFechar: TAction;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    actAlterar: TAction;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    PageControl: TPageControl;
    tsConsulta: TTabSheet;
    tsCadastro: TTabSheet;
    DBGrid1: TDBGrid;
    StatusBar1: TStatusBar;
    procedure actIncluirExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
    procedure habilitaBotoes;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.actAlterarExecute(Sender: TObject);
begin
  //HabilitaBotoes;
  StatusBar1.Panels[0].Text := 'Mensagem: Alterando registro...';

  PageControl.ActivePage:=tsCadastro;
end;

procedure TForm1.actCancelarExecute(Sender: TObject);
begin
  actIncluir.Enabled := True;
  actAlterar.Enabled := True;
  actExcluir.Enabled := True;
  actSalvar.Enabled := False;
  actCancelar.Enabled := False;
  actFechar.Enabled := True;

  PageControl.ActivePage:=tsConsulta;

end;

procedure TForm1.actExcluirExecute(Sender: TObject);
begin
  //
end;

procedure TForm1.actFecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TForm1.actIncluirExecute(Sender: TObject);
begin
  actIncluir.Enabled := False;
  actAlterar.Enabled := False;
  actExcluir.Enabled := False;
  actFechar.Enabled := False;
  actSalvar.Enabled := True;
  actCancelar.Enabled := True;

  StatusBar1.Panels[0].Text := 'Mensagem: Incluindo registro...';
  PageControl.ActivePage:=tsCadastro;
end;


procedure TForm1.actSalvarExecute(Sender: TObject);
begin
  actIncluir.Enabled := True;
  actAlterar.Enabled := True;
  actExcluir.Enabled := True;
  actSalvar.Enabled := False;
  actCancelar.Enabled := False;
  actFechar.Enabled := True;

  StatusBar1.Panels[0].Text := 'Mensagem: Incluindo registro...';
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  PageControl.ActivePage:=tsConsulta;

  actIncluir.Enabled := True;
  actAlterar.Enabled := True;
  actExcluir.Enabled := True;
  actSalvar.Enabled := False;
  actCancelar.Enabled := False;
  actFechar.Enabled := True;
end;

procedure TForm1.habilitaBotoes;
begin
  actIncluir.Enabled := False;
  actAlterar.Enabled := False;
  actExcluir.Enabled := False;
  actSalvar.Enabled := True;
  actCancelar.Enabled := True;
  actFechar.Enabled := False;
end;

end.