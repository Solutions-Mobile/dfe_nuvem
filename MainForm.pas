Unit MainForm;

Interface

Uses
   Winapi.Windows,
   Winapi.Messages,
   System.SysUtils,
   System.Classes,
   System.JSON,
   Vcl.Forms,
   Vcl.StdCtrls,
   Vcl.ExtCtrls,
   Vcl.Controls,
   Vcl.Dialogs,
   Vcl.ComCtrls,
   Data.DB,
   FireDAC.Comp.Client,
   DBConexao, DBConexaoConfig,
   FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
   FireDAC.Comp.DataSet, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait,
   NFe.JsonBuilder;

Type
   TfrmMain = Class(TForm)
      pnlBanco: TPanel;
      lblDatabase: TLabel;
      edtDatabase: TEdit;
      lblUser: TLabel;
      edtUser: TEdit;
      lblPassword: TLabel;
      edtPassword: TEdit;
      btnConectar: TButton;
      MemoJSON: TMemo;
      MemoLog: TMemo;

      PageControl: TPageControl;
      TabJSON: TTabSheet;
      TabLog: TTabSheet;
      FDQuery1: TFDQuery;
      edtNumeroNF: TEdit;

      Procedure FormCreate(Sender: TObject);
      Procedure btnConectarClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
   Private
      FConnection: TDBConnection;

      Procedure Log(Const ATexto: String);
      Procedure TestarDTO(IdNFe: integer);
   End;

Var
   frmMain: TfrmMain;

Implementation

Uses NFe.Scripts, NFe.DTO, NFe.Mapper, api.Utils;

{$R *.dfm}


Procedure TfrmMain.TestarDTO(IdNFe: integer);
Var
   NFeDTO: TNFeDTO;
   LJSON: TJSONObject;
Begin
   NFeDTO := TNFeDTO.Create;
   Try
      Try
         TNFeMapper.Mapear(FConnection.Connection, IdNFe, NFeDTO);
         LJSON := TNFeJsonBuilder.Build(NFeDTO);
         Try
            MemoJSON.Text := TUtils.FormatarJSON(LJSON.ToString);
            //MemoJSON.Text := LJSON.ToJSON;
         Finally
            LJSON.Free;
         End;
      Finally
         NFeDTO.Free;
      End;
   Except
      On E: Exception Do
         ShowMessage(
            'Erro ao gerar JSON da NF-e:' + sLineBreak +
            E.ClassName + sLineBreak +
            E.Message + sLineBreak);
   End;
End;

Procedure TfrmMain.FormCreate(Sender: TObject);
Begin
   FConnection := TDBConnection.Create;

   edtUser.Text := 'SYSDBA';
   edtPassword.Text := 'masterkey';

   MemoJSON.ScrollBars := ssBoth;
   MemoJSON.WordWrap := False;
   MemoLog.ScrollBars := ssVertical;

   Log('Aplicação iniciada.');
End;

Procedure TfrmMain.FormShow(Sender: TObject);
Var
   Info: TConnectionConfigDTO;
Begin
   Info := TConnectionConfigDTO.Create;
   Try
      TConnectionConfig.LerConexao(Info);
      edtDatabase.Text := Info.CaminhoBanco;
      edtNumeroNF.Text := Info.IdNFe;
   Finally
      Info.Free;
   End;
End;

Procedure TfrmMain.btnConectarClick(Sender: TObject);
Var
   Info: TConnectionConfigDTO;
Begin
   Try
      FConnection.Connect(edtDatabase.Text, edtUser.Text, edtPassword.Text);
      Log('Conectado ao Firebird.');
   Except
      On E: Exception Do
      Begin
         Log('ERRO: ' + E.Message);
         ShowMessage(E.Message);
      End;
   End;

   Info := TConnectionConfigDTO.Create;
   Try
      TestarDTO(StrToIntDef(edtNumeroNF.Text, 0));
      Info.CaminhoBanco := edtDatabase.Text;
      Info.IdNFe := edtNumeroNF.Text;
      TConnectionConfig.SalvarConexao(Info);
   Finally
      Info.Free;
   End;
End;

Procedure TfrmMain.Log(Const ATexto: String);
Begin
   MemoLog.Lines.Add(
      FormatDateTime('hh:nn:ss', Now) + ' - ' +
      ATexto);
End;

End.
