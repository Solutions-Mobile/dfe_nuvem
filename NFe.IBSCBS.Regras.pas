Unit NFe.IBSCBS.Regras;

Interface

Uses
   System.SysUtils, FireDAC.Comp.Client, Data.DB;

Type

   TTipoDocumentoFiscal = (
      tdfNFe,
      tdfNFCe,
      tdfCTe,
      tdfTodos
      );

   { Regras gerais definidas para o CST }
   TInfoCST = Class
   Public
      CST: String;
      Descricao: String;
      IndGrp_IBSCBS: Boolean;
      IndGrp_IBSCBSMono: Boolean;
      IndGrp_Red: Boolean;
      IndGrp_Diferim: Boolean;
      IndGrp_TransfCred: Boolean;
      IndGrp_CredPresIBSZFM: Boolean;
      IndGrp_AjusteCompet: Boolean;
      IndRedutorBC: Boolean;
   End;

   { Regras específicas da cClassTrib }
   TInfoClassTrib = Class
   Public
      CST: String;
      ClassTrib: String;
      Nome: String;
      Descricao: String;

      DTiniVig: String;
      DtFimVig: String;

      { Reduções definidas pela classificação }
      AliqRedIbs: Double;
      AliqRedCbs: Double;

      { Grupos específicos }
      IndGrpTribRegular: Boolean;
      IndGrpCredPresOper: Boolean;
      IndGrpMonoPadrao: Boolean;
      IndGrpMonoReten: Boolean;
      IndGrpMonoRet: Boolean;
      IndGrpMonoDif: Boolean;
      IndGrpEstornoCred: Boolean;

      { Grupos gerais provenientes do CST/classificação }
      IndGrpIBS_CBS: Boolean;
      IndGrpIBS_CBS_Mono: Boolean;
      IndGrpRed: Boolean;
      IndGrpDif: Boolean;
      IndGrpTransfCred: Boolean;
      IndGrpCredPresIBS_ZFM: Boolean;
      IndGrpAjusteCompet: Boolean;

      { Documentos permitidos }
      IndNFe: Boolean;
      IndNFCe: Boolean;
      IndCTe: Boolean;

      TipoAliquota: String;
      LinkWeb: String;
   End;

   { Resultado consolidado das regras aplicáveis }
   TIBSCBSGruposPermitidos = Record
      gIBSCBS: Boolean;
      gIBSCBSMono: Boolean;
      gRed: Boolean;
      gDif: Boolean;
      gTransfCred: Boolean;
      gCredPresIBSZFM: Boolean;
      gAjusteCompet: Boolean;
      gTribRegular: Boolean;
      gCredPresOper: Boolean;
      gEstornoCred: Boolean;
      gMonoPadrao: Boolean;
      gMonoReten: Boolean;
      gMonoRet: Boolean;
      gMonoDif: Boolean;
   End;

   TIBSCBSRegras = Class
   Private
      FConnection: TFDConnection;
      Function ValorBooleano(AField: TField): Boolean;
      Function DocumentoPermitido(AInfo: TInfoClassTrib; ATipoDocumento: TTipoDocumentoFiscal): Boolean;

   Public
      Constructor Create(AConnection: TFDConnection);
      Function PegarInfoCST(Const ACST: String): TInfoCST;
      Function PegarInfoClassTrib(Const ACST: String; Const AClassTrib: String; ATipoDocumento: TTipoDocumentoFiscal): TInfoClassTrib;
      Function ObterGruposPermitidos(AInfoCST: TInfoCST; AInfoClassTrib: TInfoClassTrib): TIBSCBSGruposPermitidos;
   End;

Implementation

{ TIBSCBSRegras }

Constructor TIBSCBSRegras.Create(AConnection: TFDConnection);
Begin
   FConnection := AConnection;
End;

Function TIBSCBSRegras.ValorBooleano(AField: TField): Boolean;
Begin
   Result :=
      Assigned(AField) And
      (Trim(AField.AsString) = '1');
End;

Function TIBSCBSRegras.PegarInfoCST(Const ACST: String): TInfoCST;
Var
   LQuery: TFDQuery;
Begin
   Result := TInfoCST.Create;
   Result.CST := Trim(ACST);

   LQuery := TFDQuery.Create(Nil);

   Try
      LQuery.Connection := FConnection;

      LQuery.SQL.Text :=
         'SELECT ' +
         '   C.CST, ' +
         '   C.DESCRICAO, ' +
         '   C.INDGIBSCBS, ' +
         '   C.INDGIBSCBSMONO, ' +
         '   C.INDGRED, ' +
         '   C.INDGDIF, ' +
         '   C.INDGTRANSFCRED, ' +
         '   C.INDGCREDPRESIBSZFM, ' +
         '   C.INDGAJUSTECOMPET, ' +
         '   C.INDREDUTORBC ' +
         'FROM IBS_CBS_CST C ' +
         'WHERE TRIM(C.CST) = :CST';

      LQuery.ParamByName('CST').AsString := Trim(ACST);
      LQuery.Open;

      If Not LQuery.IsEmpty Then
      Begin
         Result.CST := Trim(LQuery.FieldByName('CST').AsString);
         Result.Descricao := LQuery.FieldByName('DESCRICAO').AsString;
         Result.IndGrp_IBSCBS := ValorBooleano(LQuery.FieldByName('INDGIBSCBS'));
         Result.IndGrp_IBSCBSMono := ValorBooleano(LQuery.FieldByName('INDGIBSCBSMONO'));
         Result.IndGrp_Red := ValorBooleano(LQuery.FieldByName('INDGRED'));
         Result.IndGrp_Diferim := ValorBooleano(LQuery.FieldByName('INDGDIF'));
         Result.IndGrp_TransfCred := ValorBooleano(LQuery.FieldByName('INDGTRANSFCRED'));
         Result.IndGrp_CredPresIBSZFM := ValorBooleano(LQuery.FieldByName('INDGCREDPRESIBSZFM'));
         Result.IndGrp_AjusteCompet := ValorBooleano(LQuery.FieldByName('INDGAJUSTECOMPET'));
         Result.IndRedutorBC := ValorBooleano(LQuery.FieldByName('INDREDUTORBC'));
      End;
   Finally
      LQuery.Free;
   End;
End;

Function TIBSCBSRegras.DocumentoPermitido(AInfo: TInfoClassTrib; ATipoDocumento: TTipoDocumentoFiscal): Boolean;
Begin
   Result := False;

   Case ATipoDocumento Of

      tdfNFe:
         Result := AInfo.IndNFe;

      tdfNFCe:
         Result := AInfo.IndNFCe;

      tdfCTe:
         Result := AInfo.IndCTe;

      tdfTodos:
         Result :=
            AInfo.IndNFe Or
            AInfo.IndNFCe Or
            AInfo.IndCTe;
   End;
End;

Function TIBSCBSRegras.PegarInfoClassTrib(Const ACST: String; Const AClassTrib: String; ATipoDocumento: TTipoDocumentoFiscal): TInfoClassTrib;
Var
   LQuery: TFDQuery;
Begin
   Result := TInfoClassTrib.Create;

   Result.CST := Trim(ACST);
   Result.ClassTrib := Trim(AClassTrib);

   LQuery := TFDQuery.Create(Nil);
   Try
      LQuery.Connection := FConnection;
      LQuery.SQL.Text :=
         'SELECT ' +
         '   CT.CST, ' +
         '   CT.CCLASSTRIB, ' +
         '   CT.NOME, ' +
         '   CT.DESCRICAO, ' +
         '   CT.TIPO_ALIQUOTA, ' +
         '   CT.PREDIBS, ' +
         '   CT.PREDCBS, ' +
         '   CT.DINIVIG, ' +
         '   CT.DFIMVIG, ' +
         '   CT.INDGTRIBREGULAR, ' +
         '   CT.INDGCREDPRESOPER, ' +
         '   CT.INDGMONOPADRAO, ' +
         '   CT.INDGMONORETEN, ' +
         '   CT.INDGMONORET, ' +
         '   CT.INDGMONODIF, ' +
         '   CT.INDGESTORNOCRED, ' +
         '   CT.INDNFE, ' +
         '   CT.INDNFCE, ' +
         '   CT.INDCTE, ' +
         '   CT.LINK, ' +
         '   CS.INDGIBSCBS, ' +
         '   CS.INDGIBSCBSMONO, ' +
         '   CS.INDGRED, ' +
         '   CS.INDGDIF, ' +
         '   CS.INDGTRANSFCRED, ' +
         '   CS.INDGCREDPRESIBSZFM, ' +
         '   CS.INDGAJUSTECOMPET ' +
         'FROM IBS_CBS_CLASSTRIB CT ' +
         'JOIN IBS_CBS_CST CS ' +
         '  ON TRIM(CS.CST) = TRIM(CT.CST) ' +
         'WHERE TRIM(CT.CST) = :CST ' +
         '  AND TRIM(CT.CCLASSTRIB) = :CCLASSTRIB';

      LQuery.ParamByName('CST').AsString := Trim(ACST);
      LQuery.ParamByName('CCLASSTRIB').AsString := Trim(AClassTrib);

      LQuery.Open;

      If Not LQuery.IsEmpty Then
      Begin
         Result.CST := Trim(LQuery.FieldByName('CST').AsString);
         Result.ClassTrib := Trim(LQuery.FieldByName('CCLASSTRIB').AsString);
         Result.Nome := LQuery.FieldByName('NOME').AsString;
         Result.Descricao := LQuery.FieldByName('DESCRICAO').AsString;
         Result.TipoAliquota := LQuery.FieldByName('TIPO_ALIQUOTA').AsString;
         Result.AliqRedIbs := LQuery.FieldByName('PREDIBS').AsFloat;
         Result.AliqRedCbs := LQuery.FieldByName('PREDCBS').AsFloat;
         Result.DTiniVig := LQuery.FieldByName('DINIVIG').AsString;
         Result.DtFimVig := LQuery.FieldByName('DFIMVIG').AsString;
         Result.IndGrpTribRegular := ValorBooleano(LQuery.FieldByName('INDGTRIBREGULAR'));
         Result.IndGrpCredPresOper := ValorBooleano(LQuery.FieldByName('INDGCREDPRESOPER'));
         Result.IndGrpMonoPadrao := ValorBooleano(LQuery.FieldByName('INDGMONOPADRAO'));
         Result.IndGrpMonoReten := ValorBooleano(LQuery.FieldByName('INDGMONORETEN'));
         Result.IndGrpMonoRet := ValorBooleano(LQuery.FieldByName('INDGMONORET'));
         Result.IndGrpMonoDif := ValorBooleano(LQuery.FieldByName('INDGMONODIF'));
         Result.IndGrpEstornoCred := ValorBooleano(LQuery.FieldByName('INDGESTORNOCRED'));
         Result.IndGrpIBS_CBS := ValorBooleano(LQuery.FieldByName('INDGIBSCBS'));
         Result.IndGrpIBS_CBS_Mono := ValorBooleano(LQuery.FieldByName('INDGIBSCBSMONO'));
         Result.IndGrpRed := ValorBooleano(LQuery.FieldByName('INDGRED'));
         Result.IndGrpDif := ValorBooleano(LQuery.FieldByName('INDGDIF'));
         Result.IndGrpTransfCred := ValorBooleano(LQuery.FieldByName('INDGTRANSFCRED'));
         Result.IndGrpCredPresIBS_ZFM := ValorBooleano(LQuery.FieldByName('INDGCREDPRESIBSZFM'));
         Result.IndGrpAjusteCompet := ValorBooleano(LQuery.FieldByName('INDGAJUSTECOMPET'));
         Result.IndNFe := ValorBooleano(LQuery.FieldByName('INDNFE'));
         Result.IndNFCe := ValorBooleano(LQuery.FieldByName('INDNFCE'));
         Result.IndCTe := ValorBooleano(LQuery.FieldByName('INDCTE'));
         Result.LinkWeb := LQuery.FieldByName('LINK').AsString;

         If Not DocumentoPermitido(Result, ATipoDocumento)
         Then
         Begin
            Result.Free;
            Result := TInfoClassTrib.Create;
         End;
      End;

   Finally
      LQuery.Free;
   End;
End;

Function TIBSCBSRegras.ObterGruposPermitidos(AInfoCST: TInfoCST; AInfoClassTrib: TInfoClassTrib): TIBSCBSGruposPermitidos;
Begin
   FillChar(Result, SizeOf(Result), 0);

   If Not Assigned(AInfoCST) Then
      Exit;

   If Not Assigned(AInfoClassTrib) Then
      Exit;

   { Grupo principal IBS/CBS }
   Result.gIBSCBS := AInfoCST.IndGrp_IBSCBS And AInfoClassTrib.IndGrpIBS_CBS;

   { Grupo monofásico }
   Result.gIBSCBSMono := AInfoCST.IndGrp_IBSCBSMono And AInfoClassTrib.IndGrpIBS_CBS_Mono;

   { Redução }
   Result.gRed := AInfoCST.IndGrp_Red And AInfoClassTrib.IndGrpRed;

   { Diferimento }
   Result.gDif := AInfoCST.IndGrp_Diferim And AInfoClassTrib.IndGrpDif;

   { Transferência de crédito }
   Result.gTransfCred := AInfoCST.IndGrp_TransfCred And AInfoClassTrib.IndGrpTransfCred;

   { Crédito presumido IBS ZFM }
   Result.gCredPresIBSZFM := AInfoCST.IndGrp_CredPresIBSZFM And AInfoClassTrib.IndGrpCredPresIBS_ZFM;

   { Ajuste de competência }
   Result.gAjusteCompet := AInfoCST.IndGrp_AjusteCompet And AInfoClassTrib.IndGrpAjusteCompet;

   { Grupos determinados diretamente pela cClassTrib }
   Result.gTribRegular := AInfoClassTrib.IndGrpTribRegular;
   Result.gCredPresOper := AInfoClassTrib.IndGrpCredPresOper;
   Result.gEstornoCred := AInfoClassTrib.IndGrpEstornoCred;

   { Subgrupos monofásicos }
   Result.gMonoPadrao := AInfoClassTrib.IndGrpMonoPadrao;
   Result.gMonoReten := AInfoClassTrib.IndGrpMonoReten;
   Result.gMonoRet := AInfoClassTrib.IndGrpMonoRet;
   Result.gMonoDif := AInfoClassTrib.IndGrpMonoDif;
End;

End.
