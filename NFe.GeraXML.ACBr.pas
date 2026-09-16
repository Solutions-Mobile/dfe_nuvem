{ ***************************************************************************
  * DATA :30/10/2023                                                        *
  * - BIBLIOTECA PARA GERAÇÃO DE NF-e, UTILIZANDO O COMPONENTE ABCr         *
  * - ESTRUTURA PADRÃO ANTERIORMENTE UTILIZADA PELO COMPONENTE DA TECNOSPEED*
  * DATA :11/09/2024
  * -
  * DESENVOLVIDA POR: Marcos Acelino Da Silva                               *
  ************************************************************************* }

Unit NFe.GeraXML.ACBr;

Interface

Uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Math,
   System.Actions, Vcl.ActnList, Data.DB, Vcl.ExtCtrls, System.IniFiles, Data.DBXFirebird, System.StrUtils,
   Data.FMTBcd, Data.SqlExpr, System.Types, System.Character, blcksock,

   ACBrMail,
   ACBrPosPrinter, ACBrNFeDANFeESCPOS, ACBrNFeDANFEClass, ACBrDANFCeFortesFr,
   ACBrDFeReport, ACBrDFeDANFeReport, ACBrNFeDANFeRLClass, ACBrBase, ACBrDFe,
   ACBrNFe, ShellAPI, XMLIntf, XMLDoc, zlib, ACBrDANFCeFortesFrA4,
   ACBrNFeNotasFiscais, ACBrUtil.FilesIO, ACBrUtil.Strings, pcnAuxiliar, ACBrNFe.Classes, ACBrDFe.Conversao,
   pcnConversaoNFe, ACBrDFeUtil,
   DFe.Constantes, uDMNFe, MZ.Biblioteca, MSG.Mensagens;

(*
  {pcnConversao,}   {pcnNFe};
*)

Type
   TNFeGeraXMLACBr = Class
   Private
      { Private declarations }
      InformarICMSMonofasico: Boolean;
      // MARCOS - 11/09/2024 - VERIFICAR NECESSIDADE DESSAS VARIÁVEIS
      // VARIÁVEIS PARA UTILIZAÇÃO APENAS PELO ACBr
      Nota: NotaFiscal;
      Detalhe: TDetCollectionItem;
      Produto: TProd;
      Imposto: TImposto;
      Servico: TDetCollectionItem;
      Transportador: TTransp;

      // VARIÁVEIS DE CONFIGURAÇÃO DOS COMPONETES ACBr
      FModoProducao: Boolean;
      FCNPJ: String;
      sqlProduto: TSQLDataSet;
      FNFe: TNFe;
      Ok: Boolean;
      FValorBCIRRF, FValorIRRF: Real;
      sScript: String;

      // VARIAVEIS DE PROPERTIES
      // FCaminho: String;
      // FMensagemSEFAZ: String;
      // FDataEmi: String;
      FIdNFe: Integer;
      FChaveXML: String;
      FXMLGerado: String;
      FACBrNFe: TACBrNFe;
      //
      CodigoProduto: String;
      RecalculaSTRet: Boolean;

      // MARCOS - 20/05/2025 - IDENTIFICA NOTA DE CONSUMO/PERDA
      NFPerda: Boolean;

      // MARCOS - 19/02/2026- IDENTIFICA NOTA PARA CONSUMIDOR FINAL
      ConsumidorFinal: Boolean;
      MesmaUF: Boolean;

      Function MensagemPartilhaSimples: String;
      Function MensagemIRRF(ValorIR: Double; ValorBCIR: Double): String;
      Procedure PreparaDS(Script: String; DS: TSQLDataSet);
      Function PegaValor_I(Campo: String; DS: TSQLDataSet): Integer;
      Function PegaValor_R(Campo: String; DS: TSQLDataSet; Decimais: Byte = 2): Real;
      Function PegaValor_D(Campo: String; DS: TSQLDataSet): TDate;
      Function PegaValor_DT(Campo: String; DS: TSQLDataSet): TDateTime;
      Function PegaValor_S(Campo: String; DS: TSQLDataSet): String;

      // NFE - GERAÇÃO DOS BLOCOS
      // INICIALIZAÇÃO
      { REVISADO } (* identific____ *) Procedure GeraBloco_B;

      // REFERENCIAS
      { REVISADO } (* doc ref nfe__ *) Procedure GeraBloco_BA02;
      { REVISADO } (* doc ref nf___ *) Procedure GeraBloco_BA03;
      { REVISADO } (* doc ref prod_ *) Procedure GeraBloco_BA10;
      { REVISADO } (* doc ref ecf__ *) Procedure GeraBloco_BA20;

      // EMISSÃO E ENTREGA
      { REVISADO } (* emitente_____ *) Procedure GeraBloco_C;
      { REVISADO } (* destinatario_ *) Procedure GeraBloco_E;
      { REVISADO } (* retirada_____ *) Procedure GeraBloco_F;
      { REVISADO } (* entrega______ *) Procedure GeraBloco_G;

      // AUTORIZADOS
      { REVISADO } (* autorização__ *) Procedure GeraBloco_GA;

      // PRODUTOS (ITENS/TRIBUTOS)
      { REVISADO } (* produto/serv_ *) Procedure GeraBloco_H;
      { REVISADO } (* detalhe prod_ *) Procedure GeraBloco_I(Prod: TProd);
      { REVISADO } (* combustível__ *) Procedure GeraBloco_LA(Prod: TProd);
      { REVISADO } (* icms_________ *) Procedure GeraBloco_N(Imposto: TImposto);
      { REVISADO } (* partilha icms *) Procedure GeraBloco_NA(Imposto: TImposto);
      { REVISADO } (* ipi__________ *) Procedure GeraBloco_O(Imposto: TImposto);
      { REVISADO } (* pis__________ *) Procedure GeraBloco_Q(Imposto: TImposto);
      { REVISADO } (* cofins_______ *) Procedure GeraBloco_S(Imposto: TImposto);

      // MARCOS - 07/11/2023 - NÃO IMPLEMENTADO (AINDA)
      // SERVICO
      (* serviço/ipi dev *) Procedure GeraBloco_U;

      // MARCOS - 27/11/2025 - REFORMA TRIBUTÁRIA
      (* reforma trib___ *) Procedure GeraBloco_UB(IdNFe: Integer; IdItem: Integer; Imposto: TImposto);

      (* referenciamento DFes *) Procedure GeraBloco_VC;

      // TOTAIS
      { REVISADO } (* totais da nfe *) Procedure GeraBloco_W;

      // TRANSPORTADOR
      { REVISADO } (* transportador *) Procedure GeraBloco_X;
      { REVISADO } (* reboque______ *) Procedure GeraBloco_X22;
      { REVISADO } (* volumes______ *) Procedure GeraBloco_X26;
      /// <summary>
      /// Método "OBSOLETO", utilizar o método "GeraBloco_X33(IdVolume: Integer; Volume: TVolCollectionItem)"
      /// </summary>
      { REVISADO } (* lacres_______ *) Procedure GeraBloco_X33(Volume: Integer); Overload;
      { REVISADO } (* lacres_______ *) Procedure GeraBloco_X33(IdVolume: Integer; Volume: TVolCollectionItem); Overload;

      // FINANCEIRO
      { REVISADO } (* cobrança_____ *) Procedure GeraBloco_Y;
      { REVISADO } (* duplicatas___ *) Procedure GeraBloco_Y07;
      { REVISADO } (* formas pagto_ *) Procedure GeraBloco_YA;

      // INFORMAÇÕES ADICIONAIS
      { REVISADO } (* info adic____ *) Procedure GeraBloco_Z;
      { REVISADO } (* info contrib_ *) Procedure GeraBloco_Z04;
      { REVISADO } (* info fisco___ *) Procedure GeraBloco_Z07;

      // (BLOCOS NÃO GERADOS: D, I80, I18, I25,I50, I52, JA, ,K, L, LB, P, R, T, Z10, ZA, ZB, ZC, ZC04, ZC10)
      // Procedure SetACBrNFe(Const Value: TACBrNFe);


      // MARCOS - 08/06/2025
      Function InformarOrigemComb(IdNFe: Integer; IdItem: Integer): Boolean;
   Public
      { Public declarations }
      Constructor Create(CNPJ: String);
      Destructor Destroy; Override;
      /// <summary>
      /// Carrega o componente NFe com informações do banco de dados
      /// </summary>
      Function GerarNFe(IdNFe: Integer; ComponenteACBr: TACBrNFe): Boolean;
   Published
      Property ChaveXML: String Read FChaveXML Write FChaveXML;
      Property IdNFe: Integer Read FIdNFe Write FIdNFe;
      Property XMLGerado: String Read FXMLGerado Write FXMLGerado;
      // Property DataEmi: String Read FDataEmi Write FDataEmi;
      // Property Caminho: String Read FCaminho Write FCaminho;
      // Property MensagemSEFAZ: String Read FMensagemSEFAZ Write FMensagemSEFAZ;
      // Property ACBrNFe: TACBrNFe Read FACBrNFe Write SetACBrNFe;
   End;

Var
   // FrmGeraArquivo: TNFeGeraXMLACBr;
   bMostraEstoque: Boolean;
   // OPERACAO_SEM_VALOR: Boolean;

Implementation

Constructor TNFeGeraXMLACBr.Create(CNPJ: String);
Begin
   FModoProducao := False;
   FCNPJ := CNPJ;
End;

Destructor TNFeGeraXMLACBr.Destroy;
Begin
   Inherited;
   //
End;

{$REGION 'Preparação do Ambiente'}

// Procedure TNFeGeraXMLACBr.SetACBrNFe(Const Value: TACBrNFe);
// Begin
// FACBrNFe := Value;
// End;

Function TNFeGeraXMLACBr.GerarNFe(IdNFe: Integer; ComponenteACBr: TACBrNFe): Boolean;
Var
   ObjINI: TIniFile;
   GerarCobranca, Temporario: Boolean;
Begin
   Result := False;
   FChaveXML := '';
   FXMLGerado := '';

   RecalculaSTRet := False;

   If (Not Assigned(ComponenteACBr)) Then
   Begin
      Exit;
   End;

   If (IdNFe <= 0) Then
   Begin
      Exit;
   End;

   FIdNFe := IdNFe;

   ObjINI := TIniFile.Create(CAMINHO_APP + MZNFE_INI);
   bMostraEstoque := ObjINI.ReadBool('Geral', 'MostraEstoque', False);
   GerarCobranca := ObjINI.ReadBool('ProcessoNFe', 'GerarCobranca', False);
   FreeAndNil(ObjINI);

   // PREPARA O COMPONENTE PARA RECEBER OS DADOS DA NFe
   FACBrNFe := ComponenteACBr;
   FACBrNFe.NotasFiscais.Clear;

   // MARCOS - 05/02/2025 - CORRIGE SEQUENCIA DOS ITENS NA NOTA
   DMNFe.AlterarSequenciaItens(IdNFe);

   // MARCOS - 19/02/2026- IDENTIFICA NOTA PARA CONSUMIDOR FINAL
   ConsumidorFinal := False;
   MesmaUF := True;

   // INSERE CADA BLOCO DE DADOS NO COMPONENTE
   // GeraBloco_A; // NFE
   GeraBloco_B; // EMISSAO
   GeraBloco_BA02; // REFER.NFE
   GeraBloco_BA03; // REFER.NF
   GeraBloco_BA10; // REFER.NF PRODUTOR
   GeraBloco_BA20; // REFER.CUPOM
   GeraBloco_C; // EMITENTE
   GeraBloco_E; // DESTINATARIO
   GeraBloco_F; // LOCAL RETIRADA
   GeraBloco_G; // LOCAL ENTREGA
   GeraBloco_GA; // AUTORIZAÇÃO
   GeraBloco_H; // ITENS, PRODUTO ESPECIFICO(COMBUSTIVEL), ICMS, IPI, II, PIS, COFINS, ISS, INFORMAÇÕES ADIC
   GeraBloco_W; // TOTAIS DA NF
   GeraBloco_X; // TRANSPORTE

   // MARCOS - 01/10/2024 - GERA COBRANÇA SE ESTIVER SETADO E NFe NÃO FOR DE DEVOLUÇÃO
   // MARCOS - 08/10/2024 - COBRANÇA

   // TESTE - 06/12/2024
   // DMNFe.GeraFatura(FIdNFe);

   // cdsNFeCobrancaVORIG_Y04.AsFloat := rValorNFe;
   // cdsNFeCobrancaVLIQ_Y06.AsFloat := rValorNFe;

   (*
     //MARCOS - RETIRADA EXCLUSÃO DE DUPLICATAS - 11/11/2024
     If (DMNFe.cdsNFeCobrancaVLIQ_Y06.AsFloat > DMNFe.cdsCadNFeVNF_W16.AsFloat) Then
     Begin
     DMNFe.ExcluirFatura(FIdNFe);
     GerarCobranca := False;
     End;
 *)

   // "FinNfe = 4 -> Devolução
   If (DMNFe.cdsCadNFeFINNFE_B25.AsString <> '4') And (GerarCobranca = True)
   Then
   Begin
      GeraBloco_Y; // COBRANÇA
      GeraBloco_Y07; // DUPLICATA
   End;

   GeraBloco_YA; // PAGAMENTO
   GeraBloco_Z; // INFORMAÇÕES ADICIONAIS

   FACBrNFe.NotasFiscais.GravarXML(CAMINHO_APP + Format(NFE_PATH_XML_TEMP, [EMP.CNPJ]));

   // MARCOS - 08/07/2026 - CNPJ ALFANUMÉRICO
   FChaveXML := TFuncoes.RetornaNumero(FACBrNFe.NotasFiscais.Items[0].NFe.infNFe.id, '');
   //FChaveXML :=  FACBrNFe.NotasFiscais.Items[0].NFe.infNFe.id;

   FXMLGerado := Trim(FACBrNFe.NotasFiscais.Items[0].XML);
   Result := (FXMLGerado <> '');

   // OPERACAO_SEM_VALOR := False;
End;

Function TNFeGeraXMLACBr.InformarOrigemComb(IdNFe, IdItem: Integer): Boolean;
Var
   SqlDS: TSQLDataSet;
   scriptCIBS: String;
Begin
   scriptCIBS :=
      'SELECT CST_UB13, CCLASSTRIB_UB14 ' +
      'FROM NFE_PROD_IS_IBS_CBS ';
   scriptCIBS := scriptCIBS + Format('WHERE (ID_NFE = %d) AND (ID_ITEM = %d) ', [IdNFe, IdItem]);

   SqlDS := TSQLDataSet.Create(Nil);
   SqlDS.Active := False;
   SqlDS.SQLConnection := DMNFe.sqlConexao;
   SqlDS.CommandText := scriptCIBS;
   SqlDS.Active := True;
   SqlDS.First;

   Result := (SqlDS.FIELDS[0].AsString = '620');
End;

{$ENDREGION}

{$REGION 'Recursos Para Gerção da NFe'}
Function TNFeGeraXMLACBr.MensagemIRRF(ValorIR: Double; ValorBCIR: Double): String;
Var
   sMensagem: String;
   AliquotaIRRF: Real;
Begin
   sMensagem := '';
   AliquotaIRRF := 0;
   If (ValorBCIR <> 0)
   Then
   Begin
      AliquotaIRRF := RoundTo((ValorIR / ValorBCIR) * 100, -2);
   End;

   If (EMP.CRT <> '3') And (AliquotaIRRF > 0)
   Then
   Begin
      sMensagem := Format(' "IRRF aplicado conforme IN RFB nº 2145/2023: IR R$ %f (%f%%)"', [ValorIR, AliquotaIRRF]);
   End;
   Result := sMensagem;
End;

Function TNFeGeraXMLACBr.MensagemPartilhaSimples: String;
Var
   sMensagem: String;
Begin
   sMensagem := '';
   If (EMP.CRT <> '3')
   Then
   Begin
      sMensagem :=
         ' "Liminar concedida com base na Ações Diretas de Inconstitucionalidade Numero 5.464 e 5.469; ' +
         'Convênio ICMS nº 93/2015, cláusula nona isenta essa empresa Simples Nacional."';
   End;
   Result := sMensagem;
End;

Function TNFeGeraXMLACBr.PegaValor_S(Campo: String; DS: TSQLDataSet): String;
Begin
   Result := DS.FieldByName(Campo).AsString;
End;

Function TNFeGeraXMLACBr.PegaValor_D(Campo: String; DS: TSQLDataSet): TDate;
Begin
   Result := DS.FieldByName(Campo).AsDateTime;
End;

Function TNFeGeraXMLACBr.PegaValor_DT(Campo: String; DS: TSQLDataSet): TDateTime;
Begin
   Result := DS.FieldByName(Campo).AsDateTime;
End;

Function TNFeGeraXMLACBr.PegaValor_I(Campo: String; DS: TSQLDataSet): Integer;
Begin
   Result := StrToInt64Def(DS.FieldByName(Campo).AsString, 0);
End;

Function TNFeGeraXMLACBr.PegaValor_R(Campo: String; DS: TSQLDataSet; Decimais: Byte = 2): Real;
Begin
   If (Decimais < 1) Or (Decimais > 8)
   Then
   Begin
      Decimais := 2;
   End;
   // Result := RoundTo(DS.FieldByName(Campo).AsFloat, Decimais * -1);
   Result := DS.FieldByName(Campo).AsFloat;
End;

Procedure TNFeGeraXMLACBr.PreparaDS(Script: String; DS: TSQLDataSet);
Begin
   DS.Active := False;
   DS.SQLConnection := DMNFe.sqlConexao;
   DS.CommandText := Script;
   DS.Active := True;
   DS.First;
End;
{$ENDREGION}

{$REGION 'Bloco B - Identificação'}
Procedure TNFeGeraXMLACBr.GeraBloco_B;
Var
   sDescricaoTipo, sValor: String;
   iTipo: Integer;
   sds: TSQLDataSet;
   tipoEnteGov, tipoOperGov, tipoNfeDebito, tipoNFeCredito: String;
 Begin
   sds := TSQLDataSet.Create(Nil);
   sScript := Format('SELECT * FROM NFE WHERE ID_NFE = %d ', [FIdNFe]);
   PreparaDS(sScript, sds);

   sDescricaoTipo := '';
   iTipo := 0;
   DMNFe.PegaTipoCliente(FIdNFe, iTipo, sDescricaoTipo);
   sValor := PegaValor_S('NATOP_B04', sds);

   // MARCOS - 20/05/2025 - IDENTIFICA NOTA DE CONSUMO/PERDA
   NFPerda := (Pos('BAIXA DE ESTOQUE', UpperCase(sValor)) > 0);

   // MARCOS - CONCATENA O TIPO DE CLIENTE "COOPERADO", NA DESCRIÇÃO DE NATUREZA DA OPERAÇÃO
   If (iTipo = 5)
   Then
   Begin
      sValor := sValor + ' - COOPERADO';
   End;

// MARCOS - 19/02/2026- IDENTIFICA NOTA PARA CONSUMIDOR FINAL
   ConsumidorFinal := (PegaValor_S('INDFINAL_B25A', sds) = '1');

   RecalculaSTRet := (PegaValor_S('TPNF_B11', sds) = '1') And (PegaValor_S('FINNFE_B25', sds) = '1');
   FNFe := FACBrNFe.NotasFiscais.add.NFe;
   With FNFe Do
   Begin
      Ide.cUF := PegaValor_I('CUF_B02', sds);
      Ide.cNF := StrToInt(Format('%2.2d%6.6d', [EMP.id, FIdNFe]));
      Ide.natOp := sValor;
      Ide.indPag := ipVista;
      Ide.Modelo := PegaValor_I('MOD_B06', sds);
      Ide.Serie := PegaValor_I('SERIE_B07', sds);
      Ide.nNF := PegaValor_I('NNF_B08', sds);
      Ide.dEmi := PegaValor_DT('DHEMI_B09', sds);
      Ide.dSaiEnt := PegaValor_DT('DHSAIENT_B10', sds);
      Ide.hSaiEnt := Now;
      Ide.tpNF := StrToTpNF(PegaValor_S('TPNF_B11', sds));
      Ide.idDest := StrToDestinoOperacao(Ok, PegaValor_S('IDDEST_B11A', sds));
      Ide.cMunFG := PegaValor_I('CMUNFG_B12', sds);
      Ide.tpImp := StrToTpImp(PegaValor_S('TPIMP_B21', sds));
      // Ide.tpEmis := StrToTpEmis(Ok, PegaValor_S('TPEMIS_B22', sds));
      Ide.tpEmis := StrToTipoEmissao(PegaValor_S('TPEMIS_B22', sds));
      // Ide.tpAmb := StrToTpAmb(Ok, PegaValor_S('TPAMB_B24', sds));
      Ide.tpAmb := StrToTipoAmbiente(PegaValor_S('TPAMB_B24', sds));
      Ide.finNFe := StrToFinNFe(Ok, PegaValor_S('FINNFE_B25', sds));
      Ide.indFinal := StrToConsumidorFinal(Ok, PegaValor_S('INDFINAL_B25A', sds));
      Ide.indPres := StrToPresencaComprador(Ok, PegaValor_S('INDPRES_B25B', sds));
      Ide.procEmi := StrToprocEmi(PegaValor_S('PROCEMI_B26', sds));
      Ide.verProc := PegaValor_S('VERPROC_B27', sds);
      Ide.dhCont := PegaValor_D('DHCONT_B28', sds);
      Ide.xJust := PegaValor_S('XJUST_B29', sds);

      // *****************************************
      // MARCOS - 27/11/2025 - REFORMA TRIBUTÁRIA
      Ide.cMunFGIBS := Ide.cMunFG;
      Ide.tpNFDebito := tdNenhum;
      Ide.tpNFCredito := tcNenhum;

      (*
       cdsCadNFeTPENTEGOV_BB02: TStringField;
       cdsCadNFePREDUTOR_BB03: TFloatField;
       cdsCadNFeTPOPERGOV_BB04: TStringField;
 *)

      // MARCOS - 21/07/2026 - NT2025.002
      // tipoEnteGov := PegaValor_S('TPENTEGOV_B32', sds);
      tipoEnteGov := PegaValor_S('TPENTEGOV_BB02', sds);

      // Ide.gCompraGov.tpEnteGov := TtpEnteGov.tcgNenhum;
      If (tipoEnteGov > '0')
      Then
      Begin
         // tipoOperGov := PegaValor_S('TPOPERGOV_B34', sds);
         tipoOperGov := PegaValor_S('TPOPERGOV_BB04', sds);

         If (tipoOperGov = '0')
         Then
         Begin
            tipoOperGov := '1';
         End;
         Ide.gCompraGov.tpEnteGov := StrTotpEnteGov(tipoEnteGov); // tcgEstados;
         // Ide.gCompraGov.pRedutor := PegaValor_R('PREDUTOR_B33', sds);
         Ide.gCompraGov.pRedutor := PegaValor_R('PREDUTOR_BB03', sds);
         Ide.gCompraGov.tpOperGov := StrTotpOperGov(tipoOperGov);
         // DMNFe.cdsCadNFeTPOPERGOV_B34.AsString := '0';

      End;

      tipoNfeDebito := PegaValor_S('TPNFDEBITO_B25_1', sds);
      tipoNfeDebito := TFuncoes.LPad(tipoNfeDebito,2, '0');
      //tipoNfeDebito := Format('%2.2d', [tipoNfeDebito]);
      If (tipoNfeDebito > '00')
      Then
      Begin
         Ide.tpNFDebito := StrTotpNFDebito(tipoNfeDebito);
      End;

      tipoNFeCredito := PegaValor_S('TPNFCREDITO_B25_2', sds);
      tipoNFeCredito := TFuncoes.LPad(tipoNFeCredito,2, '0');
      //tipoNFeCredito := Format('%2.2d', [tipoNFeCredito]);
      If (tipoNFeCredito > '00')
      Then
      Begin
         Ide.tpNFCredito := StrTotpNFCredito(tipoNFeCredito);
      End;

      // MARCOS - 21/07/2026 - NT2025.002
      Ide.cIndOp := PegaValor_S('CINDOP_B25D', sds);
   End;
   sds.DisposeOf;
End;
{$ENDREGION}

{$REGION 'Bloco BA - Doctos Referenciados'}
Procedure TNFeGeraXMLACBr.GeraBloco_BA02;
Var
   Referenciada: TNFrefCollectionItem;
   sds: TSQLDataSet;
Begin
   sds := TSQLDataSet.Create(Nil);
   sScript := Format('SELECT * FROM NFE_REF_NFE WHERE ID_NFE = %d ', [FIdNFe]);
   PreparaDS(sScript, sds);
   If (sds.RecordCount > 0)
   Then
   Begin
      While Not sds.Eof Do
      Begin
         With FNFe.Ide.NFref.add Do
         Begin
            refNFe := PegaValor_S('REFNFE_BA02', sds);
         End;
         sds.Next;
      End;
   End;
   sds.DisposeOf;
End;

Procedure TNFeGeraXMLACBr.GeraBloco_BA03;
Var
   Referenciada: TNFrefCollectionItem;
   sds: TSQLDataSet;
Begin
   sds := TSQLDataSet.Create(Nil);
   sScript := Format('SELECT * FROM NFE_REF_NF WHERE ID_NFE = %d ', [FIdNFe]);
   PreparaDS(sScript, sds);
   If (sds.RecordCount > 0)
   Then
   Begin
      While Not sds.Eof Do
      Begin
         With FNFe.Ide.NFref.add Do
         Begin
            RefNF.cUF := PegaValor_I('CUF_BA04', sds);
            RefNF.AAMM := PegaValor_S('AAMM_BA05', sds);
            RefNF.CNPJ := PegaValor_S('CNPJ_BA06', sds);
            RefNF.Modelo := PegaValor_I('MOD_BA07', sds);
            RefNF.Serie := PegaValor_I('SERIE_BA08', sds);
            RefNF.nNF := PegaValor_I('NNF_BA09', sds);
         End;
         sds.Next;
      End;
   End;
   sds.DisposeOf;
End;

Procedure TNFeGeraXMLACBr.GeraBloco_BA10;
Var
   Referenciada: TNFrefCollectionItem;
   sds: TSQLDataSet;
Begin
   sds := TSQLDataSet.Create(Nil);
   sScript := Format('SELECT * FROM NFE_REF_NF_RURAL WHERE ID_NFE = %d ', [FIdNFe]);
   PreparaDS(sScript, sds);
   If (sds.RecordCount > 0)
   Then
   Begin
      While Not sds.Eof Do
      Begin
         With FNFe.Ide.NFref.add Do
         Begin
            RefNFP.cUF := PegaValor_I('CUF_BA11', sds);
            RefNFP.AAMM := PegaValor_S('AAMM_BA12', sds);
            RefNFP.CNPJCPF := PegaValor_S('CNPJ_BA13', sds);
            RefNFP.IE := PegaValor_S('IE_BA15', sds);
            RefNFP.Modelo := PegaValor_S('MOD_BA16', sds);
            RefNFP.Serie := PegaValor_I('SERIE_BA17', sds);
            RefNFP.nNF := PegaValor_I('NNF_BA18', sds);
         End;
         sds.Next;
      End;
   End;
   sds.DisposeOf;
End;

Procedure TNFeGeraXMLACBr.GeraBloco_BA20;
Var
   Referenciada: TNFrefCollectionItem;
   sds: TSQLDataSet;
Begin
   sds := TSQLDataSet.Create(NiL);
   sScript := Format('SELECT * FROM NFE_REF_CF WHERE ID_NFE = %d ', [FIdNFe]);
   PreparaDS(sScript, sds);
   If (sds.RecordCount > 0)
   Then
   Begin
      While Not sds.Eof Do
      Begin
         With FNFe.Ide.NFref.add Do
         Begin
            RefECF.Modelo := StrToECFModRef(Ok, PegaValor_S('MOD_BA21', sds));
            RefECF.nECF := PegaValor_S('NECF_BA22', sds);
            RefECF.nCOO := PegaValor_S('NCOO_BA23', sds);
         End;
         sds.Next;
      End;
   End;
   sds.DisposeOf
End;
{$ENDREGION}

{$REGION 'Bloco C - Emitente '}
Procedure TNFeGeraXMLACBr.GeraBloco_C;
Var
   sds: TSQLDataSet;
   Documento: String;
Begin
   sds := TSQLDataSet.Create(Nil);
   sScript := Format('SELECT * FROM NFE WHERE ID_NFE = %d ', [FIdNFe]);
   PreparaDS(sScript, sds);
   While Not sds.Eof Do
   Begin
      // MARCOS - 10/03/2025 - OMITE DOCUMENTO PREENCHIDO COM ZEROS '00000000000NNN'
      Documento := PegaValor_S('CNPJ_C02', sds);
      If (Documento = '00000000000000') Then
      Begin
         Documento := PegaValor_S('CPF_C02A', sds);
      End;

      // With Nota.NFe Do
      With FNFe Do
      Begin
         // Emit.CNPJCPF := PegaValor_S('CNPJ_C02', sds) + PegaValor_S('CPF_C02A', sds);
         Emit.CNPJCPF := Documento;
         Emit.IE := PegaValor_S('IE_C17', sds);
         Emit.xNome := PegaValor_S('XNOME_C03', sds);
         Emit.xFant := PegaValor_S('XFANT_C04', sds);
         Emit.EnderEmit.fone := PegaValor_S('FONE_C16', sds);

         Emit.EnderEmit.CEP := PegaValor_I('CEP_C13', sds);
         Emit.EnderEmit.xLgr := PegaValor_S('XLGR_C06', sds);
         Emit.EnderEmit.nro := PegaValor_S('NRO_C07', sds);
         Emit.EnderEmit.xCpl := PegaValor_S('XCPL_C08', sds);
         Emit.EnderEmit.xBairro := PegaValor_S('XBAIRRO_C09', sds);
         Emit.EnderEmit.cMun := PegaValor_I('CMUN_C10', sds);
         Emit.EnderEmit.xMun := PegaValor_S('XMUN_C11', sds);
         Emit.EnderEmit.UF := PegaValor_S('UF_C12', sds);
         Emit.EnderEmit.cPais := PegaValor_I('CPAIS_C14', sds);
         Emit.EnderEmit.xPais := PegaValor_S('XPAIS_C15', sds);

         Emit.IEST := PegaValor_S('IEST_C18', sds);
         Emit.IM := PegaValor_S('IM_C19', sds);
         Emit.CNAE := PegaValor_S('CNAE_C20', sds);
         Emit.CRT := StrToCRT(Ok, EMP.CRT);

         // MARCOS - 21/07/2026 - NT2025.002
         Emit.ISUFEmit := PegaValor_S('ISUFEMIT_C22', sds);
      End;
      sds.Next;
   End;
   sds.DisposeOf;
End;
{$ENDREGION}

{$REGION 'Bloco E - Destinatário '}
Procedure TNFeGeraXMLACBr.GeraBloco_E;
Var
   sds: TSQLDataSet;
   Documento: String;
Begin
   sds := TSQLDataSet.Create(Nil);
   sScript := Format('SELECT * FROM NFE WHERE ID_NFE = %d ', [FIdNFe]);
   PreparaDS(sScript, sds);

   While Not sds.Eof Do
   Begin
      // MARCOS - 10/03/2025 - OMITE DOCUMENTO PREENCHIDO COM ZEROS '00000000000NNN'
      Documento := PegaValor_S('CNPJ_E02', sds);
      If ((Documento = '00000000000000') Or (Documento = '')) Then
      Begin
         Documento := PegaValor_S('CPF_E03', sds);
      End;

      // MARCOS - 19/02/2026
      MesmaUF := (EMP.UF = PegaValor_S('UF_E12', sds));

      With FNFe Do
      Begin
         // Dest.CNPJCPF := PegaValor_S('CNPJ_E02', sds) + PegaValor_S('CPF_E03', sds);
         Dest.CNPJCPF := Documento;
         Dest.idEstrangeiro := PegaValor_S('IDESTRANGEIRO_E03A', sds);
         Dest.xNome := PegaValor_S('XNOME_E04', sds);
         Dest.EnderDest.fone := PegaValor_S('FONE_E16', sds);
         Dest.EnderDest.CEP := PegaValor_I('CEP_E13', sds);
         Dest.EnderDest.xLgr := PegaValor_S('XLGR_E06', sds);
         Dest.EnderDest.nro := PegaValor_S('NRO_E07', sds);
         Dest.EnderDest.xCpl := PegaValor_S('XCPL_E08', sds);
         Dest.EnderDest.xBairro := PegaValor_S('XBAIRRO_E09', sds);
         Dest.EnderDest.cMun := PegaValor_I('CMUN_E10', sds);
         Dest.EnderDest.xMun := PegaValor_S('XMUN_E11', sds);
         Dest.EnderDest.UF := PegaValor_S('UF_E12', sds);
         Dest.EnderDest.cPais := PegaValor_I('CPAIS_E14', sds);
         Dest.EnderDest.xPais := PegaValor_S('XPAIS_E15', sds);
         Dest.indIEDest := StrToindIEDest(PegaValor_S('INDIEDEST_E16A', sds));
         Dest.IE := PegaValor_S('IE_E17', sds);
         Dest.ISUF := PegaValor_S('ISUF_E18', sds);
         Dest.IM := PegaValor_S('IM_E18A', sds);
         Dest.Email := PegaValor_S('EMAIL_E19', sds);
      End;
      sds.Next;
   End;
   sds.DisposeOf;
End;
{$ENDREGION}

{$REGION 'Bloco F - Local de Retirada'}
Procedure TNFeGeraXMLACBr.GeraBloco_F;
Var
   sds: TSQLDataSet;
   Documento: String;
Begin
   sds := TSQLDataSet.Create(Nil);
   sScript := Format('SELECT * FROM NFE_LOCAL_RETIRADA WHERE ID_NFE = %d ', [FIdNFe]);
   PreparaDS(sScript, sds);
   While Not sds.Eof Do
   Begin
      // MARCOS - 10/03/2025 - OMITE DOCUMENTO PREENCHIDO COM ZEROS '00000000000NNN'
      Documento := PegaValor_S('CNPJ_F02', sds);
      If (Documento = '00000000000000') Then
      Begin
         Documento := PegaValor_S('CPF_F02A', sds);
      End;

      With FNFe Do
      Begin
         // Retirada.CNPJCPF := PegaValor_S('CNPJ_F02', sds) + PegaValor_S('CPF_F02A', sds);
         Retirada.CNPJCPF := Documento;
         Retirada.xLgr := PegaValor_S('XLGR_F03', sds);
         Retirada.nro := PegaValor_S('NRO_F04', sds);
         Retirada.xCpl := PegaValor_S('XCPL_F05', sds);
         Retirada.xBairro := PegaValor_S('XBAIRRO_F06', sds);
         Retirada.cMun := PegaValor_I('CMUN_F07', sds);
         Retirada.xMun := PegaValor_S('XMUN_F08', sds);
         Retirada.UF := PegaValor_S('UF_F09', sds);
      End;
      sds.Next;
   End;
   sds.DisposeOf;
End;
{$ENDREGION}

{$REGION 'Bloco G - Local de Entrega'}
Procedure TNFeGeraXMLACBr.GeraBloco_G;
Var
   sds: TSQLDataSet;
   Documento: String;
Begin
   sds := TSQLDataSet.Create(Nil);
   sScript := Format('SELECT * FROM NFE_LOCAL_ENTREGA WHERE ID_NFE = %d ', [FIdNFe]);
   PreparaDS(sScript, sds);
   While Not sds.Eof Do
   Begin
      // MARCOS - 10/03/2025 - OMITE DOCUMENTO PREENCHIDO COM ZEROS '00000000000NNN'
      Documento := PegaValor_S('CNPJ_G02', sds);
      If (Documento = '00000000000000') Then
      Begin
         Documento := PegaValor_S('CPF_G02A', sds);
      End;

      With FNFe Do
      Begin
         // MARCOS - 10/03/2025
         // Entrega.CNPJCPF := PegaValor_S('CNPJ_G02', sds) + PegaValor_S('CPF_G02A', sds);
         Entrega.CNPJCPF := Documento;
         Entrega.xLgr := PegaValor_S('XLGR_G03', sds);
         Entrega.nro := PegaValor_S('NRO_G04', sds);
         Entrega.xCpl := PegaValor_S('XCPL_G05', sds);
         Entrega.xBairro := PegaValor_S('XBAIRRO_G06', sds);
         Entrega.cMun := PegaValor_I('CMUN_G07', sds);
         Entrega.xMun := PegaValor_S('XMUN_G08', sds);
         Entrega.UF := PegaValor_S('UF_G09', sds);
      End;
      sds.Next;
   End;
   sds.DisposeOf;
End;
{$ENDREGION}

{$REGION 'Bloco GA - Autorização '}
Procedure TNFeGeraXMLACBr.GeraBloco_GA;
Var
   sds: TSQLDataSet;
   Documento: String;
Begin
   sds := TSQLDataSet.Create(Nil);
   sScript := Format('SELECT * FROM NFE_AUTORIZA_XML WHERE ID_NFE = %d ', [FIdNFe]);
   PreparaDS(sScript, sds);
   If (sds.RecordCount > 0)
   Then
   Begin
      While Not sds.Eof Do
      Begin
         // MARCOS - 10/03/2025 - OMITE DOCUMENTO PREENCHIDO COM ZEROS '00000000000NNN'
         Documento := PegaValor_S('CNPJ_GA02', sds);
         If (Documento = '00000000000000') Then
         Begin
            Documento := PegaValor_S('CPF_GA03', sds);
         End;

         With FNFe Do
            // autXML.add.CNPJCPF := PegaValor_S('CNPJ_GA02', sds) + PegaValor_S('CPF_GA03', sds);
            autXML.add.CNPJCPF := Documento;
         sds.Next;
      End;
   End;
   sds.DisposeOf;
End;
{$ENDREGION}

{$REGION 'Bloco H..LA - Produtos/Serviços'}
Procedure TNFeGeraXMLACBr.GeraBloco_H;
Var
   // SequenciaItem: Integer;
   GTIN: String;
   OrganizaDescrição: Boolean;
   ObjINI: TIniFile;
   rValor: Real;
   InfoAdicionalProduto, Pedido, ItemPedido: String;
Begin
   ObjINI := TIniFile.Create(CAMINHO_APP + MZNFE_INI);
   OrganizaDescrição := ObjINI.ReadBool('NFE', 'OrganizaDescricao', False);
   FreeAndNil(ObjINI);

   sqlProduto := TSQLDataSet.Create(Nil);
   sScript := 'SELECT ' +
   // PRODUTO
      'PRO.ID_ITEM, PRO.ID_SEFAZ, INF.INFADPROD_V01, PRO.CPROD_I02, PRO.CEAN_I03, PRO.XPROD_I04, PRO.NCM_I05, ' +
      'PRO.EXTIPI_I06, PRO.CFOP_I08, PRO.UCOM_I09, PRO.QCOM_I10, PRO.VUNCOM_I10A, PRO.VPROD_I11, PRO.CEANTRIB_I12, ' +
      'PRO.UTRIB_I13, PRO.QTRIB_I14, PRO.VUNTRIB_I14A, PRO.VFRETE_I15, PRO.VSEG_I16, PRO.VDESC_I17, PRO.VOUTRO_I17A, ' +
      'PRO.INDTOT_I17B, PRO.XPED_I60, PRO.NITEMPED_I61, PRO.NFCI_I70, PRO.NVE_I05A, PRO.VTOTTRIB_M02, ' +
      'PRO.CEST_I05C, PRO.INDESCALA_I05D, PRO.CNPJFAB_I05E, PRO.CBENEF_I05F, PRO.CHAVEACESSO_VC02, PRO.NITEM_VC03, ' +

      'ICM.ORI_N11, ICM.CST_N12, ICM.CSOSN_N12A, ICM.MODBC_N13, ICM.PREDBC_N14, ICM.VBC_N15, ICM.PICMS_N16, ICM.VICMSOP_N16A, ' +
      'ICM.PDIF_N16B, ICM.VICMSDIF_N16C, ICM.VICMS_N17, ICM.MODBCST_N18, ICM.PMVAST_N19, ICM.PREDBCST_N20, ' +
      'ICM.VBCST_N21, ICM.PICMSST_N22, ICM.VICMSST_N23, ICM.UFST_N24, ICM.PBCOP_N25, ICM.VBCSTRET_N26, ' +
      'ICM.VICMSSTRET_N27, ICM.VICMSDESON_N27A, ICM.MOTDESICMS_N28, ICM.PCREDSN_N29, ICM.VCREDICMSSN_N30, ' +
      'ICM.VBCSTDEST_N31, ICM.VICMSTDEST_N32, ICM.VBCUFDEST_NA03, ICM.PFCPUFDEST_NA05, ICM.PICMSUFDEST_NA07, ICM.PICMSINTER_NA09, ' +
      'ICM.PICMSINTERPART_NA11, ICM.VFCPUFDEST_NA13, ICM.VICMSUFDEST_NA15, ICM.VICMSUFREMET_NA17, ' +

      'ICM.VBCFCP_N17A, ICM.PFCP_N17B, ICM.VFCP_N17C, ICM.VBCFCPST_N23A, ICM.PFCPST_N23B, ICM.VFCPST_N23D, ICM.PST_N26A, ' +
      'ICM.VBCFCPSTRET_N27A, ICM.PFCPSTRET_N27B, ICM.VFCPSTRET_N27D, ICM.VBCFCPUFDEST_NA04, ' +

      'ICM.QBCMONO_N37A, ICM.ADREMICMS_N38, ICM.VICMSMONO_N39, ICM.QBCMONORETEN_N39A, ICM.ADREMICMSRETEN_N40, ICM.VICMSMONORETEN_N41, ICM.VICMSMONOOP_N41A, ' +
      'ICM.PDIF_N42, ICM.VICMSMONODIF_N43, ICM.QBCMONORET_N43A, ICM.ADREMICMSRET_N44, ICM.VICMSMONORET_N45, ICM.PREDADREM_N47, ICM.MOTREDADREM_N48, ' +

      'PIS.CST_Q06, PIS.VBC_Q07, PIS.PPIS_Q08, PIS.VPIS_Q09, PIS.QBCPROD_Q10, ' +
      'PIS.VALIQPROD_Q11, COF.CST_S06, COF.VBC_S07, COF.PCOFINS_S08, COF.QBCPROD_S09, COF.VALIQPROD_S10, ' +

      'COF.VCOFINS_S11, ISS.VBC_U02, ISS.VALIQ_U03, ISS.VISSQN_U04, ISS.CNUMFG_U05, ISS.CLISTSERV_U06, ' +

      'ISS.VDEDUCAO_U07, ISS.VOUTRO_U08, ISS.VDESCINCOND_U09, ISS.VDESCOND_U10, ISS.VISSRET_U11, ISS.INDISS_U12, ' +
      'ISS.CSERVICO_U13, ISS.CMUN_U14, ISS.CPAIS_U15, ISS.NPROCESSO_U16, ISS.INDINCENTIVO_U17, ' +

      'COMB.CPRODANP_LA02, COMB.DESCANP_LA03, COMB.CODIF_LA04, COMB.QTEMP_LA05, COMB.UFCONS_LA06, COMB.PMIXGN_LA03, ' +
      'COMB.PGLP_LA03A, COMB.PGNN_LA03B, COMB.PGNI_LA03C, COMB.VPART_LA03D, ' +
      'COMB.QBCPROD_LA08, COMB.VALIQPROD_LA09, COMB.VCIDE_LA10, ' +
      'COMB.NBICO_LA12, COMB.NBOMBA_LA13, COMB.NTANQUE_LA14, COMB.VENCINI_LA15, COMB.VENCFIN_LA16, COMB.PBIO_LA17, ' +

      'IPI.CNPJPROD_O03, IPI.CSELO_O04, IPI.QSELO_O05, IPI.CENQ_O06, IPI.CST_O09, IPI.VBC_O10, IPI.QUNID_O11, ' +
      'IPI.VUNID_O12, IPI.PIPI_O13, IPI.VIPI_O14, IPI.CLENQ_O02, IPI.PDEVOL_UA02, IPI.VIPIDEVOL_UA04 ' +

      'FROM NFE_PROD PRO LEFT JOIN NFE_PROD_INFADIC INF ON (INF.ID_NFE = PRO.ID_NFE AND INF.ID_ITEM = PRO.ID_ITEM) ' +
      'LEFT JOIN NFE_PROD_ICMS ICM ON(ICM.ID_NFE = PRO.ID_NFE AND ICM.ID_ITEM = PRO.ID_ITEM) ' +
      'LEFT JOIN NFE_PROD_PIS PIS ON(PIS.ID_NFE = PRO.ID_NFE AND PIS.ID_ITEM = PRO.ID_ITEM) ' +
      'LEFT JOIN NFE_PROD_COFINS COF ON(COF.ID_NFE = PRO.ID_NFE AND COF.ID_ITEM = PRO.ID_ITEM) ' +
      'LEFT JOIN NFE_PROD_ISSQN ISS ON(ISS.ID_NFE = PRO.ID_NFE AND ISS.ID_ITEM = PRO.ID_ITEM) ' +
      'LEFT JOIN NFE_PROD_COMB COMB ON(COMB.ID_NFE = PRO.ID_NFE AND COMB.ID_ITEM = PRO.ID_ITEM) ' +
      'LEFT JOIN NFE_PROD_IPI IPI ON(IPI.ID_NFE = PRO.ID_NFE AND IPI.ID_ITEM = PRO.ID_ITEM) ' +
      'WHERE PRO.ID_NFE = ' + IntToStr(FIdNFe) + ' ';
   If (OrganizaDescrição) Then
   Begin
      sScript := sScript + 'ORDER BY PRO.XPROD_I04';
   End
   Else
   Begin
      sScript := sScript + 'ORDER BY PRO.ID_ITEM';
   End;

   // SequenciaItem := 1;
   PreparaDS(sScript, sqlProduto);
   InformarICMSMonofasico := False;
   While Not sqlProduto.Eof Do
   Begin
      // H|nItem|infAdProd|
      With FNFe.Det.new Do
      Begin
         // MARCOS - 05/02/2025 - CORRIGE SEQUENCIA DOS ITENS NA NOTA
         Prod.nItem := PegaValor_I('ID_SEFAZ', sqlProduto);
         // Prod.nItem := SequenciaItem;
         // Inc(SequenciaItem);

         // *****************************************
         // MARCOS - 27/11/2025 - REFORMA TRIBUTÁRIA
         // Prod.tpCredPresIBSZFM := tcpSemCredito;
         Prod.indBemMovelUsado := tieNenhum;
         vItem := PegaValor_I('VPROD_I11', sqlProduto);
         // GRUPO VC
         // DFeReferenciado.chaveAcesso := '';
         // DFeReferenciado.nItem := 1;
         // *****************************************

         If (FNFe.Ide.finNFe = TpcnFinalidadeNFe.fnDevolucao) Then
         Begin
            // MARCOS -21/07/2026 - NT2025.002-V150
            DFeReferenciado.chaveAcesso := Trim(PegaValor_S('CHAVEACESSO_VC02', sqlProduto));;
            DFeReferenciado.nItem := PegaValor_I('NITEM_VC03', sqlProduto);
         End;

         // ITEM
         GeraBloco_I(Prod);

         // COMBUSTIVEL
         GeraBloco_LA(Prod);

         // ICMS
         Imposto := TImposto.Create;
         With Imposto Do
         Begin
            GeraBloco_N(Imposto);

            // ICMS-PARTILHA
            GeraBloco_NA(Imposto);

            // IPI
            If (DMNFe.CalcularIPI)
            Then
            Begin
               GeraBloco_O(Imposto);
            End;

            // PIS
            GeraBloco_Q(Imposto);

            // COFINS
            GeraBloco_S(Imposto);


            // ISS, IPI
            // GeraBloco_U;

            // MARCOS - 17/09/2024 - DEEOLUÇÃO DE IPI
            pDevol := PegaValor_R('PDEVOL_UA02', sqlProduto);
            vIPIDevol := PegaValor_R('VIPIDEVOL_UA04', sqlProduto);

            // *****************************************
            // MARCOS - 27/11/2025 - REFORMA TRIBUTÁRIA
            GeraBloco_UB(IdNFe, PegaValor_I('ID_ITEM', sqlProduto), Imposto)
            // *****************************************
         End;

         // MARCOS - 04/10/2024 - INFORMAÇÕES ADICIONAIS DO PRODUTO
         InfoAdicionalProduto := '';
         Pedido := Trim(PegaValor_S('XPED_I60', sqlProduto));
         ItemPedido := Trim(PegaValor_S('NITEMPED_I61', sqlProduto));
         If (Pedido <> '') Then
         Begin
            InfoAdicionalProduto := Format('Ref. Pedido: %s, ', [Pedido]);
            If (ItemPedido <> '') Then
            Begin
               InfoAdicionalProduto := InfoAdicionalProduto + Format('Item: %s, ', [ItemPedido]);
            End;
         End;
         InfoAdicionalProduto := InfoAdicionalProduto + TFuncoes.RemoverCharControle(PegaValor_S('INFADPROD_V01', sqlProduto));
         infAdProd := InfoAdicionalProduto;
      End;
      sqlProduto.Next;
   End;
   sqlProduto.DisposeOf;
End;

Procedure TNFeGeraXMLACBr.GeraBloco_I(Prod: TProd);
Var
   GTIN: String;
Begin
   // I|cProd|cEAN|xProd|NCM|EXTIPI|CFOP|uCom|qCom|vUnCom|vProd|cEANTrib|uTrib|qTrib|vUnTrib|vFrete|vSeg|vDesc|vOutro|indTot|xPed|nItemPed|nFCI|
   GTIN := PegaValor_S('CEAN_I03', sqlProduto);
   If (GTIN = '')
   Then
   Begin
      GTIN := 'SEM GTIN';
   End;
   CodigoProduto := PegaValor_S('CPROD_I02', sqlProduto);

   Prod.cProd := CodigoProduto;
   Prod.cEAN := GTIN;
   Prod.xProd := PegaValor_S('XPROD_I04', sqlProduto);
   Prod.NCM := TFuncoes.RetornaNumero(PegaValor_S('NCM_I05', sqlProduto));
   Prod.EXTIPI := PegaValor_S('EXTIPI_I06', sqlProduto);
   Prod.CFOP := PegaValor_S('CFOP_I08', sqlProduto);
   Prod.uCom := PegaValor_S('UCOM_I09', sqlProduto);
   Prod.qCom := PegaValor_R('QCOM_I10', sqlProduto);
   Prod.vUnCom := PegaValor_R('VUNCOM_I10A', sqlProduto);
   Prod.vProd := PegaValor_R('VPROD_I11', sqlProduto);
   Prod.cEANTrib := GTIN;

   // MARCOS - 25/10/2024
   // Prod.uTrib := PegaValor_S('UCOM_I09', sqlProduto);
   // Prod.qTrib := PegaValor_R('QCOM_I10', sqlProduto);
   // Prod.vUnTrib := PegaValor_R('VUNCOM_I10A', sqlProduto);
   Prod.uTrib := PegaValor_S('UTRIB_I13', sqlProduto);

   Prod.qTrib := PegaValor_R('QTRIB_I14', sqlProduto);
   Prod.vUnTrib := PegaValor_R('VUNTRIB_I14A', sqlProduto);

   If (Prod.uTrib = '') Then
   Begin
      Prod.uTrib := Prod.uCom;
   End;

   If (Prod.qTrib = 0) Then
   Begin
      Prod.qTrib := Prod.qCom;
   End;

   If (Prod.vUnTrib = 0) Then
   Begin
      Prod.vUnTrib := Prod.vUnCom;
   End;

   Prod.vOutro := PegaValor_R('VOUTRO_I17A', sqlProduto);
   Prod.vFrete := PegaValor_R('VFRETE_I15', sqlProduto);
   Prod.vSeg := PegaValor_R('VSEG_I16', sqlProduto);
   Prod.vDesc := PegaValor_R('VDESC_I17', sqlProduto);
   Prod.IndTot := StrToindTot(Ok, PegaValor_S('INDTOT_I17B', sqlProduto));
   Prod.xPed := PegaValor_S('XPED_I60', sqlProduto);
   Prod.nItemPed := PegaValor_S('NITEMPED_I61', sqlProduto);
   Prod.nFCI := PegaValor_S('NFCI_I70', sqlProduto);
   Prod.CEST := TFuncoes.RetornaNumero(PegaValor_S('CEST_I05C', sqlProduto));
   Prod.indEscala := StrToIndEscala(Ok, PegaValor_S('INDESCALA_I05D', sqlProduto));
   Prod.CNPJFab := PegaValor_S('CNPJFAB_I05E', sqlProduto);
   Prod.cBenef := PegaValor_S('CBENEF_I05F', sqlProduto);
End;

Procedure TNFeGeraXMLACBr.GeraBloco_LA(Prod: TProd);
Var
   // NFe,
   Item: Integer;
   pb: Real;
   produ: STring;
  UFConsumo, CFOP: String;
Begin
   UFConsumo := PegaValor_S('UFCONS_LA06', sqlProduto);

   CFOP := PegaValor_S('CFOP_I08', sqlProduto);
   If (Copy(CFOP,2,3) = '667')
   Then
   Begin
      UFConsumo := FnFe.Emit.EnderEmit.UF;
   End;

   // NFe := PegaValor_I('ID_NFE', sqlProduto);
   Item := PegaValor_I('ID_ITEM', sqlProduto);
   pb := PegaValor_R('PBIO_LA17', sqlProduto);
   produ := PegaValor_S('XPROD_I04', sqlProduto);

   With Prod Do
   Begin
      // LA|cProdANP|descANP|CODIF|qTemp|UFCons|
      comb.cProdANP := PegaValor_I('CPRODANP_LA02', sqlProduto);
      comb.descANP := PegaValor_S('DESCANP_LA03', sqlProduto);
      comb.CODIF := PegaValor_S('CODIF_LA04', sqlProduto);
      comb.qTemp := PegaValor_R('QTEMP_LA05', sqlProduto);


      // MARCOS - 28/08/2026 - CORREÇÃO PARA VENDA DE COMBUSTÍVEIS
      //comb.UFcons := PegaValor_S('UFCONS_LA06', sqlProduto);
      comb.UFcons := UFConsumo;


      comb.pBio := PegaValor_R('PBIO_LA17', sqlProduto);

      // comb.pBio := PegaValor_R('PMIXGN_LA03', sqlProduto);
      // comb.pMixGN :=PegaValor_R('PMIXGN_LA03', sqlProduto);
      comb.CIDE.qBCProd := 0;
      comb.CIDE.vAliqProd := 0;
      comb.CIDE.vCIDE := 0;
      comb.ICMS.vBCICMS := 0;
      comb.ICMS.vICMS := 0;
      comb.ICMS.vBCICMSST := 0;
      comb.ICMS.vICMSST := 0;
      comb.ICMSInter.vBCICMSSTDest := 0;
      comb.ICMSInter.vICMSSTDest := 0;
      comb.ICMSCons.vBCICMSSTCons := 0;
      comb.ICMSCons.vICMSSTCons := 0;
      comb.ICMSCons.UFcons := '';

      // MARCOS - 21/05/2024
      // MARCOS - 11/09/2025 - DESABILITADO - POSTO EM GOIAS
      // MARCOS - 08/06/2026 - REABILITADO POSTO ITAPURA
      // {
      If (InformarOrigemComb(FIdNFe, Item)) Then
      Begin
         With comb.origComb.add Do
         Begin
            cUFOrig := 35;
            indImport := TindImport.iiNacional;
            pOrig := 100;
         End;
      End;
      // }

      // LA03a|pGLP|pGNn|pGNi|vPart|
      comb.pGLP := PegaValor_R('PGLP_LA03A', sqlProduto);
      comb.pGNn := PegaValor_R('PGNN_LA03B', sqlProduto);
      comb.pGNi := PegaValor_R('PGNI_LA03C', sqlProduto);
      comb.vPart := PegaValor_R('VPART_LA03D', sqlProduto);

      // LA07|qBCProd|ValiqProd|vCIDE|
      comb.CIDE.qBCProd := PegaValor_R('QBCPROD_LA08', sqlProduto);
      comb.CIDE.vAliqProd := PegaValor_R('VALIQPROD_LA09', sqlProduto);
      comb.CIDE.vCIDE := PegaValor_R('VCIDE_LA10', sqlProduto);

      // LA11|nBico|nBomba|nTanque|vEncIni|vEncFin|
      comb.encerrante.nBico := PegaValor_I('NBICO_LA12', sqlProduto);
      comb.encerrante.nBomba := PegaValor_I('NBOMBA_LA13', sqlProduto);
      comb.encerrante.nTanque := PegaValor_I('NTANQUE_LA14', sqlProduto);
      comb.encerrante.vEncIni := PegaValor_R('VENCINI_LA15', sqlProduto);
      comb.encerrante.vEncFin := PegaValor_R('VENCFIN_LA16', sqlProduto);
      comb.encerrante.vEncFin := PegaValor_R('VENCFIN_LA16', sqlProduto);
   End;
End;
{$ENDREGION}

{$REGION 'Bloco N..UB - Tributos'}
Procedure TNFeGeraXMLACBr.GeraBloco_N(Imposto: TImposto);
Const
   ICMS_00 = 0;
   ICMS_02 = 1;
   ICMS_10 = 2;
   ICMS_15 = 3;
   ICMS_20 = 4;
   ICMS_30 = 5;
   ICMS_40 = 6;
   ICMS_41 = 7;
   ICMS_50 = 8;
   ICMS_51 = 9;
   ICMS_53 = 10;
   ICMS_60 = 11;
   ICMS_61 = 12;
   ICMS_70 = 13;
   ICMS_90 = 14;
   //
   CSOSN_101 = 0;
   CSOSN_102 = 1;
   CSOSN_103 = 2;
   CSOSN_201 = 3;
   CSOSN_202 = 4;
   CSOSN_300 = 5;
   CSOSN_400 = 6;
   CSOSN_500 = 7;
   CSOSN_900 = 8;
Var
   sOrigem, sValor: String;
   ValorICMS, ValorICMSOper: Real;
   Aliq_MVAST, Aliq_ST, Indice_STRet, Indice_BCRet: Real;
   //
   AliqBCOp, VlrBCFCP, VlrBCFCPST: Real;
Begin
   sOrigem := PegaValor_S('ORI_N11', sqlProduto);
   If (Pos(sOrigem, '012') <= 0)
   Then
   Begin
      sOrigem := '0';
   End;

   sValor := PegaValor_S('CST_N12', sqlProduto);
   If (sValor = '90')
   Then
   Begin
      // OPERACAO_SEM_VALOR := True;
   End;

   DMNFe.PegarInfoICMSST(CodigoProduto, 'SP', Aliq_MVAST, Aliq_ST, Indice_STRet, Indice_BCRet);
   If (RecalculaSTRet = False)
   Then
   Begin
      Aliq_ST := 0.0;
      Aliq_MVAST := 0.0;
      Indice_STRet := 0.0;
      Indice_BCRet := 0.0;
   End;

   // INFORMAÇÃO NÃO OBRIGATÓRIA NA NFe
   Imposto.vTotTrib := PegaValor_R('VTOTTRIB_M02', sqlProduto);
   With Imposto Do
   Begin
      ICMS.orig := StrToOrig(sOrigem);
      If (sValor <> '')
      Then
      Begin
         Case AnsiIndexStr(sValor, ['00', '02', '10', '15', '20', '30', '40', '41', '50', '51', '53', '60', '61', '70', '90']) Of
            ICMS_00:
               Begin
                  // N02|orig|CST|modBC|vBC|pICMS|vICMS|pFCP|vFCP|
                  ICMS.CST := cst00;
                  ICMS.modBC := StrTomodBC(Ok, PegaValor_S('MODBC_N13', sqlProduto));
                  ICMS.vBC := PegaValor_R('VBC_N15', sqlProduto);
                  ICMS.pICMS := PegaValor_R('PICMS_N16', sqlProduto);
                  ICMS.vICMS := PegaValor_R('VICMS_N17', sqlProduto);
                  ICMS.modBCST := dbisMargemValorAgregado;
                  ICMS.pFCP := PegaValor_R('PFCP_N17B', sqlProduto);
                  ICMS.vFCP := PegaValor_R('VFCP_N17C', sqlProduto);
               End;
            // MARCOS - 17/10/2023 - ICMS MONOFASICO
            ICMS_02:
               Begin
                  // N02a|orig|CST|qBCMono|adRemICMS|vICMSMono|
                  ICMS.CST := cst02;
                  ICMS.qBCMono := PegaValor_R('QBCMONO_N37A', sqlProduto);
                  ICMS.adRemICMS := PegaValor_R('ADREMICMS_N38', sqlProduto);
                  ICMS.vICMSMono := PegaValor_R('VICMSMONO_N39', sqlProduto);
               End;
            ICMS_10:
               Begin
                  // N03|orig|CST|modBC|vBC|pICMS|vICMS|vBCFCP|pFCP|vFCP|modBCST|pMVAST|pRedBCST|vBCST|pICMSST|vICMSST|vBCFCPST|pFCPST|vFCPST|
                  // N10a|orig|CST|modBC|vBC|pRedBC|pICMS|vICMS|modBCST|pMVAST|pRedBCST|vBCST|pICMSST|vICMSST|pBCOp|UFST|
                  ICMS.CST := cst10;
                  ICMS.modBC := StrTomodBC(Ok, PegaValor_S('MODBC_N13', sqlProduto));
                  ICMS.pRedBC := PegaValor_R('PREDBC_N14', sqlProduto);
                  ICMS.vBC := PegaValor_R('VBC_N15', sqlProduto);
                  ICMS.pICMS := PegaValor_R('PICMS_N16', sqlProduto);
                  ICMS.vICMS := PegaValor_R('VICMS_N17', sqlProduto);
                  ICMS.modBCST := StrTomodBCST(Ok, PegaValor_S('MODBCST_N18', sqlProduto));
                  ICMS.pMVAST := PegaValor_R('PMVAST_N19', sqlProduto);
                  ICMS.pRedBCST := PegaValor_R('PREDBCST_N20', sqlProduto);
                  ICMS.vBCST := PegaValor_R('VBCST_N21', sqlProduto);
                  ICMS.pICMSST := PegaValor_R('PICMSST_N22', sqlProduto);
                  ICMS.vICMSST := PegaValor_R('VICMSST_N23', sqlProduto);

                  // MARCOS - 19/02/2026
                  VlrBCFCP := PegaValor_R('VBCFCP_N17A', sqlProduto);
                  If (VlrBCFCP > 0) Then
                  Begin
                     ICMS.vBCFCP := VlrBCFCP;
                     ICMS.pFCP := PegaValor_R('PFCP_N17B', sqlProduto);
                     ICMS.vFCP := PegaValor_R('VFCP_N17C', sqlProduto);
                  End;

                  // MARCOS - 19/02/2026
                  VlrBCFCPST := PegaValor_R('VBCFCPST_N23A', sqlProduto);
                  If (VlrBCFCPST > 0) Then
                  Begin
                     ICMS.vBCFCPST := VlrBCFCPST;
                     ICMS.pFCPST := PegaValor_R('PFCPST_N23B', sqlProduto);
                     ICMS.vFCPST := PegaValor_R('VFCPST_N23D', sqlProduto);
                  End;

                  // MARCOS - 19/02/2026
                  AliqBCOp := PegaValor_R('PBCOP_N25', sqlProduto);
                  If (AliqBCOp > 0) AND (ConsumidorFinal) And (NOT MesmaUF) Then
                  Begin
                     ICMS.pBCOp := AliqBCOp;
                     ICMS.UFST := PegaValor_S('UFST_N24', sqlProduto);
                  End;

               End;
            // MARCOS - 17/10/2023 - ICMS MONOFASICO
            ICMS_15:
               Begin
                  // N03a|orig|CST|qBCMono|adRemICMS|vICMSMono|qBCMonoReten|adRemICMSReten|vICMSMonoReten|pRedAdRem|motRedAdRem|
                  ICMS.CST := cst15;
                  ICMS.qBCMono := PegaValor_R('QBCMONO_N37A', sqlProduto);
                  ICMS.adRemICMS := PegaValor_R('ADREMICMS_N38', sqlProduto);
                  ICMS.vICMSMono := PegaValor_R('VICMSMONO_N39', sqlProduto);
                  ICMS.qBCMonoReten := PegaValor_R('QBCMONORETEN_N39A', sqlProduto);
                  ICMS.adRemICMSReten := PegaValor_R('ADREMICMSRETEN_N40', sqlProduto);
                  ICMS.vICMSMonoReten := PegaValor_R('VICMSMONORETEN_N41', sqlProduto);
                  ICMS.pRedAdRem := PegaValor_R('PREDADREM_N47', sqlProduto);
                  ICMS.motRedAdRem := motOutros;;
               End;
            ICMS_20:
               Begin
                  // N04|orig|CST|modBC|pRedBC|vBC|pICMS|vICMS|vBCFCP|pFCP|vFCP|vICMSDeson|motDesICMS|
                  ICMS.CST := cst20;
                  ICMS.modBC := StrTomodBC(Ok, PegaValor_S('MODBC_N13', sqlProduto));
                  ICMS.pRedBC := PegaValor_R('PREDBC_N14', sqlProduto);
                  ICMS.vBC := PegaValor_R('VBC_N15', sqlProduto);
                  ICMS.pICMS := PegaValor_R('PICMS_N16', sqlProduto);
                  ICMS.vICMS := PegaValor_R('VICMS_N17', sqlProduto);
                  ICMS.vBCFCP := PegaValor_R('VBCFCP_N17A', sqlProduto);
                  ICMS.pFCP := PegaValor_R('PFCP_N17B', sqlProduto);
                  ICMS.vFCP := PegaValor_R('VFCP_N17C', sqlProduto);
                  ICMS.vICMSDeson := PegaValor_R('VICMSDESON_N27A', sqlProduto);
                  ICMS.motDesICMS := StrTomotDesICMS(Ok, PegaValor_S('MOTDESICMS_N28', sqlProduto));
               End;
            ICMS_30:
               Begin
                  // N05|orig|CST|modBCST|pMVAST|pRedBCST|vBCST|pICMSST|vICMSST|vBCFCPST|pFCPST|vFCPST|vICMSDeson|motDesICMS|
                  ICMS.CST := cst30;
                  ICMS.modBCST := StrTomodBCST(Ok, PegaValor_S('MODBCST_N18', sqlProduto));
                  ICMS.pMVAST := PegaValor_R('PMVAST_N19', sqlProduto);
                  ICMS.pRedBCST := PegaValor_R('PREDBCST_N20', sqlProduto);
                  ICMS.vBCST := PegaValor_R('VBCST_N21', sqlProduto);
                  ICMS.pICMSST := PegaValor_R('PICMSST_N22', sqlProduto);
                  ICMS.vICMSST := PegaValor_R('VICMSST_N23', sqlProduto);
                  ICMS.vBCFCPST := PegaValor_R('VBCFCPST_N23A', sqlProduto);
                  ICMS.pFCPST := PegaValor_R('PFCPST_N23B', sqlProduto);
                  ICMS.vFCPST := PegaValor_R('VFCPST_N23D', sqlProduto);
                  ICMS.vICMSDeson := PegaValor_R('VICMSDESON_N27A', sqlProduto);
                  ICMS.motDesICMS := StrTomotDesICMS(Ok, PegaValor_S('MOTDESICMS_N28', sqlProduto));
               End;
            ICMS_40, ICMS_50:
               Begin
                  // N06|orig|CST|vICMSDeson|motDesICMS|
                  ICMS.CST := StrToCSTICMS(PegaValor_S('CST_N12', sqlProduto));
                  ICMS.vICMSDeson := PegaValor_R('VICMSDESON_N27A', sqlProduto);
                  ICMS.motDesICMS := StrTomotDesICMS(Ok, PegaValor_S('MOTDESICMS_N28', sqlProduto));
               End;
            ICMS_41:
               Begin
                  // N10b|orig|CST|vBCSTRet|vICMSSTRet|vBCSTDest|vICMSSTDest|vBCFCPSTRet|pFCPSTRet|vFCPSTRet|pST |vICMSSubstituto|pRedBCEfet|vBCEfet|pICMSEfet|vICMSEfet
                  ICMS.CST := cst41;
                  ICMS.vBCSTRet := PegaValor_R('VBCSTRET_N26', sqlProduto);
                  ICMS.vICMSSTRet := PegaValor_R('VICMSSTRET_N27', sqlProduto);
                  ICMS.vICMSDeson := PegaValor_R('VICMSDESON_N27A', sqlProduto);
                  ICMS.motDesICMS := StrTomotDesICMS(Ok, PegaValor_S('MOTDESICMS_N28', sqlProduto));
                  ICMS.vBCSTDest := PegaValor_R('VBCSTDEST_N31', sqlProduto);
                  ICMS.vICMSSTDest := PegaValor_R('VICMSTDEST_N32', sqlProduto);
                  ICMS.vBCFCPSTRet := 0;
                  ICMS.pFCPSTRet := 0;
                  ICMS.vFCPSTRet := 0;
                  ICMS.pST := 0;
                  ICMS.vICMSSubstituto := 0;
                  ICMS.pRedBCEfet := 0;
                  ICMS.vBCEfet := 0;
                  ICMS.pICMSEfet := 0;
                  ICMS.vICMSEfet := 0;
               End;
            ICMS_51:
               Begin
                  // N07|orig|CST|modBC|pRedBC|vBC|pICMS|vICMSOp|pDif|vICMSDif|vICMS|vBCFCP|pFCP|vFCP|
                  ValorICMSOper := PegaValor_R('VICMS_N17', sqlProduto);
                  ValorICMS := ValorICMSOper - PegaValor_R('VICMSDIF_N16C', sqlProduto);
                  //
                  ICMS.CST := cst51;
                  ICMS.modBC := StrTomodBC(Ok, PegaValor_S('MODBC_N13', sqlProduto));
                  ICMS.pRedBC := PegaValor_R('PREDBC_N14', sqlProduto);
                  ICMS.vBC := PegaValor_R('VBC_N15', sqlProduto);
                  ICMS.pICMS := PegaValor_R('PICMS_N16', sqlProduto);
                  ICMS.vICMSOp := ValorICMSOper;
                  ICMS.pDif := PegaValor_R('PDIF_N16B', sqlProduto);
                  ICMS.vICMSDif := PegaValor_R('VICMSDIF_N16C', sqlProduto);
                  ICMS.vICMS := ValorICMS;
                  ICMS.vBCFCP := PegaValor_R('VBCFCP_N17A', sqlProduto);
                  ICMS.pFCP := PegaValor_R('PFCP_N17B', sqlProduto);
                  ICMS.vFCP := PegaValor_R('VFCP_N17C', sqlProduto);
               End;
            // MARCOS - 17/10/2023 - ICMS MONOFASICO
            ICMS_53:
               Begin
                  // N07a|orig|CST|qBCMonoDif_N41a|adRemICMSDif_N42|vICMSMonoDif_N43|
                  ICMS.CST := cst53;
                  ICMS.vICMSDif := PegaValor_R('VICMSMONOOP_N41A', sqlProduto) - PegaValor_R('VICMSMONO_N39', sqlProduto);
                  ICMS.pDif := PegaValor_R('PDIF_N42', sqlProduto);
                  ICMS.vICMSMonoDif := PegaValor_R('VICMSMONODIF_N43', sqlProduto);
               End;
            ICMS_60:
               Begin
                  // N08|orig|CST|vBCSTRet|pST|vICMSSTRet|vBCFCPSTRet|pFCPSTRet|vFCPSTRet|
                  // N08|orig|CST|vBCSTRet|pST|vICMSSTRet|vBCFCPSTRet|pFCPSTRet|vFCPSTRet|pRedBCEfet|vBCEfet|pICMSEfet|vICMSEfet|vICMSSubstituto|
                  // N10b|orig|CST|vBCSTRet|vICMSSTRet|vBCSTDest|vICMSSTDest|vBCFCPSTRet|pFCPSTRet|vFCPSTRet|pST |vICMSSubstituto|pRedBCEfet|vBCEfet|pICMSEfet|vICMSEfet

                  // MARCOS - 29/04/2025 - INFORMAÇÕES DO ICMS ST RETIDO ANTERIORMENTE (CST 60)
                  ICMS.CST := cst60;

                  // MARCOS - 02/05/2025 - GAMBIARRA
                  // If (Aliq_MVAST <= 0) Or (Indice_STRet <= 0) Or (Indice_BCRet <= 0) or
                  // (PegaValor_R('VBCSTRET_N26', sqlProduto) <=0) or (PegaValor_R('VICMSSTRET_N27', sqlProduto) <=0)
                  If (Aliq_MVAST <= 0) Or (Indice_STRet <= 0) Or (Indice_BCRet <= 0)
                  Then
                  Begin
                     { N26 } ICMS.vBCSTRet := 0.01;
                     { N26a } ICMS.pST := 0.00;
                     { N26b } ICMS.vICMSSubstituto := 0.01;
                     { N27 } ICMS.vICMSSTRet := 0.00;
                  End
                  Else
                  Begin
                     { N26 } ICMS.vBCSTRet := PegaValor_R('VBCSTRET_N26', sqlProduto);
                     { N26a } ICMS.pST := PegaValor_R('PST_N26A', sqlProduto);
                     { N26b } ICMS.vICMSSubstituto := 0.01;
                     { N27 } ICMS.vICMSSTRet := PegaValor_R('VICMSSTRET_N27', sqlProduto);
                  End;

                  { N27a } ICMS.vBCFCPSTRet := 0; // PegaValor_R('VBCFCPSTRET_N27A', sqlProduto);
                  { N27b } ICMS.pFCPSTRet := 0; // PegaValor_R('PFCPSTRET_N27B', sqlProduto);
                  { N27d } ICMS.vFCPSTRet := 0; // PegaValor_R('VFCPSTRET_N27D', sqlProduto);

                  { N34 } ICMS.pRedBCEfet := 0;
                  { N35 } ICMS.vBCEfet := 0;
                  { N36 } ICMS.pICMSEfet := 0;
                  { N37 } ICMS.vICMSEfet := 0;
               End;
            // MARCOS - 17/10/2023 - ICMS MONOFASICO
            ICMS_61:
               Begin
                  // N08a|orig|CST|qBCMonoRet|adRemICMSRet|vICMSMonoRet
                  ICMS.CST := cst61;
                  ICMS.qBCMonoRet := PegaValor_R('QBCMONORET_N43A', sqlProduto);
                  ICMS.adRemICMSRet := PegaValor_R('ADREMICMSRET_N44', sqlProduto);
                  ICMS.vICMSMonoRet := PegaValor_R('VICMSMONORET_N45', sqlProduto);
                  // MARCOS - 11/10/2024 - INFO ICMS MONOFÁSICO
                  InformarICMSMonofasico := True;
               End;
            ICMS_70:
               Begin
                  // N09|orig|CST|modBC|pRedBC|vBC|pICMS|vICMS|vBCFCP|pFCP|vFCP|modBCST|pMVAST|pRedBCST|vBCST|pICMSST|vICMSST|vBCFCPST|pFCPST|vFCPST|vICMSDeson|motDesICMS|
                  ICMS.CST := cst70;
                  ICMS.modBC := StrTomodBC(Ok, PegaValor_S('MODBC_N13', sqlProduto));
                  ICMS.vBC := PegaValor_R('VBC_N15', sqlProduto);
                  ICMS.pICMS := PegaValor_R('PICMS_N16', sqlProduto);
                  ICMS.vICMS := PegaValor_R('VICMS_N17', sqlProduto);
                  ICMS.vBCFCP := PegaValor_R('VBCFCP_N17A', sqlProduto);
                  ICMS.pFCP := PegaValor_R('PFCP_N17B', sqlProduto);
                  ICMS.vFCP := PegaValor_R('VFCP_N17C', sqlProduto);
                  ICMS.modBCST := StrTomodBCST(Ok, PegaValor_S('MODBCST_N18', sqlProduto));
                  ICMS.pMVAST := PegaValor_R('PMVAST_N19', sqlProduto);
                  ICMS.pRedBCST := PegaValor_R('PREDBCST_N20', sqlProduto);
                  ICMS.vBCST := PegaValor_R('VBCST_N21', sqlProduto);
                  ICMS.pICMSST := PegaValor_R('PICMSST_N22', sqlProduto);
                  ICMS.vICMSST := PegaValor_R('VICMSST_N23', sqlProduto);
                  ICMS.vBCFCPST := PegaValor_R('VBCFCPST_N23A', sqlProduto);
                  ICMS.pFCPST := PegaValor_R('PFCPST_N23B', sqlProduto);
                  ICMS.vFCPST := PegaValor_R('VFCPST_N23D', sqlProduto);
                  ICMS.vICMSDeson := PegaValor_R('VICMSDESON_N27A', sqlProduto);
                  ICMS.motDesICMS := StrTomotDesICMS(Ok, PegaValor_S('MOTDESICMS_N28', sqlProduto));
               End;
            ICMS_90:
               Begin
                  // N10|orig|CST|modBC|vBC|pRedBC|pICMS|vICMS|vBCFCP|pFCP|vFCP|modBCST|pMVAST|pRedBCST|vBCST|pICMSST|vICMSST|vBCFCPST|pFCPST|vFCPST|vICMSDeson|motDesICMS|
                  // N10a|orig|CST|modBC|vBC|pRedBC|pICMS|vICMS|modBCST|pMVAST|pRedBCST|vBCST|pICMSST|vICMSST|pBCOp|UFST|
                  ICMS.CST := cst90;
                  ICMS.modBC := StrTomodBC(Ok, PegaValor_S('MODBC_N13', sqlProduto));
                  ICMS.pRedBC := PegaValor_R('PREDBC_N14', sqlProduto);
                  ICMS.vBC := PegaValor_R('VBC_N15', sqlProduto);
                  ICMS.pICMS := PegaValor_R('PICMS_N16', sqlProduto);
                  ICMS.vICMS := PegaValor_R('VICMS_N17', sqlProduto);
                  ICMS.vBCFCP := PegaValor_R('VBCFCP_N17A', sqlProduto);
                  ICMS.pFCP := PegaValor_R('PFCP_N17B', sqlProduto);
                  ICMS.vFCP := PegaValor_R('VFCP_N17C', sqlProduto);
                  ICMS.modBCST := StrTomodBCST(Ok, PegaValor_S('MODBCST_N18', sqlProduto));
                  ICMS.pMVAST := PegaValor_R('PMVAST_N19', sqlProduto);
                  ICMS.pRedBCST := PegaValor_R('PREDBCST_N20', sqlProduto);
                  ICMS.vBCST := PegaValor_R('VBCST_N21', sqlProduto);
                  ICMS.pICMSST := PegaValor_R('PICMSST_N22', sqlProduto);
                  ICMS.vICMSST := PegaValor_R('VICMSST_N23', sqlProduto);
                  ICMS.vBCFCPST := PegaValor_R('VBCFCPST_N23A', sqlProduto);
                  ICMS.pFCPST := PegaValor_R('PFCPST_N23B', sqlProduto);
                  ICMS.vFCPST := PegaValor_R('VFCPST_N23D', sqlProduto);
                  ICMS.UFST := PegaValor_S('UFST_N24', sqlProduto);
                  ICMS.pBCOp := PegaValor_R('PBCOP_N25', sqlProduto);
                  ICMS.vICMSDeson := PegaValor_R('VICMSDESON_N27A', sqlProduto);
                  ICMS.motDesICMS := StrTomotDesICMS(Ok, PegaValor_S('MOTDESICMS_N28', sqlProduto));
               End;
         End;
      End;

      // ICMS-SN
      sValor := PegaValor_S('CSOSN_N12A', sqlProduto);
      If (sValor <> '')
      Then
      Begin
         Case AnsiIndexStr(sValor, ['101', '102', '103', '201', '202', '300', '400', '500', '900']) Of
            CSOSN_101:
               Begin
                  // N10c|orig|CSOSN|pCredSN|vCredICMSSN|
                  ICMS.CSOSN := csosn101;
                  ICMS.pCredSN := PegaValor_R('PCREDSN_N29', sqlProduto);
                  ICMS.vCredICMSSN := PegaValor_R('VCREDICMSSN_N30', sqlProduto);

                  // MARCOS - 31/03/2025 - NÃO ACEITA ALIQUOTA "ZERO" PARA SIMPLES NACIONAL
                  If ((ICMS.pCredSN <= 0) Or (ICMS.vCredICMSSN <= 0))
                  Then
                  Begin
                     MensagemBox('Aliquota ICMS-SN', 'Aliquota do ICMS-SN deve ser maior que "Zero".', tamErro);
                     Exit;
                  End;
               End;
            CSOSN_102, CSOSN_103, CSOSN_300, CSOSN_400:
               Begin
                  // N10d|orig|CSOSN|
                  ICMS.CSOSN := StrToCSOSNIcms(PegaValor_S('CSOSN_N12A', sqlProduto));
               End;
            CSOSN_201:
               Begin
                  // N10e|orig|CSOSN|modBCST|pMVAST|pRedBCST|vBCST|pICMSST|vICMSST|vBCFCPST|pFCPST|vFCPST|pCredSN|vCredICMSSN|
                  ICMS.CSOSN := csosn201;
                  ICMS.modBCST := StrTomodBCST(Ok, PegaValor_S('MODBCST_N18', sqlProduto));
                  ICMS.pMVAST := PegaValor_R('PMVAST_N19', sqlProduto);
                  ICMS.pRedBCST := PegaValor_R('PREDBCST_N20', sqlProduto);
                  ICMS.vBCST := PegaValor_R('VBCST_N21', sqlProduto);
                  ICMS.pICMSST := PegaValor_R('PICMSST_N22', sqlProduto);
                  ICMS.vICMSST := PegaValor_R('VICMSST_N23', sqlProduto);
                  ICMS.vBCFCPST := PegaValor_R('VBCFCPST_N23A', sqlProduto);
                  ICMS.pFCPST := PegaValor_R('PFCPST_N23B', sqlProduto);
                  ICMS.vFCPST := -PegaValor_R('VFCPST_N23D', sqlProduto);
                  ICMS.pCredSN := PegaValor_R('PCREDSN_N29', sqlProduto);
                  ICMS.vCredICMSSN := PegaValor_R('VCREDICMSSN_N30', sqlProduto);
               End;
            CSOSN_202:
               Begin
                  // N10f|orig|CSOSN|modBCST|pMVAST|pRedBCST|vBCST|pICMSST|vICMSST|vBCFCPST|pFCPST|vFCPST|
                  ICMS.CSOSN := csosn202;
                  ICMS.modBCST := StrTomodBCST(Ok, PegaValor_S('MODBCST_N18', sqlProduto));
                  ICMS.pMVAST := PegaValor_R('PMVAST_N19', sqlProduto);
                  ICMS.pRedBCST := PegaValor_R('PREDBCST_N20', sqlProduto);
                  ICMS.vBCST := PegaValor_R('VBCST_N21', sqlProduto);
                  ICMS.pICMSST := PegaValor_R('PICMSST_N22', sqlProduto);
                  ICMS.vICMSST := PegaValor_R('VICMSST_N23', sqlProduto);
                  ICMS.vBCFCPST := PegaValor_R('VBCFCPST_N23A', sqlProduto);
                  ICMS.pFCPST := PegaValor_R('PFCPST_N23B', sqlProduto);
                  ICMS.vFCPST := -PegaValor_R('VFCPST_N23D', sqlProduto);
               End;
            CSOSN_500:
               Begin
                  // N10g|orig|CSOSN|vBCSTRet|pST|vICMSSTRet|vBCFCPSTRet|pFCPSTRet|vFCPSTRet|pRedBCEfet|vBCEfet|pICMSEfet|vICMSEfet|vICMSSubstituto|
                  ICMS.CSOSN := csosn500;
                  ICMS.pMVAST := PegaValor_R('PMVAST_N19', sqlProduto);
                  ICMS.vBCSTRet := PegaValor_R('VBCSTRET_N26', sqlProduto);
                  ICMS.vICMSSTRet := PegaValor_R('VICMSSTRET_N27', sqlProduto);
                  ICMS.vBCFCPSTRet := PegaValor_R('VBCFCPSTRET_N27A', sqlProduto);
                  ICMS.pFCPSTRet := PegaValor_R('PFCPSTRET_N27B', sqlProduto);
                  ICMS.vFCPSTRet := PegaValor_R('VFCPSTRET_N27D', sqlProduto);
                  ICMS.pRedBCEfet := 0;
                  ICMS.vBCEfet := 0;
                  ICMS.pICMSEfet := 0;
                  ICMS.vICMSEfet := 0;
                  ICMS.vICMSSubstituto := 0;
               End;
            CSOSN_900:
               Begin
                  // N10h|orig|CSOSN|modBC|vBC|pRedBC|pICMS|vICMS|modBCST|pMVAST|pRedBCST|vBCST|pICMSST|vICMSST|vBCFCPST|pFCPST|vFCPST|pCredSN|vCredICMSSN|
                  ICMS.CSOSN := csosn900;
                  ICMS.modBC := StrTomodBC(Ok, PegaValor_S('MODBC_N13', sqlProduto));
                  ICMS.vBC := PegaValor_R('VBC_N15', sqlProduto);
                  ICMS.pRedBC := PegaValor_R('PREDBC_N14', sqlProduto);
                  ICMS.pICMS := PegaValor_R('PICMS_N16', sqlProduto);
                  ICMS.vICMS := PegaValor_R('VICMS_N17', sqlProduto);
                  ICMS.modBCST := StrTomodBCST(Ok, PegaValor_S('MODBCST_N18', sqlProduto));
                  ICMS.pMVAST := PegaValor_R('PMVAST_N19', sqlProduto);
                  ICMS.pRedBCST := PegaValor_R('PREDBCST_N20', sqlProduto);
                  ICMS.vBCST := PegaValor_R('VBCST_N21', sqlProduto);
                  ICMS.pICMSST := PegaValor_R('PICMSST_N22', sqlProduto);
                  ICMS.vICMSST := PegaValor_R('VICMSST_N23', sqlProduto);
                  ICMS.vBCFCPST := PegaValor_R('VBCFCPST_N23A', sqlProduto);
                  ICMS.pFCPST := PegaValor_R('PFCPST_N23B', sqlProduto);
                  ICMS.vFCPST := -PegaValor_R('VFCPST_N23D', sqlProduto);
                  ICMS.pCredSN := PegaValor_R('PCREDSN_N29', sqlProduto);
                  ICMS.vCredICMSSN := PegaValor_R('VCREDICMSSN_N30', sqlProduto);
               End;
         End;
      End;
   End;
End;

Procedure TNFeGeraXMLACBr.GeraBloco_NA(Imposto: TImposto);
Begin
   If (DMNFe.TemPartilhaICMS(FIdNFe))
   Then
   Begin
      With Imposto Do
      Begin
         // NA|vBCUFDest|vBCFCPUFDest|pFCPUFDest|pICMSUFDest|pICMSInter|pICMSInterPart|vFCPUFDest|vICMSUFDest|vICMSUFRemet|
         ICMSUFDest.vBCUFDest := PegaValor_R('VBCUFDEST_NA03', sqlProduto);
         ICMSUFDest.vBCFCPUFDest := PegaValor_R('VBCFCPUFDEST_NA04', sqlProduto);
         ICMSUFDest.pFCPUFDest := PegaValor_R('PFCPUFDEST_NA05', sqlProduto);
         ICMSUFDest.pICMSUFDest := PegaValor_R('PICMSUFDEST_NA07', sqlProduto);
         ICMSUFDest.pICMSInter := PegaValor_R('PICMSINTER_NA09', sqlProduto);
         ICMSUFDest.pICMSInterPart := PegaValor_R('PICMSINTERPART_NA11', sqlProduto);
         ICMSUFDest.vFCPUFDest := PegaValor_R('VFCPUFDEST_NA13', sqlProduto);

         // INFORMAÇõES NÃO OBRIGATÓRIAS NA NFe
         ICMSUFDest.vICMSUFDest := PegaValor_R('VICMSUFDEST_NA15', sqlProduto);
         ICMSUFDest.vICMSUFRemet := PegaValor_R('VICMSUFREMET_NA17', sqlProduto);
      End;
   End;
End;

Procedure TNFeGeraXMLACBr.GeraBloco_O(Imposto: TImposto);
Const
   // TRIBUTADO
   IPI_00 = 0;
   IPI_49 = 6;
   IPI_50 = 7;
   IPI_99 = 13;
   // NÃO TRIBUTADO
   IPI_01 = 1;
   IPI_02 = 2;
   IPI_03 = 3;
   IPI_04 = 4;
   IPI_05 = 5;
   IPI_51 = 8;
   IPI_52 = 9;
   IPI_53 = 10;
   IPI_54 = 11;
   IPI_55 = 12;
Var
   sValor: String;
   rValor1, rValor2: Real;
Begin
   With Imposto Do
   Begin
      // O|CNPJProd|cSelo|qSelo|cEnq|
      sValor := PegaValor_S('CST_O09', sqlProduto);
      //
      IPI.CNPJProd := PegaValor_S('CNPJPROD_O03', sqlProduto);
      IPI.cSelo := PegaValor_S('CSELO_O04', sqlProduto);
      IPI.qSelo := PegaValor_I('QSELO_O05', sqlProduto);
      IPI.cEnq := PegaValor_S('CENQ_O06', sqlProduto);
      IPI.CST := StrToCSTIPI(Ok, sValor);

      Case AnsiIndexStr(sValor, ['00', '49', '50', '99']) Of
         IPI_00, IPI_49, IPI_50, IPI_99:
            Begin
               rValor1 := PegaValor_R('QUNID_O11', sqlProduto);
               rValor1 := PegaValor_R('VUNID_O12', sqlProduto);
               If ((rValor1 > 0) And (rValor2 > 0))
               Then
               Begin
                  // O13|qUnid|vUnid|vIPI|
                  IPI.qUnid := PegaValor_R('QUNID_O11', sqlProduto);
                  IPI.vUnid := PegaValor_R('VUNID_O12', sqlProduto);
                  IPI.vIPI := PegaValor_R('VIPI_O14', sqlProduto);
               End
               Else
               Begin
                  // O09|vBC|pIPI|
                  IPI.vBC := PegaValor_R('VBC_O10', sqlProduto);
                  IPI.pIPI := PegaValor_R('PIPI_O13', sqlProduto);
               End;
            End;
      End;
   End;
End;

Procedure TNFeGeraXMLACBr.GeraBloco_Q(Imposto: TImposto);
Const
   PIS_01 = 0;
   PIS_02 = 1;
   PIS_03 = 2;
   PIS_04 = 3;
   PIS_05 = 4;
   PIS_06 = 5;
   PIS_07 = 6;
   PIS_08 = 7;
   PIS_09 = 8;
   PIS_49 = 9;
   PIS_50 = 10;
   PIS_51 = 11;
   PIS_52 = 12;
   PIS_53 = 13;
   PIS_54 = 14;
   PIS_55 = 15;
   PIS_56 = 16;
   PIS_60 = 17;
   PIS_61 = 18;
   PIS_62 = 19;
   PIS_63 = 20;
   PIS_64 = 21;
   PIS_65 = 22;
   PIS_66 = 23;
   PIS_67 = 24;
   PIS_70 = 25;
   PIS_71 = 26;
   PIS_72 = 27;
   PIS_73 = 28;
   PIS_74 = 29;
   PIS_75 = 30;
   PIS_98 = 31;
   PIS_99 = 32;
Var
   sValor: String;
Begin
   sValor := PegaValor_S('CST_Q06', sqlProduto);

   With Imposto Do
   Begin
      PIS.CST := StrToCSTPIS(sValor);
      Case AnsiIndexStr(sValor, [
         '01', '02', '03', '04', '05', '06', '07', '08', '09', '49',
         '50', '51', '52', '53', '54', '55', '56',
         '60', '61', '62', '63', '64', '65', '66', '67',
         '70', '71', '72', '73', '74', '75',
         '98', '99']) Of
         PIS_01, PIS_02:
            Begin
               // Q02|CST|vBC|pPIS|vPIS|
               PIS.vBC := PegaValor_R('VBC_Q07', sqlProduto);
               PIS.pPIS := PegaValor_R('PPIS_Q08', sqlProduto);
               PIS.vPIS := PegaValor_R('VPIS_Q09', sqlProduto);
            End;
         PIS_03:
            Begin
               // Q03|CST|qBCProd|vAliqProd|vPIS|
               PIS.vPIS := PegaValor_R('VPIS_Q09', sqlProduto);
               PIS.qBCProd := PegaValor_R('QBCPROD_Q10', sqlProduto);
               PIS.vAliqProd := PegaValor_R('VALIQPROD_Q11', sqlProduto);
            End;
         PIS_04, PIS_05, PIS_06, PIS_07, PIS_08, PIS_09:
            Begin
               // Q04|CST|
            End;
         PIS_49, PIS_50, PIS_51, PIS_52, PIS_53, PIS_54, PIS_55, PIS_56, PIS_60, PIS_61, PIS_62, PIS_63, PIS_64, PIS_65, PIS_66, PIS_67,
            PIS_70, PIS_71, PIS_72, PIS_73, PIS_74, PIS_75, PIS_98, PIS_99:
            Begin
               // UTILIZAR CÁLCULO DO PIS POR ALIQUOTA
               // Q07|vBC|pPIS|vPIS
               PIS.vBC := PegaValor_R('VBC_Q07', sqlProduto);
               PIS.pPIS := PegaValor_R('PPIS_Q08', sqlProduto);
               PIS.vPIS := PegaValor_R('VPIS_Q09', sqlProduto);

               // UTILIZAR CÁLCULO DO PIS POR QUANTIDADE
               // Q10|qBCProd|vAliqProd|
               // qBCProd := PegaValor_R('QBCPROD_Q10', sqlProduto);
               // vAliqProd := PegaValor_R('VALIQPROD_Q11', sqlProduto);
            End;
      End;
   End;

   With Imposto Do
   Begin
      PISST.vBC := 0;
      PISST.pPIS := 0;
      PISST.qBCProd := 0;
      PISST.vAliqProd := 0;
      PISST.vPIS := 0;
      PISST.IndSomaPISST := ispNenhum;
   End;
End;

Procedure TNFeGeraXMLACBr.GeraBloco_S(Imposto: TImposto);
Const
   COFINS_01 = 0;
   COFINS_02 = 1;
   COFINS_03 = 2;
   COFINS_04 = 3;
   COFINS_05 = 4;
   COFINS_06 = 5;
   COFINS_07 = 6;
   COFINS_08 = 7;
   COFINS_09 = 8;
   COFINS_49 = 9;
   COFINS_50 = 10;
   COFINS_51 = 11;
   COFINS_52 = 12;
   COFINS_53 = 13;
   COFINS_54 = 14;
   COFINS_55 = 15;
   COFINS_56 = 16;
   COFINS_60 = 17;
   COFINS_61 = 18;
   COFINS_62 = 19;
   COFINS_63 = 20;
   COFINS_64 = 21;
   COFINS_65 = 22;
   COFINS_66 = 23;
   COFINS_67 = 24;
   COFINS_70 = 25;
   COFINS_71 = 26;
   COFINS_72 = 27;
   COFINS_73 = 28;
   COFINS_74 = 29;
   COFINS_75 = 30;
   COFINS_98 = 31;
   COFINS_99 = 32;
Var
   sValor: String;
Begin
   sValor := PegaValor_S('CST_S06', sqlProduto);
   With Imposto Do
   Begin
      COFINS.CST := StrToCSTCOFINS(sValor);
      Case AnsiIndexStr(sValor, [
         '01', '02', '03', '04', '05', '06', '07', '08', '09', '49',
         '50', '51', '52', '53', '54', '55', '56',
         '60', '61', '62', '63', '64', '65', '66', '67',
         '70', '71', '72', '73', '74', '75',
         '98', '99']) Of
         COFINS_01, COFINS_02:
            Begin
               // S02|CST|vBC|pCOFINS|vCOFINS|
               COFINS.vBC := PegaValor_R('VBC_S07', sqlProduto);
               COFINS.pCOFINS := PegaValor_R('PCOFINS_S08', sqlProduto);
               COFINS.vCOFINS := PegaValor_R('VCOFINS_S11', sqlProduto);
            End;
         COFINS_03:
            Begin
               // S03|CST|qBCProd|vAliqProd|vCOFINS|
               COFINS.vCOFINS := PegaValor_R('VCOFINS_S11', sqlProduto);
               COFINS.qBCProd := PegaValor_R('QBCPROD_S09', sqlProduto);
               COFINS.vAliqProd := PegaValor_R('VALIQPROD_S10', sqlProduto);
            End;
         COFINS_04, COFINS_05, COFINS_06, COFINS_07, COFINS_08, COFINS_09:
            Begin
               // S04|CST|
            End;
         COFINS_49, COFINS_50, COFINS_51, COFINS_52, COFINS_53, COFINS_54, COFINS_55, COFINS_56, COFINS_60, COFINS_61, COFINS_62, COFINS_63,
            COFINS_64, COFINS_65, COFINS_66, COFINS_67, COFINS_70, COFINS_71, COFINS_72, COFINS_73, COFINS_74, COFINS_75, COFINS_98, COFINS_99:
            Begin
               // UTILIZAR CÁLCULO DO COFINS POR ALIQUOTA
               // S07|vBC|pCOFINS|vCOFINS
               COFINS.vBC := PegaValor_R('VBC_S07', sqlProduto);
               COFINS.pCOFINS := PegaValor_R('PCOFINS_S08', sqlProduto);
               COFINS.vCOFINS := PegaValor_R('VCOFINS_S11', sqlProduto);

               // UTILIZAR CÁLCULO DO COFINS POR QUANTIDADE
               // S10|qBCProd|vAliqProd|
               // qBCProd := PegaValor_R('QBCPROD_S10', sqlProduto);
               // vAliqProd := PegaValor_R('VALIQPROD_S11', sqlProduto);
            End;
      End;

      With Imposto Do
      Begin
         COFINSST.vBC := 0;
         COFINSST.pCOFINS := 0;
         COFINSST.qBCProd := 0;
         COFINSST.vAliqProd := 0;
         COFINSST.vCOFINS := 0;
         COFINSST.indSomaCOFINSST := iscNenhum;
      End;
   End;
End;

Procedure TNFeGeraXMLACBr.GeraBloco_U;
Var
   rValor: Real;
Begin
   // IPI DEVOLUÇÃO
   {
     // UA|pDevol|
     // IPI|vIPIDevol
     rValor := PegaValor_R('VIPIDEVOL_UA04');
     If (rValor > 0)
     Then
     Begin
     PreparaCampo('PDEVOL_UA02', TC_13V2);
     PreparaCampo('VIPIDEVOL_UA04', TC_13V2);
     End;
 }

   {
     // U|vBC|vAliq|vISSQN|cMunFG|cListServ|vDeducao|vOutro|vDescIncond|vDescCond|vISSRet|indISS|cServico|cMun|cPais|nProcesso|indIncentivo|
     rValor := StrToFloatDef(PegaValor_S('VBC_U02', '0'), 0);
     Servico := FACBrNFe.NotasFiscais.add.NFe.Det.New;
     With Servico Do
     Begin
     Prod.nItem := 1; // Número sequencial, para cada item deve ser incrementado
     Prod.cProd := '123457';
     Prod.cEAN := '';
     Prod.xProd := 'Descrição do Serviço';
     Prod.NCM := '99';
     Prod.EXTIPI := '';
     Prod.CFOP := '5933';
     Prod.uCom := 'UN';
     Prod.qCom := 1;
     Prod.vUnCom := 100;
     Prod.vProd := 100;

     Prod.cEANTrib := '';
     Prod.uTrib := 'UN';
     Prod.qTrib := 1;
     Prod.vUnTrib := 100;

     Prod.vFrete := 0;
     Prod.vSeg := 0;
     Prod.vDesc := 0;

     infAdProd := 'Informação Adicional do Serviço';

     // Grupo para serviços
     Imposto.cSitTrib := ISSQNcSitTribNORMAL;
     Imposto.vBC := rValor;
     Imposto.vAliq := PegaValor_R('VALIQ_U03');
     Imposto.vISSQN := PegaValor_R('VISSQN_U04');
     Imposto.cMunFG := PegaValor_S('CNUMFG_U05');
     Imposto.cListServ := PegaValor_S('CLISTSERV_U06');
     NotaF.NFe.Total.ISSQNtot.vServ := rValor;
     NotaF.NFe.Total.ISSQNtot.vBC :=rValor;
     NotaF.NFe.Total.ISSQNtot.vISS :=PegaValor_R('VISSQN_U04');
     NotaF.NFe.Total.ISSQNtot.vPIS :=0;
     NotaF.NFe.Total.ISSQNtot.vCOFINS := 0;
     End;
 }
   {
     If (rValor > 0)
     Then
     Begin
     PreparaCampo('VBC_U02', TC_13V2);
     PreparaCampo('VALIQ_U03', TC_13V2);
     PreparaCampo('VISSQN_U04', TC_13V2);
     PreparaCampo('CNUMFG_U05');
     PreparaCampo('CLISTSERV_U06');
     PreparaCampo('VDEDUCAO_U07', TC_13V2);
     PreparaCampo('VOUTRO_U08', TC_13V2);
     PreparaCampo('VDESCINCOND_U09', TC_13V2);
     PreparaCampo('VDESCOND_U10', TC_13V2);
     PreparaCampo('VISSRET_U11', TC_13V2);
     PreparaCampo('INDISS_U12');
     PreparaCampo('CSERVICO_U13');
     PreparaCampo('CMUN_U14');
     PreparaCampo('CPAIS_U15');
     PreparaCampo('NPROCESSO_U16');
     PreparaCampo('INDINCENTIVO_U17');
     End;
 }
End;

Procedure TNFeGeraXMLACBr.GeraBloco_UB(IdNFe: Integer; IdItem: Integer; Imposto: TImposto);
Var
   SqlDS: TSQLDataSet;
   scriptCIBS: String;
Begin
   // MARCOS - 21/07/2026 - NT2025.002
   scriptCIBS :=
      'SELECT * FROM NFE_PROD_IS_IBS_CBS ' +
      Format('WHERE (ID_NFE = %d) AND (ID_ITEM = %d) ', [IdNFe, IdItem]);

   SqlDS := TSQLDataSet.Create(Nil);
   SqlDS.Active := False;
   SqlDS.SQLConnection := DMNFe.sqlConexao;
   SqlDS.CommandText := scriptCIBS;
   SqlDS.Active := True;
   SqlDS.First;
   // PreparaDS(sScript, SqlDS);
   With Imposto Do
   Begin
      // ********************************************
      // IMPLEMENTAR URGENTE

      // MARCOS - 18/02/2026
      // ISel.CSTIS := StrToCSTIS(PegaValor_S('CSTIS_UB02', SqlDS)); // cstis000;
      ISel.CSTIS := PegaValor_S('CSTIS_UB02', SqlDS); // cstis000;

      ISel.cClassTribIS := PegaValor_S('CCLASSTRIBIS_UB03', SqlDS); // '000001';
      ISel.vBCIS := PegaValor_R('VBCIS_UB05', SqlDS); // 100;
      ISel.PIS := PegaValor_R('PIS_UB06', SqlDS); // 5;

      // MARCOS - 21/07/2026
      // ISel.pISEspec := PegaValor_R('PISESPEC_UB07', SqlDS); // 5;
      ISel.adRemIS := PegaValor_R('PISESPEC_UB07', SqlDS); // 5;

      ISel.uTrib := PegaValor_S('UTRIB_UB09', SqlDS); // 'UNIDAD';
      ISel.qTrib := PegaValor_R('QTRIB_UB10', SqlDS); // 10;
      ISel.vIS := PegaValor_R('VIS_UB11', SqlDS); // 100;
      // *********************************************

      // Informações do tributo: IBS / CBS
      IBSCBS.CST := StrToCSTIBSCBS(PegaValor_S('CST_UB13', SqlDS)); // cst000;
      IBSCBS.cClassTrib := PegaValor_S('CCLASSTRIB_UB14', SqlDS); // '000001';
      // IBSCBS.indDoacao := StrToTIndicadorEx(OK,PegaValor_S('INDDOACAO_UB14A', SqlDS)); // tieNenhum;
      IBSCBS.indDoacao := tieNenhum;

      IBSCBS.gIBSCBS.vBC := PegaValor_R('VBC_UB16', SqlDS); // 100;
      IBSCBS.gIBSCBS.gIBSUF.pIBSUF := PegaValor_R('PIBSUF_UB18', SqlDS); // 5;
      IBSCBS.gIBSCBS.gIBSUF.vIBSUF := PegaValor_R('VIBSUF_UB35', SqlDS); // 100;

      IBSCBS.gIBSCBS.gIBSUF.gDif.pDif := PegaValor_R('PDIF_UB22', SqlDS); // 5;
      IBSCBS.gIBSCBS.gIBSUF.gDif.vDif := PegaValor_R('VDIF_UB23', SqlDS); // 100;

      IBSCBS.gIBSCBS.gIBSUF.gDevTrib.vDevTrib := PegaValor_R('VDEVTRIB_UB25', SqlDS); // 100;

      IBSCBS.gIBSCBS.gIBSUF.gRed.pRedAliq := PegaValor_R('PREDALIQ_UB27', SqlDS); // 5;
      IBSCBS.gIBSCBS.gIBSUF.gRed.pAliqEfet := PegaValor_R('PALIQEFET_UB28', SqlDS); // 5;

      IBSCBS.gIBSCBS.gIBSMun.pIBSMun := PegaValor_R('PIBSMUN_UB37', SqlDS); // 5;
      IBSCBS.gIBSCBS.gIBSMun.vIBSMun := PegaValor_R('VIBSMUN_UB54', SqlDS); // 100;

      IBSCBS.gIBSCBS.gIBSMun.gDif.pDif := PegaValor_R('PDIF_UB41', SqlDS); // 5;
      IBSCBS.gIBSCBS.gIBSMun.gDif.vDif := PegaValor_R('VDIF_UB42', SqlDS); // 100;

      IBSCBS.gIBSCBS.gIBSMun.gDevTrib.vDevTrib := PegaValor_R('VDEVTRIB_UB44', SqlDS); // 100;

      IBSCBS.gIBSCBS.gIBSMun.gRed.pRedAliq := PegaValor_R('PREDALIQ_UB46', SqlDS); // 5;
      IBSCBS.gIBSCBS.gIBSMun.gRed.pAliqEfet := PegaValor_R('PALIQEFET_UB47', SqlDS); // 5;

      // vIBS = vIBSUF + vIBSMun
      IBSCBS.gIBSCBS.vIBS := PegaValor_R('VIBS_UB54A', SqlDS); // 100;

      IBSCBS.gIBSCBS.gCBS.pCBS := PegaValor_R('PCBS_UB56', SqlDS); // 5;
      IBSCBS.gIBSCBS.gCBS.vCBS := PegaValor_R('VCBS_UB67', SqlDS); // 100;

      IBSCBS.gIBSCBS.gCBS.gDif.pDif := PegaValor_R('PDIF_UB60', SqlDS); // 5;
      IBSCBS.gIBSCBS.gCBS.gDif.vDif := PegaValor_R('VDIF_UB61', SqlDS); // 100;

      IBSCBS.gIBSCBS.gCBS.gDevTrib.vDevTrib := PegaValor_R('VDEVTRIB_UB63', SqlDS); // 100;

      IBSCBS.gIBSCBS.gCBS.gRed.pRedAliq := PegaValor_R('PREDALIQ_UB65', SqlDS); // 5;
      IBSCBS.gIBSCBS.gCBS.gRed.pAliqEfet := PegaValor_R('PALIQEFET_UB66', SqlDS); // 5;

      IBSCBS.gIBSCBS.gTribRegular.CSTReg := StrToCSTIBSCBS(PegaValor_S('CSTREG_UB69', SqlDS)); // cst000;
      IBSCBS.gIBSCBS.gTribRegular.cClassTribReg := PegaValor_S('CCLASSTRIBREG_UB70', SqlDS); // '000001';
      IBSCBS.gIBSCBS.gTribRegular.pAliqEfetRegIBSUF := PegaValor_R('PALIQEFETREGIBSUF_UB71', SqlDS); // 5;
      IBSCBS.gIBSCBS.gTribRegular.vTribRegIBSUF := PegaValor_R('VTRIBREGIBSUF_UB72', SqlDS); // 50;
      IBSCBS.gIBSCBS.gTribRegular.pAliqEfetRegIBSMun := PegaValor_R('PALIQEFETREGIBSMUN_UB72A', SqlDS); // 5;
      IBSCBS.gIBSCBS.gTribRegular.vTribRegIBSMun := PegaValor_R('VTRIBREGIBSMUN_UB72B', SqlDS); // 50;
      IBSCBS.gIBSCBS.gTribRegular.pAliqEfetRegCBS := PegaValor_R('PALIQEFETREGCBS_UB72C', SqlDS); // 5;
      IBSCBS.gIBSCBS.gTribRegular.vTribRegCBS := PegaValor_R('VTRIBREGCBS_UB72D', SqlDS); // 50;

      // Tipo Tributação Compra Governamental
      IBSCBS.gIBSCBS.gTribCompraGov.pAliqIBSUF := PegaValor_R('PALIQIBSUF_UB82B', SqlDS); // 5;
      IBSCBS.gIBSCBS.gTribCompraGov.vTribIBSUF := PegaValor_R('VTRIBIBSUF_UB82C', SqlDS); // 50;
      IBSCBS.gIBSCBS.gTribCompraGov.pAliqIBSMun := PegaValor_R('PALIQIBSMUN_UB82D', SqlDS); // 5;
      IBSCBS.gIBSCBS.gTribCompraGov.vTribIBSMun := PegaValor_R('VTRIBIBSMUN_UB82E', SqlDS); // 50;
      IBSCBS.gIBSCBS.gTribCompraGov.pAliqCBS := PegaValor_R('PALIQCBS_UB82F', SqlDS); // 5;
      IBSCBS.gIBSCBS.gTribCompraGov.vTribCBS := PegaValor_R('VTRIBCBS_UB82G', SqlDS); // 50;

      // Informações do tributo: IBS / CBS em operações com imposto monofásico
      // PADRÃO
      IBSCBS.gIBSCBSMono.gMonoPadrao.qBCMono := PegaValor_R('QBCMONO_UB86A', SqlDS); // IBS;
      //IBSCBS.gIBSCBSMono.gMonoPadrao.qBCMono := PegaValor_R('QBCMONO_UB96A ', SqlDS); // CBS;
      IBSCBS.gIBSCBSMono.gMonoPadrao.adRemIBS := PegaValor_R('ADREMIBS_UB86B', SqlDS); // 5;
      IBSCBS.gIBSCBSMono.gMonoPadrao.adRemCBS := PegaValor_R('ADREMCBS_UB96B', SqlDS); // 5;
      IBSCBS.gIBSCBSMono.gMonoPadrao.vIBSMono := PegaValor_R('VIBSMONO_UB86C', SqlDS); // 100;
      IBSCBS.gIBSCBSMono.gMonoPadrao.vCBSMono := PegaValor_R('VCBSMONO_UB96C', SqlDS); // 100;
      // RETEN
      IBSCBS.gIBSCBSMono.gMonoReten.qBCMonoReten := PegaValor_R('QBCMONORETEN_UB87A', SqlDS); // 1;
      IBSCBS.gIBSCBSMono.gMonoReten.adRemIBSReten := PegaValor_R('ADREMIBSRETEN_UB87B', SqlDS); // 5;
      IBSCBS.gIBSCBSMono.gMonoReten.vIBSMonoReten := PegaValor_R('VIBSMONORETEN_UB87C', SqlDS); // 100;
      //IBSCBS.gIBSCBSMono.gMonoReten.adRemCBSReten := PegaValor_R('ADREMCBSRETEN_UB97B', SqlDS); // 100;
      IBSCBS.gIBSCBSMono.gMonoReten.vCBSMonoReten := PegaValor_R('VCBSMONORETEN_UB97C', SqlDS); // 100;
      // RET
      IBSCBS.gIBSCBSMono.gMonoRet.qBCMonoRet := PegaValor_R('QBCMONORET_UB95', SqlDS); // 1;
      IBSCBS.gIBSCBSMono.gMonoRet.adRemIBSRet := PegaValor_R('ADREMIBSRET_UB96', SqlDS); // 5;
      IBSCBS.gIBSCBSMono.gMonoRet.vIBSMonoRet := PegaValor_R('VIBSMONORET_UB97', SqlDS); // 100;
      IBSCBS.gIBSCBSMono.gMonoRet.adRemCBSRet := PegaValor_R('ADREMCBSRET_UB98', SqlDS); // 5;
      IBSCBS.gIBSCBSMono.gMonoRet.vCBSMonoRet := PegaValor_R('VCBSMONORET_UB98A', SqlDS); // 100;
      // BIO_DIFERENCA
      //IBSCBS.gIBSCBSMono.gMonoDif.pDifIBS := PegaValor_R('PDIFIBS_UB100', SqlDS); // 5;
      //IBSCBS.gIBSCBSMono.gMonoDif.vIBSMonoDif := PegaValor_R('VIBSMONODIF_UB101', SqlDS); // 100;
      //IBSCBS.gIBSCBSMono.gMonoDif.pDifCBS := PegaValor_R('PDIFCBS_UB102', SqlDS); // 5;
      //IBSCBS.gIBSCBSMono.gMonoDif.vCBSMonoDif := PegaValor_R('VCBSMONODIF_UB103', SqlDS); // 100;
      // TOTAIS
      IBSCBS.gIBSCBSMono.vTotIBSMonoItem := PegaValor_R('VTOTIBSMONOITEM_UB105A', SqlDS); // 100;
      IBSCBS.gIBSCBSMono.vTotCBSMonoItem := PegaValor_R('VTOTCBSMONOITEM_UB105B', SqlDS); // 100;

      // Informações da Transferencia de Crédito
      IBSCBS.gTransfCred.vIBS := PegaValor_R('VIBS_UB107', SqlDS); // 100;
      IBSCBS.gTransfCred.vCBS := PegaValor_R('VCBS_UB108', SqlDS); // 100;

      // Informações Ajuste de Competência
      IBSCBS.gAjusteCompet.competApur := PegaValor_D('COMPETAPUR_UB113', SqlDS); // Date;
      IBSCBS.gAjusteCompet.vIBS := PegaValor_R('VIBS_UB114', SqlDS); // 100;
      IBSCBS.gAjusteCompet.vCBS := PegaValor_R('VCBS_UB115', SqlDS); // 100;

      // Informações Estorno de Crédito
      IBSCBS.gEstornoCred.vIBSEstCred := PegaValor_R('VIBSESTCRED_UB117', SqlDS); // 100;
      IBSCBS.gEstornoCred.vCBSEstCred := PegaValor_R('VCBSESTCRED_UB118', SqlDS); // 100;

      // Informações do Crédito Presumido Operacional
      // IBSCBS.gCredPresOper.cCredPres := StrTocCredPres(PegaValor_S('CCREDPRES_UB122', SqlDS));
      IBSCBS.gCredPresOper.cCredPres := cpNenhum;
      IBSCBS.gCredPresOper.vBCCredPres := PegaValor_R('VBCCREDPRES_UB121', SqlDS); // 100;
      IBSCBS.gCredPresOper.gIBSCredPres.pCredPres := PegaValor_R('PCREDPRES_UB124', SqlDS); // 5;
      IBSCBS.gCredPresOper.gIBSCredPres.vCredPres := PegaValor_R('VCREDPRES_UB125', SqlDS); // 100;
      IBSCBS.gCredPresOper.gIBSCredPres.vCredPresCondSus := PegaValor_R('VCREDPRESCONDSUS_UB126', SqlDS); // 0;
      IBSCBS.gCredPresOper.gCBSCredPres.pCredPres := PegaValor_R('PCREDPRES_UB128', SqlDS); // 5;
      IBSCBS.gCredPresOper.gCBSCredPres.vCredPres := PegaValor_R('VCREDPRES_UB129', SqlDS); // 100;
      IBSCBS.gCredPresOper.gCBSCredPres.vCredPresCondSus := PegaValor_R('VCREDPRESCONDSUS_UB130', SqlDS); // 0;

      // Informações do Crédito Presumido IBS ZFM
      // tcpNenhum, tcpSemCredito, tcpBensConsumoFinal, tcpBensCapital,
      // tcpBensIntermediarios, tcpBensInformaticaOutros
      // IBSCBS.gCredPresIBSZFM.tpCredPresIBSZFM := StrToTpCredPresIBSZFM(PegaValor_S('TPCREDPRESIBSZFM_UB133', SqlDS));
      IBSCBS.gCredPresIBSZFM.tpCredPresIBSZFM := tcpNenhum;
      IBSCBS.gCredPresIBSZFM.competApur := PegaValor_D('COMPETAPUR_UB132', SqlDS); // Date;
      IBSCBS.gCredPresIBSZFM.vCredPresIBSZFM := PegaValor_R('VCREDPRESIBSZFM_UB134', SqlDS); // 100;
   End;
   SqlDS.Free;
End;
{$ENDREGION}

{$REGION 'Bloco VC - Referenciamento DFe'}
Procedure TNFeGeraXMLACBr.GeraBloco_VC;
Var
   Referenciada: TNFrefCollectionItem;
   sds: TSQLDataSet;
Begin
   sds := TSQLDataSet.Create(Nil);
   sScript := Format('SELECT * FROM NFE_REF_NFE WHERE ID_NFE = %d ', [FIdNFe]);
   PreparaDS(sScript, sds);
   If (sds.RecordCount > 0)
   Then
   Begin
      While Not sds.Eof Do
      Begin
         With FNFe.Ide.NFref.add Do
         Begin
            refNFe := PegaValor_S('REFNFE_BA02', sds);
         End;
         sds.Next;
      End;
   End;
   sds.DisposeOf;
End;
{$ENDREGION}

{$REGION 'Bloco W - Totais'}
Procedure TNFeGeraXMLACBr.GeraBloco_W;
Var
   rValorRet: Real;
   Total: TTotal;
   RegimeNormal: Boolean;
   sds: TSQLDataSet;
   NFDevolucao: Boolean;
Begin
   sds := TSQLDataSet.Create(Nil);
   sScript := 'SELECT NF.VBC_W03, NF.VICMS_W04, NF.VICMSDESON_W04A, NF.VBCST_W05, NF.VST_W06, NF.VPROD_W07, ' +
      'NF.VFRETE_W08, NF.VSEG_W09, NF.VDESC_W10, NF.VII_W11, NF.VIPI_W12, NF.VPIS_W13, NF.VCOFINS_W14, ' +
      'NF.VOUTRO_W15, NF.VNF_W16, NF.VTOTTRIB_W16A, NF.VFCPUFDEST_W04C, NF.VICMSUFDEST_W04E, NF.VICMSUFREMET_W04G, ' +
      'NF.VFCP_W04H, NF.VFCPST_W06A, NF.VFCPSTRET_W06B, NF.VIPIDEVOL_W12A, ' +
      'NF.QBCMONO_W06B1, NF.VICMSMONO_W06C, NF.QBCMONORETEN_W06C1, NF.VICMSMONORETEN_W06D, NF.QBCMONORET_W06D1, NF.VICMSMONORET_W06E, ' +
      'NF.VIS_W33, NF.VBCIBSCBS_W35, NF.VDIF_W38, NF.VDEVTRIB_W39, ' +
      'NF.VIBSUF_W41, NF.VDIF_W43, NF.VDEVTRIB_W44, NF.VIBSMUN_W46, ' +
      'NF.VIBS_W47, NF.VCREDPRES_W48, NF.VCREDPRESCONDSUS_W49, NF.VDIF_W53, NF.VDEVTRIB_W54, NF.VCBS_W56, NF.VCREDPRES_W56A, ' +
      'NF.VIBSMONO_W58, NF.VCBSMONO_W59, NF.VIBSMONORETEN_W59A, NF.VCBSMONORETEN_W59B, NF.VIBSMONORET_W59C, NF.VCBSMONORET_W59D, ' +
      'NF.VIBSESTCRED_W59F, NF.VCBSESTCRED_W59G, NF.VNFTOT_W60, ' +

      'ISS.VSERV_W18, ISS.VBC_W19, ISS.VISS_W20, ISS.VPIS_W21, ISS.VCOFINS_W22, ISS.DCOMPET_W22A, ISS.VDEDUCAO_W22B, ' +
      'ISS.VOUTRO_W22C, ISS.VDESCINCOND_W22D, ISS.VDESCCOND_W22E, ISS.VISSRET_W22F, ISS.CREGTRIB_W22G, ' +

      'RET.VRETPIS_W24, RET.VRETCOFINS_W25, ' +
      'RET.VRETCSLL_W26, RET.VBCIRRF_W27, RET.VIRRF_W28, RET.VBCRETPREV_W29, RET.VRETPREV_W30 ' +

      'FROM NFE NF  ' +
      'LEFT JOIN NFE_TOTAL_ISS ISS ON (ISS.ID_NFE = NF.ID_NFE) ' +
      'LEFT JOIN NFE_TOTAL_RETENCAO RET ON(RET.ID_NFE = NF.ID_NFE) ' +
      'WHERE NF.ID_NFE = ' + IntToStr(FIdNFe);

   PreparaDS(sScript, sds);
   RegimeNormal := (FNFe.Emit.CRT In [crtSimplesExcessoReceita, crtRegimeNormal]);

   NFDevolucao := (FNFe.Ide.finNFe = TpcnFinalidadeNFe.fnDevolucao);

   With FNFe.Total Do
   Begin
      // W02|vBC|vICMS|vICMSDeson|vFCP|vBCST|vST|vFCPST|vFCPSTRet|vProd|vFrete|vSeg|vDesc|vII|vIPI|vIPIDevol|vPIS|vCOFINS|vOutro|vNF|vTotTrib|
      If RegimeNormal
      Then
      Begin
         ICMSTot.vBC := PegaValor_R('VBC_W03', sds);
         ICMSTot.vICMS := PegaValor_R('VICMS_W04', sds);
      End
      Else
      Begin
         // MARCOS - 16/07/2024 - COFERSOL
         If (NFDevolucao) Then
         Begin
            ICMSTot.vBC := PegaValor_R('VBC_W03', sds);
            ICMSTot.vICMS := PegaValor_R('VICMS_W04', sds);
         End
         Else
         Begin
            // ICMSTot.vBC := 0;
            // ICMSTot.vICMS := 0;
            ICMSTot.vBC := PegaValor_R('VBC_W03', sds);
            ICMSTot.vICMS := PegaValor_R('VICMS_W04', sds);
         End;
      End;

      ICMSTot.vBCST := PegaValor_R('VBCST_W05', sds);
      ICMSTot.vST := PegaValor_R('VST_W06', sds);
      ICMSTot.vProd := PegaValor_R('VPROD_W07', sds);
      ICMSTot.vFrete := PegaValor_R('VFRETE_W08', sds);
      ICMSTot.vSeg := PegaValor_R('VSEG_W09', sds);
      ICMSTot.vDesc := PegaValor_R('VDESC_W10', sds);
      ICMSTot.vII := PegaValor_R('VII_W11', sds);
      ICMSTot.vIPI := PegaValor_R('VIPI_W12', sds);
      ICMSTot.vIPIDevol := PegaValor_R('VIPIDEVOL_W12A', sds);
      ICMSTot.vPIS := PegaValor_R('VPIS_W13', sds);
      ICMSTot.vCOFINS := PegaValor_R('VCOFINS_W14', sds);
      ICMSTot.vOutro := PegaValor_R('VOUTRO_W15', sds);
      ICMSTot.vNF := PegaValor_R('VNF_W16', sds);

      // INFORMAÇõES OBRIGATÓRIAS NA NFe
      ICMSTot.vTotTrib := PegaValor_R('VTOTTRIB_W16A', sds);
      ICMSTot.vFCPUFDest := PegaValor_R('VFCPUFDEST_W04C', sds);
      ICMSTot.vFCPST := PegaValor_R('VFCPST_W06A', sds);
      ICMSTot.vFCPSTRet := PegaValor_R('VFCPSTRET_W06B', sds);
      ICMSTot.qBCMono := PegaValor_R('QBCMONO_W06B1', sds);
      ICMSTot.vICMSMono := PegaValor_R('VICMSMONO_W06C', sds);
      ICMSTot.qBCMonoReten := PegaValor_R('QBCMONORETEN_W06C1', sds);
      ICMSTot.vICMSMonoReten := PegaValor_R('VICMSMONORETEN_W06D', sds);
      // ICMSTot.qBCMonoRet := 0;
      ICMSTot.qBCMonoRet := PegaValor_R('QBCMONORET_W06D1', sds);
      // ICMSTot.vICMSMonoRet := 0;
      ICMSTot.vICMSMonoRet := PegaValor_R('VICMSMONORET_W06E', sds);

      // INFORMAÇõES NÃO OBRIGATÓRIAS NA NFe
      ICMSTot.vICMSUFDest := PegaValor_R('VICMSUFDEST_W04E', sds);
      ICMSTot.vICMSUFRemet := PegaValor_R('VICMSUFREMET_W04G', sds);

      rValorRet :=
         PegaValor_R('VRETPIS_W24', sds) + PegaValor_R('VRETCOFINS_W25', sds) +
         PegaValor_R('VRETCSLL_W26', sds) + PegaValor_R('VBCIRRF_W27', sds) +
         PegaValor_R('VIRRF_W28', sds) + PegaValor_R('VBCRETPREV_W29', sds) + PegaValor_R('VRETPREV_W30', sds);
      If (rValorRet > 0.0)
      Then
      Begin
         retTrib.vRetPIS := PegaValor_R('VRETPIS_W24', sds);
         retTrib.vRetCOFINS := PegaValor_R('VRETCOFINS_W25', sds);
         retTrib.vRetCSLL := PegaValor_R('VRETCSLL_W26', sds);
         retTrib.vBCIRRF := PegaValor_R('VBCIRRF_W27', sds);
         retTrib.vIRRF := PegaValor_R('VIRRF_W28', sds);
         retTrib.vBCRetPrev := PegaValor_R('VBCRETPREV_W29', sds);
         retTrib.vRetPrev := PegaValor_R('VRETPREV_W30', sds);
      End;

      // *****************************************
      // MARCOS - 27/11/2025 - REFORMA TRIBUTÁRIA
      ISTot.vIS := PegaValor_R('VIS_W33', sds);

      IBSCBSTot.vBCIBSCBS := PegaValor_R('VBCIBSCBS_W35', sds);

      IBSCBSTot.gIBS.vIBS := PegaValor_R('VIBS_W47', sds);
      IBSCBSTot.gIBS.vCredPres := PegaValor_R('VCREDPRES_W48', sds);
      IBSCBSTot.gIBS.vCredPresCondSus := PegaValor_R('VCREDPRESCONDSUS_W49', sds);

      IBSCBSTot.gIBS.gIBSUFTot.vDif := PegaValor_R('VDIF_W38', sds);
      IBSCBSTot.gIBS.gIBSUFTot.vDevTrib := PegaValor_R('VDEVTRIB_W39', sds);
      IBSCBSTot.gIBS.gIBSUFTot.vIBSUF := PegaValor_R('VIBSUF_W41', sds);

      IBSCBSTot.gIBS.gIBSMunTot.vDif := PegaValor_R('VDIF_W43', sds);
      IBSCBSTot.gIBS.gIBSMunTot.vDevTrib := PegaValor_R('VDEVTRIB_W44', sds);
      IBSCBSTot.gIBS.gIBSMunTot.vIBSMun := PegaValor_R('VIBSMUN_W46', sds);

      IBSCBSTot.gCBS.vDif := PegaValor_R('VDIF_W53', sds);
      IBSCBSTot.gCBS.vDevTrib := PegaValor_R('VDEVTRIB_W54', sds);
      IBSCBSTot.gCBS.vCBS := PegaValor_R('VCBS_W56', sds);
      IBSCBSTot.gCBS.vCredPres := PegaValor_R('VCREDPRES_W56A', sds);
      // IBSCBSTot.gCBS.vCredPresCondSus := PegaValor_R('', sds);

      IBSCBSTot.gMono.vIBSMono := PegaValor_R('VIBSMONO_W58', sds);
      IBSCBSTot.gMono.vCBSMono := PegaValor_R('VCBSMONO_W59', sds);
      IBSCBSTot.gMono.vIBSMonoReten := PegaValor_R('VIBSMONORETEN_W59A', sds);
      IBSCBSTot.gMono.vCBSMonoReten := PegaValor_R('VCBSMONORETEN_W59B', sds);
      IBSCBSTot.gMono.vIBSMonoRet := PegaValor_R('VIBSMONORET_W59C', sds);
      IBSCBSTot.gMono.vCBSMonoRet := PegaValor_R('VCBSMONORET_W59D', sds);

      IBSCBSTot.gEstornoCred.vIBSEstCred := PegaValor_R('VIBSESTCRED_W59F', sds);
      IBSCBSTot.gEstornoCred.vCBSEstCred := PegaValor_R('VCBSESTCRED_W59G', sds);

      // Valor total da NF-e com IBS / CBS / IS
      vNFTot := PegaValor_R('VNFTOT_W60', sds);
      // *****************************************

      // MARCOS - 19/03/2024 - INFORMAÇÃO DO IRRF
      FValorBCIRRF := PegaValor_R('VBCIRRF_W27', sds);
      FValorIRRF := PegaValor_R('VIRRF_W28', sds);
   End;

   {
     rValorISS := PegaValor_R('VSERV_W18', sds);
     If (rValorISS > 0.0)
     Then
     Begin
     // W17|vServ|vBC|vISS|vPIS|vCOFINS|dCompet|vDeducao|vOutro|vDescIncond|vDescCond|vISSRet|cRegTrib|
     PegaValor_R('VSERV_W18', sds);
     PegaValor_R('VBC_W19', sds);
     PegaValor_R('VISS_W20', sds);
     PegaValor_R('VPIS_W21', sds);
     PegaValor_R('VCOFINS_W22', sds);
     PegaValor_R('DCOMPET_W22A', sds);
     PegaValor_R('VDEDUCAO_W22B', sds);
     PegaValor_R('VOUTRO_W22C', sds);
     PegaValor_R('VDESCINCOND_W22D', sds);
     PegaValor_R('VDESCCOND_W22E', sds);
     PegaValor_R('VISSRET_W22F', sds);
     PegaValor_R('CREGTRIB_W22G', sds);
     End;
 }
End;
{$ENDREGION}

{$REGION 'Bloco X..X33 - Transportador '}
Procedure TNFeGeraXMLACBr.GeraBloco_X;
Var
   rValorRet: Real;
   sds: TSQLDataSet;
   Documento: String;
Begin
   sds := TSQLDataSet.Create(Nil);
   sScript := 'SELECT NF.MODFRETE_X02, TRA.CNPJ_X04, TRA.CPF_X05, TRA.XNOME_X06, TRA.IE_X07, TRA.XENDER_X08, ' +
      'TRA.XMUN_X09, TRA.UF_X10, ICM.VSERV_X12, ICM.VBCRET_X13, ICM.PICMSRET_X14, ICM.VICMSRET_X15, ICM.CFOP_X16,  ' +
      'ICM.CMUNFG_X17, VEI.PLACA_X19, VEI.UF_X20, VEI.RNTC_X21 FROM NFE NF LEFT JOIN NFE_TRANSPORTADOR TRA ON  ' +
      '(TRA.ID_NFE = NF.ID_NFE)LEFT JOIN NFE_TRANS_ICMS ICM ON(ICM.ID_NFE = NF.ID_NFE)LEFT  ' +
      'JOIN NFE_TRANS_VEICULO VEI ON (VEI.ID_NFE = NF.ID_NFE)WHERE NF.ID_NFE = ' + IntToStr(FIdNFe);
   PreparaDS(sScript, sds);

   // MARCOS - 10/03/2025 - OMITE DOCUMENTO PREENCHIDO COM ZEROS '00000000000NNN'
   Documento := PegaValor_S('CNPJ_X04', sds);
   If (Documento = '00000000000000') Then
   Begin
      Documento := PegaValor_S('CPF_X05', sds);
   End;

   // FRETE
   With FNFe.Transp Do
   Begin
      // MODALIDADE
      // X|modFrete|vagao|balsa|
      // X03|xNome|IE|xEnder|xMun|UF|
      // X04|CNPJ|
      // X05|CPF|
      modFrete := StrTomodFrete(Ok, PegaValor_S('MODFRETE_X02', sds));
      // Transporta.CNPJCPF := PegaValor_S('CNPJ_X04', sds) + PegaValor_S('CPF_X05', sds);
      Transporta.CNPJCPF := Documento;
      Transporta.xNome := PegaValor_S('XNOME_X06', sds);
      Transporta.IE := PegaValor_S('IE_X07', sds);
      Transporta.xEnder := PegaValor_S('XENDER_X08', sds);
      Transporta.xMun := PegaValor_S('XMUN_X09', sds);
      Transporta.UF := PegaValor_S('UF_X10', sds);

      // ICMS
      rValorRet := PegaValor_R('VSERV_X12', sds);
      If (rValorRet > 0.0)
      Then
      Begin
         // X11|vServ|vBCRet|pICMSRet|vICMSRet|CFOP|cMunFG|
         retTransp.vServ := PegaValor_R('VSERV_X12', sds);
         retTransp.vBCRet := PegaValor_R('VBCRET_X13', sds);
         retTransp.pICMSRet := PegaValor_R('PICMSRET_X14', sds);
         retTransp.vICMSRet := PegaValor_R('VICMSRET_X15', sds);
         retTransp.CFOP := PegaValor_S('CFOP_X16', sds);
         retTransp.cMunFG := PegaValor_I('CMUNFG_X17', sds);
      End;

      // VEICULO
      veicTransp.placa := PegaValor_S('PLACA_X19', sds);
      veicTransp.UF := PegaValor_S('UF_X20', sds);
      veicTransp.RNTC := PegaValor_S('RNTC_X21', sds);

      // REBOQUES
      GeraBloco_X22;

      // VOLUMES
      GeraBloco_X26;

      // LACRES
      // MARCOS - 08/07/2024 - INCLUÍDA CHAMADA NO MÉTODO "GeraBloco_X26"
      // GeraBloco_X33(....);
   End;
   sds.DisposeOf;
End;

Procedure TNFeGeraXMLACBr.GeraBloco_X22;
Var
   sds: TSQLDataSet;
Begin
   sds := TSQLDataSet.Create(Nil);
   sScript := 'SELECT * FROM NFE_REBOQUE WHERE ID_NFE = ' + IntToStr(FIdNFe);
   PreparaDS(sScript, sds);
   While Not sds.Eof Do
   Begin
      With FNFe.Transp.Reboque.new Do
      Begin
         // X22|placa|UF|RNTC|
         placa := PegaValor_S('PLACA_X23', sds);
         UF := PegaValor_S('UF_X24', sds);
         RNTC := PegaValor_S('RNTC_X25', sds);
      End;
      sds.Next;
   End;
   sds.DisposeOf;
End;

Procedure TNFeGeraXMLACBr.GeraBloco_X26;
Var
   IVolume: Integer;
   Volume: TVolCollectionItem;
   sds: TSQLDataSet;
Begin
   sds := TSQLDataSet.Create(Nil);
   sScript := 'SELECT * FROM NFE_VOLUME WHERE ID_NFE = ' + IntToStr(FIdNFe);
   PreparaDS(sScript, sds);

   // VOLUMES
   (*
     While Not sds.Eof Do
     Begin
     With FNFe.Transp.Vol.new Do
     Begin
     Begin
     // X26|qVol|esp|marca|nVol|pesoL|pesoB|
     Volume.qVol := PegaValor_I('QVOL_X27', sds);
     Volume.esp := PegaValor_S('ESP_X28', sds);
     Volume.marca := PegaValor_S('MARCA_X29', sds);
     Volume.nVol := PegaValor_S('NVOL_X30', sds);
     Volume.pesoL := PegaValor_R('PELOL_X31', sds);
     Volume.pesoB := PegaValor_R('PELOB_X32', sds);
     End;

     // LACRES
     IVolume := PegaValor_I('ID_VOLUME', sds);
     GeraBloco_X33(IVolume);
     sds.Next;
     End;
     sds.DisposeOf;
     End;
 *)

   // MARCOS - 08/07/2024 - LANÇA APENAS UMA INFORMAÇÃO SOBRE VOLUME (CONF EXEMPLO ACBR)
   If Not sds.IsEmpty Then
   Begin
      // X26|qVol|esp|marca|nVol|pesoL|pesoB|
      Volume := FNFe.Transp.Vol.new;
      Volume.qVol := PegaValor_I('QVOL_X27', sds);
      Volume.esp := PegaValor_S('ESP_X28', sds);
      Volume.marca := PegaValor_S('MARCA_X29', sds);
      Volume.nVol := PegaValor_S('NVOL_X30', sds);
      Volume.pesoL := PegaValor_R('PELOL_X31', sds);
      Volume.pesoB := PegaValor_R('PELOB_X32', sds);

      // MARCOS - 08/07/2024 - DESABILITADA INFORMAÇÕES SOBRE LACRES
      IVolume := PegaValor_I('ID_VOLUME', sds);
      GeraBloco_X33(IVolume, Volume);
   End;
   sds.Free;
End;

Procedure TNFeGeraXMLACBr.GeraBloco_X33(IdVolume: Integer; Volume: TVolCollectionItem);
Var
   sds: TSQLDataSet;
   Lacre: TLacresCollectionItem;
Begin
   sds := TSQLDataSet.Create(Nil);
   sScript := Format('SELECT NLACRE_X34 FROM NFE_LACRES WHERE ID_NFE = %d AND ID_VOLUME = %d ', [FIdNFe, IdVolume]);
   PreparaDS(sScript, sds);
   If (Not sds.IsEmpty)
   Then
   Begin
      While Not sds.Eof Do
      Begin
         Lacre := Volume.Lacres.add;
         Lacre.nLacre := PegaValor_S('NLACRE_X34', sds);
         sds.Next;
      End;
   End;
   sds.DisposeOf;
End;

Procedure TNFeGeraXMLACBr.GeraBloco_X33(Volume: Integer);
Var
   sds: TSQLDataSet;
Begin
   sds := TSQLDataSet.Create(Nil);
   sScript := Format('SELECT NLACRE_X34 FROM NFE_LACRES WHERE ID_NFE = %d AND ID_VOLUME = %d ', [FIdNFe, Volume]);
   PreparaDS(sScript, sds);
   While Not sds.Eof Do
   Begin
      With FNFe.Transp.Vol.add.Lacres.new Do
      Begin
         // X33|nLacre|
         nLacre := PegaValor_S('NLACRE_X34', sds);
      End;
      sds.Next;
   End;
   sds.DisposeOf;
End;
{$ENDREGION}

{$REGION 'Bloco Y..YA - Financeiro'}
Procedure TNFeGeraXMLACBr.GeraBloco_Y;
Var
   sds: TSQLDataSet;
Begin
   sds := TSQLDataSet.Create(Nil);
   sScript := 'SELECT NFAT_Y03, VORIG_Y04, VDESC_Y05, VLIQ_Y06 FROM NFE_COBRANCA WHERE ID_NFE = ' + IntToStr(FIdNFe);
   PreparaDS(sScript, sds);

   If (sds.IsEmpty) Then
   Begin
      Exit;
   End;

   // COBRANCA
   With FNFe.Cobr Do
   Begin
      // Y|
      // Y02|nFat|vOrig|vDesc|vLiq|
      Fat.nFat := PegaValor_S('NFAT_Y03', sds);
      Fat.vOrig := PegaValor_R('VORIG_Y04', sds);
      Fat.vDesc := PegaValor_R('VDESC_Y05', sds);
      Fat.vLiq := PegaValor_R('VLIQ_Y06', sds);
   End;

   // DUPLICATA
   // GeraBloco_Y07;

   sds.DisposeOf;
End;

Procedure TNFeGeraXMLACBr.GeraBloco_Y07;
Var
   sds: TSQLDataSet;
Begin
   sScript := 'SELECT NDUP_Y08, DVENC_Y09, VDUP_Y10 FROM NFE_DUPLICATAS  WHERE ID_NFE = ' + IntToStr(FIdNFe);
   sds := TSQLDataSet.Create(Nil);
   PreparaDS(sScript, sds);

   // DUPLICATA
   While NOT sds.Eof Do
   Begin
      With FNFe.Cobr.Dup.new Do
      Begin
         // Y07|nDup|dVenc|vDup|
         nDup := PegaValor_S('NDUP_Y08', sds);
         dVenc := PegaValor_D('DVENC_Y09', sds);
         vDup := PegaValor_R('VDUP_Y10', sds);
      End;
      sds.Next;
   End;
   sds.DisposeOf;
End;

Procedure TNFeGeraXMLACBr.GeraBloco_YA;
Var
   sFinalidade: String;
   sds: TSQLDataSet;
Begin
   sds := TSQLDataSet.Create(Nil);
   sFinalidade := DMNFe.PegaFinalidadeNFe(FIdNFe);

   // VENDA OU COMPLEMENTO
   If ((sFinalidade = '1') Or (sFinalidade = '2'))
   Then
   Begin
      sScript :=
         'SELECT TPAG_YA02, XPAG_YA02A, VPAG_YA03, INDPAG_YA01B, TPINTEGRA_YA04A, CNPJ_YA05, TBAND_YA06, CAUT_YA07, VTROCO_YA08 ' +
         'FROM NFE_PAGAMENTO ' +
         'WHERE ID_NFE = ' + IntToStr(FIdNFe);
      PreparaDS(sScript, sds);

      // MARCOS - 23/10/2024 - RECRIA MEIO DE PAGAMENTO
      If (sds.IsEmpty) Then
      Begin
         DMNFe.GeraPagamento(FIdNFe);
         PreparaDS(sScript, sds);
      End;

      While NOT sds.Eof Do
      Begin
         With FNFe.pag.new Do
         Begin
            // YA|tPag|vPag|indPag|
            tPag := StrToFormaPagamento(Ok, PegaValor_S('TPAG_YA02', sds));
            vPag := PegaValor_R('VPAG_YA03', sds);
            indPag := StrToIndpag(Ok, PegaValor_S('INDPAG_YA01B', sds));
            xPag := PegaValor_S('XPAG_YA02A', sds);

            // YA04|tpIntegra|CNPJ|tBand|cAut|
            tpIntegra := StrTotpIntegra(PegaValor_S('TPINTEGRA_YA04A', sds));
            CNPJ := PegaValor_S('CNPJ_YA05', sds);
            tBand := StrToBandeiraCartao(Ok, PegaValor_S('TBAND_YA06', sds));
            cAut := PegaValor_S('CAUT_YA07', sds);
         End;
         sds.Next;
      End;
   End
   Else
   Begin
      If (sFinalidade = '4')
      Then
      Begin
         With FNFe.pag.new Do
         Begin
            // YA|tPag|vPag|indPag|
            tPag := TpcnFormaPagamento.fpSemPagamento;
         End;

      End;
   End;
   sds.DisposeOf;
End;
{$ENDREGION}

{$REGION 'Bloco Z..Z07 - Informações adicionais'}
Procedure TNFeGeraXMLACBr.GeraBloco_Z;
Var
   sMotorista, sIBPT, sInformacao, sMsgSimples, sMsgPartilhaSimples, sMsgICMSMonofasico: String;
   bMostraMensagemSimples: Boolean;
   sInformacaoDocumentos: String;
   sds: TSQLDataSet;
Begin
   sMsgSimples := '';
   sMsgPartilhaSimples := '';
   sMotorista := '';
   bMostraMensagemSimples := False;

   sds := TSQLDataSet.Create(Nil);
   sScript := 'SELECT FINNFE_B25, TPNF_B11, INFADFISCO_Z02, INFCPL_Z03 FROM NFE WHERE ID_NFE = ' + IntToStr(FIdNFe);
   PreparaDS(sScript, sds);

   sInformacao := '';
   sMsgICMSMonofasico := '';
   IF (InformarICMSMonofasico = True)
   Then
   Begin
      sMsgICMSMonofasico := ', ICMS monofásico sobre combustíveis cobrado anteriormente conforme Convênio ICMS 199/2022';
   End;
   sInformacaoDocumentos := PegaValor_S('INFCPL_Z03', sds);
   sInformacaoDocumentos := TFuncoes.RemoverCharControle(sInformacaoDocumentos);
   sInformacaoDocumentos := Copy(sInformacaoDocumentos, 1, 4000);

   // INFORMAÇÕES (SIMPLES)
   sMsgSimples := DMNFe.InformacaoSIMPLES(FIdNFe);
   sInformacao := sInformacao + ' ' + sMsgSimples;
   If (DMNFe.TemPartilhaICMS(FIdNFe))
   Then
   Begin
      sMsgPartilhaSimples := MensagemPartilhaSimples;
      sInformacao := sInformacao + ' ' + sMsgPartilhaSimples;
   End;

   // INFORMACAO TRIBUTOS
   sIBPT := Trim(DMNFe.InformacaoTributos(FIdNFe));
   If (sIBPT <> '') AND (NFPerda = False)
   Then
   Begin
      sInformacao := sInformacao + ' ' + sIBPT;
   End;

   // INFORMACAO MOTORISTA
   sMotorista := Trim(DMNFe.InformacaoMotorista(FIdNFe));
   If (sMotorista <> '')
   Then
   Begin
      sInformacao := sInformacao + ' ' + sMotorista;
   End;

   If (FValorIRRF <> 0)
   Then
   Begin
      sInformacao := sInformacao + ' ' + MensagemIRRF(FValorIRRF, FValorBCIRRF);
   End;

   sInformacao := sInformacaoDocumentos + ' ' + sInformacao + sMsgICMSMonofasico;
   sInformacao := Copy(sInformacao, 1, 5000);

   sInformacaoDocumentos := PegaValor_S('INFADFISCO_Z02', sds);
   sInformacaoDocumentos := TFuncoes.RemoverCharControle(sInformacaoDocumentos);
   sInformacaoDocumentos := Copy(sInformacaoDocumentos, 1, 2000);

   With FNFe Do
   Begin
      infIntermed.CNPJ := '';
      infIntermed.idCadIntTran := '';
      InfAdic.infCpl := sInformacao;
      InfAdic.infAdFisco := sInformacaoDocumentos;
   End;
   sds.DisposeOf;

   // INFO CONTRIBUINTE
   GeraBloco_Z04;

   // INFO FISCO
   GeraBloco_Z07;
End;

Procedure TNFeGeraXMLACBr.GeraBloco_Z04;
Var
   sds: TSQLDataSet;
Begin
   sds := TSQLDataSet.Create(Nil);
   sScript := 'SELECT XCAMPO_Z05, XTEXTO_Z06 FROM NFE_INFO_ADIC_CONTR WHERE ID_NFE = ' + IntToStr(FIdNFe);
   PreparaDS(sScript, sds);

   While NOT sds.Eof Do
   Begin
      // Z04|xCampo|xTexto|
      With FNFe.InfAdic.obsCont.new Do
      Begin
         xCampo := PegaValor_S('XCAMPO_Z05', sds);
         xTexto := PegaValor_S('XTEXTO_Z06', sds);
      End;
      sds.Next;
   End;
   sds.DisposeOf;
End;

Procedure TNFeGeraXMLACBr.GeraBloco_Z07;
Var
   sds: TSQLDataSet;
   Campo, Texto: String;
Begin
   sds := TSQLDataSet.Create(Nil);
   sScript := 'SELECT XCAMPO_Z08, XTEXTO_Z09 FROM NFE_INFO_ADIC_FISCO WHERE ID_NFE = ' + IntToStr(FIdNFe);
   PreparaDS(sScript, sds);

   While NOT sds.Eof Do
   Begin
      Campo := Trim(PegaValor_S('XCAMPO_Z08', sds));
      Texto := Trim(PegaValor_S('XTEXTO_Z09', sds));
      If ((Campo <> '') And (Texto <> '')) Then
      Begin
         With FNFe.InfAdic.obsFisco.new Do
         Begin
            // Z07|xCampo|xTexto|
            xCampo := Campo;;
            xTexto := Texto;
         End;
      End;
      sds.Next;
   End;
   sds.DisposeOf;
End;
{$ENDREGION}

End.
