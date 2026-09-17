Unit NFe.DTO;

Interface

Uses
   System.Generics.Collections, REST.Json.Types;

Type
   // DECLARAÇÕES DAS CLASSES
   { B } TNFeIdeDTO = Class;
   { BA } TNFeDocReferenciadoDTO = Class;
   { BB } TNFeCompraGovDTO = Class;
   { BC } TNFePagamentoAntecipadoDTO = Class;
   { C } TNFeEmitDTO = Class;
   { E } TNFeDestDTO = Class;
   { C/E } TNFeEnderecoDTO = Class;
   { F } TNFeRetiradaDTO = Class;
   { G } TNFeEntregaDTO = Class;
   { GA } TNFeAutorizacaoDTO = Class;
   { H } TNFeItemDTO = Class;
   { I } TNFeProdutoDTO = Class;
   { LA } TNFeCombustivelDTO = Class;
   { LA07 } TNFeCIDECombustivelDTO = Class;
   { LA11 } TNFeEncerranteDTO = Class;
   { M } TNFeImpostoDTO = Class;
   { N } TNFeICMSDTO = Class;
   { Q } TNFePISDTO = Class;
   { S } TNFeCOFINSDTO = Class;
   { U } TNFeISSQNDTO = Class;
   { UA } TNFeImpostoDevolDTO = Class;
   { UA03 } TNFeIPIImpostoDevolDTO = Class;
   { UB } TNFeIBSCBSDTO = Class;
   { UB01 } TNFeISDTO = Class;
   { UB17 } TNFeIBSUFDTO = Class;
   { UB36 } TNFeIBSMunDTO = Class;
   { UB55 } TNFeCBSDTO = Class;
   { UB66a } TNFeALCZFMCBS = Class;
   { UB68 } TNFeTribRegularDTO = Class;
   { UB82a } TNFeTribCompraGov = Class;
   { UB84 } TNFeIBSCBSMonoDTO = Class;
   { UB85a } TNFeIBSMonoAdRemDTO = Class;
   { UB86 } TNFeIBSMonoAdRemPadraoDTO = Class;
   { UB87 } TNFeIBSMonoAdRemRetenDTO = Class;
   { UB88 } TNFeIBSMonoAdRemRetDTO = Class;
   { UB89 } TNFeIBSMonoAdRemBioDiferencaDTO = Class;
   { UB90 } TNFeIBSMonoAdValoremDTO = Class;
   { UB91 } TNFeIBSMonoAdValoremPadraoDTO = Class;
   { UB92 } TNFeIBSMonoAdValoremRetenDTO = Class;
   { UB93 } TNFeIBSMonoAdValoremRetDTO = Class;
   { UB94 } TNFeIBSMonoAdValoremBioDiferencaDTO = Class;
   { UB95a } TNFeCBSMonoAdRemDTO = Class;
   { UB96 } TNFeCBSMonoAdRemPadraoDTO = Class;
   { UB97 } TNFeCBSMonoAdRemRetenDTO = Class;
   { UB98 } TNFeCBSMonoAdRemRetDTO = Class;
   { UB99 } TNFeCBSMonoAdRemBioDiferencaDTO = Class;
   { UB100 } TNFeCBSMonoAdValoremDTO = Class;
   { UB101 } TNFeCBSMonoAdValoremPadraoDTO = Class;
   { UB102 } TNFeCBSMonoAdValoremRetenDTO = Class;
   { UB103 } TNFeCBSMonoAdValoremRetDTO = Class;
   { UB104 } TNFeCBSMonoAdValoremBioDiferencaDTO = Class;

   // IMPLEMENTAR
   { UB105a - Totais do Item }
   { UB106 - gTransfCred }
   { UB112 - gAjusteCompet }
   { UB116 - gEstornoCred }
   { UB120 - gCredPresOper }
   { UB123 - gIBSCredPres }
   { UB127 - gCBSCredPres }
   { UB131 - gCredPresIBSZFM }
   // *************************

   { VC } TNFeDFeReferenciadoDTO = Class;
   { W-W02 } TNFeICMSTotDTO = Class;
   { W-W17 } TNFeISSQNTotDTO = Class;
   { W-W23 } TNFeRetTribTotDTO = Class;
   { W03 } TNFeTotalISIBSCBSDTO = Class;
   { W31 } TNFeISTotDTO = Class;
   { W34 } TNFeIBSCBSTotDTO = Class;
   { W36 } TNFeIBSTotDTO = Class;
   { W37 } TNFeIBSUFTotDTO = Class;
   { W42 } TNFeIBSMunTotDTO = Class;
   { W50 } TNFeCBSTotDTO = Class;
   { W57 } TNFeMonoTotDTO = Class;
   { W59e } TNFeEstornoCredTot = Class;
   { X } TNFeTransporteDTO = Class;
   { X03 } TNFeTransportadorDTO = Class;
   { X11 } TNFeRetTranspDTO = Class;
   { X18/X22 } TNFeVeicTranspDTO = Class;
   { X26 } TNFeVolumeDTO = Class;
   { X33 } TNFeLacreDTO = Class;
   { Y } TNFeCobrDTO = Class;
   { Y02 } TNFeFaturaDTO = Class;
   { Y07 } TNFeDuplicataDTO = Class;
   { YA } TNFePagamentoDTO = Class;
   { YA01a } TNFeDetalhePagamentoDTO = Class;
   { Z } TNFeInfoAdicionalDTO = Class;
   { Z04 } TNFeObsContDTO = Class;
   { Z07 } TNFeObsFiscoDTO = Class;
   { Z10 } TNFeProcRefDTO = Class;
   { YA04 } TNFeCartaoDTO = Class;
   { ZD } TNFeRespTecnicoDTO = Class;

   // IMPLEMENTAÇÕES DAS CLASSES
   { B } TNFeIdeDTO = Class
   Private
      FcUF: Integer;
      FcNF: String;
      FnatOp: String;
      Fmod_: Integer;
      Fserie: Integer;
      FnNF: Integer;
      FdhEmi: String;
      FdhSaiEnt: String;
      FtpNF: Integer;
      FidDest: Integer;
      FcMunFG: Integer;
      FtpImp: Integer;
      FtpEmis: Integer;
      FcDV: Integer;
      FtpAmb: Integer;
      FfinNFe: Integer;
      FindFinal: Integer;
      FindPres: Integer;
      FindIntermed: Integer;
      FprocEmi: Integer;
      FverProc: String;
      FdhCont: String;
      FxJust: String;
      FdPrevEntrega: String;
   Public
      Property cUF: Integer Read FcUF Write FcUF;
      Property cNF: String Read FcNF Write FcNF;
      Property natOp: String Read FnatOp Write FnatOp;
      Property mod_: Integer Read Fmod_ Write Fmod_;
      Property serie: Integer Read Fserie Write Fserie;
      Property nNF: Integer Read FnNF Write FnNF;
      Property dhEmi: String Read FdhEmi Write FdhEmi;
      Property dhSaiEnt: String Read FdhSaiEnt Write FdhSaiEnt;
      Property tpNF: Integer Read FtpNF Write FtpNF;
      Property idDest: Integer Read FidDest Write FidDest;
      Property tpImp: Integer Read FtpImp Write FtpImp;
      Property tpEmis: Integer Read FtpEmis Write FtpEmis;
      Property cDV: Integer Read FcDV Write FcDV;
      Property tpAmb: Integer Read FtpAmb Write FtpAmb;
      Property finNFe: Integer Read FfinNFe Write FfinNFe;
      Property indFinal: Integer Read FindFinal Write FindFinal;
      Property indPres: Integer Read FindPres Write FindPres;
      Property indIntermed: Integer Read FindIntermed Write FindIntermed;
      Property procEmi: Integer Read FprocEmi Write FprocEmi;
      Property verProc: String Read FverProc Write FverProc;
      Property dhCont: String Read FdhCont Write FdhCont;
      Property xJust: String Read FxJust Write FxJust;
      Property cMunFG: Integer Read FcMunFG Write FcMunFG;
      Property dPrevEntrega: String Read FdPrevEntrega Write FdPrevEntrega;
   End;

   { BA } TNFeDocReferenciadoDTO = Class
   Private
      FRefNFe: String;
      FRefCTe: String;
   Public
      Property refNFe: String Read FRefNFe Write FRefNFe;
      Property refCTe: String Read FRefCTe Write FRefCTe;
   End;

   { BB } TNFeCompraGovDTO = Class
   Private
      FtpEnteGov: Integer;
      FpRedutor: Double;
      FtpOperGov: Integer;
      FrefDFeAnt: TArray<String>;
   Public
      Property tpEnteGov: Integer Read FtpEnteGov Write FtpEnteGov;
      Property pRedutor: Double Read FpRedutor Write FpRedutor;
      Property tpOperGov: Integer Read FtpOperGov Write FtpOperGov;
      Property refDFeAnt: TArray<String> Read FrefDFeAnt Write FrefDFeAnt;
   End;

   { BC } TNFePagamentoAntecipadoDTO = Class
   Private
      FRefNFe: TArray<String>;
   Public
      Property refNFe: TArray<String> Read FRefNFe Write FRefNFe;
   End;

   { C } TNFeEmitDTO = Class
   Private
      // [JSONName('CNPJ')]
      FCNPJ: String;
      // [JSONName('CPF')]
      FCPF: String;
      FxNome: String;
      FxFant: String;
      // [JSONName('IE')]
      FIE: String;
      // [JSONName('IEST')]
      FIEST: String;
      // [JSONName('IM')]
      FIM: String;
      // [JSONName('CNAE')]
      FCNAE: String;
      // [JSONName('CRT')]
      FCRT: Integer;
      FenderEmit: TNFeEnderecoDTO;
      // [JSONName('ISUFEmit')]
      FISUFEmit: String;
   Public
      Constructor Create;
      Destructor Destroy; Override;

      Property CNPJ: String Read FCNPJ Write FCNPJ;
      Property CPF: String Read FCPF Write FCPF;
      Property xNome: String Read FxNome Write FxNome;
      Property xFant: String Read FxFant Write FxFant;
      Property IE: String Read FIE Write FIE;
      Property IEST: String Read FIEST Write FIEST;
      Property IM: String Read FIM Write FIM;
      Property ISUFEmit: String Read FISUFEmit Write FISUFEmit;
      Property CNAE: String Read FCNAE Write FCNAE;
      Property CRT: Integer Read FCRT Write FCRT;
      Property enderEmit: TNFeEnderecoDTO Read FenderEmit Write FenderEmit;
   End;

   { E } TNFeDestDTO = Class
   Private
      // [JSONName('CNPJ')]
      FCNPJ: String;
      // [JSONName('CPF')]
      FCPF: String;
      FidEstrangeiro: String;
      FxNome: String;
      FindIEDest: Integer;
      // [JSONName('IE')]
      FIE: String;
      // [JSONName('ISUF')]
      FISUF: String;
      // [JSONName('IM')]
      FIM: String;
      Femail: String;
      FenderDest: TNFeEnderecoDTO;
   Public
      Constructor Create;
      Destructor Destroy; Override;

      Property CNPJ: String Read FCNPJ Write FCNPJ;
      Property CPF: String Read FCPF Write FCPF;
      Property idEstrangeiro: String Read FidEstrangeiro Write FidEstrangeiro;
      Property xNome: String Read FxNome Write FxNome;
      Property indIEDest: Integer Read FindIEDest Write FindIEDest;
      Property IE: String Read FIE Write FIE;
      Property ISUF: String Read FISUF Write FISUF;
      Property IM: String Read FIM Write FIM;
      Property email: String Read Femail Write Femail;
      Property enderDest: TNFeEnderecoDTO Read FenderDest Write FenderDest;
   End;

   { C/E } TNFeEnderecoDTO = Class
   Private
      FxLgr: String;
      Fnro: String;
      FxCpl: String;
      FxBairro: String;
      FcMun: Integer;
      FxMun: String;
      // [JSONName('UF')]
      FUF: String;
      // [JSONName('CEP')]
      FCEP: String;
      FcPais: Integer;
      FxPais: String;
      Ffone: String;
   Public
      Property xLgr: String Read FxLgr Write FxLgr;
      Property nro: String Read Fnro Write Fnro;
      Property xCpl: String Read FxCpl Write FxCpl;
      Property xBairro: String Read FxBairro Write FxBairro;
      Property cMun: Integer Read FcMun Write FcMun;
      Property xMun: String Read FxMun Write FxMun;
      Property UF: String Read FUF Write FUF;
      Property CEP: String Read FCEP Write FCEP;
      Property cPais: Integer Read FcPais Write FcPais;
      Property xPais: String Read FxPais Write FxPais;
      Property fone: String Read Ffone Write Ffone;
   End;

   { F } TNFeRetiradaDTO = Class
   Private
      FxLgr: String;
      Fnro: String;
      FxCpl: String;
      FxBairro: String;
      FcMun: String;
      FxMun: String;
      FUF: String;
      FCEP: String;
      FcPais: String;
      FxPais: String;
      Ffone: String;
      Femail: String;
      FIE: String;
   Public
      Property xLgr: String Read FxLgr Write FxLgr;
      Property nro: String Read Fnro Write Fnro;
      Property xCpl: String Read FxCpl Write FxCpl;
      Property xBairro: String Read FxBairro Write FxBairro;
      Property cMun: String Read FcMun Write FcMun;
      Property xMun: String Read FxMun Write FxMun;
      Property UF: String Read FUF Write FUF;
      Property CEP: String Read FCEP Write FCEP;
      Property cPais: String Read FcPais Write FcPais;
      Property xPais: String Read FxPais Write FxPais;
      Property fone: String Read Ffone Write Ffone;
      Property email: String Read Femail Write Femail;
      Property IE: String Read FIE Write FIE;
   End;

   { G } TNFeEntregaDTO = Class
   Private
      FxLgr: String;
      Fnro: String;
      FxCpl: String;
      FxBairro: String;
      FcMun: String;
      FxMun: String;
      FUF: String;
      FCEP: String;
      FcPais: String;
      FxPais: String;
      Ffone: String;
      Femail: String;
      FIE: String;
   Public
      Property xLgr: String Read FxLgr Write FxLgr;
      Property nro: String Read Fnro Write Fnro;
      Property xCpl: String Read FxCpl Write FxCpl;
      Property xBairro: String Read FxBairro Write FxBairro;
      Property cMun: String Read FcMun Write FcMun;
      Property xMun: String Read FxMun Write FxMun;
      Property UF: String Read FUF Write FUF;
      Property CEP: String Read FCEP Write FCEP;
      Property cPais: String Read FcPais Write FcPais;
      Property xPais: String Read FxPais Write FxPais;
      Property fone: String Read Ffone Write Ffone;
      Property email: String Read Femail Write Femail;
      Property IE: String Read FIE Write FIE;
   End;

   { GA } TNFeAutorizacaoDTO = Class
   Private
      FCNPJ: String;
      FCPF: String;
   Public
      Property CNPJ: String Read FCNPJ Write FCNPJ;
      Property CPF: String Read FCPF Write FCPF;
   End;

   { H } TNFeItemDTO = Class
   Private
      { I } Fprod: TNFeProdutoDTO;
      // [JSONName('CNPJFab')]
      { M } FImposto: TNFeImpostoDTO;
      FinfAdProd: String;
      FnItem: Integer;
   Public
      Constructor Create;
      Destructor Destroy; Override;

      Property nItem: Integer Read FnItem Write FnItem;
      Property prod: TNFeProdutoDTO Read Fprod Write Fprod;
      Property Imposto: TNFeImpostoDTO Read FImposto Write FImposto;
      Property infAdProd: String Read FinfAdProd Write FinfAdProd;
   End;

   { I } TNFeProdutoDTO = Class
   Private
      FcProd: String;
      FcEAN: String;
      FxProd: String;
      // [JSONName('NCM')]
      FNCM: String;
      // [JSONName('EXTIPI')]
      FEXTIPI: String;
      // [JSONName('CFOP')]
      FCFOP: String;
      FuCom: String;
      FqCom: Double;
      FvUnCom: Double;
      FvProd: Double;
      FcEANTrib: String;
      FuTrib: String;
      FqTrib: Double;
      FvUnTrib: Double;
      FvFrete: Double;
      FvSeg: Double;
      FvDesc: Double;
      FvOutro: Double;
      FindTot: Integer;
      FxPed: String;
      FnItemPed: String;
      // [JSONName('CEST')]
      FCEST: String;
      FcBenef: String;
      //
      // [JSONName('NVE')]
      FnVE: String;
      // [JSONName('NFCI')]
      FNFCI: String;
      FvTotTrib: Double;
      FindEscala: String;
      // [JSONName('CNPJFab')]
      FCNPJFab: String;
      FDFeReferenciado: TNFeDFeReferenciadoDTO;
      FCombustivel: TNFeCombustivelDTO;
   Public
      Constructor Create;
      Destructor Destroy;
      Property cProd: String Read FcProd Write FcProd;
      Property cEAN: String Read FcEAN Write FcEAN;
      Property xProd: String Read FxProd Write FxProd;
      Property NCM: String Read FNCM Write FNCM;
      Property EXTIPI: String Read FEXTIPI Write FEXTIPI;
      Property CFOP: String Read FCFOP Write FCFOP;
      Property uCom: String Read FuCom Write FuCom;
      Property qCom: Double Read FqCom Write FqCom;
      Property vUnCom: Double Read FvUnCom Write FvUnCom;
      Property vProd: Double Read FvProd Write FvProd;
      Property cEANTrib: String Read FcEANTrib Write FcEANTrib;
      Property uTrib: String Read FuTrib Write FuTrib;
      Property qTrib: Double Read FqTrib Write FqTrib;
      Property vUnTrib: Double Read FvUnTrib Write FvUnTrib;
      Property vFrete: Double Read FvFrete Write FvFrete;
      Property vSeg: Double Read FvSeg Write FvSeg;
      Property vDesc: Double Read FvDesc Write FvDesc;
      Property vOutro: Double Read FvOutro Write FvOutro;
      Property indTot: Integer Read FindTot Write FindTot;
      Property xPed: String Read FxPed Write FxPed;
      Property nItemPed: String Read FnItemPed Write FnItemPed;
      Property CEST: String Read FCEST Write FCEST;
      Property cBenef: String Read FcBenef Write FcBenef;
      //
      Property nVE: String Read FnVE Write FnVE;
      Property NFCI: String Read FNFCI Write FNFCI;
      Property vTotTrib: Double Read FvTotTrib Write FvTotTrib;
      Property indEscala: String Read FindEscala Write FindEscala;
      Property CNPJFab: String Read FCNPJFab Write FCNPJFab;
      Property DFeReferenciado: TNFeDFeReferenciadoDTO Read FDFeReferenciado Write FDFeReferenciado;
      Property Combustivel: TNFeCombustivelDTO Read FCombustivel Write FCombustivel;
   End;

   { LA } TNFeCombustivelDTO = Class
   Private
      FcProdANP: String;
      FdescANP: String;
      FpGLP: Double;
      FpGNn: Double;
      FpGNni: Double;
      FvPart: Double;
      FCODIF: String;
      FqTemp: Double;
      FUFCons: String;
      FCIDE: TNFeCIDECombustivelDTO;
      FEncerrante: TNFeEncerranteDTO;
   Public
      Constructor Create;
      Destructor Destroy; Override;

      Property cProdANP: String Read FcProdANP Write FcProdANP;
      Property descANP: String Read FdescANP Write FdescANP;
      Property pGLP: Double Read FpGLP Write FpGLP;
      Property pGNn: Double Read FpGNn Write FpGNn;
      Property pGNni: Double Read FpGNni Write FpGNni;
      Property vPart: Double Read FvPart Write FvPart;
      Property CODIF: String Read FCODIF Write FCODIF;
      Property qTemp: Double Read FqTemp Write FqTemp;
      Property UFCons: String Read FUFCons Write FUFCons;
      Property CIDE: TNFeCIDECombustivelDTO Read FCIDE Write FCIDE;
      Property encerrante: TNFeEncerranteDTO Read FEncerrante Write FEncerrante;
   End;

   { LA07 } TNFeCIDECombustivelDTO = Class
   Private
      FqBCProd: Double;
      FvAliqProd: Double;
      FvCIDE: Double;
   Public
      Property qBCProd: Double Read FqBCProd Write FqBCProd;
      Property vAliqProd: Double Read FvAliqProd Write FvAliqProd;
      Property vCIDE: Double Read FvCIDE Write FvCIDE;
   End;

   { LA11 } TNFeEncerranteDTO = Class
   Private
      FnBico: Integer;
      FnBomba: Integer;
      FnTanque: Integer;
      FvEncIni: Double;
      FvEncFin: Double;
   Public
      Property nBico: Integer Read FnBico Write FnBico;
      Property nBomba: Integer Read FnBomba Write FnBomba;
      Property nTanque: Integer Read FnTanque Write FnTanque;
      Property vEncIni: Double Read FvEncIni Write FvEncIni;
      Property vEncFin: Double Read FvEncFin Write FvEncFin;
   End;

   { M } TNFeImpostoDTO = Class
   Private
      // [JSONName('ICMS')]
      { N } FICMS: TNFeICMSDTO;
      // [JSONName('PIS')]
      { Q } FPIS: TNFePISDTO;
      // [JSONName('COFINS')]
      { S } FCOFINS: TNFeCOFINSDTO;
      { U } FISSQN: TNFeISSQNDTO;
      { UA } FImpostoDevol: TNFeImpostoDevolDTO;
      { UB } FIBSCBS: TNFeIBSCBSDTO;
   Public
      Constructor Create;
      Destructor Destroy; Override;

      Property ICMS: TNFeICMSDTO Read FICMS Write FICMS;
      Property PIS: TNFePISDTO Read FPIS Write FPIS;
      Property COFINS: TNFeCOFINSDTO Read FCOFINS Write FCOFINS;
      Property impostoDevol: TNFeImpostoDevolDTO Read FImpostoDevol Write FImpostoDevol;
      Property IBSCBS: TNFeIBSCBSDTO Read FIBSCBS Write FIBSCBS;
      Property ISSQN: TNFeISSQNDTO Read FISSQN Write FISSQN;
   End;

   { N } TNFeICMSDTO = Class
   Private
      Forig: Integer;
      // [JSONName('CST')]
      FCST: String;
      // [JSONName('CSOSN')]
      FCSOSN: String;
      FmodBC: Integer;
      FpRedBC: Double;
      FvBC: Double;
      FpICMS: Double;
      FvICMSOp: Double;
      FpDif: Double;
      FvICMSDif: Double;
      FvICMS: Double;
      FmodBCST: Integer;
      FpMVAST: Double;
      FpRedBCST: Double;
      FvBCST: Double;
      FpICMSST: Double;
      FvICMSST: Double;
      // [JSONName('UFST')]
      FUFST: String;
      FpBCOp: Double;
      FvBCSTRet: Double;
      FvICMSSTRet: Double;
      FvICMSDeson: Double;
      FmotDesICMS: Integer;
      FpCredSN: Double;
      FvCredICMSSN: Double;
      FvBCSTDest: Double;
      FvICMSSTDest: Double;
      FvBCUFDest: Double;
      FvBCFCPUFDest: Double;
      FpFCPUFDest: Double;
      FpICMSUFDest: Double;
      FpICMSInter: Double;
      FpICMSInterPart: Double;
      FvFCPUFDest: Double;
      FvICMSUFDest: Double;
      FvICMSUFRemet: Double;
      FvBCFCP: Double;
      FpFCP: Double;
      FvFCP: Double;
      FvBCFCPST: Double;
      FpFCPST: Double;
      FvFCPST: Double;
      FpST: Double;
      FvBCFCPSTRet: Double;
      FpFCPSTRet: Double;
      FvFCPSTRet: Double;
      FqBCMono: Double;
      FadRemICMS: Double;
      FvICMSMono: Double;
      FqBCMonoReten: Double;
      FadRemICMSReten: Double;
      FvICMSMonoReten: Double;
      FvICMSMonoOp: Double;
      FpDifMono: Double;
      FvICMSMonoDif: Double;
      FqBCMonoRet: Double;
      FadRemICMSRet: Double;
      FvICMSMonoRet: Double;
      FpRedAdRem: Double;
      FmotRedAdRem: Integer;
   Public
      Property orig: Integer Read Forig Write Forig;
      Property CST: String Read FCST Write FCST;
      Property CSOSN: String Read FCSOSN Write FCSOSN;
      Property modBC: Integer Read FmodBC Write FmodBC;
      Property pRedBC: Double Read FpRedBC Write FpRedBC;
      Property vBC: Double Read FvBC Write FvBC;
      Property pICMS: Double Read FpICMS Write FpICMS;
      Property vICMSOp: Double Read FvICMSOp Write FvICMSOp;
      Property pDif: Double Read FpDif Write FpDif;
      Property vICMSDif: Double Read FvICMSDif Write FvICMSDif;
      Property vICMS: Double Read FvICMS Write FvICMS;
      Property modBCST: Integer Read FmodBCST Write FmodBCST;
      Property pMVAST: Double Read FpMVAST Write FpMVAST;
      Property pRedBCST: Double Read FpRedBCST Write FpRedBCST;
      Property vBCST: Double Read FvBCST Write FvBCST;
      Property pICMSST: Double Read FpICMSST Write FpICMSST;
      Property vICMSST: Double Read FvICMSST Write FvICMSST;
      Property UFST: String Read FUFST Write FUFST;
      Property pBCOp: Double Read FpBCOp Write FpBCOp;
      Property vBCSTRet: Double Read FvBCSTRet Write FvBCSTRet;
      Property vICMSSTRet: Double Read FvICMSSTRet Write FvICMSSTRet;
      Property vICMSDeson: Double Read FvICMSDeson Write FvICMSDeson;
      Property motDesICMS: Integer Read FmotDesICMS Write FmotDesICMS;
      Property pCredSN: Double Read FpCredSN Write FpCredSN;
      Property vCredICMSSN: Double Read FvCredICMSSN Write FvCredICMSSN;
      Property vBCSTDest: Double Read FvBCSTDest Write FvBCSTDest;
      Property vICMSSTDest: Double Read FvICMSSTDest Write FvICMSSTDest;
      Property vBCUFDest: Double Read FvBCUFDest Write FvBCUFDest;
      Property vBCFCPUFDest: Double Read FvBCFCPUFDest Write FvBCFCPUFDest;
      Property pFCPUFDest: Double Read FpFCPUFDest Write FpFCPUFDest;
      Property pICMSUFDest: Double Read FpICMSUFDest Write FpICMSUFDest;
      Property pICMSInter: Double Read FpICMSInter Write FpICMSInter;
      Property pICMSInterPart: Double Read FpICMSInterPart Write FpICMSInterPart;
      Property vFCPUFDest: Double Read FvFCPUFDest Write FvFCPUFDest;
      Property vICMSUFDest: Double Read FvICMSUFDest Write FvICMSUFDest;
      Property vICMSUFRemet: Double Read FvICMSUFRemet Write FvICMSUFRemet;
      Property vBCFCP: Double Read FvBCFCP Write FvBCFCP;
      Property pFCP: Double Read FpFCP Write FpFCP;
      Property vFCP: Double Read FvFCP Write FvFCP;
      Property vBCFCPST: Double Read FvBCFCPST Write FvBCFCPST;
      Property pFCPST: Double Read FpFCPST Write FpFCPST;
      Property vFCPST: Double Read FvFCPST Write FvFCPST;
      Property pST: Double Read FpST Write FpST;
      Property vBCFCPSTRet: Double Read FvBCFCPSTRet Write FvBCFCPSTRet;
      Property pFCPSTRet: Double Read FpFCPSTRet Write FpFCPSTRet;
      Property vFCPSTRet: Double Read FvFCPSTRet Write FvFCPSTRet;
      Property qBCMono: Double Read FqBCMono Write FqBCMono;
      Property adRemICMS: Double Read FadRemICMS Write FadRemICMS;
      Property vICMSMono: Double Read FvICMSMono Write FvICMSMono;
      Property qBCMonoReten: Double Read FqBCMonoReten Write FqBCMonoReten;
      Property adRemICMSReten: Double Read FadRemICMSReten Write FadRemICMSReten;
      Property vICMSMonoReten: Double Read FvICMSMonoReten Write FvICMSMonoReten;
      Property vICMSMonoOp: Double Read FvICMSMonoOp Write FvICMSMonoOp;
      Property pDifMono: Double Read FpDifMono Write FpDifMono;
      Property vICMSMonoDif: Double Read FvICMSMonoDif Write FvICMSMonoDif;
      Property qBCMonoRet: Double Read FqBCMonoRet Write FqBCMonoRet;
      Property adRemICMSRet: Double Read FadRemICMSRet Write FadRemICMSRet;
      Property vICMSMonoRet: Double Read FvICMSMonoRet Write FvICMSMonoRet;
      Property pRedAdRem: Double Read FpRedAdRem Write FpRedAdRem;
      Property motRedAdRem: Integer Read FmotRedAdRem Write FmotRedAdRem;
   End;

   { Q } TNFePISDTO = Class
   Private
      // [JSONName('CST')]
      FCST: String;
      FvBC: Double;
      FpPIS: Double;
      FvPIS: Double;
      FqBCProd: Double;
      FvAliqProd: Double;
   Public
      Property CST: String Read FCST Write FCST;
      Property vBC: Double Read FvBC Write FvBC;
      Property pPIS: Double Read FpPIS Write FpPIS;
      Property vPIS: Double Read FvPIS Write FvPIS;
      Property qBCProd: Double Read FqBCProd Write FqBCProd;
      Property vAliqProd: Double Read FvAliqProd Write FvAliqProd;
   End;

   { S } TNFeCOFINSDTO = Class
   Private
      // [JSONName('CST')]
      FCST: String;
      FvBC: Double;
      FpCOFINS: Double;
      FvCOFINS: Double;
      FqBCProd: Double;
      FvAliqProd: Double;
   Public
      Property CST: String Read FCST Write FCST;
      Property vBC: Double Read FvBC Write FvBC;
      Property pCOFINS: Double Read FpCOFINS Write FpCOFINS;
      Property vCOFINS: Double Read FvCOFINS Write FvCOFINS;
      Property qBCProd: Double Read FqBCProd Write FqBCProd;
      Property vAliqProd: Double Read FvAliqProd Write FvAliqProd;
   End;

   { U } TNFeISSQNDTO = Class
   Private
      FdCompet: String;
      FvBC: Double;
      FvISS: Double;
      FvPIS: Double;
      FvISSRet: Double;
      FvCOFINS: Double;
      FvDescCond: Double;
      FvServ: Double;
      FvOutro: Double;
      FcRegTrib: Integer;
      FvDescIncond: Double;
      FvDeducao: Double;
   Public
      Property vServ: Double Read FvServ Write FvServ;
      Property vBC: Double Read FvBC Write FvBC;
      Property vISS: Double Read FvISS Write FvISS;
      Property vPIS: Double Read FvPIS Write FvPIS;
      Property vCOFINS: Double Read FvCOFINS Write FvCOFINS;
      Property dCompet: String Read FdCompet Write FdCompet;
      Property vDeducao: Double Read FvDeducao Write FvDeducao;
      Property vOutro: Double Read FvOutro Write FvOutro;
      Property vDescIncond: Double Read FvDescIncond Write FvDescIncond;
      Property vDescCond: Double Read FvDescCond Write FvDescCond;
      Property vISSRet: Double Read FvISSRet Write FvISSRet;
      Property cRegTrib: Integer Read FcRegTrib Write FcRegTrib;
   End;

   { UA } TNFeImpostoDevolDTO = Class
   Private
      FpDevol: Double;
      FIPI: TNFeIPIImpostoDevolDTO;
   Public
      Constructor Create;
      Destructor Destroy; Override;

      Property pDevol: Double Read FpDevol Write FpDevol;
      Property IPI: TNFeIPIImpostoDevolDTO Read FIPI Write FIPI;
   End;

   { UA03 } TNFeIPIImpostoDevolDTO = Class
   Private
      FvIPIDevol: Double;
   Public
      Property vIPIDevol: Double Read FvIPIDevol Write FvIPIDevol;
   End;

   { UB } TNFeIBSCBSDTO = Class { UB17, UB36, UB55, UB84 }
   Private
      FCST: String;
      FcClassTrib: String;
      FindDoacao: Integer;
      FvIBS: Double;
      FvBC: Double; { gIBSCBS }

      { UB01 } FgIS: TNFeISDTO;
      { UB17 } FgIBSUF: TNFeIBSUFDTO;
      { UB36 } FgIBSMun: TNFeIBSMunDTO;
      { UB55 } FgCBS: TNFeCBSDTO;
      { UB68 } FgTribRegular: TNFeTribRegularDTO;
      { UB82a } FgTribCompraGov: TNFeTribCompraGov;
      { UB84 } FgIBSCBSMono: TNFeIBSCBSMonoDTO;
   Public
      Constructor Create;
      Destructor Destroy; Override;

      Property CST: String Read FCST Write FCST;
      Property cClassTrib: String Read FcClassTrib Write FcClassTrib;
      Property indDoacao: Integer Read FindDoacao Write FindDoacao;
      Property vIBS: Double Read FvIBS Write FvIBS;
      Property vBC: Double Read FvBC Write FvBC;

      Property gIS: TNFeISDTO Read FgIS Write FgIS;
      Property gIBSUF: TNFeIBSUFDTO Read FgIBSUF Write FgIBSUF;
      Property gIBSMun: TNFeIBSMunDTO Read FgIBSMun Write FgIBSMun;
      Property gCBS: TNFeCBSDTO Read FgCBS Write FgCBS;
      Property gTribRegular: TNFeTribRegularDTO Read FgTribRegular Write FgTribRegular;
      Property gTribCompraGov: TNFeTribCompraGov Read FgTribCompraGov Write FgTribCompraGov;

      Property gIBSCBSMono: TNFeIBSCBSMonoDTO Read FgIBSCBSMono Write FgIBSCBSMono;
   End;

   { UB01 } TNFeISDTO = Class
   Private
      FCST: String;
      FcClassTribIS: String;
      FvBCIS: Double;
      FPIS: Double;
      FadRemIS: Double;
      FuTrib: String;
      FqTrib: Double;
      FvIS: Double;
   Public
      Property CST: String Read FCST Write FCST;
      Property cClassTribIS: String Read FcClassTribIS Write FcClassTribIS;
      Property vBCIS: Double Read FvBCIS Write FvBCIS;
      Property PIS: Double Read FPIS Write FPIS;
      Property adRemIS: Double Read FadRemIS Write FadRemIS;
      Property uTrib: String Read FuTrib Write FuTrib;
      Property qTrib: Double Read FqTrib Write FqTrib;
      Property vIS: Double Read FvIS Write FvIS;
   End;

   { UB17 } TNFeIBSUFDTO = Class
   Private
      FpIBSUF: Double;
      FvIBSUF: Double;

      { gDif }
      FpDif: Double;
      FvDif: Double;

      { gDevTrib }
      FpDevTrib: Double;
      FvDevTrib: Double;

      { gRed }
      FpRedAliq: Double;
      FpAliqEfet: Double;
   Public
      Property pIBSUF: Double Read FpIBSUF Write FpIBSUF;
      Property vIBSUF: Double Read FvIBSUF Write FvIBSUF;
      Property pDif: Double Read FpDif Write FpDif;
      Property vDif: Double Read FvDif Write FvDif;
      Property pDevTrib: Double Read FpDevTrib Write FpDevTrib;
      Property vDevTrib: Double Read FvDevTrib Write FvDevTrib;
      Property pRedAliq: Double Read FpRedAliq Write FpRedAliq;
      Property pAliqEfet: Double Read FpAliqEfet Write FpAliqEfet;
   End;

   { UB36 } TNFeIBSMunDTO = Class
   Private
      FpIBSMun: Double;
      FvIBSMun: Double;

      { gDif }
      FpDif: Double;
      FvDif: Double;

      { gDevTrib }
      FpDevTrib: Double;
      FvDevTrib: Double;

      { gRed }
      FpRedAliq: Double;
      FpAliqEfet: Double;
   Public
      Property pIBSMun: Double Read FpIBSMun Write FpIBSMun;
      Property vIBSMun: Double Read FvIBSMun Write FvIBSMun;
      Property pDif: Double Read FpDif Write FpDif;
      Property vDif: Double Read FvDif Write FvDif;
      Property pDevTrib: Double Read FpDevTrib Write FpDevTrib;
      Property vDevTrib: Double Read FvDevTrib Write FvDevTrib;
      Property pRedAliq: Double Read FpRedAliq Write FpRedAliq;
      Property pAliqEfet: Double Read FpAliqEfet Write FpAliqEfet;
   End;

   { UB55 } TNFeCBSDTO = Class
   Private
      FpCBS: Double;
      FvCBS: Double;

      { gDif }
      FpDif: Double;
      FvDif: Double;

      { gFrvTrib }
      FpDevTrib: Double;
      FvDevTrib: Double;

      { gRed }
      FpRedAliq: Double;
      FpAliqEfet: Double;

      { gALCZFMCBS }
      FgALCZFMCBS: TNFeALCZFMCBS;
   Public
      Constructor Create;
      Destructor Destroy; Override;

      Property pCBS: Double Read FpCBS Write FpCBS;
      Property vCBS: Double Read FvCBS Write FvCBS;
      Property pDif: Double Read FpDif Write FpDif;
      Property vDif: Double Read FvDif Write FvDif;
      Property pDevTrib: Double Read FpDevTrib Write FpDevTrib;
      Property vDevTrib: Double Read FvDevTrib Write FvDevTrib;
      Property pRedAliq: Double Read FpRedAliq Write FpRedAliq;
      Property pAliqEfet: Double Read FpAliqEfet Write FpAliqEfet;
      Property gALCZFMCBS: TNFeALCZFMCBS Read FgALCZFMCBS Write FgALCZFMCBS;
   End;

   { UB66a } TNFeALCZFMCBS = Class
   Private
      FtpALCZFMCBS: Integer;
      FnProcSuframa: String;
      FpAliqEfetRegCBS: Double;
      FvTribRegCBS: Double;
   Public
      Property tpALCZFMCBS: Integer Read FtpALCZFMCBS Write FtpALCZFMCBS;
      Property nProcSuframa: String Read FnProcSuframa Write FnProcSuframa;
      Property pAliqEfetRegCBS: Double Read FpAliqEfetRegCBS Write FpAliqEfetRegCBS;
      Property vTribRegCBS: Double Read FvTribRegCBS Write FvTribRegCBS;
   End;

   { UB68 } TNFeTribRegularDTO = Class
   Private
      FCSTReg: String;
      FcClassTribReg: String;
      FpAliqEfetRegIBSUF: Double;
      FvTribRegIBSUF: Double;
      FpAliqEfetRegIBSMun: Double;
      FvTribRegIBSMun: Double;
      FpAliqEfetRegCBS: Double;
      FvTribRegCBS: Double;
   Public
      Property CSTReg: String Read FCSTReg Write FCSTReg;
      Property cClassTribReg: String Read FcClassTribReg Write FcClassTribReg;
      Property pAliqEfetRegIBSUF: Double Read FpAliqEfetRegIBSUF Write FpAliqEfetRegIBSUF;
      Property vTribRegIBSUF: Double Read FvTribRegIBSUF Write FvTribRegIBSUF;
      Property pAliqEfetRegIBSMun: Double Read FpAliqEfetRegIBSMun Write FpAliqEfetRegIBSMun;
      Property vTribRegIBSMun: Double Read FvTribRegIBSMun Write FvTribRegIBSMun;
      Property pAliqEfetRegCBS: Double Read FpAliqEfetRegCBS Write FpAliqEfetRegCBS;
      Property vTribRegCBS: Double Read FvTribRegCBS Write FvTribRegCBS;
   End;

   { UB82a } TNFeTribCompraGov = Class
   Private
      FpAliqIBSUF: Double;
      FvTribIBSUF: Double;
      FpAliqIBSMun: Double;
      FvTribIBSMun: Double;
      FpAliqCBS: Double;
      FvTribCBS: Double;
   Public
      Property pAliqIBSUF: Double Read FpAliqIBSUF Write FpAliqIBSUF;
      Property vTribIBSUF: Double Read FvTribIBSUF Write FvTribIBSUF;
      Property pAliqIBSMun: Double Read FpAliqIBSMun Write FpAliqIBSMun;
      Property vTribIBSMun: Double Read FvTribIBSMun Write FvTribIBSMun;
      Property pAliqCBS: Double Read FpAliqCBS Write FpAliqCBS;
      Property vTribCBS: Double Read FvTribCBS Write FvTribCBS;
   End;

   { UB84 } TNFeIBSCBSMonoDTO = Class
   Private
      FgIBSMonoAdRem: TNFeIBSMonoAdRemDTO;
      FgIBSMonoAdValorem: TNFeIBSMonoAdValoremDTO;
      FgCBSMonoAdRem: TNFeCBSMonoAdRemDTO;
      FgCBSMonoAdValorem: TNFeCBSMonoAdValoremDTO;
      FvTotIBSMonoItem: Double;
      FvTotCBSMonoItem: Double;
   Public
      Constructor Create;
      Destructor Destroy; Override;

      Property gIBSMonoAdRem: TNFeIBSMonoAdRemDTO Read FgIBSMonoAdRem Write FgIBSMonoAdRem;
      Property gIBSMonoAdValorem: TNFeIBSMonoAdValoremDTO Read FgIBSMonoAdValorem Write FgIBSMonoAdValorem;
      Property gCBSMonoAdRem: TNFeCBSMonoAdRemDTO Read FgCBSMonoAdRem Write FgCBSMonoAdRem;
      Property gCBSMonoAdValorem: TNFeCBSMonoAdValoremDTO Read FgCBSMonoAdValorem Write FgCBSMonoAdValorem;
      Property vTotIBSMonoItem: Double Read FvTotIBSMonoItem Write FvTotIBSMonoItem;
      Property vTotCBSMonoItem: Double Read FvTotCBSMonoItem Write FvTotCBSMonoItem;
   End;

   { UB85a } TNFeIBSMonoAdRemDTO = Class
   Private
      FgMonoPadrao: TNFeIBSMonoAdRemPadraoDTO;
      FgMonoReten: TNFeIBSMonoAdRemRetenDTO;
      FgMonoRet: TNFeIBSMonoAdRemRetDTO;
      FgpBioDiferenca: TNFeIBSMonoAdRemBioDiferencaDTO;
   Public
      Constructor Create;
      Destructor Destroy; Override;

      Property gMonoPadrao: TNFeIBSMonoAdRemPadraoDTO Read FgMonoPadrao Write FgMonoPadrao;
      Property gMonoReten: TNFeIBSMonoAdRemRetenDTO Read FgMonoReten Write FgMonoReten;
      Property gMonoRet: TNFeIBSMonoAdRemRetDTO Read FgMonoRet Write FgMonoRet;
      Property gpBioDiferenca: TNFeIBSMonoAdRemBioDiferencaDTO Read FgpBioDiferenca Write FgpBioDiferenca;
   End;

   { UB86 } TNFeIBSMonoAdRemPadraoDTO = Class
   Private
      FqBCMono: Double;
      FadRemIBS: Double;
      FvIBSMono: Double;
   Public
      Property qBCMono: Double Read FqBCMono Write FqBCMono;
      Property adRemIBS: Double Read FadRemIBS Write FadRemIBS;
      Property vIBSMono: Double Read FvIBSMono Write FvIBSMono;
   End;

   { UB87 } TNFeIBSMonoAdRemRetenDTO = Class
   Private
      FqBCMonoReten: Double;
      FadRemIBSReten: Double;
      FvIBSMonoReten: Double;
   Public
      Property qBCMonoReten: Double Read FqBCMonoReten Write FqBCMonoReten;
      Property adRemIBSReten: Double Read FadRemIBSReten Write FadRemIBSReten;
      Property vIBSMonoReten: Double Read FvIBSMonoReten Write FvIBSMonoReten;
   End;

   { UB88 } TNFeIBSMonoAdRemRetDTO = Class
   Private
      FvIBSMonoRet: Double;
   Public
      Property vIBSMonoRet: Double Read FvIBSMonoRet Write FvIBSMonoRet;
   End;

   { UB89 } TNFeIBSMonoAdRemBioDiferencaDTO = Class
   Private
      FqBCBioComb: Double;
      FvIBSDiferenca: Double;
   Public
      Property qBCBioComb: Double Read FqBCBioComb Write FqBCBioComb;
      Property vIBSDiferenca: Double Read FvIBSDiferenca Write FvIBSDiferenca;
   End;

   { UB90 } TNFeIBSMonoAdValoremDTO = Class
   Private
      FgMonoPadrao: TNFeIBSMonoAdValoremPadraoDTO;
      FgMonoReten: TNFeIBSMonoAdValoremRetenDTO;
      FgMonoRet: TNFeIBSMonoAdValoremRetDTO;
      FgpBioDiferenca: TNFeIBSMonoAdValoremBioDiferencaDTO;
   Public
      Constructor Create;
      Destructor Destroy; Override;

      Property gMonoPadrao: TNFeIBSMonoAdValoremPadraoDTO Read FgMonoPadrao Write FgMonoPadrao;
      Property gMonoReten: TNFeIBSMonoAdValoremRetenDTO Read FgMonoReten Write FgMonoReten;
      Property gMonoRet: TNFeIBSMonoAdValoremRetDTO Read FgMonoRet Write FgMonoRet;
      Property gpBioDiferenca: TNFeIBSMonoAdValoremBioDiferencaDTO Read FgpBioDiferenca Write FgpBioDiferenca;
   End;

   { UB91 } TNFeIBSMonoAdValoremPadraoDTO = Class
   Private
      FvBCMono: Double;
      FpAliqMonoUF: Double;
      FvIBSMonoUF: Double;
      FpAliqMonoMun: Double;
      FvIBSMonoMun: Double;
      FvIBSMono: Double;
   Public
      Property vBCMono: Double Read FvBCMono Write FvBCMono;
      Property pAliqMonoUF: Double Read FpAliqMonoUF Write FpAliqMonoUF;
      Property vIBSMonoUF: Double Read FvIBSMonoUF Write FvIBSMonoUF;
      Property pAliqMonoMun: Double Read FpAliqMonoMun Write FpAliqMonoMun;
      Property vIBSMonoMun: Double Read FvIBSMonoMun Write FvIBSMonoMun;
      Property vIBSMono: Double Read FvIBSMono Write FvIBSMono;
   End;

   { UB92 } TNFeIBSMonoAdValoremRetenDTO = Class
   Private
      FvBCMonoReten: Double;
      FpAliqMonoReten: Double;
      FvIBSMonoReten: Double;
   Public
      Property vBCMonoReten: Double Read FvBCMonoReten Write FvBCMonoReten;
      Property pAliqMonoReten: Double Read FpAliqMonoReten Write FpAliqMonoReten;
      Property vIBSMonoReten: Double Read FvIBSMonoReten Write FvIBSMonoReten;
   End;

   { UB93 } TNFeIBSMonoAdValoremRetDTO = Class
   Private
      FvIBSMonoRet: Double;
   Public
      Property vIBSMonoRet: Double Read FvIBSMonoRet Write FvIBSMonoRet;
   End;

   { UB94 } TNFeIBSMonoAdValoremBioDiferencaDTO = Class
   Private
      FqBCBioComb: Double;
      FvIBSDiferenca: Double;
   Public
      Property qBCBioComb: Double Read FqBCBioComb Write FqBCBioComb;
      Property vIBSDiferenca: Double Read FvIBSDiferenca Write FvIBSDiferenca;
   End;

   { UB95a } TNFeCBSMonoAdRemDTO = Class
   Private
      FgMonoPadrao: TNFeCBSMonoAdRemPadraoDTO;
      FgMonoReten: TNFeCBSMonoAdRemRetenDTO;
      FgMonoRet: TNFeCBSMonoAdRemRetDTO;
      FgpBioDiferenca: TNFeCBSMonoAdRemBioDiferencaDTO;
   Public
      Constructor Create;
      Destructor Destroy; Override;

      Property gMonoPadrao: TNFeCBSMonoAdRemPadraoDTO Read FgMonoPadrao Write FgMonoPadrao;
      Property gMonoReten: TNFeCBSMonoAdRemRetenDTO Read FgMonoReten Write FgMonoReten;
      Property gMonoRet: TNFeCBSMonoAdRemRetDTO Read FgMonoRet Write FgMonoRet;
      Property gpBioDiferenca: TNFeCBSMonoAdRemBioDiferencaDTO Read FgpBioDiferenca Write FgpBioDiferenca;
   End;

   { UB96 } TNFeCBSMonoAdRemPadraoDTO = Class
   Private
      FqBCMono: Double;
      FadRemCBS: Double;
      FvCBSMono: Double;
   Public
      Property qBCMono: Double Read FqBCMono Write FqBCMono;
      Property adRemCBS: Double Read FadRemCBS Write FadRemCBS;
      Property vCBSMono: Double Read FvCBSMono Write FvCBSMono;
   End;

   { UB97 } TNFeCBSMonoAdRemRetenDTO = Class
   Private
      FqBCMonoReten: Double;
      FadRemCBSReten: Double;
      FvCBSMonoReten: Double;
   Public
      Property qBCMonoReten: Double Read FqBCMonoReten Write FqBCMonoReten;
      Property adRemCBSReten: Double Read FadRemCBSReten Write FadRemCBSReten;
      Property vCBSMonoReten: Double Read FvCBSMonoReten Write FvCBSMonoReten;
   End;

   { UB98 } TNFeCBSMonoAdRemRetDTO = Class
   Private
      FvCBSMonoRet: Double;
   Public
      Property vCBSMonoRet: Double Read FvCBSMonoRet Write FvCBSMonoRet;
   End;

   { UB99 } TNFeCBSMonoAdRemBioDiferencaDTO = Class
   Private
      FqBCBioComb: Double;
      FvCBSDiferenca: Double;
   Public
      Property qBCBioComb: Double Read FqBCBioComb Write FqBCBioComb;
      Property vCBSDiferenca: Double Read FvCBSDiferenca Write FvCBSDiferenca;
   End;

   { UB100 } TNFeCBSMonoAdValoremDTO = Class
   Private
      FgMonoPadrao: TNFeCBSMonoAdValoremPadraoDTO;
      FgMonoReten: TNFeCBSMonoAdValoremRetenDTO;
      FgMonoRet: TNFeCBSMonoAdValoremRetDTO;
      FgpBioDiferenca: TNFeCBSMonoAdValoremBioDiferencaDTO;
   Public
      Constructor Create;
      Destructor Destroy; Override;

      Property gMonoPadrao: TNFeCBSMonoAdValoremPadraoDTO Read FgMonoPadrao Write FgMonoPadrao;
      Property gMonoReten: TNFeCBSMonoAdValoremRetenDTO Read FgMonoReten Write FgMonoReten;
      Property gMonoRet: TNFeCBSMonoAdValoremRetDTO Read FgMonoRet Write FgMonoRet;
      Property gpBioDiferenca: TNFeCBSMonoAdValoremBioDiferencaDTO Read FgpBioDiferenca Write FgpBioDiferenca;
   End;

   { UB101 } TNFeCBSMonoAdValoremPadraoDTO = Class
   Private
      FvBCMono: Double;
      FpAliqMonoCBS: Double;
      FvCBSMono: Double;
   Public
      Property vBCMono: Double Read FvBCMono Write FvBCMono;
      Property pAliqMonoCBS: Double Read FpAliqMonoCBS Write FpAliqMonoCBS;
      Property vCBSMono: Double Read FvCBSMono Write FvCBSMono;
   End;

   { UB102 } TNFeCBSMonoAdValoremRetenDTO = Class
   Private
      FvBCMonoReten: Double;
      FpAliqMonoReten: Double;
      FvCBSMonoReten: Double;
   Public
      Property vBCMonoReten: Double Read FvBCMonoReten Write FvBCMonoReten;
      Property pAliqMonoReten: Double Read FpAliqMonoReten Write FpAliqMonoReten;
      Property vCBSMonoReten: Double Read FvCBSMonoReten Write FvCBSMonoReten;
   End;

   { UB103 } TNFeCBSMonoAdValoremRetDTO = Class
   Private
      FvCBSMonoRet: Double;
   Public
      Property vCBSMonoRet: Double Read FvCBSMonoRet Write FvCBSMonoRet;
   End;

   { UB104 } TNFeCBSMonoAdValoremBioDiferencaDTO = Class
   Private
      FqBCBioComb: Double;
      FvCBSDiferenca: Double;
   Public
      Property qBCBioComb: Double Read FqBCBioComb Write FqBCBioComb;
      Property vCBSDiferenca: Double Read FvCBSDiferenca Write FvCBSDiferenca;
   End;

   { VC } TNFeDFeReferenciadoDTO = Class
   Private
      FChaveAcesso: String;
      FTipoDFe: String;
   Public
      Property chaveAcesso: String Read FChaveAcesso Write FChaveAcesso;
      Property tipoDFe: String Read FTipoDFe Write FTipoDFe;
   End;

   { W } TNFeTotalDTO = Class
   Private
      { W17 } FISSQNTot: TNFeISSQNTotDTO;
      { W02 } FICMSTot: TNFeICMSTotDTO;
      { W02 } FRetTribTot: TNFeRetTribTotDTO;
      { W03 } FISTot: TNFeISTotDTO;
      { W31/W34 } FIBSCBSTot: TNFeIBSCBSTotDTO;
      FvNFTot: Double;
   Public
      Constructor Create;
      Destructor Destroy; Override;

      Property ISSQNTot: TNFeISSQNTotDTO Read FISSQNTot Write FISSQNTot;
      Property ICMSTot: TNFeICMSTotDTO Read FICMSTot Write FICMSTot;
      Property IBSCBSTot: TNFeIBSCBSTotDTO Read FIBSCBSTot Write FIBSCBSTot;
      Property RetTribTot: TNFeRetTribTotDTO Read FRetTribTot Write FRetTribTot;
      Property ISTot: TNFeISTotDTO Read FISTot Write FISTot;
      Property vNFTot: Double Read FvNFTot Write FvNFTot;
   End;

   { W-W02 } TNFeICMSTotDTO = Class
   Private
      FvBC: Double;
      FvICMS: Double;
      FvICMSDeson: Double;
      FvFCP: Double;
      FvBCST: Double;
      FvST: Double;
      FvFCPST: Double;
      FvFCPSTRet: Double;
      FvProd: Double;
      FvFrete: Double;
      FvSeg: Double;
      FvDesc: Double;
      FvII: Double;
      FvIPI: Double;
      FvIPIDevol: Double;
      FvPIS: Double;
      FvCOFINS: Double;
      FvOutro: Double;
      FvNF: Double;
      FvTotTrib: Double;
      FvFCPUFDest: Double;
      FvICMSUFRemet: Double;
      FvICMSMonoReten: Double;
      FqBCMonoReten: Double;
      FvICMSMono: Double;
      FvICMSMonoRet: Double;
      FqBCMono: Double;
      FqBCMonoRet: Double;
      FvICMSUFDest: Double;
   Public
      Property vBC: Double Read FvBC Write FvBC;
      Property vICMS: Double Read FvICMS Write FvICMS;
      Property vICMSDeson: Double Read FvICMSDeson Write FvICMSDeson;
      Property vFCP: Double Read FvFCP Write FvFCP;
      Property vBCST: Double Read FvBCST Write FvBCST;
      Property vST: Double Read FvST Write FvST;
      Property vFCPST: Double Read FvFCPST Write FvFCPST;
      Property vFCPSTRet: Double Read FvFCPSTRet Write FvFCPSTRet;
      Property vProd: Double Read FvProd Write FvProd;
      Property vFrete: Double Read FvFrete Write FvFrete;
      Property vSeg: Double Read FvSeg Write FvSeg;
      Property vDesc: Double Read FvDesc Write FvDesc;
      Property vII: Double Read FvII Write FvII;
      Property vIPI: Double Read FvIPI Write FvIPI;
      Property vIPIDevol: Double Read FvIPIDevol Write FvIPIDevol;
      Property vPIS: Double Read FvPIS Write FvPIS;
      Property vCOFINS: Double Read FvCOFINS Write FvCOFINS;
      Property vOutro: Double Read FvOutro Write FvOutro;
      Property vNF: Double Read FvNF Write FvNF;
      Property vTotTrib: Double Read FvTotTrib Write FvTotTrib;
      Property vFCPUFDest: Double Read FvFCPUFDest Write FvFCPUFDest;
      Property vICMSUFDest: Double Read FvICMSUFDest Write FvICMSUFDest;
      Property vICMSUFRemet: Double Read FvICMSUFRemet Write FvICMSUFRemet;
      Property qBCMono: Double Read FqBCMono Write FqBCMono;
      Property vICMSMono: Double Read FvICMSMono Write FvICMSMono;
      Property qBCMonoReten: Double Read FqBCMonoReten Write FqBCMonoReten;
      Property vICMSMonoReten: Double Read FvICMSMonoReten Write FvICMSMonoReten;
      Property qBCMonoRet: Double Read FqBCMonoRet Write FqBCMonoRet;
      Property vICMSMonoRet: Double Read FvICMSMonoRet Write FvICMSMonoRet;
   End;

   { W-W17 } TNFeISSQNTotDTO = Class
   Private
      FISSQN: TNFeISSQNDTO;
   Public
      Property ISSQN: TNFeISSQNDTO Read FISSQN Write FISSQN;
   End;

   { W-W23 } TNFeRetTribTotDTO = Class
   Private
      FvRetPIS: Double;
      FvRetCOFINS: Double;
      FvRetCSLL: Double;
      FvBCIRRF: Double;
      FvIRRF: Double;
      FvBCRetPrev: Double;
      FvRetPrev: Double;
   Public
      Property vRetPIS: Double Read FvRetPIS Write FvRetPIS;
      Property vRetCOFINS: Double Read FvRetCOFINS Write FvRetCOFINS;
      Property vRetCSLL: Double Read FvRetCSLL Write FvRetCSLL;
      Property vBCIRRF: Double Read FvBCIRRF Write FvBCIRRF;
      Property vIRRF: Double Read FvIRRF Write FvIRRF;
      Property vBCRetPrev: Double Read FvBCRetPrev Write FvBCRetPrev;
      Property vRetPrev: Double Read FvRetPrev Write FvRetPrev;

   End;

   { W03 } TNFeTotalISIBSCBSDTO = Class
   Private
      FISTot: TNFeISTotDTO;
      FIBSCBSTot: TNFeIBSCBSTotDTO;
   Public
      Constructor Create;
      Destructor Destroy; Override;

      Property ISTot: TNFeISTotDTO Read FISTot Write FISTot;
      Property IBSCBSTot: TNFeIBSCBSTotDTO Read FIBSCBSTot Write FIBSCBSTot;
   End;

   { W31 } TNFeISTotDTO = Class
   Private
      FvIS: Double;
   Public
      Property vIS: Double Read FvIS Write FvIS;
   End;

   { W34 } TNFeIBSCBSTotDTO = Class
   Private
      FvBCIBSCBS: Double;
      FgIBS: TNFeIBSTotDTO;
      FgCBS: TNFeCBSTotDTO;
      FgMono: TNFeMonoTotDTO;
      FgEstornoCred: TNFeEstornoCredTot;
      FvNFTot: Double;
   Public
      Constructor Create;
      Destructor Destroy; Override;

      Property vBCIBSCBS: Double Read FvBCIBSCBS Write FvBCIBSCBS;
      Property gIBS: TNFeIBSTotDTO Read FgIBS Write FgIBS;
      Property gCBS: TNFeCBSTotDTO Read FgCBS Write FgCBS;
      Property gMono: TNFeMonoTotDTO Read FgMono Write FgMono;
      Property gEstornoCred: TNFeEstornoCredTot Read FgEstornoCred Write FgEstornoCred;
      Property vNFTot: Double Read FvNFTot Write FvNFTot;
   End;

   { W36 } TNFeIBSTotDTO = Class
   Private
      FgIBSUF: TNFeIBSUFTotDTO;
      FgIBSMun: TNFeIBSMunTotDTO;
      FvIBS: Double;
      FvCredPres: Double;
      FvCredPresCondSus: Double;
   Public
      Constructor Create;
      Destructor Destroy; Override;

      Property gIBSUF: TNFeIBSUFTotDTO Read FgIBSUF Write FgIBSUF;
      Property gIBSMun: TNFeIBSMunTotDTO Read FgIBSMun Write FgIBSMun;
      Property vIBS: Double Read FvIBS Write FvIBS;
      Property vCredPres: Double Read FvCredPres Write FvCredPres;
      Property vCredPresCondSus: Double Read FvCredPresCondSus Write FvCredPresCondSus;
   End;

   { W37 } TNFeIBSUFTotDTO = Class
   Private
      FvDif: Double;
      FvDevTrib: Double;
      FvIBSUF: Double;
   Public
      Property vDif: Double Read FvDif Write FvDif;
      Property vDevTrib: Double Read FvDevTrib Write FvDevTrib;
      Property vIBSUF: Double Read FvIBSUF Write FvIBSUF;
   End;

   { W42 } TNFeIBSMunTotDTO = Class
   Private
      FvDif: Double;
      FvDevTrib: Double;
      FvIBSMun: Double;
   Public
      Property vDif: Double Read FvDif Write FvDif;
      Property vDevTrib: Double Read FvDevTrib Write FvDevTrib;
      Property vIBSMun: Double Read FvIBSMun Write FvIBSMun;
   End;

   { W50 } TNFeCBSTotDTO = Class
   Private
      FvDif: Double;
      FvDevTrib: Double;
      FvCBS: Double;
      FvCredPres: Double;
      FvCredPresCondSus: Double;
   Public
      Property vDif: Double Read FvDif Write FvDif;
      Property vDevTrib: Double Read FvDevTrib Write FvDevTrib;
      Property vCBS: Double Read FvCBS Write FvCBS;
      Property vCredPres: Double Read FvCredPres Write FvCredPres;
      Property vCredPresCondSus: Double Read FvCredPresCondSus Write FvCredPresCondSus;
   End;

   { W57 } TNFeMonoTotDTO = Class
   Private
      FvIBSMono: Double;
      FvCBSMono: Double;
      FvIBSMonoReten: Double;
      FvCBSMonoReten: Double;
      FvIBSMonoRet: Double;
      FvCBSMonoRet: Double;
   Public
      Property vIBSMono: Double Read FvIBSMono Write FvIBSMono;
      Property vCBSMono: Double Read FvCBSMono Write FvCBSMono;
      Property vIBSMonoReten: Double Read FvIBSMonoReten Write FvIBSMonoReten;
      Property vCBSMonoReten: Double Read FvCBSMonoReten Write FvCBSMonoReten;
      Property vIBSMonoRet: Double Read FvIBSMonoRet Write FvIBSMonoRet;
      Property vCBSMonoRet: Double Read FvCBSMonoRet Write FvCBSMonoRet;
   End;

   { W59e } TNFeEstornoCredTot = Class
   Private
      FvIBSEstCred: Double;
      FvCBSEstCred: Double;
   Public
      Property vIBSEstCred: Double Read FvIBSEstCred Write FvIBSEstCred;
      Property vCBSEstCred: Double Read FvCBSEstCred Write FvCBSEstCred;
   End;

   { X } TNFeTransporteDTO = Class
   Private
      FmodFrete: Integer;
      Ftransporta: TNFeTransportadorDTO;
      FretTransp: TNFeRetTranspDTO;
      FveicTransp: TNFeVeicTranspDTO;
      Freboque: TArray<TNFeVeicTranspDTO>;
      Fvagao: String;
      Fbalsa: String;
      Fvol: TArray<TNFeVolumeDTO>;
   Public
      Constructor Create;
      Destructor Destroy;
         Override;

      Property modFrete: Integer Read FmodFrete Write FmodFrete;
      Property transporta: TNFeTransportadorDTO Read Ftransporta Write Ftransporta;
      Property retTransp: TNFeRetTranspDTO Read FretTransp Write FretTransp;
      Property veicTransp: TNFeVeicTranspDTO Read FveicTransp Write FveicTransp;
      Property reboque: TArray<TNFeVeicTranspDTO> Read Freboque Write Freboque;
      Property vagao: String Read Fvagao Write Fvagao;
      Property balsa: String Read Fbalsa Write Fbalsa;
      Property vol: TArray<TNFeVolumeDTO> Read Fvol Write Fvol;
   End;

   { X03 } TNFeTransportadorDTO = Class
   Private
      FCNPJ: String;
      FCPF: String;
      FxNome: String;
      FIE: String;
      FxEnder: String;
      FxMun: String;
      FUF: String;
   Public
      Property CNPJ: String Read FCNPJ Write FCNPJ;
      Property CPF: String Read FCPF Write FCPF;
      Property xNome: String Read FxNome Write FxNome;
      Property IE: String Read FIE Write FIE;
      Property xEnder: String Read FxEnder Write FxEnder;
      Property xMun: String Read FxMun Write FxMun;
      Property UF: String Read FUF Write FUF;
   End;

   { X11 } TNFeRetTranspDTO = Class
   Private
      FvServ: Double;
      FvBCRet: Double;
      FpICMSRet: Double;
      FvICMSRet: Double;
      FCFOP: String;
      FcMunFG: Integer;
   Public
      Property vServ: Double Read FvServ Write FvServ;
      Property vBCRet: Double Read FvBCRet Write FvBCRet;
      Property pICMSRet: Double Read FpICMSRet Write FpICMSRet;
      Property vICMSRet: Double Read FvICMSRet Write FvICMSRet;
      Property CFOP: String Read FCFOP Write FCFOP;
      Property cMunFG: Integer Read FcMunFG Write FcMunFG;
   End;

   { X18/X22 } TNFeVeicTranspDTO = Class
   Private
      Fplaca: String;
      FUF: String;
      FRNTC: String;
   Public
      Property placa: String Read Fplaca Write Fplaca;
      Property UF: String Read FUF Write FUF;
      Property RNTC: String Read FRNTC Write FRNTC;
   End;

   { X26 } TNFeVolumeDTO = Class
   Private
      FqVol: Integer;
      Fesp: String;
      Fmarca: String;
      FnVol: String;
      FpesoL: Double;
      FpesoB: Double;
      Flacres: TArray<TNFeLacreDTO>;
   Public
      Destructor Destroy;
         Override;

      Property qVol: Integer Read FqVol Write FqVol;
      Property esp: String Read Fesp Write Fesp;
      Property marca: String Read Fmarca Write Fmarca;
      Property nVol: String Read FnVol Write FnVol;
      Property pesoL: Double Read FpesoL Write FpesoL;
      Property pesoB: Double Read FpesoB Write FpesoB;
      Property lacres: TArray<TNFeLacreDTO>
         Read Flacres Write Flacres;
   End;

   { X33 } TNFeLacreDTO = Class
   Private
      FnLacre: String;
   Public
      Property nLacre: String Read FnLacre Write FnLacre;
   End;

   { Y } TNFeCobrDTO = Class
   Private
      FFat: TNFeFaturaDTO;
      FDup: TArray<TNFeDuplicataDTO>;
   Public
      Constructor Create;
      Destructor Destroy;
         Override;

      Property Fat: TNFeFaturaDTO
         Read FFat Write FFat;

      Property Dup: TArray<TNFeDuplicataDTO>
         Read FDup Write FDup;
   End;

   { Y02 } TNFeFaturaDTO = Class
   Private
      FnFat: String;
      FvOrig: Double;
      FvDesc: Double;
      FvLiq: Double;
   Public
      Property nFat: String Read FnFat Write FnFat;
      Property vOrig: Double Read FvOrig Write FvOrig;
      Property vDesc: Double Read FvDesc Write FvDesc;
      Property vLiq: Double Read FvLiq Write FvLiq;
   End;

   { Y07 } TNFeDuplicataDTO = Class
   Private
      FnDup: String;
      FdVenc: String;
      FvDup: Double;
   Public
      Property nDup: String Read FnDup Write FnDup;
      Property dVenc: String Read FdVenc Write FdVenc;
      Property vDup: Double Read FvDup Write FvDup;
   End;

   { YA } TNFePagamentoDTO = Class
   Private
      FdetPag: TArray<TNFeDetalhePagamentoDTO>;
      FvTroco: Double;
   Public
      Destructor Destroy;
         Override;
      Property detPag: TArray<TNFeDetalhePagamentoDTO> Read FdetPag Write FdetPag;
      Property vTroco: Double Read FvTroco Write FvTroco;
   End;

   { YA04 } TNFeCartaoDTO = Class
   Private
      FtpIntegra: Integer;
      FCNPJ: String;
      FtBand: String;
      FcAut: String;
      FCNPJReceb: String;
      FidTermPag: String;
   Public
      Property tpIntegra: Integer Read FtpIntegra Write FtpIntegra;
      Property CNPJ: String Read FCNPJ Write FCNPJ;
      Property tBand: String Read FtBand Write FtBand;
      Property cAut: String Read FcAut Write FcAut;
      Property CNPJReceb: String Read FCNPJReceb Write FCNPJReceb;
      Property idTermPag: String Read FidTermPag Write FidTermPag;
   End;

   { YA01a } TNFeDetalhePagamentoDTO = Class
   Private
      FindPag: Integer;
      FtPag: String;
      FxPag: String;
      FvPag: Double;
      FdPag: String;
      FCNPJPag: String;
      FUFPag: String;
      FCard: TNFeCartaoDTO;
   Public
      Constructor Create;
      Destructor Destroy;
         Override;

      Property indPag: Integer Read FindPag Write FindPag;
      Property tPag: String Read FtPag Write FtPag;
      Property xPag: String Read FxPag Write FxPag;
      Property vPag: Double Read FvPag Write FvPag;
      Property dPag: String Read FdPag Write FdPag;
      Property CNPJPag: String Read FCNPJPag Write FCNPJPag;
      Property UFPag: String Read FUFPag Write FUFPag;
      Property card: TNFeCartaoDTO Read FCard Write FCard;
   End;

   { Z } TNFeInfoAdicionalDTO = Class
   Private
      FinfAdFisco: String;
      FinfCpl: String;
      FobsCont: TArray<TNFeObsContDTO>;
      FobsFisco: TArray<TNFeObsFiscoDTO>;
      FprocRef: TArray<TNFeProcRefDTO>;
   Public
      Destructor Destroy;
         Override;
      Property infAdFisco: String Read FinfAdFisco Write FinfAdFisco;
      Property infCpl: String Read FinfCpl Write FinfCpl;
      Property obsCont: TArray<TNFeObsContDTO> Read FobsCont Write FobsCont;
      Property obsFisco: TArray<TNFeObsFiscoDTO> Read FobsFisco Write FobsFisco;
      Property procRef: TArray<TNFeProcRefDTO> Read FprocRef Write FprocRef;
   End;

   { Z04 } TNFeObsContDTO = Class
   Private
      FxCampo: String;
      FxTexto: String;
   Public
      Property xCampo: String Read FxCampo Write FxCampo;
      Property xTexto: String Read FxTexto Write FxTexto;
   End;

   { Z07 } TNFeObsFiscoDTO = Class
   Private
      FxCampo: String;
      FxTexto: String;
   Public
      Property xCampo: String Read FxCampo Write FxCampo;
      Property xTexto: String Read FxTexto Write FxTexto;
   End;

   { Z10 } TNFeProcRefDTO = Class
   Private
      FnProc: String;
      FindProc: Integer;
      FtpAto: Integer;
   Public
      Property nProc: String Read FnProc Write FnProc;
      Property indProc: Integer Read FindProc Write FindProc;
      Property tpAto: Integer Read FtpAto Write FtpAto;
   End;

   { ZD } TNFeRespTecnicoDTO = Class
   Private
      FCNPJ: String;
      FxContato: String;
      Femail: String;
      Ffone: String;
      FidCSRT: String;
      FhashCSRT: String;
   Public
      Property CNPJ: String Read FCNPJ Write FCNPJ;
      Property xContato: String Read FxContato Write FxContato;
      Property email: String Read Femail Write Femail;
      Property fone: String Read Ffone Write Ffone;
      Property idCSRT: String Read FidCSRT Write FidCSRT;
      Property hashCSRT: String Read FhashCSRT Write FhashCSRT;
   End;

   TNFeDTO = Class
   Private
      FIde: TNFeIdeDTO;
      FEmit: TNFeEmitDTO;
      FDest: TNFeDestDTO;
      FTotal: TNFeTotalDTO;
      FRetirada: TNFeRetiradaDTO;
      FEntrega: TNFeEntregaDTO;
      FRespTecnico: TNFeRespTecnicoDTO;
      FCompraGov: TNFeCompraGovDTO;
      FTransporte: TNFeTransporteDTO;
      FCobr: TNFeCobrDTO;
      FInfoAdicional: TNFeInfoAdicionalDTO;
      //
      FItens: TArray<TNFeItemDTO>;
      FAutXML: TArray<TNFeAutorizacaoDTO>;
      FDocReferenciado: TArray<TNFeDocReferenciadoDTO>;
      FPagamento: TArray<TNFePagamentoDTO>;
      FPagamentoAntecipado: TNFePagamentoAntecipadoDTO;
   Public
      Constructor Create;
      Destructor Destroy;
         Override;
      Procedure AdicionarItem(AItem: TNFeItemDTO);

      Property Ide: TNFeIdeDTO Read FIde Write FIde;
      Property Emit: TNFeEmitDTO Read FEmit Write FEmit;
      Property Dest: TNFeDestDTO Read FDest Write FDest;
      Property Total: TNFeTotalDTO Read FTotal Write FTotal;
      Property retirada: TNFeRetiradaDTO Read FRetirada Write FRetirada;
      Property entrega: TNFeEntregaDTO Read FEntrega Write FEntrega;
      Property respTecnico: TNFeRespTecnicoDTO Read FRespTecnico Write FRespTecnico;
      //
      Property Itens: TArray<TNFeItemDTO> Read FItens Write FItens;
      Property autXML: TArray<TNFeAutorizacaoDTO> Read FAutXML Write FAutXML;
      Property docReferenciado: TArray<TNFeDocReferenciadoDTO> Read FDocReferenciado Write FDocReferenciado;
      Property pagamento: TArray<TNFePagamentoDTO> Read FPagamento Write FPagamento;
      Property transporte: TNFeTransporteDTO Read FTransporte Write FTransporte;
      Property compraGov: TNFeCompraGovDTO Read FCompraGov Write FCompraGov;
      Property pagamentoAntecipado: TNFePagamentoAntecipadoDTO Read FPagamentoAntecipado Write FPagamentoAntecipado;
      Property infoAdicional: TNFeInfoAdicionalDTO Read FInfoAdicional Write FInfoAdicional;
   End;

   TNFeResultadoDTO = Class
   Private
      FSucesso: Boolean;
      FcStat: Integer;
      FxMotivo: String;
      FnProt: String;
      FdhRecbto: String;
      FchNFe: String;
      FXml: String;
   Public
      Property Sucesso: Boolean Read FSucesso Write FSucesso;
      Property cStat: Integer Read FcStat Write FcStat;
      Property xMotivo: String Read FxMotivo Write FxMotivo;
      Property nProt: String Read FnProt Write FnProt;
      Property dhRecbto: String Read FdhRecbto Write FdhRecbto;
      Property chNFe: String Read FchNFe Write FchNFe;
      Property Xml: String Read FXml Write FXml;
   End;

Implementation

{ TNFeImpostoDTO }
Constructor TNFeImpostoDTO.Create;
Begin
   Inherited;
   FICMS := TNFeICMSDTO.Create;
   FPIS := TNFePISDTO.Create;
   FCOFINS := TNFeCOFINSDTO.Create;
   FImpostoDevol := TNFeImpostoDevolDTO.Create;
   FIBSCBS := TNFeIBSCBSDTO.Create;
End;

Destructor TNFeImpostoDTO.Destroy;
Begin
   FICMS.Free;
   FPIS.Free;
   FCOFINS.Free;
   FImpostoDevol.Free;
   FIBSCBS.Free;
   Inherited;
End;

{ TNFeItemDTO }
Constructor TNFeItemDTO.Create;
Begin
   Inherited;
   Fprod := TNFeProdutoDTO.Create;
   FImposto := TNFeImpostoDTO.Create;
End;

Destructor TNFeItemDTO.Destroy;
Begin
   Fprod.Free;
   FImposto.Free;
   Inherited;
End;

{ TNFeDTO }
Procedure TNFeDTO.AdicionarItem(AItem: TNFeItemDTO);
Begin
   SetLength(FItens, Length(FItens) + 1);
   FItens[High(FItens)] := AItem;
End;

Constructor TNFeDTO.Create;
Begin
   Inherited;

   FIde := TNFeIdeDTO.Create;
   FEmit := TNFeEmitDTO.Create;
   FDest := TNFeDestDTO.Create;
   FTotal := TNFeTotalDTO.Create;
   FRetirada := TNFeRetiradaDTO.Create;
   FEntrega := TNFeEntregaDTO.Create;
   FCompraGov := TNFeCompraGovDTO.Create;
   FTransporte := TNFeTransporteDTO.Create;
   FCobr := TNFeCobrDTO.Create;
   FInfoAdicional := TNFeInfoAdicionalDTO.Create;
   FRespTecnico := TNFeRespTecnicoDTO.Create;
   FPagamentoAntecipado := TNFePagamentoAntecipadoDTO.Create;
End;

Destructor TNFeDTO.Destroy;
Var
   Item: TNFeItemDTO;
   autXML: TNFeAutorizacaoDTO;
   docReferenciado: TNFeDocReferenciadoDTO;
   pagamento: TNFePagamentoDTO;
Begin
   For Item In FItens Do
      Item.Free;

   For autXML In FAutXML Do
      autXML.Free;

   For docReferenciado In FDocReferenciado Do
      docReferenciado.Free;

   For pagamento In FPagamento Do
      pagamento.Free;

   FIde.Free;
   FEmit.Free;
   FDest.Free;
   FTotal.Free;
   FRetirada.Free;
   FEntrega.Free;
   FCompraGov.Free;
   FTransporte.Free;
   FCobr.Free;
   FInfoAdicional.Free;
   FRespTecnico.Free;
   FPagamentoAntecipado.Free;

   Inherited;
End;

{ TNFeEmitDTO }
Constructor TNFeEmitDTO.Create;
Begin
   FenderEmit := TNFeEnderecoDTO.Create;
End;

Destructor TNFeEmitDTO.Destroy;
Begin
   FenderEmit.Free;
   Inherited;
End;

{ TNFeDestDTO }
Constructor TNFeDestDTO.Create;
Begin
   FenderDest := TNFeEnderecoDTO.Create;
End;

Destructor TNFeDestDTO.Destroy;
Begin
   FenderDest.Free;
   Inherited;
End;

{ TNFeTotalDTO }
Constructor TNFeTotalDTO.Create;
Begin
   FICMSTot := TNFeICMSTotDTO.Create;
   FISSQNTot := TNFeISSQNTotDTO.Create;
   FRetTribTot := TNFeRetTribTotDTO.Create;
   FISTot := TNFeISTotDTO.Create;
   FIBSCBSTot := TNFeIBSCBSTotDTO.Create;
End;

Destructor TNFeTotalDTO.Destroy;
Begin
   FIBSCBSTot.Free;
   FISTot.Free;
   FRetTribTot.Free;
   FISSQNTot.Free;
   FICMSTot.Free;

   Inherited;
End;

{ TNFeIBSCBSTotDTO }
Constructor TNFeIBSCBSDTO.Create;
Begin
   FgIBSUF := TNFeIBSUFDTO.Create;
   FgIBSMun := TNFeIBSMunDTO.Create;
   FgTribCompraGov := TNFeTribCompraGov.Create;
   FgCBS := TNFeCBSDTO.Create;
   FgIBSCBSMono := TNFeIBSCBSMonoDTO.Create;
   FgTribRegular := TNFeTribRegularDTO.Create;
   FgTribCompraGov := TNFeTribCompraGov.Create;
   FgIS := TNFeISDTO.Create;
End;

Destructor TNFeIBSCBSDTO.Destroy;
Begin
   FgIBSUF.Free;
   FgIBSMun.Free;
   FgTribCompraGov.Free;
   FgCBS.Free;
   FgIBSCBSMono.Free;
   FgTribRegular.Free;
   FgTribCompraGov.Free;
   FgIS.Free;
   Inherited;
End;

{ TNFeCombustivelDTO }

Constructor TNFeCombustivelDTO.Create;
Begin
   Inherited;

   FCIDE := TNFeCIDECombustivelDTO.Create;
   FEncerrante := TNFeEncerranteDTO.Create;
End;

Destructor TNFeCombustivelDTO.Destroy;
Begin
   FCIDE.Free;
   FEncerrante.Free;

   Inherited;
End;

{ TNFeProdutoDTO }

Constructor TNFeProdutoDTO.Create;
Begin
   Inherited;

   FDFeReferenciado := TNFeDFeReferenciadoDTO.Create;
   FCombustivel := TNFeCombustivelDTO.Create;
End;

Destructor TNFeProdutoDTO.Destroy;
Begin
   FDFeReferenciado.Free;
   FCombustivel.Free;

   Inherited;
End;

{ TNFeImpostoDevolDTO }

Constructor TNFeImpostoDevolDTO.Create;
Begin
   Inherited;
   FIPI := TNFeIPIImpostoDevolDTO.Create;
End;

Destructor TNFeImpostoDevolDTO.Destroy;
Begin
   FIPI.Free;
   Inherited;
End;

{ TNFeDetalhePagamentoDTO }

Constructor TNFeDetalhePagamentoDTO.Create;
Begin
   Inherited;
   FCard := TNFeCartaoDTO.Create;
End;

Destructor TNFeDetalhePagamentoDTO.Destroy;
Begin
   FCard.Free;
   Inherited;
End;

{ TNFePagamentoDTO }

Destructor TNFePagamentoDTO.Destroy;
Var
   detPag: TNFeDetalhePagamentoDTO;
Begin
   For detPag In FdetPag Do
      detPag.Free;
   Inherited;
End;

{ TNFeCobrDTO }

Constructor TNFeCobrDTO.Create;
Begin
   Inherited;
   FFat := TNFeFaturaDTO.Create;
End;

Destructor TNFeCobrDTO.Destroy;
Var
   Duplicata: TNFeDuplicataDTO;
Begin
   FFat.Free;
   For Duplicata In FDup Do
      Duplicata.Free;

   Inherited;
End;

{ TNFeVolumeDTO }

Destructor TNFeVolumeDTO.Destroy;
Var
   Item: TNFeLacreDTO;
Begin
   For Item In Flacres Do
      Item.Free;

   Inherited;
End;

{ TNFeTransporteDTO }

Constructor TNFeTransporteDTO.Create;
Begin
   Inherited;
   Ftransporta := TNFeTransportadorDTO.Create;
   FretTransp := TNFeRetTranspDTO.Create;
   FveicTransp := TNFeVeicTranspDTO.Create;
End;

Destructor TNFeTransporteDTO.Destroy;
Var
   reboque: TNFeVeicTranspDTO;
   Volume: TNFeVolumeDTO;
Begin
   For reboque In Freboque Do
      reboque.Free;

   For Volume In Fvol Do
      Volume.Free;

   Ftransporta.Free;
   FretTransp.Free;
   FveicTransp.Free;
   Inherited;
End;

{ TNFeInfoAdicionalDTO }

Destructor TNFeInfoAdicionalDTO.Destroy;
Var
   obsCont: TNFeObsContDTO;
   obsFisco: TNFeObsFiscoDTO;
   procRef: TNFeProcRefDTO;
Begin
   For obsCont In FobsCont Do
      obsCont.Free;

   For obsFisco In FobsFisco Do
      obsFisco.Free;

   For procRef In FprocRef Do
      procRef.Free;

   Inherited;
End;

{ TNFeCBSDTO }

Constructor TNFeCBSDTO.Create;
Begin
   FgALCZFMCBS := TNFeALCZFMCBS.Create;
End;

Destructor TNFeCBSDTO.Destroy;
Begin
   FgALCZFMCBS.Free;
   Inherited;
End;

{ TNFeIBSCBSMonoDTO }

Constructor TNFeIBSCBSMonoDTO.Create;
Begin
   // Inherited Create;
   FgIBSMonoAdRem := TNFeIBSMonoAdRemDTO.Create;
   FgIBSMonoAdValorem := TNFeIBSMonoAdValoremDTO.Create;
   FgCBSMonoAdRem := TNFeCBSMonoAdRemDTO.Create;
   FgCBSMonoAdValorem := TNFeCBSMonoAdValoremDTO.Create;
End;

Destructor TNFeIBSCBSMonoDTO.Destroy;
Begin
   FgIBSMonoAdRem.Free;
   FgIBSMonoAdValorem.Free;
   FgCBSMonoAdRem.Free;
   FgCBSMonoAdValorem.Free;

   Inherited;
End;

{ TNFeIBSMonoAdRemDTO }

Constructor TNFeIBSMonoAdRemDTO.Create;
Begin
   Inherited Create;
End;

Destructor TNFeIBSMonoAdRemDTO.Destroy;
Begin
   FgMonoPadrao.Free;
   FgMonoReten.Free;
   FgMonoRet.Free;
   FgpBioDiferenca.Free;

   Inherited;
End;

{ TNFeIBSMonoAdValoremDTO }

Constructor TNFeIBSMonoAdValoremDTO.Create;
Begin
   Inherited Create;
End;

Destructor TNFeIBSMonoAdValoremDTO.Destroy;
Begin
   FgMonoPadrao.Free;
   FgMonoReten.Free;
   FgMonoRet.Free;
   FgpBioDiferenca.Free;

   Inherited;
End;

{ TNFeCBSMonoAdRemDTO }

Constructor TNFeCBSMonoAdRemDTO.Create;
Begin
   Inherited Create;
End;

Destructor TNFeCBSMonoAdRemDTO.Destroy;
Begin
   FgMonoPadrao.Free;
   FgMonoReten.Free;
   FgMonoRet.Free;
   FgpBioDiferenca.Free;

   Inherited;
End;

{ TNFeCBSMonoAdValoremDTO }

Constructor TNFeCBSMonoAdValoremDTO.Create;
Begin
   Inherited Create;
End;

Destructor TNFeCBSMonoAdValoremDTO.Destroy;
Begin
   FgMonoPadrao.Free;
   FgMonoReten.Free;
   FgMonoRet.Free;
   FgpBioDiferenca.Free;

   Inherited;
End;

{ TNFeIBSCBSTotDTO }
Constructor TNFeIBSCBSTotDTO.Create;
Begin
   FgIBS := TNFeIBSTotDTO.Create;
   FgCBS := TNFeCBSTotDTO.Create;
   FgMono := TNFeMonoTotDTO.Create;
End;

Destructor TNFeIBSCBSTotDTO.Destroy;
Begin
   FgMono.Free;
   FgCBS.Free;
   FgIBS.Free;

   Inherited;
End;

{ TNFeIBSTotDTO }
Constructor TNFeIBSTotDTO.Create;
Begin
   FgIBSUF := TNFeIBSUFTotDTO.Create;
   FgIBSMun := TNFeIBSMunTotDTO.Create;
End;

Destructor TNFeIBSTotDTO.Destroy;
Begin
   FgIBSMun.Free;
   FgIBSUF.Free;

   Inherited;
End;

{ TNFeTotalISIBSCBSDTO }
Constructor TNFeTotalISIBSCBSDTO.Create;
Begin
   FISTot := TNFeISTotDTO.Create;
   FIBSCBSTot := TNFeIBSCBSTotDTO.Create;
End;

Destructor TNFeTotalISIBSCBSDTO.Destroy;
Begin
   FIBSCBSTot.Free;
   FISTot.Free;

   Inherited;
End;

End.
