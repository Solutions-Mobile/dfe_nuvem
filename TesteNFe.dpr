program TesteNFe;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {frmMain},
  DBConexao in 'DBConexao.pas',
  NFeApi in 'NFeApi.pas',
  NFe.DTO in 'NFe.DTO.pas',
  API.Utils in 'C:\Componentes\mzsistemas\Core\API\API.Utils.pas',
  NFe.Mapper in 'NFe.Mapper.pas',
  NFe.Scripts in 'NFe.Scripts.pas',
  NFe.ICMS.JsonBuilder in 'NFe.ICMS.JsonBuilder.pas',
  NFe.JsonBuilder in 'NFe.JsonBuilder.pas',
  NFe.PIS.JsonBuilder in 'NFe.PIS.JsonBuilder.pas',
  NFe.COFINS.JsonBuilder in 'NFe.COFINS.JsonBuilder.pas',
  NFe.Ide.JsonBuilder in 'NFe.Ide.JsonBuilder.pas',
  NFe.Emit.JsonBuilder in 'NFe.Emit.JsonBuilder.pas',
  NFe.Dest.JsonBuilder in 'NFe.Dest.JsonBuilder.pas',
  NFe.Produto.JsonBuilder in 'NFe.Produto.JsonBuilder.pas',
  NFe.Imposto.JsonBuilder in 'NFe.Imposto.JsonBuilder.pas',
  NFe.Total.JsonBuilder in 'NFe.Total.JsonBuilder.pas',
  NFe.ICMSTot.JsonBuilder in 'NFe.ICMSTot.JsonBuilder.pas',
  NFe.IBS.JsonBuilder in 'NFe.IBS.JsonBuilder.pas',
  NFe.IBSCBSMono.JsonBuilder in 'NFe.IBSCBSMono.JsonBuilder.pas',
  NFe.CBS.JsonBuilder in 'NFe.CBS.JsonBuilder.pas',
  NFe.IBSCBS.JsonBuilder in 'NFe.IBSCBS.JsonBuilder.pas',
  NFe.ISSQN.JsonBuilder in 'NFe.ISSQN.JsonBuilder.pas',
  NFe.Transporte.JsonBuilder in 'NFe.Transporte.JsonBuilder.pas',
  NFe.InfoAdicional.JsonBuilder in 'NFe.InfoAdicional.JsonBuilder.pas',
  NFe.CompraGov.JsonBuilder in 'NFe.CompraGov.JsonBuilder.pas',
  NFe.PagamentoAntecipado.JsonBuilder in 'NFe.PagamentoAntecipado.JsonBuilder.pas',
  DBConexaoConfig in 'DBConexaoConfig.pas',
  NFe.ISSQNTot.JsonBuilder in 'NFe.ISSQNTot.JsonBuilder.pas',
  NFe.RetTribTot.JsonBuilder in 'NFe.RetTribTot.JsonBuilder.pas',
  NFe.TotalISIBSCBS.JsonBuilder in 'NFe.TotalISIBSCBS.JsonBuilder.pas',
  NFe.IBSCBSTot.JsonBuilder in 'NFe.IBSCBSTot.JsonBuilder.pas',
  NFe.TribRegular.JsonBuilder in 'NFe.TribRegular.JsonBuilder.pas',
  NFe.TribCompraGov.JsonBuilder in 'NFe.TribCompraGov.JsonBuilder.pas',
  NFe.InfoComplementar in 'NFe.InfoComplementar.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
