Unit NFe.Mapper;

Interface

Uses
   System.SysUtils, Data.DB, NFe.DTO, NFe.ICMS.JsonBuilder,
   FireDAC.Comp.Client, NFe.Scripts;

Type
   TNFeMapper = Class
   Private
      FConnection: TFDConnection;
      Class Function ExecutarQuery(AConnection: TFDConnection; Const ASQL: String): TFDQuery;
      Class Function ExisteNFe(AConnection: TFDConnection; Const AIdNFe: Integer): Boolean; Static;

      Class Function S(ADataSet: TDataSet; Const ACampo: String): String; Static;
      Class Function I(ADataSet: TDataSet; Const ACampo: String): Integer; Static;
      Class Function D(ADataSet: TDataSet; Const ACampo: String): Double; Static;
      Class Function B(ADataSet: TDataSet; Const ACampo: String): Boolean; Static;
      Class Function DataHoraISO8601(ADataSet: TDataSet; Const ACampo: String): String; Static;
      Class Function DataISO8601(ADataSet: TDataSet; Const ACampo: String): String; Static;
      //
      Class Procedure MapearCabecalho(AConnection: TFDConnection; AIdNFe: Integer; ADTO: TNFeDTO); Static;
      Class Procedure MapearIdentificacao(AConnection: TFDConnection; AIdNFe: Integer; ADTO: TNFeDTO); Static;
      Class Procedure MapearEmitente(AConnection: TFDConnection; AIdNFe: Integer; ADTO: TNFeDTO); Static;
      Class Procedure MapearDestinatario(AConnection: TFDConnection; AIdNFe: Integer; ADTO: TNFeDTO); Static;
      Class Procedure MapearItens(AConnection: TFDConnection; AIdNFe: Integer; ADTO: TNFeDTO); Static;
      Class Procedure MapearItem(ADataSet: TDataSet; ADTO: TNFeItemDTO); Static;
      //
      Class Procedure MapearICMS(ADataSet: TDataSet; ADTO: TNFeICMSDTO); Static;
      Class Procedure MapearPIS(ADataSet: TDataSet; ADTO: TNFePISDTO); Static;
      Class Procedure MapearCOFINS(ADataSet: TDataSet; ADTO: TNFeCOFINSDTO); Static;
      Class Procedure MapearISSQN(ADataSet: TDataSet; ADTO: TNFeISSQNDTO); Static;
      //
      Class Procedure MapearInfoNFe(AConnection: TFDConnection; AIdNFe: Integer; ADTO: TNFeDTO); Static;
      Class Procedure MapearTotal(AConnection: TFDConnection; AIdNFe: Integer; ADTO: TNFeDTO); Static;
      Class Procedure MapearTotalIBSCBS(AConnection: TFDConnection; AIdNFe: Integer; ADTO: TNFeDTO); Static;
      //
      Class Procedure MapearTransporte(AConnection: TFDConnection; AIdNFe: Integer; ADTO: TNFeDTO); Static;
      Class Function MapearVolume(ADataSet: TDataSet): TNFeVolumeDTO; Static;
      Class Function MapearLacre(ADataSet: TDataSet): TNFeLacreDTO; Static;
      Class Function MapearReboque(ADataSet: TDataSet): TNFeVeicTranspDTO; Static;

      { ATENÇÃO }
      Class Function MapearObsFisco(ADataSet: TDataSet): TNFeObsFiscoDTO; Static;

      { ATUALIZAR } Class Procedure MapearInfoAdicional(AConnection: TFDConnection; AIdNFe: Integer; ADTO: TNFeDTO); Static;
      { UTILIZAR } Class Procedure MapearCompraGov(AConnection: TFDConnection; AIdNFe: Integer; ADTO: TNFeDTO); Static;

      { IMPLEMENTAR } Class Procedure MapearReferenciados(ADataSet: TDataSet; ADTO: TNFeDTO); Static;
      { IMPLEMENTAR } Class Function MapearObsCont(ADataSet: TDataSet): TNFeObsContDTO; Static;
      { IMPLEMENTAR } Class Function MapearProcRef(ADataSet: TDataSet): TNFeProcRefDTO; Static;
      { IMPLEMENTAR } Class Function MapearPagamentoAntecipado(ADataSet: TDataSet): TNFePagamentoAntecipadoDTO; Static;
      { IMPLEMENTAR } Class Function MapearRefDFeAnt(ADataSet: TDataSet): String; Static;
      { IMPLEMENTAR } Class Function MapearRefNFeAntecipada(ADataSet: TDataSet): String; Static;
      // *****************

      { IBS/CBS }
      Class Procedure MapearISIBSCBS(ADataSet: TDataSet; ADTO: TNFeIBSCBSDTO); Static;
      Class Procedure MapearIS(ADataSet: TDataSet; ADTO: TNFeISDTO); Static;
      Class Procedure MapearIBSCBS(ADataSet: TDataSet; ADTO: TNFeIBSCBSDTO); Static;
      { IBS/CBS - Trib Regular }
      Class Function MapearIBSCBSGTribRegular(ADataSet: TDataSet): TNFeTribRegularDTO;
      { IBS/CBS - Compra Gov }
      Class Function MapearIBSCBSTribCompraGov(ADataSet: TDataSet): TNFeTribCompraGov;

      { IBS-UF-Dif, DevTrib, Red }
      Class Function MapearGIBSUF(ADataSet: TDataSet): TNFeIBSUFDTO;
      { IBS-MunDif, DevTrib, Red }
      Class Function MapearGIBSMun(ADataSet: TDataSet): TNFeIBSMunDTO;
      { CBS-Dif, DevTrib, Red }
      Class Function MapearGCBS(ADataSet: TDataSet): TNFeCBSDTO;
      { CBS-ALCZFMCBS }
      Class Function MapearGCBSGALCZFMCBS(ADataSet: TDataSet): TNFeALCZFMCBS;

      { IBS / CBS - Mono }
      Class Function MapearGIBSCBSMono(ADataSet: TDataSet): TNFeIBSCBSMonoDTO;
      { IBS-MonoAdRem }
      Class Function MapearGIBSMonoAdRemPadrao(ADataSet: TDataSet): TNFeIBSMonoAdRemPadraoDTO;
      Class Function MapearGIBSMonoAdRemReten(ADataSet: TDataSet): TNFeIBSMonoAdRemRetenDTO;
      Class Function MapearGIBSMonoAdRemRet(ADataSet: TDataSet): TNFeIBSMonoAdRemRetDTO;
      Class Function MapearGIBSMonoAdRemBioDiferenca(ADataSet: TDataSet): TNFeIBSMonoAdRemBioDiferencaDTO;
      Class Function MapearGIBSMonoAdRem(ADataSet: TDataSet): TNFeIBSMonoAdRemDTO;
      { IBS-MonoAdValorem }
      Class Function MapearGIBSMonoAdValoremPadrao(ADataSet: TDataSet): TNFeIBSMonoAdValoremPadraoDTO;
      Class Function MapearGIBSMonoAdValoremReten(ADataSet: TDataSet): TNFeIBSMonoAdValoremRetenDTO;
      Class Function MapearGIBSMonoAdValoremRet(ADataSet: TDataSet): TNFeIBSMonoAdValoremRetDTO;
      Class Function MapearGIBSMonoAdValoremBioDiferenca(ADataSet: TDataSet): TNFeIBSMonoAdValoremBioDiferencaDTO;
      { CBS-MonoAdRem }
      Class Function MapearGCBSMonoAdRemPadrao(ADataSet: TDataSet): TNFeCBSMonoAdRemPadraoDTO;
      Class Function MapearGCBSMonoAdRemReten(ADataSet: TDataSet): TNFeCBSMonoAdRemRetenDTO;
      Class Function MapearGCBSMonoAdRemRet(ADataSet: TDataSet): TNFeCBSMonoAdRemRetDTO;
      Class Function MapearGCBSMonoAdRemBioDiferenca(ADataSet: TDataSet): TNFeCBSMonoAdRemBioDiferencaDTO;
      { CBS-MonoAdValorem }
      Class Function MapearGCBSMonoAdValoremPadrao(ADataSet: TDataSet): TNFeCBSMonoAdValoremPadraoDTO;
      Class Function MapearGCBSMonoAdValoremReten(ADataSet: TDataSet): TNFeCBSMonoAdValoremRetenDTO;
      Class Function MapearGCBSMonoAdValoremRet(ADataSet: TDataSet): TNFeCBSMonoAdValoremRetDTO;
      Class Function MapearGCBSMonoAdValoremBioDiferenca(ADataSet: TDataSet): TNFeCBSMonoAdValoremBioDiferencaDTO;

      { Ajustes/Transf/CredPres }
      Class Procedure MapearTransfCred(ADataSet: TDataSet; ADTO: TNFeTransfCredDTO);
      Class Procedure MapearAjusteCompet(ADataSet: TDataSet; ADTO: TNFeAjusteCompetDTO);
      Class Procedure MapearEstornoCred(ADataSet: TDataSet; ADTO: TNFeEstornoCredDTO);
      Class Procedure MapearCredPresOper(ADataSet: TDataSet; ADTO: TNFeCredPresOperDTO);
      Class Procedure MapearIBSCredPres(ADataSet: TDataSet; ADTO: TNFeIBSCredPresDTO);
      Class Procedure MapearCBSCredPres(ADataSet: TDataSet; ADTO: TNFeCBSCredPresDTO);
      Class Procedure MapearCredPresIBSZFM(ADataSet: TDataSet; ADTO: TNFeCredPresIBSZFMDTO);
   Public
      Class Procedure Mapear(AConnection: TFDConnection; AIdNFe: Integer; ADTO: TNFeDTO);

   End;

Implementation

uses
  MZ.Biblioteca;

{ TNFeMapper }

{$REGION 'Conversão de tipos'}


Class Function TNFeMapper.S(ADataSet: TDataSet; Const ACampo: String): String;
Begin
   Result := '';

   If Not Assigned(ADataSet) Then
      Exit;

   If Not Assigned(ADataSet.FindField(ACampo)) Then
      Exit;

   If Not ADataSet.FieldByName(ACampo).IsNull Then
      Result := ADataSet.FieldByName(ACampo).AsString;
End;

Class Function TNFeMapper.I(ADataSet: TDataSet; Const ACampo: String): Integer;
Begin
   Result := 0;

   If Not Assigned(ADataSet) Then
      Exit;

   If Not Assigned(ADataSet.FindField(ACampo)) Then
      Exit;

   If Not ADataSet.FieldByName(ACampo).IsNull Then
      Result := ADataSet.FieldByName(ACampo).AsInteger;
End;

Class Function TNFeMapper.D(ADataSet: TDataSet; Const ACampo: String): Double;
Begin
   Result := 0;

   If Not Assigned(ADataSet) Then
      Exit;

   If Not Assigned(ADataSet.FindField(ACampo)) Then
      Exit;

   If Not ADataSet.FieldByName(ACampo).IsNull Then
      Result := ADataSet.FieldByName(ACampo).AsFloat;
End;

Class Function TNFeMapper.DataHoraISO8601(ADataSet: TDataSet; Const ACampo: String): String;
Var
   V: TDateTime;
Begin
   If ADataSet.FieldByName(ACampo).IsNull Then
      Exit('');

   V := ADataSet.FieldByName(ACampo).AsDateTime;

   Result := FormatDateTime(
      'yyyy"-"mm"-"dd"T"hh":"nn":"ss"-03:00',
      V
      );
End;

Class Function TNFeMapper.DataISO8601(ADataSet: TDataSet; Const ACampo: String): String;
Var
   V: TDateTime;
Begin
   If ADataSet.FieldByName(ACampo).IsNull Then
      Exit('');

   V := ADataSet.FieldByName(ACampo).AsDateTime;

   Result := FormatDateTime('yyyy"-"mm"-"dd"', V);
End;

Class Function TNFeMapper.B(ADataSet: TDataSet; Const ACampo: String): Boolean;
Begin
   Result := False;

   If Not Assigned(ADataSet) Then
      Exit;

   If Not Assigned(ADataSet.FindField(ACampo)) Then
      Exit;

   If Not ADataSet.FieldByName(ACampo).IsNull Then
      Result := ADataSet.FieldByName(ACampo).AsBoolean;
End;
{$ENDREGION}

{$REGION 'Mapeamento principal'}


Class Procedure TNFeMapper.Mapear(AConnection: TFDConnection; AIdNFe: Integer; ADTO: TNFeDTO);
Begin
   // TESTAR SE EXISTE NFe
   IF (NOT ExisteNFe(AConnection, AIdNFe))
   Then
      Raise Exception.Create('NFe não localizada');

   Try
      MapearCabecalho(AConnection, AIdNFe, ADTO);
      MapearItens(AConnection, AIdNFe, ADTO);
      MapearInfoNFe(AConnection, AIdNFe, ADTO);
   Except
      Raise;
   End;
End;
{$ENDREGION}

{$REGION 'Mapeamentos das tags'}


Class Function TNFeMapper.ExecutarQuery(AConnection: TFDConnection; Const ASQL: String): TFDQuery;
Begin
   Result := TFDQuery.Create(Nil);
   Result.Connection := AConnection;
   Result.SQL.Text := ASQL;
   Result.Open;
End;

Class Function TNFeMapper.ExisteNFe(AConnection: TFDConnection; Const AIdNFe: Integer): Boolean;
Var
   LQuery: TFDQuery;
   Script: String;
Begin
   Script := Format('SELECT ID_NFE, NNF_B08 FROM NFE WHERE NNF_B08 = %d', [AIdNFe]);
   LQuery := TFDQuery.Create(Nil);
   LQuery := ExecutarQuery(AConnection, Script);
   Result := LQuery.Fields[0].AsInteger > 0;
End;

Class Procedure TNFeMapper.MapearCabecalho(AConnection: TFDConnection; AIdNFe: Integer; ADTO: TNFeDTO);
Begin
   MapearIdentificacao(AConnection, AIdNFe, ADTO);
   MapearEmitente(AConnection, AIdNFe, ADTO);
   MapearDestinatario(AConnection, AIdNFe, ADTO);
   MapearTotal(AConnection, AIdNFe, ADTO);
   MapearTotalIBSCBS(AConnection, AIdNFe, ADTO);
End;

Class Procedure TNFeMapper.MapearInfoNFe(AConnection: TFDConnection; AIdNFe: Integer; ADTO: TNFeDTO);
Begin
   MapearTotal(AConnection, AIdNFe, ADTO);
   MapearTransporte(AConnection, AIdNFe, ADTO);
   MapearInfoAdicional(AConnection, AIdNFe, ADTO);
   // MapearVolume(AConnection, AIdNFe, Integer, ADTO);
   // MapearLacre(AConnection, AIdNFe, Integer, ADTO);
End;

Class Procedure TNFeMapper.MapearIdentificacao(AConnection: TFDConnection; AIdNFe: Integer; ADTO: TNFeDTO);
Var
   LQuery: TFDQuery;
Begin
   LQuery := TFDQuery.Create(Nil);
   LQuery := ExecutarQuery(AConnection, TNFeScript.ScriptCabecalho(AIdNFe));
   If LQuery.IsEmpty Then
      Exit;

   Try
      ADTO.Ide.cUF := I(LQuery, 'CUF_B02');
      ADTO.Ide.cNF := S(LQuery, 'CNF_B03');
      ADTO.Ide.natOp := S(LQuery, 'NATOP_B04');
      ADTO.Ide.mod_ := I(LQuery, 'MOD_B06');
      ADTO.Ide.serie := I(LQuery, 'SERIE_B07');
      ADTO.Ide.nNF := I(LQuery, 'NNF_B08');
      ADTO.Ide.dhEmi := DataHoraISO8601(LQuery, 'DHEMI_B09');
      ADTO.Ide.dhSaiEnt := DataHoraISO8601(LQuery, 'DHSAIENT_B10');
      ADTO.Ide.tpNF := I(LQuery, 'TPNF_B11');
      ADTO.Ide.idDest := I(LQuery, 'IDDEST_B11A');
      ADTO.Ide.cMunFG := I(LQuery, 'CMUNFG_B12');
      ADTO.Ide.tpImp := I(LQuery, 'TPIMP_B21');
      ADTO.Ide.tpEmis := I(LQuery, 'TPEMIS_B22');
      ADTO.Ide.cDV := I(LQuery, 'CDV_B23');
      ADTO.Ide.tpAmb := I(LQuery, 'TPAMB_B24');
      ADTO.Ide.finNFe := I(LQuery, 'FINNFE_B25');
      ADTO.Ide.indFinal := I(LQuery, 'INDFINAL_B25A');
      ADTO.Ide.indPres := I(LQuery, 'INDPRES_B25B');
      ADTO.Ide.indIntermed := I(LQuery, 'INDINTERMED_B25C');
      ADTO.Ide.procEmi := I(LQuery, 'PROCEMI_B26');
      ADTO.Ide.verProc := S(LQuery, 'VERPROC_B27');
      ADTO.Ide.dhCont := DataHoraISO8601(LQuery, 'DHCONT_B28');
      ADTO.Ide.xJust := S(LQuery, 'XJUST_B29');
      ADTO.Ide.dPrevEntrega := DataISO8601(LQuery, 'DPREVENTREGA_B10A');
   Finally
      LQuery.Free;
   End;
End;

Class Procedure TNFeMapper.MapearInfoAdicional(AConnection: TFDConnection; AIdNFe: Integer; ADTO: TNFeDTO);
Var
   LQuery: TFDQuery;
   InfoComplementar: String;
Begin
   LQuery := ExecutarQuery(AConnection, TNFeScript.ScriptInfoAdicional(AIdNFe));

   If LQuery.IsEmpty Then
      Exit;
   Try
      ADTO.InfoAdicional.infAdFisco := S(LQuery, 'INFADFISCO_Z02');

      // ADTO.InfoAdicional.infCpl := S(LQuery, 'INFCPL_Z03');
      InfoComplementar := TNFeScript.PrepararInfoComplementar(AConnection, AIdNFe);
      ADTO.InfoAdicional.infCpl := InfoComplementar;
   Finally
      LQuery.Free;
   End;
End;

Class Procedure TNFeMapper.MapearEmitente(AConnection: TFDConnection; AIdNFe: Integer; ADTO: TNFeDTO);
Var
   LQuery: TFDQuery;
Begin
   LQuery := TFDQuery.Create(Nil);
   LQuery := ExecutarQuery(AConnection, TNFeScript.ScriptEmitente(AIdNFe));
   If LQuery.IsEmpty Then
      Exit;

   Try
      ADTO.emit.CNPJ := S(LQuery, 'CNPJ_C02');
      ADTO.emit.CPF := S(LQuery, 'CPF_C02A');
      ADTO.emit.xNome := S(LQuery, 'XNOME_C03');
      ADTO.emit.xFant := S(LQuery, 'XFANT_C04');
      ADTO.emit.enderEmit.xLgr := S(LQuery, 'XLGR_C06');
      ADTO.emit.enderEmit.nro := S(LQuery, 'NRO_C07');
      ADTO.emit.enderEmit.xCpl := S(LQuery, 'XCPL_C08');
      ADTO.emit.enderEmit.xBairro := S(LQuery, 'XBAIRRO_C09');
      ADTO.emit.enderEmit.cMun := I(LQuery, 'CMUN_C10');
      ADTO.emit.enderEmit.xMun := S(LQuery, 'XMUN_C11');
      ADTO.emit.enderEmit.UF := S(LQuery, 'UF_C12');
      ADTO.emit.enderEmit.CEP := S(LQuery, 'CEP_C13');
      ADTO.emit.enderEmit.cPais := I(LQuery, 'CPAIS_C14');
      ADTO.emit.enderEmit.xPais := S(LQuery, 'XPAIS_C15');
      ADTO.emit.enderEmit.fone := S(LQuery, 'FONE_C16');
      ADTO.emit.IE := S(LQuery, 'IE_C17');
      ADTO.emit.IEST := S(LQuery, 'IEST_C18');
      ADTO.emit.IM := S(LQuery, 'IM_C19');
      ADTO.emit.CNAE := S(LQuery, 'CNAE_C20');
      ADTO.emit.CRT := I(LQuery, 'CRT_C21');
      ADTO.emit.ISUFEmit := S(LQuery, 'ISUFEMIT_C22');
   Finally
      LQuery.Free;
   End;
End;

Class Procedure TNFeMapper.MapearDestinatario(AConnection: TFDConnection; AIdNFe: Integer; ADTO: TNFeDTO);
Var
   LQuery: TFDQuery;
Begin
   LQuery := TFDQuery.Create(Nil);
   LQuery := ExecutarQuery(AConnection, TNFeScript.ScriptDestinatatrio(AIdNFe));
   If LQuery.IsEmpty Then
      Exit;

   Try
      ADTO.dest.CNPJ := S(LQuery, 'CNPJ_E02');
      ADTO.dest.CPF := S(LQuery, 'CPF_E03');
      ADTO.dest.idEstrangeiro := S(LQuery, 'IDESTRANGEIRO_E03A');
      ADTO.dest.xNome := S(LQuery, 'XNOME_E04');
      ADTO.dest.enderDest.xLgr := S(LQuery, 'XLGR_E06');
      ADTO.dest.enderDest.nro := S(LQuery, 'NRO_E07');
      ADTO.dest.enderDest.xCpl := S(LQuery, 'XCPL_E08');
      ADTO.dest.enderDest.xBairro := S(LQuery, 'XBAIRRO_E09');
      ADTO.dest.enderDest.cMun := I(LQuery, 'CMUN_E10');
      ADTO.dest.enderDest.xMun := S(LQuery, 'XMUN_E11');
      ADTO.dest.enderDest.UF := S(LQuery, 'UF_E12');
      ADTO.dest.enderDest.CEP := S(LQuery, 'CEP_E13');
      ADTO.dest.enderDest.cPais := I(LQuery, 'CPAIS_E14');
      ADTO.dest.enderDest.xPais := S(LQuery, 'XPAIS_E15');
      ADTO.dest.enderDest.fone := S(LQuery, 'FONE_E16');
      ADTO.dest.indIEDest := I(LQuery, 'INDIEDEST_E16A');
      ADTO.dest.IE := S(LQuery, 'IE_E17');
      ADTO.dest.ISUF := S(LQuery, 'ISUF_E18');
      ADTO.dest.IM := S(LQuery, 'IM_E18A');
      ADTO.dest.email := S(LQuery, 'EMAIL_E19');
   Finally
      LQuery.Free;
   End;
End;

Class Procedure TNFeMapper.MapearItem(ADataSet: TDataSet; ADTO: TNFeItemDTO);
Begin
   ADTO.nItem := I(ADataSet, 'ID_SEFAZ');
   ADTO.prod.cProd := S(ADataSet, 'CPROD_I02');
   ADTO.prod.cEAN := S(ADataSet, 'CEAN_I03');
   ADTO.prod.xProd := S(ADataSet, 'XPROD_I04');
   ADTO.prod.NCM := S(ADataSet, 'NCM_I05');
   ADTO.prod.EXTIPI := S(ADataSet, 'EXTIPI_I06');
   ADTO.prod.CFOP := S(ADataSet, 'CFOP_I08');
   ADTO.prod.uCom := S(ADataSet, 'UCOM_I09');
   ADTO.prod.qCom := D(ADataSet, 'QCOM_I10');
   ADTO.prod.vUnCom := D(ADataSet, 'VUNCOM_I10A');
   ADTO.prod.vProd := D(ADataSet, 'VPROD_I11');
   ADTO.prod.cEANTrib := S(ADataSet, 'CEANTRIB_I12');
   ADTO.prod.uTrib := S(ADataSet, 'UTRIB_I13');
   ADTO.prod.qTrib := D(ADataSet, 'QTRIB_I14');
   ADTO.prod.vUnTrib := D(ADataSet, 'VUNTRIB_I14A');
   ADTO.prod.vFrete := D(ADataSet, 'VFRETE_I15');
   ADTO.prod.vSeg := D(ADataSet, 'VSEG_I16');
   ADTO.prod.vDesc := D(ADataSet, 'VDESC_I17');
   ADTO.prod.vOutro := D(ADataSet, 'VOUTRO_I17A');
   ADTO.prod.indTot := I(ADataSet, 'INDTOT_I17B');
   ADTO.prod.xPed := S(ADataSet, 'XPED_I60');
   ADTO.prod.nItemPed := S(ADataSet, 'NITEMPED_I61');
   ADTO.prod.NFCI := S(ADataSet, 'NFCI_I70');
   ADTO.prod.nVE := S(ADataSet, 'NVE_I05A');
   ADTO.prod.CEST := S(ADataSet, 'CEST_I05C');
   ADTO.prod.indEscala := S(ADataSet, 'INDESCALA_I05D');
   ADTO.prod.CNPJFab := S(ADataSet, 'CNPJFAB_I05E');
   ADTO.prod.cBenef := S(ADataSet, 'CBENEF_I05F');

   { IMPLEMENTAR }
   // MapearIPI(ADataSet, ADTO.Imposto.ICMS);

   MapearICMS(ADataSet, ADTO.Imposto.ICMS);
   MapearPIS(ADataSet, ADTO.Imposto.PIS);
   MapearCOFINS(ADataSet, ADTO.Imposto.COFINS);
   MapearISSQN(ADataSet, ADTO.Imposto.ISSQN);

   // MapearIBSCBS(ADataSet, ADTO.Imposto.IBSCBS);

   ADTO.prod.vTotTrib := D(ADataSet, 'VTOTTRIB_M02');
   ADTO.infAdProd := S(ADataSet, 'INFADPROD_V01');

End;

(*
  Class Procedure TNFeMapper.MapearItens(AConnection: TFDConnection; AIdNFe: Integer; ADTO: TNFeDTO);
  Var
  Item: TNFeItemDTO;
  LQuery: TFDQuery;
  Begin
  LQuery := TFDQuery.Create(Nil);
  LQuery := ExecutarQuery(AConnection, TNFeScript.ScriptProdutosEImpostos(AIdNFe));
  If LQuery.IsEmpty Then
  Exit;

  Try
  LQuery.First;
  While Not LQuery.Eof Do
  Begin
  Item := TNFeItemDTO.Create;
  MapearItem(LQuery, Item);

  ADTO.AdicionarItem(Item);
  LQuery.Next;
  End;
  Finally
  LQuery.Free;
  End;
  End;
*)

Class Procedure TNFeMapper.MapearItens(AConnection: TFDConnection; AIdNFe: Integer; ADTO: TNFeDTO);
Var
   LQueryItens: TFDQuery;
   LQueryISIBSCBS: TFDQuery;
   Item: TNFeItemDTO;
Begin
   LQueryItens := ExecutarQuery(AConnection, TNFeScript.ScriptProdutosEImpostos(AIdNFe));
   If LQueryItens.IsEmpty Then
      Exit;

   LQueryISIBSCBS := ExecutarQuery(AConnection, TNFeScript.ScriptISIBSCBS(AIdNFe));
   Try
      LQueryItens.First;

      While Not LQueryItens.Eof Do
      Begin
         Item := TNFeItemDTO.Create;

         // TRIBUTOS EXISTENTES - IPI, ICMS, ...
         MapearItem(LQueryItens, Item);

         If LQueryISIBSCBS.Locate('ID_ITEM', LQueryItens.FieldByName('ID_ITEM').AsInteger, [])
         Then
         Begin
            MapearISIBSCBS(LQueryISIBSCBS, Item.Imposto.IBSCBS);
         End;

         ADTO.AdicionarItem(Item);

         LQueryItens.Next;
      End;

   Finally
      LQueryISIBSCBS.Free;
      LQueryItens.Free;
   End;
End;

Class Procedure TNFeMapper.MapearPIS(ADataSet: TDataSet; ADTO: TNFePISDTO);
Begin
   ADTO.CST := S(ADataSet, 'CST_Q06');
   ADTO.vBC := D(ADataSet, 'VBC_Q07');
   ADTO.pPIS := D(ADataSet, 'PPIS_Q08');
   ADTO.vPIS := D(ADataSet, 'VPIS_Q09');
   ADTO.qBCProd := D(ADataSet, 'QBCPROD_Q10');
   ADTO.vAliqProd := D(ADataSet, 'VALIQPROD_Q11');
End;

Class Procedure TNFeMapper.MapearCOFINS(ADataSet: TDataSet; ADTO: TNFeCOFINSDTO);
Begin
   ADTO.CST := S(ADataSet, 'CST_S06');
   ADTO.vBC := D(ADataSet, 'VBC_S07');
   ADTO.pCOFINS := D(ADataSet, 'PCOFINS_S08');
   ADTO.qBCProd := D(ADataSet, 'QBCPROD_S09');
   ADTO.vAliqProd := D(ADataSet, 'VALIQPROD_S10');
   ADTO.vCOFINS := D(ADataSet, 'VCOFINS_S11');
End;

Class Procedure TNFeMapper.MapearISSQN(ADataSet: TDataSet; ADTO: TNFeISSQNDTO);
Begin
   ADTO := Nil;
End;

Class Procedure TNFeMapper.MapearICMS(ADataSet: TDataSet; ADTO: TNFeICMSDTO);
Begin
   ADTO.orig := I(ADataSet, 'ORI_N11');
   ADTO.CST := S(ADataSet, 'CST_N12');
   ADTO.CSOSN := S(ADataSet, 'CSOSN_N12A');
   ADTO.modBC := I(ADataSet, 'MODBC_N13');
   ADTO.pRedBC := D(ADataSet, 'PREDBC_N14');
   ADTO.vBC := D(ADataSet, 'VBC_N15');
   ADTO.pICMS := D(ADataSet, 'PICMS_N16');
   ADTO.vICMSOp := D(ADataSet, 'VICMSOP_N16A');
   ADTO.pDif := D(ADataSet, 'PDIF_N16B');
   ADTO.vICMSDif := D(ADataSet, 'VICMSDIF_N16C');
   ADTO.vICMS := D(ADataSet, 'VICMS_N17');
   ADTO.modBCST := I(ADataSet, 'MODBCST_N18');
   ADTO.pMVAST := D(ADataSet, 'PMVAST_N19');
   ADTO.pRedBCST := D(ADataSet, 'PREDBCST_N20');
   ADTO.vBCST := D(ADataSet, 'VBCST_N21');
   ADTO.pICMSST := D(ADataSet, 'PICMSST_N22');
   ADTO.vICMSST := D(ADataSet, 'VICMSST_N23');
   ADTO.UFST := S(ADataSet, 'UFST_N24');
   ADTO.pBCOp := D(ADataSet, 'PBCOP_N25');
   ADTO.vBCSTRet := D(ADataSet, 'VBCSTRET_N26');
   ADTO.vICMSSTRet := D(ADataSet, 'VICMSSTRET_N27');
   ADTO.vICMSDeson := D(ADataSet, 'VICMSDESON_N27A');
   ADTO.motDesICMS := I(ADataSet, 'MOTDESICMS_N28');
   ADTO.pCredSN := D(ADataSet, 'PCREDSN_N29');
   ADTO.vCredICMSSN := D(ADataSet, 'VCREDICMSSN_N30');
   ADTO.vBCSTDest := D(ADataSet, 'VBCSTDEST_N31');
   ADTO.vICMSSTDest := D(ADataSet, 'VICMSTDEST_N32');
   ADTO.vBCUFDest := D(ADataSet, 'VBCUFDEST_NA03');
   ADTO.vBCFCPUFDest := D(ADataSet, 'VBCFCPUFDEST_NA04');
   ADTO.pFCPUFDest := D(ADataSet, 'PFCPUFDEST_NA05');
   ADTO.pICMSUFDest := D(ADataSet, 'PICMSUFDEST_NA07');
   ADTO.pICMSInter := D(ADataSet, 'PICMSINTER_NA09');
   ADTO.pICMSInterPart := D(ADataSet, 'PICMSINTERPART_NA11');
   ADTO.vFCPUFDest := D(ADataSet, 'VFCPUFDEST_NA13');
   ADTO.vICMSUFDest := D(ADataSet, 'VICMSUFDEST_NA15');
   ADTO.vICMSUFRemet := D(ADataSet, 'VICMSUFREMET_NA17');
   ADTO.vBCFCP := D(ADataSet, 'VBCFCP_N17A');
   ADTO.pFCP := D(ADataSet, 'PFCP_N17B');
   ADTO.vFCP := D(ADataSet, 'VFCP_N17C');
   ADTO.vBCFCPST := D(ADataSet, 'VBCFCPST_N23A');
   ADTO.pFCPST := D(ADataSet, 'PFCPST_N23B');
   ADTO.vFCPST := D(ADataSet, 'VFCPST_N23D');
   ADTO.pST := D(ADataSet, 'PST_N26A');
   ADTO.vBCFCPSTRet := D(ADataSet, 'VBCFCPSTRET_N27A');
   ADTO.pFCPSTRet := D(ADataSet, 'PFCPSTRET_N27B');
   ADTO.vFCPSTRet := D(ADataSet, 'VFCPSTRET_N27D');
   ADTO.qBCMono := D(ADataSet, 'QBCMONO_N37A');
   ADTO.adRemICMS := D(ADataSet, 'ADREMICMS_N38');
   ADTO.vICMSMono := D(ADataSet, 'VICMSMONO_N39');
   ADTO.qBCMonoReten := D(ADataSet, 'QBCMONORETEN_N39A');
   ADTO.adRemICMSReten := D(ADataSet, 'ADREMICMSRETEN_N40');
   ADTO.vICMSMonoReten := D(ADataSet, 'VICMSMONORETEN_N41');
   ADTO.vICMSMonoOp := D(ADataSet, 'VICMSMONOOP_N41A');
   ADTO.pDifMono := D(ADataSet, 'PDIF_N42');
   ADTO.vICMSMonoDif := D(ADataSet, 'VICMSMONODIF_N43');
   ADTO.qBCMonoRet := D(ADataSet, 'QBCMONORET_N43A');
   ADTO.adRemICMSRet := D(ADataSet, 'ADREMICMSRET_N44');
   ADTO.vICMSMonoRet := D(ADataSet, 'VICMSMONORET_N45');
   ADTO.pRedAdRem := D(ADataSet, 'PREDADREM_N47');
   ADTO.motRedAdRem := I(ADataSet, 'MOTREDADREM_N48');
End;

Class Function TNFeMapper.MapearReboque(ADataSet: TDataSet): TNFeVeicTranspDTO;
Begin
   Result := TNFeVeicTranspDTO.Create;
   Result.placa := S(ADataSet, 'PLACA_X23');
   Result.UF := S(ADataSet, 'UF_X24');
   Result.RNTC := S(ADataSet, 'RNTC_X25');
End;

Class Function TNFeMapper.MapearRefDFeAnt(ADataSet: TDataSet): String;
Begin
   Result := S(ADataSet, 'REFDFEANT_BB05');
End;

Class Procedure TNFeMapper.MapearReferenciados(ADataSet: TDataSet; ADTO: TNFeDTO);
Begin
   //
End;

Class Function TNFeMapper.MapearRefNFeAntecipada(ADataSet: TDataSet): String;
Begin
   Result := S(ADataSet, 'REFNFE_BC02');
End;

(*
  Class Procedure TNFeMapper.MapearTotais_Old(AConnection: TFDConnection; AIdNFe: Integer; ADTO: TNFeDTO);
  Var
  LQuery: TFDQuery;
  Begin
  LQuery := TFDQuery.Create(Nil);
  LQuery := ExecutarQuery(AConnection, TNFeScript.ScriptTotais(AIdNFe));
  If LQuery.IsEmpty Then
  Exit;

  Try
  ADTO.total.ICMSTot.vBC := D(LQuery, 'VBC_W03');
  ADTO.total.ICMSTot.vICMS := D(LQuery, 'VICMS_W04');
  ADTO.total.ICMSTot.vBCST := D(LQuery, 'VBCST_W05');
  ADTO.total.ICMSTot.vST := D(LQuery, 'VST_W06');
  ADTO.total.ICMSTot.vProd := D(LQuery, 'VPROD_W07');
  ADTO.total.ICMSTot.vFrete := D(LQuery, 'VFRETE_W08');
  ADTO.total.ICMSTot.vSeg := D(LQuery, 'VSEG_W09');
  ADTO.total.ICMSTot.vDesc := D(LQuery, 'VDESC_W10');
  ADTO.total.ICMSTot.vII := D(LQuery, 'VII_W11');
  ADTO.total.ICMSTot.vIPI := D(LQuery, 'VIPI_W12');
  ADTO.total.ICMSTot.vIPIDevol := D(LQuery, 'VIPIDEVOL_W12A');
  ADTO.total.ICMSTot.vPIS := D(LQuery, 'VPIS_W13');
  ADTO.total.ICMSTot.vCOFINS := D(LQuery, 'VCOFINS_W14');
  ADTO.total.ICMSTot.vOutro := D(LQuery, 'VOUTRO_W15');
  ADTO.total.ICMSTot.vNF := D(LQuery, 'VNF_W16');

  ADTO.total.ICMSTot.vTotTrib := D(LQuery, 'VTOTTRIB_W16A');
  // ADTO.total.ICMSTot.vICMSDeson := D(LQuery, 'VICMSDESON_W04A');
  ADTO.total.ICMSTot.vFCPUFDest := D(LQuery, 'VFCPUFDEST_W04C');
  // ADTO.total.ICMSTot.vFCP := D(LQuery, 'VFCP_W04H');
  ADTO.total.ICMSTot.vFCPST := D(LQuery, 'VFCPST_W06A');
  ADTO.total.ICMSTot.vFCPSTRet := D(LQuery, 'VFCPSTRET_W06B');
  ADTO.total.ICMSTot.qBCMono := D(LQuery, 'QBCMONO_W06B1');
  ADTO.total.ICMSTot.vICMSMono := D(LQuery, 'VICMSMONO_W06C');
  ADTO.total.ICMSTot.qBCMonoReten := D(LQuery, 'QBCMONORETEN_W06C1');
  ADTO.total.ICMSTot.vICMSMonoReten := D(LQuery, 'VICMSMONORETEN_W06D');
  ADTO.total.ICMSTot.qBCMonoRet := D(LQuery, 'QBCMONORET_W06D1');
  ADTO.total.ICMSTot.vICMSMonoRet := D(LQuery, 'VICMSMONORET_W06E');
  ADTO.total.ICMSTot.vICMSUFDest := D(LQuery, 'VICMSUFDEST_W04E');
  ADTO.total.ICMSTot.vICMSUFRemet := D(LQuery, 'VICMSUFREMET_W04G');

  // IBS/CBS
  // ADTO.total.IBSCBSTot.vIS := D(LQuery, 'VIS_W33');
  ADTO.total.IBSCBSTot.vBC := D(LQuery, 'VBCIBSCBS_W35');
  // IBS UF
  ADTO.total.IBSCBSTot.gIBSUF.vDif := D(LQuery, 'VDIF_W43');
  ADTO.total.IBSCBSTot.gIBSUF.vDevTrib := D(LQuery, 'VDEVTRIB_W44');
  ADTO.total.IBSCBSTot.gIBSUF.vIBSUF := D(LQuery, 'VIBSUF_W41');
  // IBS Mun
  ADTO.total.IBSCBSTot.gIBSMun.vDif := D(LQuery, 'VDIF_W38');
  ADTO.total.IBSCBSTot.gIBSMun.vDevTrib := D(LQuery, 'VDEVTRIB_W39');
  ADTO.total.IBSCBSTot.gIBSMun.vIBSMun := D(LQuery, 'VIBSMUN_W46');
  // CBS
  ADTO.total.IBSCBSTot.gCBS.vDif := D(LQuery, 'VDIF_W53');
  ADTO.total.IBSCBSTot.gCBS.vDevTrib := D(LQuery, 'VDEVTRIB_W54');
  ADTO.total.IBSCBSTot.gCBS.vCBS := D(LQuery, 'VCBS_W56');
  // ADTO.total.IBSCBSTot.gcBS.vCredPres := D(LQuery, 'VCREDPRES_W56A');
  // ADTO.total.IBSCBSTot.gcBS.vCredPresCondSus := D(LQuery, 'VCREDPRESCONDSUS_W49');

  ADTO.total.IBSCBSTot.gIBSCBSMono.gIBSMonoAdRem.gMonoPadrao.vIBSMono := D(LQuery, 'VIBSMONO_W58');
  ADTO.total.IBSCBSTot.gIBSCBSMono.gCBSMonoAdRem.gMonoPadrao.vCBSMono := D(LQuery, 'VCBSMONO_W59');
  ADTO.total.IBSCBSTot.gIBSCBSMono.gCBSMonoAdRem.gMonoReten.vIBSMonoReten := D(LQuery, 'VIBSMONORETEN_W59A');
  ADTO.total.IBSCBSTot.gIBSCBSMono.gCBSMonoAdRem.gMonoPadrao V vCBSMonoReten := D(LQuery, 'VCBSMONORETEN_W59B');
  ADTO.total.IBSCBSTot.gCBS.vCBSMonoRet := D(LQuery, 'VCBSMONORET_W59D');
  ADTO.total.IBSCBSTot.gCBS.vCBSEstCred := D(LQuery, 'VCBSESTCRED_W59G');

  ADTO.total.IBSCBSTot.gIBSCBSMono.vIBSMonoRet := D(LQuery, 'VIBSMONORET_W59C');
  ADTO.total.IBSCBSTot.gIBSCBSMono.vIBSEstCred := D(LQuery, 'VIBSESTCRED_W59F');

  ADTO.total.IBSCBSTot.vIBS := D(LQuery, 'VIBS_W47');

  ADTO.total.vNFTot := D(LQuery, 'VNFTOT_W60');
  Finally
  LQuery.Free;
  End;
  End;
*)

Class Procedure TNFeMapper.MapearTotal(AConnection: TFDConnection; AIdNFe: Integer; ADTO: TNFeDTO);
Var
   LQuery: TFDQuery;
Begin
   LQuery := ExecutarQuery(AConnection, TNFeScript.ScriptTotais(AIdNFe));

   If LQuery.IsEmpty Then
      Exit;

   Try
      ADTO.total.ICMSTot.vBC := D(LQuery, 'VBC_W03');
      ADTO.total.ICMSTot.vICMS := D(LQuery, 'VICMS_W04');
      ADTO.total.ICMSTot.vICMSDeson := D(LQuery, 'VICMSDESON_W04A');
      ADTO.total.ICMSTot.vFCPUFDest := D(LQuery, 'VFCPUFDEST_W04C');
      ADTO.total.ICMSTot.vICMSUFDest := D(LQuery, 'VICMSUFDEST_W04E');
      ADTO.total.ICMSTot.vICMSUFRemet := D(LQuery, 'VICMSUFREMET_W04G');
      ADTO.total.ICMSTot.vFCP := D(LQuery, 'VFCP_W04H');
      ADTO.total.ICMSTot.vBCST := D(LQuery, 'VBCST_W05');
      ADTO.total.ICMSTot.vST := D(LQuery, 'VST_W06');
      ADTO.total.ICMSTot.vFCPST := D(LQuery, 'VFCPST_W06A');
      ADTO.total.ICMSTot.vFCPSTRet := D(LQuery, 'VFCPSTRET_W06B');
      ADTO.total.ICMSTot.qBCMono := D(LQuery, 'QBCMONO_W06C');
      ADTO.total.ICMSTot.vICMSMono := D(LQuery, 'VICMSMONO_W06D');
      ADTO.total.ICMSTot.qBCMonoRet := D(LQuery, 'QBCMONORET_W06D1');
      ADTO.total.ICMSTot.vICMSMonoRet := D(LQuery, 'VICMSMONORET_W06E');
      ADTO.total.ICMSTot.vProd := D(LQuery, 'VPROD_W07');
      ADTO.total.ICMSTot.vFrete := D(LQuery, 'VFRETE_W08');
      ADTO.total.ICMSTot.vSeg := D(LQuery, 'VSEG_W09');
      ADTO.total.ICMSTot.vDesc := D(LQuery, 'VDESC_W10');
      ADTO.total.ICMSTot.vII := D(LQuery, 'VII_W11');
      ADTO.total.ICMSTot.vIPI := D(LQuery, 'VIPI_W12');
      ADTO.total.ICMSTot.vIPIDevol := D(LQuery, 'VIPIDEVOL_W12A');
      ADTO.total.ICMSTot.vPIS := D(LQuery, 'VPIS_W13');
      ADTO.total.ICMSTot.vCOFINS := D(LQuery, 'VCOFINS_W14');
      ADTO.total.ICMSTot.vOutro := D(LQuery, 'VOUTRO_W15');
      ADTO.total.ICMSTot.vNF := D(LQuery, 'VNF_W16');
      ADTO.total.ICMSTot.vTotTrib := D(LQuery, 'VTOTTRIB_W16A');

      ADTO.total.ISSQNTot.ISSQN.vServ := D(LQuery, 'VSERV_W18');
      ADTO.total.ISSQNTot.ISSQN.vBC := D(LQuery, 'VBC_W19');
      ADTO.total.ISSQNTot.ISSQN.vISS := D(LQuery, 'VISS_W20');
      ADTO.total.ISSQNTot.ISSQN.vPIS := D(LQuery, 'VPIS_W21');
      ADTO.total.ISSQNTot.ISSQN.vCOFINS := D(LQuery, 'VCOFINS_W22');

      ADTO.total.RetTribTot.vRetPIS := D(LQuery, 'VRETPIS_W24');
      ADTO.total.RetTribTot.vRetCOFINS := D(LQuery, 'VRETCOFINS_W25');
      ADTO.total.RetTribTot.vRetCSLL := D(LQuery, 'VRETCSLL_W26');
      ADTO.total.RetTribTot.vBCIRRF := D(LQuery, 'VBCIRRF_W27');
      ADTO.total.RetTribTot.vIRRF := D(LQuery, 'VIRRF_W28');
      ADTO.total.RetTribTot.vBCRetPrev := D(LQuery, 'VBCRETPREV_W29');
      ADTO.total.RetTribTot.vRetPrev := D(LQuery, 'VRETPREV_W30');
   Finally
      LQuery.Free;
   End;
End;

Class Procedure TNFeMapper.MapearTotalIBSCBS(AConnection: TFDConnection; AIdNFe: Integer; ADTO: TNFeDTO);
Var
   LQuery: TFDQuery;
Begin
   LQuery := ExecutarQuery(AConnection, TNFeScript.ScriptTotaisISIBSCBS(AIdNFe));

   If LQuery.IsEmpty Then
      Exit;

   Try
      ADTO.total.ISTot.vIS := D(LQuery, 'VIS_W33');
      //
      ADTO.total.IBSCBSTot.vBCIBSCBS := D(LQuery, 'VBCIBSCBS_W35');
      //
      ADTO.total.IBSCBSTot.gIBS.gIBSUF.vDif := D(LQuery, 'VDIF_W38');
      ADTO.total.IBSCBSTot.gIBS.gIBSUF.vDevTrib := D(LQuery, 'VDEVTRIB_W39');
      ADTO.total.IBSCBSTot.gIBS.gIBSUF.vIBSUF := D(LQuery, 'VIBSUF_W41');
      ADTO.total.IBSCBSTot.gIBS.gIBSMun.vDif := D(LQuery, 'VDIF_W43');
      ADTO.total.IBSCBSTot.gIBS.gIBSMun.vDevTrib := D(LQuery, 'VDEVTRIB_W44');
      ADTO.total.IBSCBSTot.gIBS.gIBSMun.vIBSMun := D(LQuery, 'VIBSMUN_W46');
      ADTO.total.IBSCBSTot.gIBS.vIBS := D(LQuery, 'VIBS_W47');
      ADTO.total.IBSCBSTot.gIBS.vCredPres := D(LQuery, 'VCREDPRES_W48');
      ADTO.total.IBSCBSTot.gIBS.vCredPresCondSus := D(LQuery, 'VCREDPRESCONDSUS_W49');
      //
      ADTO.total.IBSCBSTot.gCBS.vDif := D(LQuery, 'VDIF_W53');
      ADTO.total.IBSCBSTot.gCBS.vDevTrib := D(LQuery, 'VDEVTRIB_W54');
      ADTO.total.IBSCBSTot.gCBS.vCBS := D(LQuery, 'VCBS_W56');
      ADTO.total.IBSCBSTot.gCBS.vCredPres := D(LQuery, 'VCREDPRES_W56A');
      ADTO.total.IBSCBSTot.gCBS.vCredPresCondSus := D(LQuery, 'VCREDPRESCONDSUS_W56B');
      //
      ADTO.total.IBSCBSTot.gMono.vIBSMono := D(LQuery, 'VIBSMONO_W58');
      ADTO.total.IBSCBSTot.gMono.vCBSMono := D(LQuery, 'VCBSMONO_W59');
      ADTO.total.IBSCBSTot.gMono.vIBSMonoReten := D(LQuery, 'VIBSMONORETEN_W59A');
      ADTO.total.IBSCBSTot.gMono.vCBSMonoReten := D(LQuery, 'VCBSMONORETEN_W59B');
      ADTO.total.IBSCBSTot.gMono.vIBSMonoRet := D(LQuery, 'VIBSMONORET_W59C');
      ADTO.total.IBSCBSTot.gMono.vCBSMonoRet := D(LQuery, 'VCBSMONORET_W59D');
      //
      ADTO.total.IBSCBSTot.gEstornoCred.vIBSEstCred := D(LQuery, 'VIBSESTCRED_W59F');
      ADTO.total.IBSCBSTot.gEstornoCred.vCBSEstCred := D(LQuery, 'VCBSESTCRED_W59G');
      //
      ADTO.total.IBSCBSTot.vNFTot := D(LQuery, 'VNFTOT_W60');
   Finally
      LQuery.Free;
   End;
End;

Class Procedure TNFeMapper.MapearTransporte(AConnection: TFDConnection; AIdNFe: Integer; ADTO: TNFeDTO);
Var
   qryVolume, qryLacres, qryReboque, qryTransp: TFDQuery;
   dtoVolume, dtoReboque: TNFeVolumeDTO;
   dtoVeicReboque: TNFeVeicTranspDTO;
   dtoLacres: TNFeLacreDTO;
   idVolume: Integer;
Begin
   qryTransp := ExecutarQuery(AConnection, TNFeScript.ScriptTransporte(AIdNFe));
   If qryTransp.IsEmpty Then
      Exit;

   Try
      ADTO.Transporte.modFrete := I(qryTransp, 'MODFRETE_X02');

      ADTO.Transporte.transporta.CNPJ := S(qryTransp, 'CNPJ_X04');
      ADTO.Transporte.transporta.CPF := S(qryTransp, 'CPF_X05');
      ADTO.Transporte.transporta.xNome := S(qryTransp, 'XNOME_X06');
      ADTO.Transporte.transporta.IE := S(qryTransp, 'IE_X07');
      ADTO.Transporte.transporta.xEnder := S(qryTransp, 'XENDER_X08');
      ADTO.Transporte.transporta.xMun := S(qryTransp, 'XMUN_X09');
      ADTO.Transporte.transporta.UF := S(qryTransp, 'UF_X10');

      ADTO.Transporte.retTransp.vServ := D(qryTransp, 'VSERV_X12');
      ADTO.Transporte.retTransp.vBCRet := D(qryTransp, 'VBCRET_X13');
      ADTO.Transporte.retTransp.pICMSRet := D(qryTransp, 'PICMSRET_X14');
      ADTO.Transporte.retTransp.vICMSRet := D(qryTransp, 'VICMSRET_X15');
      ADTO.Transporte.retTransp.CFOP := S(qryTransp, 'CFOP_X16');
      ADTO.Transporte.retTransp.cMunFG := I(qryTransp, 'CMUNFG_X17');

      ADTO.Transporte.veicTransp.placa := S(qryTransp, 'PLACA_X19');
      ADTO.Transporte.veicTransp.UF := S(qryTransp, 'UF_X20');
      ADTO.Transporte.veicTransp.RNTC := S(qryTransp, 'RNTC_X21');

      ADTO.Transporte.vagao := S(qryTransp, 'VAGAO_X22');
      ADTO.Transporte.balsa := S(qryTransp, 'BALSA_X23');

      // Reboques
      qryReboque := ExecutarQuery(AConnection, TNFeScript.ScriptReboque(AIdNFe));
      Try
         While Not qryReboque.Eof Do
         Begin
            dtoVeicReboque := MapearReboque(qryReboque);
            ADTO.Transporte.reboque := ADTO.Transporte.reboque + [dtoVeicReboque];
            qryReboque.Next;
         End;
      Finally
         qryReboque.Free;
      End;

      // Volumes
      qryVolume := ExecutarQuery(AConnection, TNFeScript.ScriptVolumes(AIdNFe));
      Try
         While Not qryVolume.Eof Do
         Begin
            dtoVolume := MapearVolume(qryVolume);
            idVolume := I(qryVolume, 'ID_VOLUME');

            // Lacres
            qryLacres := ExecutarQuery(AConnection, TNFeScript.ScriptLacres(AIdNFe, idVolume));
            Try
               While Not qryLacres.Eof Do
               Begin
                  dtoLacres := MapearLacre(qryLacres);
                  dtoVolume.lacres := dtoVolume.lacres + [dtoLacres];
                  qryLacres.Next;
               End;
            Finally
               qryLacres.Free;
            End;

            ADTO.Transporte.vol := ADTO.Transporte.vol + [dtoVolume];

            qryVolume.Next;
         End;
      Finally
         qryVolume.Free;
      End;
   Finally
      qryTransp.Free;
   End;
End;

Class Function TNFeMapper.MapearVolume(ADataSet: TDataSet): TNFeVolumeDTO;
Begin
   Result := TNFeVolumeDTO.Create;
   Result.qVol := I(ADataSet, 'QVOL_X27');
   Result.esp := S(ADataSet, 'ESP_X28');
   Result.marca := S(ADataSet, 'MARCA_X29');
   Result.nVol := S(ADataSet, 'NVOL_X30');
   Result.pesoL := D(ADataSet, 'PELOL_X31');
   Result.pesoB := D(ADataSet, 'PELOB_X32');
End;

Class Function TNFeMapper.MapearLacre(ADataSet: TDataSet): TNFeLacreDTO;
Begin
   Result := TNFeLacreDTO.Create;
   Result.nLacre := S(ADataSet, 'NLACRE_X34');
End;

Class Function TNFeMapper.MapearObsFisco(ADataSet: TDataSet): TNFeObsFiscoDTO;
Begin
   Result := TNFeObsFiscoDTO.Create;
   Result.xCampo := S(ADataSet, 'XCAMPO_Z08');
   Result.xTexto := S(ADataSet, 'XTEXTO_Z09');
End;

Class Function TNFeMapper.MapearObsCont(ADataSet: TDataSet): TNFeObsContDTO;
Begin
   Result := TNFeObsContDTO.Create;

   Result.xCampo := S(ADataSet, 'XCAMPO_Z05');
   Result.xTexto := S(ADataSet, 'XTEXTO_Z06');
End;

Class Function TNFeMapper.MapearPagamentoAntecipado(ADataSet: TDataSet): TNFePagamentoAntecipadoDTO;
Begin
   Result := TNFePagamentoAntecipadoDTO.Create;
   Result.refNFe := Result.refNFe + [S(ADataSet, 'REFNFE_BC')];
End;

Class Function TNFeMapper.MapearProcRef(ADataSet: TDataSet): TNFeProcRefDTO;
Begin
   Result := TNFeProcRefDTO.Create;

   Result.nProc := S(ADataSet, 'NPROC_Z12');
   Result.indProc := I(ADataSet, 'INDPROC_Z13');
   Result.tpAto := I(ADataSet, 'TPATO_Z14');
End;

Class Procedure TNFeMapper.MapearCompraGov(AConnection: TFDConnection; AIdNFe: Integer; ADTO: TNFeDTO);
Var
   LQuery: TFDQuery;
Begin
   LQuery := ExecutarQuery(AConnection, TNFeScript.ScriptCompraGov(AIdNFe));

   If LQuery.IsEmpty Then
      Exit;

   Try
      ADTO.CompraGov.tpEnteGov := I(LQuery, 'TPENTEGOV_BB02');
      ADTO.CompraGov.pRedutor := D(LQuery, 'PREDUTOR_BB03');
      ADTO.CompraGov.tpOperGov := I(LQuery, 'TPOPERGOV_BB04');
   Finally
      LQuery.Free;
   End;
End;

Class Function TNFeMapper.MapearGCBS(ADataSet: TDataSet): TNFeCBSDTO;
Begin
   Result := TNFeCBSDTO.Create;
   Result.pCBS := D(ADataSet, 'PCBS_UB56');
   Result.vCBS := D(ADataSet, 'VCBS_UB67');
   Result.pDif := D(ADataSet, 'PDIF_UB60');
   Result.vDif := D(ADataSet, 'VDIF_UB61');
   Result.pDevTrib := D(ADataSet, 'CST_Q06'); { <- Falta-UB62A }
   Result.vDevTrib := D(ADataSet, 'VDEVTRIB_UB63');
   Result.pRedAliq := D(ADataSet, 'PREDALIQ_UB65');
   Result.pAliqEfet := D(ADataSet, 'PALIQEFET_UB66');
End;

Class Function TNFeMapper.MapearGCBSGALCZFMCBS(ADataSet: TDataSet): TNFeALCZFMCBS;
Begin
   Result := TNFeALCZFMCBS.Create;
   Result.tpALCZFMCBS := I(ADataSet, 'TPALCZFMCBS_UB66B');
   Result.nProcSuframa := S(ADataSet, 'NPROCSUFRAMA_UB66C');
   Result.pAliqEfetRegCBS := D(ADataSet, 'PALIQEFETREGCBS_UB66D');
   Result.vTribRegCBS := D(ADataSet, 'VTRIBREGCBS_UB66E');
End;

Class Function TNFeMapper.MapearIBSCBSGTribRegular(ADataSet: TDataSet): TNFeTribRegularDTO;
Begin
   Result := TNFeTribRegularDTO.Create;
   Result.CSTReg := S(ADataSet, 'CSTREG_UB69');
   Result.cClassTribReg := S(ADataSet, 'CCLASSTRIBREG_UB70');
   Result.pAliqEfetRegIBSUF := D(ADataSet, 'PALIQEFETREGIBSUF_UB71');
   Result.vTribRegIBSUF := D(ADataSet, 'VTRIBREGIBSUF_UB72');
   Result.pAliqEfetRegIBSMun := D(ADataSet, 'PALIQEFETREGIBSMUN_UB72A');
   Result.vTribRegIBSMun := D(ADataSet, 'VTRIBREGIBSMUN_UB72B');
   Result.pAliqEfetRegCBS := D(ADataSet, 'PALIQEFETREGCBS_UB72C');
   Result.vTribRegCBS := D(ADataSet, 'VTRIBREGCBS_UB72D');
End;

Class Function TNFeMapper.MapearIBSCBSTribCompraGov(ADataSet: TDataSet): TNFeTribCompraGov;
Begin
   Result := TNFeTribCompraGov.Create;
   Result.pAliqIBSUF := D(ADataSet, 'PALIQIBSUF_UB82B');
   Result.vTribIBSUF := D(ADataSet, 'VTRIBIBSUF_UB82C');
   Result.pAliqIBSMun := D(ADataSet, 'PALIQIBSMUN_UB82D');
   Result.vTribIBSMun := D(ADataSet, 'VTRIBIBSMUN_UB82E');
   Result.pAliqCBS := D(ADataSet, 'PALIQCBS_UB82F');
   Result.vTribCBS := D(ADataSet, 'VTRIBCBS_UB82G');
End;

Class Function TNFeMapper.MapearGIBSMonoAdRemPadrao(ADataSet: TDataSet): TNFeIBSMonoAdRemPadraoDTO;
Begin
   Result := TNFeIBSMonoAdRemPadraoDTO.Create;
   Result.qBCMono := D(ADataSet, 'QBCMONO_UB86A');
   Result.adRemIBS := D(ADataSet, 'ADREMIBS_UB86B');
   Result.vIBSMono := D(ADataSet, 'VIBSMONO_UB86C');
End;

Class Function TNFeMapper.MapearGIBSMonoAdRemReten(ADataSet: TDataSet): TNFeIBSMonoAdRemRetenDTO;
Begin
   Result := TNFeIBSMonoAdRemRetenDTO.Create;

   Result.qBCMonoReten := D(ADataSet, 'QBCMONORETEN_UB87A');
   Result.adRemIBSReten := D(ADataSet, 'ADREMIBSRETEN_UB87B');
   Result.vIBSMonoReten := D(ADataSet, 'VIBSMONORETEN_UB87C');
End;

Class Function TNFeMapper.MapearGIBSMonoAdRemRet(ADataSet: TDataSet): TNFeIBSMonoAdRemRetDTO;
Begin
   Result := TNFeIBSMonoAdRemRetDTO.Create;

   Result.vIBSMonoRet := D(ADataSet, 'VIBSMONORET_UB88A');
End;

Class Function TNFeMapper.MapearGIBSMonoAdRemBioDiferenca(ADataSet: TDataSet): TNFeIBSMonoAdRemBioDiferencaDTO;
Begin
   Result := TNFeIBSMonoAdRemBioDiferencaDTO.Create;

   Result.qBCBioComb := D(ADataSet, 'QBCBIOCOMB_UB89A');
   Result.vIBSDiferenca := D(ADataSet, 'VIBSDIFERENCA_UB89B');
End;

Class Function TNFeMapper.MapearGIBSMonoAdRem(ADataSet: TDataSet): TNFeIBSMonoAdRemDTO;
Begin
   Result := TNFeIBSMonoAdRemDTO.Create;

   If B(ADataSet, 'IND_GMONOPADRAO') Then
      Result.gMonoPadrao := MapearGIBSMonoAdRemPadrao(ADataSet);

   If B(ADataSet, 'IND_GMONORETEN') Then
      Result.gMonoReten := MapearGIBSMonoAdRemReten(ADataSet);

   If B(ADataSet, 'IND_GMONORET') Then
      Result.gMonoRet := MapearGIBSMonoAdRemRet(ADataSet);

   If B(ADataSet, 'IND_GPB IODIFERENCA') Then
      Result.gpBioDiferenca := MapearGIBSMonoAdRemBioDiferenca(ADataSet);
End;

Class Function TNFeMapper.MapearGIBSMonoAdValoremPadrao(ADataSet: TDataSet): TNFeIBSMonoAdValoremPadraoDTO;
Begin
   Result := TNFeIBSMonoAdValoremPadraoDTO.Create;

   Result.vBCMono := D(ADataSet, 'VBCMONO_UB91A');
   Result.pAliqMonoUF := D(ADataSet, 'PALIQMONOUF_UB91B');
   Result.vIBSMonoUF := D(ADataSet, 'VIBSMONOUF_UB91C');
   Result.pAliqMonoMun := D(ADataSet, 'PALIQMONOMUN_UB91D');
   Result.vIBSMonoMun := D(ADataSet, 'VIBSMONOMUN_UB91E');
   Result.vIBSMono := D(ADataSet, 'VIBSMONO_UB91F');
End;

Class Function TNFeMapper.MapearGIBSMonoAdValoremReten(ADataSet: TDataSet): TNFeIBSMonoAdValoremRetenDTO;
Begin
   Result := TNFeIBSMonoAdValoremRetenDTO.Create;
   Result.vBCMonoReten := D(ADataSet, 'VBCMONORETEN_UB92A');
   Result.pAliqMonoReten := D(ADataSet, 'PALIQMONORETEN_UB92B');
   Result.vIBSMonoReten := D(ADataSet, 'VIBSMONORETEN_UB92C');
End;

Class Function TNFeMapper.MapearGIBSMun(ADataSet: TDataSet): TNFeIBSMunDTO;
Begin
   Result := TNFeIBSMunDTO.Create;
   Result.pIBSMun := D(ADataSet, 'PIBSMUN_UB37');
   Result.vIBSMun := D(ADataSet, 'VIBSMUN_UB54');
   Result.pDif := D(ADataSet, 'PDIF_UB41');
   Result.vDif := D(ADataSet, 'VDIF_UB42');
   Result.pDevTrib := D(ADataSet, 'PDEVTRIB_UB43A');
   Result.vDevTrib := D(ADataSet, 'VDEVTRIB_UB44');
   Result.pRedAliq := D(ADataSet, 'PREDALIQ_UB46');
   Result.pAliqEfet := D(ADataSet, 'PALIQEFET_UB47');
End;

Class Function TNFeMapper.MapearGIBSUF(ADataSet: TDataSet): TNFeIBSUFDTO;
Begin
   Result := TNFeIBSUFDTO.Create;
   Result.pIBSUF := D(ADataSet, 'PIBSUF_UB18');
   Result.vIBSUF := D(ADataSet, 'VIBSUF_UB35');
   Result.pDif := D(ADataSet, 'PDIF_UB22');
   Result.vDif := D(ADataSet, 'VDIF_UB23');
   Result.pDevTrib := D(ADataSet, 'PDEVTRIB_UB24A');
   Result.vDevTrib := D(ADataSet, 'VDEVTRIB_UB25');
   Result.pRedAliq := D(ADataSet, 'PREDALIQ_UB27');
   Result.pAliqEfet := D(ADataSet, 'PALIQEFET_UB28');
End;

Class Procedure TNFeMapper.MapearIS(ADataSet: TDataSet; ADTO: TNFeISDTO);
Begin
   { IS }
   ADTO.CST := S(ADataSet, 'CSTIS_UB02');
   ADTO.cClassTribIS := S(ADataSet, 'CCLASSTRIBIS_UB03');
   ADTO.vBCIS := D(ADataSet, 'VBCIS_UB05');
   ADTO.PIS := D(ADataSet, 'PIS_UB06');
   ADTO.adRemIS := D(ADataSet, 'PISESPEC_UB07');
   ADTO.uTrib := S(ADataSet, 'UTRIB_UB09');
   ADTO.qTrib := D(ADataSet, 'QTRIB_UB10');
   ADTO.vIS := D(ADataSet, 'VIS_UB11');
End;

Class Procedure TNFeMapper.MapearIBSCBS(ADataSet: TDataSet; ADTO: TNFeIBSCBSDTO);
Begin
   { UB12 - IBS/CBS }
   { UB17 } ADTO.gIBSUF := MapearGIBSUF(ADataSet);
   { UB36 } ADTO.gIBSMun := MapearGIBSMun(ADataSet);
   { UB55 } ADTO.gCBS := MapearGCBS(ADataSet);
   { UB66a } ADTO.gCBS.gALCZFMCBS := MapearGCBSGALCZFMCBS(ADataSet);
   { UB68 } ADTO.gTribRegular := MapearIBSCBSGTribRegular(ADataSet);
   { UB82a } ADTO.gTribCompraGov := MapearIBSCBSTribCompraGov(ADataSet);

   { IBS-MonoAdRem }
   { UB86 } ADTO.gIBSCBSMono.gIBSMonoAdRem.gMonoPadrao := MapearGIBSMonoAdRemPadrao(ADataSet);
   { UB87 } ADTO.gIBSCBSMono.gIBSMonoAdRem.gMonoReten := MapearGIBSMonoAdRemReten(ADataSet);
   { UB88 } ADTO.gIBSCBSMono.gIBSMonoAdRem.gMonoRet := MapearGIBSMonoAdRemRet(ADataSet);
   { UB89 } ADTO.gIBSCBSMono.gIBSMonoAdRem.gpBioDiferenca := MapearGIBSMonoAdRemBioDiferenca(ADataSet);

   { IBS-MonoAdValorem }
   { UB91 } ADTO.gIBSCBSMono.gIBSMonoAdValorem.gMonoPadrao := MapearGIBSMonoAdValoremPadrao(ADataSet);
   { UB92 } ADTO.gIBSCBSMono.gIBSMonoAdValorem.gMonoReten := MapearGIBSMonoAdValoremReten(ADataSet);
   { UB93 } ADTO.gIBSCBSMono.gIBSMonoAdValorem.gMonoRet := MapearGIBSMonoAdValoremRet(ADataSet);
   { UB94 } ADTO.gIBSCBSMono.gIBSMonoAdValorem.gpBioDiferenca := MapearGIBSMonoAdValoremBioDiferenca(ADataSet);

   { CBS-MonoAdRem }
   { UB96 } ADTO.gIBSCBSMono.gCBSMonoAdRem.gMonoPadrao := MapearGCBSMonoAdRemPadrao(ADataSet);
   { UB97 } ADTO.gIBSCBSMono.gCBSMonoAdRem.gMonoReten := MapearGCBSMonoAdRemReten(ADataSet);
   { UB98 } ADTO.gIBSCBSMono.gCBSMonoAdRem.gMonoRet := MapearGCBSMonoAdRemRet(ADataSet);
   { UB99 } ADTO.gIBSCBSMono.gCBSMonoAdRem.gpBioDiferenca := MapearGCBSMonoAdRemBioDiferenca(ADataSet);

   { CBS-MonoAdValorem }
   { UB101 } ADTO.gIBSCBSMono.gCBSMonoAdValorem.gMonoPadrao := MapearGCBSMonoAdValoremPadrao(ADataSet);
   { UB102 } ADTO.gIBSCBSMono.gCBSMonoAdValorem.gMonoReten := MapearGCBSMonoAdValoremReten(ADataSet);
   { UB103 } ADTO.gIBSCBSMono.gCBSMonoAdValorem.gMonoRet := MapearGCBSMonoAdValoremRet(ADataSet);
   { UB104 } ADTO.gIBSCBSMono.gCBSMonoAdValorem.gpBioDiferenca := MapearGCBSMonoAdValoremBioDiferenca(ADataSet);

   { Totais-Mono }
   { UB105 } ADTO.gIBSCBSMono := MapearGIBSCBSMono(ADataSet);

   { UB106 } MapearTransfCred(ADataSet, ADTO.gTransfCred);
   { UB112 } MapearAjusteCompet(ADataSet, ADTO.gAjusteCompet);
   { UB116 } MapearEstornoCred(ADataSet, ADTO.gEstornoCred);
   { UB120 } MapearCredPresOper(ADataSet, ADTO.gCredPresOper);
   { UB131 } MapearCredPresIBSZFM(ADataSet, ADTO.gCredPresIBSZFM);
End;

Class Procedure TNFeMapper.MapearISIBSCBS(ADataSet: TDataSet; ADTO: TNFeIBSCBSDTO);
Begin

   ADTO.CST := S(ADataSet, 'CST_UB13');
   ADTO.cClassTrib := S(ADataSet, 'CCLASSTRIB_UB14');
   ADTO.indDoacao := I(ADataSet, 'INDDOACAO_UB14A');
   ADTO.vBC := D(ADataSet, 'VBC_UB16');

   { UB01 } MapearIS(ADataSet, ADTO.gIs);
   { UB12 } MapearIBSCBS(ADataSet, ADTO);
End;

Class Function TNFeMapper.MapearGIBSMonoAdValoremRet(ADataSet: TDataSet): TNFeIBSMonoAdValoremRetDTO;
Begin
   Result := TNFeIBSMonoAdValoremRetDTO.Create;
   Result.vIBSMonoRet := D(ADataSet, 'VIBSMONORET_UB93A');
End;

Class Function TNFeMapper.MapearGIBSMonoAdValoremBioDiferenca(ADataSet: TDataSet): TNFeIBSMonoAdValoremBioDiferencaDTO;
Begin
   Result := TNFeIBSMonoAdValoremBioDiferencaDTO.Create;

   Result.qBCBioComb := D(ADataSet, 'QBCBIOCOMB_UB94A');
   Result.vIBSDiferenca := D(ADataSet, 'VIBSDIFERENCA_UB94B');
End;

Class Function TNFeMapper.MapearGCBSMonoAdRemPadrao(ADataSet: TDataSet): TNFeCBSMonoAdRemPadraoDTO;
Begin
   Result := TNFeCBSMonoAdRemPadraoDTO.Create;

   Result.qBCMono := D(ADataSet, 'QBCMONO_UB96A');
   Result.adRemCBS := D(ADataSet, 'ADREMCBS_UB96B');
   Result.vCBSMono := D(ADataSet, 'VCBSMONO_UB96C');
End;

Class Function TNFeMapper.MapearGCBSMonoAdRemReten(ADataSet: TDataSet): TNFeCBSMonoAdRemRetenDTO;
Begin
   Result := TNFeCBSMonoAdRemRetenDTO.Create;

   Result.qBCMonoReten := D(ADataSet, 'QBCMONORETEN_UB97A');
   Result.adRemCBSReten := D(ADataSet, 'ADREMCBSRETEN_UB97B');
   Result.vCBSMonoReten := D(ADataSet, 'VCBSMONORETEN_UB97C');
End;

Class Function TNFeMapper.MapearGCBSMonoAdRemRet(ADataSet: TDataSet): TNFeCBSMonoAdRemRetDTO;
Begin
   Result := TNFeCBSMonoAdRemRetDTO.Create;

   Result.vCBSMonoRet := D(ADataSet, 'VCBSMONORET_UB98A');
End;

Class Function TNFeMapper.MapearGCBSMonoAdRemBioDiferenca(ADataSet: TDataSet): TNFeCBSMonoAdRemBioDiferencaDTO;
Begin
   Result := TNFeCBSMonoAdRemBioDiferencaDTO.Create;

   Result.qBCBioComb := D(ADataSet, 'QBCBIOCOMB_UB99A');
   Result.vCBSDiferenca := D(ADataSet, 'VCBSDIFERENCA_UB99B');
End;

Class Function TNFeMapper.MapearGCBSMonoAdValoremPadrao(ADataSet: TDataSet): TNFeCBSMonoAdValoremPadraoDTO;
Begin
   Result := TNFeCBSMonoAdValoremPadraoDTO.Create;

   Result.vBCMono := D(ADataSet, 'VBCMONO_UB101A');
   Result.pAliqMonoCBS := D(ADataSet, 'PALIQMONOCBS_UB101B');
   Result.vCBSMono := D(ADataSet, 'VCBSMONO_UB101C');
End;

Class Function TNFeMapper.MapearGCBSMonoAdValoremReten(ADataSet: TDataSet): TNFeCBSMonoAdValoremRetenDTO;
Begin
   Result := TNFeCBSMonoAdValoremRetenDTO.Create;

   Result.vBCMonoReten := D(ADataSet, 'VBCMONORETEN_UB102A');
   Result.pAliqMonoReten := D(ADataSet, 'PALIQMONORETEN_UB102B');
   Result.vCBSMonoReten := D(ADataSet, 'VCBSMONORETEN_UB102C');
End;

Class Function TNFeMapper.MapearGCBSMonoAdValoremRet(ADataSet: TDataSet): TNFeCBSMonoAdValoremRetDTO;
Begin
   Result := TNFeCBSMonoAdValoremRetDTO.Create;

   Result.vCBSMonoRet := D(ADataSet, 'VCBSMONORET_UB103A');
End;

Class Function TNFeMapper.MapearGCBSMonoAdValoremBioDiferenca(ADataSet: TDataSet): TNFeCBSMonoAdValoremBioDiferencaDTO;
Begin
   Result := TNFeCBSMonoAdValoremBioDiferencaDTO.Create;
   Result.qBCBioComb := D(ADataSet, 'QBCBIOCOMB_UB104A');
   Result.vCBSDiferenca := D(ADataSet, 'VCBSDIFERENCA_UB104B');
End;

Class Function TNFeMapper.MapearGIBSCBSMono(ADataSet: TDataSet): TNFeIBSCBSMonoDTO;
Begin
   Result := TNFeIBSCBSMonoDTO.Create;
   Result.vTotIBSMonoItem := D(ADataSet, 'VTOTIBSMONOITEM_UB105a');
   Result.vTotCBSMonoItem := D(ADataSet, 'VTOTCBSMONOITEM_UB105b');
End;

Class Procedure TNFeMapper.MapearTransfCred(ADataSet: TDataSet; ADTO: TNFeTransfCredDTO);
Begin
   ADTO.vIBS := D(ADataSet, 'VIBS_UB107');
   ADTO.vCBS := D(ADataSet, 'VCBS_UB108');
End;

Class Procedure TNFeMapper.MapearAjusteCompet(ADataSet: TDataSet; ADTO: TNFeAjusteCompetDTO);
Begin
   ADTO.competApur := S(ADataSet, 'COMPETAPUR_UB113');
   ADTO.vIBS := D(ADataSet, 'VIBS_UB114');
   ADTO.vCBS := D(ADataSet, 'VCBS_UB115');
End;

Class Procedure TNFeMapper.MapearEstornoCred(ADataSet: TDataSet; ADTO: TNFeEstornoCredDTO);
Begin
   ADTO.vIBSEstCred := D(ADataSet, 'VIBSESTCRED_UB117');
   ADTO.vCBSEstCred := D(ADataSet, 'VCBSESTCRED_UB118');
End;

Class Procedure TNFeMapper.MapearCredPresOper(ADataSet: TDataSet; ADTO: TNFeCredPresOperDTO);
Begin
   ADTO.vBCCredPres := D(ADataSet, 'VBCCREDPRES_UB121');
   ADTO.cCredPres := S(ADataSet, 'CCREDPRES_UB122');
   { UB123 } MapearIBSCredPres(ADataSet, ADTO.gIBSCredPres);
   { UB127 } MapearCBSCredPres(ADataSet, ADTO.gCBSCredPres);
End;

Class Procedure TNFeMapper.MapearIBSCredPres(ADataSet: TDataSet; ADTO: TNFeIBSCredPresDTO);
Begin
   ADTO.pCredPres := D(ADataSet, 'PCREDPRES_UB124');
   ADTO.vCredPres := D(ADataSet, 'VCREDPRES_UB125');
   ADTO.vCredPresCondSus := D(ADataSet, 'VCREDPRESCONDSUS_UB126');
End;

Class Procedure TNFeMapper.MapearCBSCredPres(ADataSet: TDataSet; ADTO: TNFeCBSCredPresDTO);
Begin
   ADTO.pCredPres := D(ADataSet, 'PCREDPRES_UB128');
   ADTO.vCredPres := D(ADataSet, 'VCREDPRES_UB129');
   ADTO.vCredPresCondSus := D(ADataSet, 'VCREDPRESCONDSUS_UB130');
End;

Class Procedure TNFeMapper.MapearCredPresIBSZFM(ADataSet: TDataSet; ADTO: TNFeCredPresIBSZFMDTO);
Begin
   ADTO.competApur := S(ADataSet, 'COMPETAPUR_UB132');
   ADTO.tpCredPresIBSZFM := I(ADataSet, 'TPCREDPRESIBSZFM_UB133');
   ADTO.vCredPresIBSZFM := D(ADataSet, 'VCREDPRESIBSZFM_UB134');
End;

{$ENDREGION}

End.
