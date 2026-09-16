Unit NFeDTO_Old;

Interface

Uses
   System.Generics.Collections;

Type
   TNFeEnderecoDTO = Class
   Public
      CNPJ: String;
      CPF: String;
      xLgr: String;
      nro: String;
      xCpl: String;
      xBairro: String;
      cMun: String;
      xMun: String;
      UF: String;
      CEP: String;
      cPais: String;
      xPais: String;
      fone: String;
   End;

   TNFeIdeDTO = Class
   Public
      nNF: Integer;
      cUF: Integer;
      cNF: String;
      natOp: String;
      cMunFG: String;
      mod_: Integer;
      serie: Integer;
      dhEmi: String;
      dhSaiEnt: String;
      tpNF: Integer;
      idDest: Integer;
      tpImp: Integer;
      tpEmis: Integer;
      cDV: Integer;
      tpAmb: Integer;
      finNFe: Integer;
      indFinal: Integer;
      indPres: Integer;
      procEmi: Integer;
      verProc: String;
      dhCont: String;
      xJust: String;
      indIntermed: Integer;
      dPrevEntrega: String;
      cMunFGIBS: String;
      tpNFDebito: Integer;
      tpNFCredito: Integer;
      tpEnteGov: Integer;
      pRedutor: Double;
      tpOperGov: Integer;
      cIndOp: String;
      tpEnteGovBB: Integer;
      pRedutorBB: Double;
      tpOperGovBB: Integer;
   End;

   TNFeEmitDTO = Class
   Public
      CNPJ: String;
      CPF: String;
      xNome: String;
      xFant: String;
      Endereco: TNFeEnderecoDTO;
      IE: String;
      IEST: String;
      IM: String;
      CNAE: String;
      CRT: Integer;
      ISUF: String;
      Destructor Destroy; Override;
   End;

   TNFeDestDTO = Class
   Public
      CNPJ: String;
      CPF: String;
      idEstrangeiro: String;
      xNome: String;
      Endereco: TNFeEnderecoDTO;
      indIEDest: Integer;
      IE: String;
      ISUF: String;
      IM: String;
      email: String;
      Destructor Destroy; Override;
   End;

   TNFeReferenciadoDTO = Class
   Public
      refNFe: String;
      refCTe: String;
      refDFeAnt: String;
      nItem: Integer;
   End;

   TNFeLocalDTO = Class
   Public
      CNPJ: String;
      CPF: String;
      Endereco: TNFeEnderecoDTO;
      Destructor Destroy; Override;
   End;

   TNFeAutorizacaoXMLDTO = Class
   Public
      CNPJ: String;
      CPF: String;
   End;

   TNFeProdutoDTO = Class
   Public
      cProd: String;
      cEAN: String;
      xProd: String;
      NCM: String;
      EXTIPI: String;
      CFOP: String;
      uCom: String;
      qCom: Double;
      vUnCom: Double;
      vProd: Double;
      cEANTrib: String;
      uTrib: String;
      qTrib: Double;
      vUnTrib: Double;
      vFrete: Double;
      vSeg: Double;
      vDesc: Double;
      vOutro: Double;
      indTot: Integer;
      xPed: String;
      nItemPed: String;
      nFCI: String;
      NVE: String;
      vTotTrib: Double;
      CEST: String;
      indEscala: String;
      CNPJFab: String;
      cBenef: String;
      chNFe: String;
      nItem: Integer;
   End;

   TNFeICMSDTO = Class
   Public
      orig: Integer;
      CST: String;
      CSOSN: String;
      modBC: Integer;
      pRedBC: Double;
      vBC: Double;
      pICMS: Double;
      vICMSOp: Double;
      pDif: Double;
      vICMSDif: Double;
      vICMS: Double;
      modBCST: Integer;
      pMVAST: Double;
      pRedBCST: Double;
      vBCST: Double;
      pICMSST: Double;
      vICMSST: Double;
      UFST: String;
      pBCOp: Double;
      vBCSTRET: Double;
      vICMSSTRET: Double;
      vICMSDeson: Double;
      motDesICMS: Integer;
      pCredSN: Double;
      vCredICMSSN: Double;
      vBCSTDest: Double;
      vICMSSTDest: Double;
      vBCUFDest: Double;
      pFCPUFDest: Double;
      pICMSUFDest: Double;
      pICMSInter: Double;
      pICMSInterPart: Double;
      vFCPUFDest: Double;
      vICMSUFDest: Double;
      vICMSUFRemet: Double;
      vBCFCP: Double;
      pFCP: Double;
      vFCP: Double;
      vBCFCPST: Double;
      pFCPST: Double;
      vFCPST: Double;
      pST: Double;
      vBCFCPSTRET: Double;
      pFCPSTRET: Double;
      vFCPSTRET: Double;
      vBCFCPUFDest: Double;
      qBCMono: Double;
      adRemICMS: Double;
      vICMSMono: Double;
      qBCMonoReten: Double;
      adRemICMSReten: Double;
      vICMSMonoReten: Double;
      vICMSMonoOp: Double;
      pDifMono: Double;
      vICMSMonoDif: Double;
      qBCMonoRet: Double;
      adRemICMSRet: Double;
      vICMSMonoRet: Double;
      pRedAdRem: Double;
      motRedAdRem: Integer;
   End;

   TNFePISDTO = Class
   Public
      CST: String;
      vBC: Double;
      pPIS: Double;
      vPIS: Double;
      qBCProd: Double;
      vAliqProd: Double;
   End;

   TNFeCOFINSDTO = Class
   Public
      CST: String;
      vBC: Double;
      pCOFINS: Double;
      qBCProd: Double;
      vAliqProd: Double;
      vCOFINS: Double;
   End;

   TNFeISSQNDTO = Class
   Public
      vBC: Double;
      vAliq: Double;
      vISSQN: Double;
      cMunFG: String;
      cListServ: String;
      vDeducao: Double;
      vOutro: Double;
      vDescIncond: Double;
      vDescCond: Double;
      vISSRet: Double;
      indISS: Integer;
      cServico: String;
      cMun: String;
      cPais: String;
      nProcesso: String;
      indIncentivo: Integer;
   End;

   TNFeIPIDTO = Class
   Public
      CNPJProd: String;
      cSelo: String;
      qSelo: Integer;
      cEnq: String;
      CST: String;
      vBC: Double;
      qUnid: Double;
      vUnid: Double;
      pIPI: Double;
      vIPI: Double;
      cIEnq: String;
      pDevol: Double;
      vIPIDevol: Double;
   End;

   TNFeCombustivelDTO = Class
   Public
      cProdANP: String;
      descANP: String;
      CODIF: String;
      qTemp: Double;
      UFCons: String;
      pMixGN: Double;
      pGLP: Double;
      pGNn: Double;
      pGNi: Double;
      vPart: Double;
      qBCProd: Double;
      vAliqProd: Double;
      vCIDE: Double;
      nBico: Integer;
      nBomba: Integer;
      nTanque: Integer;
      vEncIni: Double;
      vEncFin: Double;
      pBio: Double;
   End;

   TNFeIBSCBSDTO = Class
   Public
      vIS: Double;
      vBC: Double;
      vDif: Double;
      vDevTrib: Double;
      vIBSUF: Double;
      vIBSMun: Double;
      vIBS: Double;
      vCredPres: Double;
      vCredPresCondSus: Double;
      vCBS: Double;
      vCredPresCBS: Double;
      vIBSMono: Double;
      vCBSMono: Double;
      vIBSMonoReten: Double;
      vCBSMonoReten: Double;
      vIBSMonoRet: Double;
      vCBSMonoRet: Double;
      vIBSEstCred: Double;
      vCBSEstCred: Double;
   End;

   TNFeImpostoDTO = Class
   Public
      ICMS: TNFeICMSDTO;
      PIS: TNFePISDTO;
      COFINS: TNFeCOFINSDTO;
      ISSQN: TNFeISSQNDTO;
      IPI: TNFeIPIDTO;
      Combustivel: TNFeCombustivelDTO;
      IBSCBS: TNFeIBSCBSDTO;
      Destructor Destroy; Override;
   End;

   TNFeItemDTO = Class
   Public
      ID: Integer;
      IDSefaz: Integer;
      infAdProd: String;
      Produto: TNFeProdutoDTO;
      Imposto: TNFeImpostoDTO;
    // destructor Destroy; override;
   End;

   TNFeTotalISSQNDTO = Class
   Public
      vServ: Double;
      vBC: Double;
      vISS: Double;
      vPIS: Double;
      vCOFINS: Double;
      dCompet: String;
      vDeducao: Double;
      vOutro: Double;
      vDescIncond: Double;
      vDescCond: Double;
      vISSRet: Double;
      cRegTrib: Integer;
   End;

   TNFeTotalRetencaoDTO = Class
   Public
      vRetPIS: Double;
      vRetCOFINS: Double;
      vRetCSLL: Double;
      vBCIRRF: Double;
      vIRRF: Double;
      vBCRetPrev: Double;
      vRetPrev: Double;
   End;

   TNFeTotalDTO = Class
   Public
   End;

   TNFeTotalDTO = Class
   Private
   Public
      vBC: Double;
      vICMS: Double;
      vICMSDeson: Double;
      vBCST: Double;
      vST: Double;
      vProd: Double;
      vFrete: Double;
      vSeg: Double;
      vDesc: Double;
      vII: Double;
      vIPI: Double;
      vPIS: Double;
      vCOFINS: Double;
      vOutro: Double;
      vNF: Double;
      vTotTrib: Double;
      vFCPUFDest: Double;
      vICMSUFDest: Double;
      vICMSUFRemet: Double;
      vFCP: Double;
      vFCPST: Double;
      vFCPSTRET: Double;
      vIPIDevol: Double;
      qBCMono: Double;
      vICMSMono: Double;
      qBCMonoReten: Double;
      vICMSMonoReten: Double;
      qBCMonoRet: Double;
      vICMSMonoRet: Double;
      vIS: Double;
      vBCIBSCBS: Double;
      vDif: Double;
      vDevTrib: Double;
      vIBSUF: Double;
      vIBSMun: Double;
      vIBS: Double;
      vCredPres: Double;
      vCredPresCondSus: Double;
      vCBS: Double;
      vCredPresCBS: Double;
      vIBSMono: Double;
      vCBSMono: Double;
      vIBSMonoReten: Double;
      vCBSMonoReten: Double;
      vIBSMonoRet: Double;
      vCBSMonoRet: Double;
      vIBSEstCred: Double;
      vCBSEstCred: Double;
      vNFTot: Double;
      ISSQN: TNFeTotalISSQNDTO;
      Retencao: TNFeTotalRetencaoDTO;
    // destructor Destroy; override;
   End;

   TNFeTransportadorDTO = Class
   Public
      CNPJ: String;
      CPF: String;
      xNome: String;
      IE: String;
      xEnder: String;
      xMun: String;
      UF: String;
   End;

   TNFeRetencaoICMSTransporteDTO = Class
   Public
      vServ: Double;
      vBCRet: Double;
      pICMSRet: Double;
      vICMSRet: Double;
      CFOP: String;
      cMunFG: String;
   End;

   TNFeVeiculoDTO = Class
   Public
      placa: String;
      UF: String;
      RNTC: String;
   End;

   TNFeLacreDTO = Class
   Public
      nLacre: String;
   End;

   TNFeVolumeDTO = Class
   Public
      qVol: Double;
      esp: String;
      marca: String;
      nVol: String;
      pesoL: Double;
      pesoB: Double;
      Lacres: TObjectList<TNFeLacreDTO>;
      Constructor Create;
      Destructor Destroy; Override;
   End;

   TNFeTransporteDTO = Class
   Public
      modFrete: Integer;
      Transportador: TNFeTransportadorDTO;
      RetencaoICMS: TNFeRetencaoICMSTransporteDTO;
      Veiculo: TNFeVeiculoDTO;
      Volumes: TObjectList<TNFeVolumeDTO>;
   End;

   TNFeDuplicataDTO = Class
   Public
      nDup: String;
      dVenc: String;
      vDup: Double;
   End;

   TNFeCobrancaDTO = Class
   Public
      nFat: String;
      vOrig: Double;
      vDesc: Double;
      vLiq: Double;
      Duplicatas: TObjectList<TNFeDuplicataDTO>;
      Constructor Create;
      Destructor Destroy; Override;
   End;

   TNFePagamentoDTO = Class
   Public
      indPag: Integer;
      tPag: String;
      xPag: String;
      vPag: Double;
      tpIntegra: Integer;
      CNPJ: String;
      tBand: String;
      cAut: String;
      vTroco: Double;
   End;

   TNFeExportacaoDTO = Class
   Public
      nRE: String;
      chNFe: String;
      qExport: Double;
   End;

   TNFeInfAdicDTO = Class
   Public
      infAdFisco: String;
      infCpl: String;
   End;

   TNFeResponsavelTecnicoDTO = Class
   Public
      CNPJ: String;
      xContato: String;
      email: String;
      fone: String;
      idCSRT: String;
      hashCSRT: String;
   End;

   TNFeDTO = Class
   Public
      Ide: TNFeIdeDTO;
      Emit: TNFeEmitDTO;
      Dest: TNFeDestDTO;
      Referencias: TObjectList<TNFeReferenciadoDTO>;
      Retirada: TNFeLocalDTO;
      Entrega: TNFeLocalDTO;
      AutorizacoesXML: TObjectList<TNFeAutorizacaoXMLDTO>;
      Itens: TObjectList<TNFeItemDTO>;
      Total: TNFeTotalDTO;
      Transporte: TNFeTransporteDTO;
      Cobranca: TNFeCobrancaDTO;
      Pagamentos: TObjectList<TNFePagamentoDTO>;
      Exportacao: TNFeExportacaoDTO;
      InfAdic: TNFeInfAdicDTO;
      ResponsavelTecnico: TNFeResponsavelTecnicoDTO;
      Constructor Create;
      Destructor Destroy; Override;
   End;

Implementation

Destructor TNFeEmitDTO.Destroy;
Begin
   Endereco.Free;
   Inherited;
End;

Destructor TNFeDestDTO.Destroy;
Begin
   Endereco.Free;
   Inherited;
End;

Destructor TNFeLocalDTO.Destroy;
Begin
   Endereco.Free;
   Inherited;
End;

Constructor TNFeVolumeDTO.Create;
Begin
   Lacres := TObjectList<TNFeLacreDTO>.Create(True);
End;

Destructor TNFeVolumeDTO.Destroy;
Begin
   Lacres.Free;
   Inherited;
End;

{
constructor TNFeTransporteDTO.Create;
begin
  Volumes := TObjectList<TNFeVolumeDTO>.Create(True);
end;
destructor TNFeTransporteDTO.Destroy;
begin
  Transportador.Free;
  RetencaoICMS.Free;
  Veiculo.Free;
  Volumes.Free;
  inherited;
end;
}
Constructor TNFeCobrancaDTO.Create;
Begin
   Duplicatas := TObjectList<TNFeDuplicataDTO>.Create(True);
End;

Destructor TNFeCobrancaDTO.Destroy;
Begin
   Duplicatas.Free;
   Inherited;
End;

Constructor TNFeDTO.Create;
Begin
   Referencias := TObjectList<TNFeReferenciadoDTO>.Create(True);
   AutorizacoesXML := TObjectList<TNFeAutorizacaoXMLDTO>.Create(True);
   Itens := TObjectList<TNFeItemDTO>.Create(True);
   Pagamentos := TObjectList<TNFePagamentoDTO>.Create(True);
End;

Destructor TNFeDTO.Destroy;
Begin
   Referencias.Free;
   AutorizacoesXML.Free;
   Itens.Free;
   Pagamentos.Free;
   Ide.Free;
   Emit.Free;
   Dest.Free;
   Retirada.Free;
   Entrega.Free;
   Total.Free;
   Transporte.Free;
   Cobranca.Free;
   Exportacao.Free;
   InfAdic.Free;
   ResponsavelTecnico.Free;
   Inherited;
End;
{ TNFeImpostoDTO }

Destructor TNFeImpostoDTO.Destroy;
Begin
  //
   Inherited;
End;

{ TNFeItemDTO }

Destructor TNFeItemDTO { TNFeItemDTO }

{ destructor TNFeItemDTO.Destroy;
begin

  inherited;
end;

 TNFeItemDTO }

   Destructor TNFeItemDTO.Destroy;
Begin

   Inherited;
End;

Destroy;
Begin

   Inherited;
End;

nd.
