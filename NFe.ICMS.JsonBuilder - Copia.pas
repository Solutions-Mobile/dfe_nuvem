Unit NFe.ICMS.JsonBuilder;

Interface

Uses
   System.SysUtils, System.JSON, NFe.DTO;

Type
   TNFeICMSGrupo = (
      igICMS00, igICMS10, igICMS20, igICMS30, igICMS40, igICMS51, igICMS60, igICMS70, igICMS90,
      igICMSSN101, igICMSSN102, igICMSSN201, igICMSSN202, igICMSSN900,
      igICMSPart, igICMSST, igICMSUFDest);

   TNFeICMSJsonBuilder = Class
   Private
      Class Function IdentificarGrupo(AICMS: TNFeICMSDTO): TNFeICMSGrupo; Static;

      Class Procedure AddValue(AJson: TJSONObject; Const AName: String; Const AValue: Double); Static;
      Class Procedure AddInteger(AJson: TJSONObject; Const AName: String; Const AValue: Integer); Static;
      Class Procedure AddString(AJson: TJSONObject; Const AName, AValue: String); Static;

      Class Function BuildICMS00(AICMS: TNFeICMSDTO): TJSONObject; Static;
      Class Function BuildICMS10(AICMS: TNFeICMSDTO): TJSONObject; Static;
      Class Function BuildICMS20(AICMS: TNFeICMSDTO): TJSONObject; Static;
      Class Function BuildICMS30(AICMS: TNFeICMSDTO): TJSONObject; Static;
      Class Function BuildICMS40(AICMS: TNFeICMSDTO): TJSONObject; Static;
      Class Function BuildICMS51(AICMS: TNFeICMSDTO): TJSONObject; Static;
      Class Function BuildICMS60(AICMS: TNFeICMSDTO): TJSONObject; Static;
      Class Function BuildICMS70(AICMS: TNFeICMSDTO): TJSONObject; Static;
      Class Function BuildICMS90(AICMS: TNFeICMSDTO): TJSONObject; Static;

      Class Function BuildICMSSN101(AICMS: TNFeICMSDTO): TJSONObject; Static;
      Class Function BuildICMSSN102(AICMS: TNFeICMSDTO): TJSONObject; Static;
      Class Function BuildICMSSN201(AICMS: TNFeICMSDTO): TJSONObject; Static;
      Class Function BuildICMSSN202(AICMS: TNFeICMSDTO): TJSONObject; Static;
      Class Function BuildICMSSN900(AICMS: TNFeICMSDTO): TJSONObject; Static;

      Class Function BuildICMSPart(AICMS: TNFeICMSDTO): TJSONObject; Static;
      Class Function BuildICMSST(AICMS: TNFeICMSDTO): TJSONObject; Static;
      // Class Function BuildICMSUFDest(AICMS: TNFeICMSDTO): TJSONObject; Static;
   Public
      Class Function Build(AICMS: TNFeICMSDTO): TJSONObject; Static;
   End;

Implementation


Class Procedure TNFeICMSJsonBuilder.AddValue(AJson: TJSONObject; Const AName: String; Const AValue: Double);
Begin
   AJson.AddPair(AName, TJSONNumber.Create(AValue));
End;

Class Procedure TNFeICMSJsonBuilder.AddInteger(AJson: TJSONObject; Const AName: String; Const AValue: Integer);
Begin
   AJson.AddPair(AName, TJSONNumber.Create(AValue));
End;

Class Procedure TNFeICMSJsonBuilder.AddString(AJson: TJSONObject; Const AName, AValue: String);
Begin
   AJson.AddPair(AName, AValue);
End;

Class Function TNFeICMSJsonBuilder.BuildICMS00(AICMS: TNFeICMSDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   Result.AddPair('orig', TJSONNumber.Create(AICMS.orig));
   Result.AddPair('CST', AICMS.CST);
   Result.AddPair('modBC', TJSONNumber.Create(AICMS.modBC));
   Result.AddPair('vBC', TJSONNumber.Create(AICMS.vBC));
   Result.AddPair('pICMS', TJSONNumber.Create(AICMS.pICMS));
   Result.AddPair('vICMS', TJSONNumber.Create(AICMS.vICMS));

   If AICMS.vBCFCP > 0 Then
   Begin
      Result.AddPair('vBCFCP', TJSONNumber.Create(AICMS.vBCFCP));
      Result.AddPair('pFCP', TJSONNumber.Create(AICMS.pFCP));
      Result.AddPair('vFCP', TJSONNumber.Create(AICMS.vFCP));
   End;
End;

Class Function TNFeICMSJsonBuilder.BuildICMS10(AICMS: TNFeICMSDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   Result.AddPair('orig', TJSONNumber.Create(AICMS.orig));
   Result.AddPair('CST', AICMS.CST);

   Result.AddPair('modBC', TJSONNumber.Create(AICMS.modBC));
   Result.AddPair('vBC', TJSONNumber.Create(AICMS.vBC));
   Result.AddPair('pICMS', TJSONNumber.Create(AICMS.pICMS));
   Result.AddPair('vICMS', TJSONNumber.Create(AICMS.vICMS));

   Result.AddPair('modBCST', TJSONNumber.Create(AICMS.modBCST));
   Result.AddPair('pMVAST', TJSONNumber.Create(AICMS.pMVAST));
   Result.AddPair('pRedBCST', TJSONNumber.Create(AICMS.pRedBCST));
   Result.AddPair('vBCST', TJSONNumber.Create(AICMS.vBCST));
   Result.AddPair('pICMSST', TJSONNumber.Create(AICMS.pICMSST));
   Result.AddPair('vICMSST', TJSONNumber.Create(AICMS.vICMSST));

   If AICMS.vBCFCP > 0 Then
   Begin
      Result.AddPair('vBCFCP', TJSONNumber.Create(AICMS.vBCFCP));
      Result.AddPair('pFCP', TJSONNumber.Create(AICMS.pFCP));
      Result.AddPair('vFCP', TJSONNumber.Create(AICMS.vFCP));
   End;

   If AICMS.vBCFCPST > 0 Then
   Begin
      Result.AddPair('vBCFCPST', TJSONNumber.Create(AICMS.vBCFCPST));
      Result.AddPair('pFCPST', TJSONNumber.Create(AICMS.pFCPST));
      Result.AddPair('vFCPST', TJSONNumber.Create(AICMS.vFCPST));
   End;
End;

Class Function TNFeICMSJsonBuilder.BuildICMS20(AICMS: TNFeICMSDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   Result.AddPair('orig', TJSONNumber.Create(AICMS.orig));
   Result.AddPair('CST', AICMS.CST);

   Result.AddPair('modBC', TJSONNumber.Create(AICMS.modBC));
   Result.AddPair('pRedBC', TJSONNumber.Create(AICMS.pRedBC));
   Result.AddPair('vBC', TJSONNumber.Create(AICMS.vBC));
   Result.AddPair('pICMS', TJSONNumber.Create(AICMS.pICMS));
   Result.AddPair('vICMS', TJSONNumber.Create(AICMS.vICMS));

   If AICMS.vBCFCP > 0 Then
   Begin
      Result.AddPair('vBCFCP', TJSONNumber.Create(AICMS.vBCFCP));
      Result.AddPair('pFCP', TJSONNumber.Create(AICMS.pFCP));
      Result.AddPair('vFCP', TJSONNumber.Create(AICMS.vFCP));
   End;
End;

Class Function TNFeICMSJsonBuilder.BuildICMS30(AICMS: TNFeICMSDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   Result.AddPair('orig', TJSONNumber.Create(AICMS.orig));
   Result.AddPair('CST', AICMS.CST);

   Result.AddPair('modBCST', TJSONNumber.Create(AICMS.modBCST));
   Result.AddPair('pMVAST', TJSONNumber.Create(AICMS.pMVAST));
   Result.AddPair('pRedBCST', TJSONNumber.Create(AICMS.pRedBCST));
   Result.AddPair('vBCST', TJSONNumber.Create(AICMS.vBCST));
   Result.AddPair('pICMSST', TJSONNumber.Create(AICMS.pICMSST));
   Result.AddPair('vICMSST', TJSONNumber.Create(AICMS.vICMSST));

   If AICMS.vBCFCPST > 0 Then
   Begin
      Result.AddPair('vBCFCPST', TJSONNumber.Create(AICMS.vBCFCPST));
      Result.AddPair('pFCPST', TJSONNumber.Create(AICMS.pFCPST));
      Result.AddPair('vFCPST', TJSONNumber.Create(AICMS.vFCPST));
   End;
End;

Class Function TNFeICMSJsonBuilder.BuildICMS40(AICMS: TNFeICMSDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   Result.AddPair('orig', TJSONNumber.Create(AICMS.orig));
   Result.AddPair('CST', AICMS.CST);

   If AICMS.vICMSDeson > 0 Then
   Begin
      Result.AddPair(
         'vICMSDeson',
         TJSONNumber.Create(AICMS.vICMSDeson)
         );

      Result.AddPair(
         'motDesICMS',
         TJSONNumber.Create(AICMS.motDesICMS)
         );
   End;
End;

Class Function TNFeICMSJsonBuilder.BuildICMS51(AICMS: TNFeICMSDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   AddInteger(Result, 'orig', AICMS.orig);
   AddString(Result, 'CST', AICMS.CST);
   AddInteger(Result, 'modBC', AICMS.modBC);
   AddValue(Result, 'pRedBC', AICMS.pRedBC);
   AddValue(Result, 'vBC', AICMS.vBC);
   AddValue(Result, 'pICMS', AICMS.pICMS);
   AddValue(Result, 'vICMSOp', AICMS.vICMSOp);
   AddValue(Result, 'pDif', AICMS.pDif);
   AddValue(Result, 'vICMSDif', AICMS.vICMSDif);
   AddValue(Result, 'vICMS', AICMS.vICMS);
End;

Class Function TNFeICMSJsonBuilder.BuildICMS60(AICMS: TNFeICMSDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   AddInteger(Result, 'orig', AICMS.orig);
   AddString(Result, 'CST', AICMS.CST);
   AddValue(Result, 'vBCSTRet', AICMS.vBCSTRet);
   AddValue(Result, 'pST', AICMS.pST);
   AddValue(Result, 'vICMSSubstituto', AICMS.vICMSST);
   AddValue(Result, 'vICMSSTRet', AICMS.vICMSSTRet);

   If AICMS.vBCFCPSTRet <> 0 Then
   Begin
      AddValue(Result, 'vBCFCPSTRet', AICMS.vBCFCPSTRet);
      AddValue(Result, 'pFCPSTRet', AICMS.pFCPSTRet);
      AddValue(Result, 'vFCPSTRet', AICMS.vFCPSTRet);
   End;
End;

Class Function TNFeICMSJsonBuilder.BuildICMS70(AICMS: TNFeICMSDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   AddInteger(Result, 'orig', AICMS.orig);
   AddString(Result, 'CST', AICMS.CST);
   AddInteger(Result, 'modBC', AICMS.modBC);
   AddValue(Result, 'pRedBC', AICMS.pRedBC);
   AddValue(Result, 'vBC', AICMS.vBC);
   AddValue(Result, 'pICMS', AICMS.pICMS);
   AddValue(Result, 'vICMS', AICMS.vICMS);

   AddInteger(Result, 'modBCST', AICMS.modBCST);
   AddValue(Result, 'vBCST', AICMS.vBCST);
   AddValue(Result, 'pICMSST', AICMS.pICMSST);
   AddValue(Result, 'vICMSST', AICMS.vICMSST);

   If AICMS.vICMSDeson <> 0 Then
   Begin
      AddValue(Result, 'vICMSDeson', AICMS.vICMSDeson);
      AddInteger(Result, 'motDesICMS', AICMS.motDesICMS);
   End;
End;

Class Function TNFeICMSJsonBuilder.BuildICMS90(AICMS: TNFeICMSDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   AddInteger(Result, 'orig', AICMS.orig);
   AddString(Result, 'CST', AICMS.CST);
   AddInteger(Result, 'modBC', AICMS.modBC);
   AddValue(Result, 'pRedBC', AICMS.pRedBC);
   AddValue(Result, 'vBC', AICMS.vBC);
   AddValue(Result, 'pICMS', AICMS.pICMS);
   AddValue(Result, 'vICMS', AICMS.vICMS);

   AddInteger(Result, 'modBCST', AICMS.modBCST);
   AddValue(Result, 'vBCST', AICMS.vBCST);
   AddValue(Result, 'pICMSST', AICMS.pICMSST);
   AddValue(Result, 'vICMSST', AICMS.vICMSST);

   AddValue(Result, 'pCredSN', AICMS.pCredSN);
   AddValue(Result, 'vCredICMSSN', AICMS.vCredICMSSN);
End;

Class Function TNFeICMSJsonBuilder.BuildICMSPart(AICMS: TNFeICMSDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   AddInteger(Result, 'orig', AICMS.orig);
   AddString(Result, 'CST', AICMS.CST);

   AddInteger(Result, 'modBCST', AICMS.modBCST);
   AddValue(Result, 'pMVAST', AICMS.pMVAST);
   AddValue(Result, 'pRedBCST', AICMS.pRedBCST);
   AddValue(Result, 'vBCST', AICMS.vBCST);
   AddValue(Result, 'pICMSST', AICMS.pICMSST);
   AddValue(Result, 'vICMSST', AICMS.vICMSST);

   AddString(Result, 'UFST', AICMS.UFST);
   AddValue(Result, 'pBCOp', AICMS.pBCOp);
End;

Class Function TNFeICMSJsonBuilder.BuildICMSST(AICMS: TNFeICMSDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   AddInteger(Result, 'orig', AICMS.orig);
   AddString(Result, 'CST', AICMS.CST);
   AddValue(Result, 'vBCSTRet', AICMS.vBCSTRet);
   AddValue(Result, 'pST', AICMS.pST);
   AddValue(Result, 'vICMSSubstituto', AICMS.vICMSST);
   AddValue(Result, 'vICMSSTRet', AICMS.vICMSSTRet);
End;

Class Function TNFeICMSJsonBuilder.IdentificarGrupo(AICMS: TNFeICMSDTO): TNFeICMSGrupo;
Begin
   If AICMS.CST = '00' Then
      Exit(igICMS00);

   If AICMS.CST = '10' Then
      Exit(igICMS10);

   If AICMS.CST = '20' Then
      Exit(igICMS20);

   If AICMS.CST = '30' Then
      Exit(igICMS30);

   If (AICMS.CST = '40') Or
      (AICMS.CST = '41') Or
      (AICMS.CST = '50') Then
      Exit(igICMS40);

   If AICMS.CST = '51' Then
      Exit(igICMS51);

   If AICMS.CST = '60' Then
      Exit(igICMS60);

   If AICMS.CST = '70' Then
      Exit(igICMS70);

   If AICMS.CST = '90' Then
      Exit(igICMS90);

   If AICMS.CSOSN = '101' Then
      Exit(igICMSSN101);

   If (AICMS.CSOSN = '102') Or
      (AICMS.CSOSN = '103') Or
      (AICMS.CSOSN = '300') Or
      (AICMS.CSOSN = '400') Then
      Exit(igICMSSN102);

   If AICMS.CSOSN = '201' Then
      Exit(igICMSSN201);

   If (AICMS.CSOSN = '202') Or
      (AICMS.CSOSN = '203') Then
      Exit(igICMSSN202);

   If AICMS.CSOSN = '900' Then
      Exit(igICMSSN900);

   Raise EArgumentException.CreateFmt(
      'CST/CSOSN não suportado. CST=%s CSOSN=%s',
      [AICMS.CST, AICMS.CSOSN]
      );
End;

Class Function TNFeICMSJsonBuilder.BuildICMSSN101(AICMS: TNFeICMSDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   AddInteger(Result, 'orig', AICMS.orig);
   AddString(Result, 'CSOSN', AICMS.CSOSN);
   AddValue(Result, 'pCredSN', AICMS.pCredSN);
   AddValue(Result, 'vCredICMSSN', AICMS.vCredICMSSN);
End;

Class Function TNFeICMSJsonBuilder.BuildICMSSN102(AICMS: TNFeICMSDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   AddInteger(Result, 'orig', AICMS.orig);
   AddString(Result, 'CSOSN', AICMS.CSOSN);
End;

Class Function TNFeICMSJsonBuilder.BuildICMSSN201(AICMS: TNFeICMSDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   AddInteger(Result, 'orig', AICMS.orig);
   AddString(Result, 'CSOSN', AICMS.CSOSN);

   AddInteger(Result, 'modBCST', AICMS.modBCST);
   AddValue(Result, 'pMVAST', AICMS.pMVAST);
   AddValue(Result, 'pRedBCST', AICMS.pRedBCST);
   AddValue(Result, 'vBCST', AICMS.vBCST);
   AddValue(Result, 'pICMSST', AICMS.pICMSST);
   AddValue(Result, 'vICMSST', AICMS.vICMSST);

   AddValue(Result, 'pCredSN', AICMS.pCredSN);
   AddValue(Result, 'vCredICMSSN', AICMS.vCredICMSSN);
End;

Class Function TNFeICMSJsonBuilder.BuildICMSSN202(AICMS: TNFeICMSDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   AddInteger(Result, 'orig', AICMS.orig);
   AddString(Result, 'CSOSN', AICMS.CSOSN);

   AddInteger(Result, 'modBCST', AICMS.modBCST);
   AddValue(Result, 'pMVAST', AICMS.pMVAST);
   AddValue(Result, 'pRedBCST', AICMS.pRedBCST);
   AddValue(Result, 'vBCST', AICMS.vBCST);
   AddValue(Result, 'pICMSST', AICMS.pICMSST);
   AddValue(Result, 'vICMSST', AICMS.vICMSST);
End;

Class Function TNFeICMSJsonBuilder.BuildICMSSN900(AICMS: TNFeICMSDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   AddInteger(Result, 'orig', AICMS.orig);
   AddString(Result, 'CSOSN', AICMS.CSOSN);

   AddInteger(Result, 'modBC', AICMS.modBC);
   AddValue(Result, 'pRedBC', AICMS.pRedBC);
   AddValue(Result, 'vBC', AICMS.vBC);
   AddValue(Result, 'pICMS', AICMS.pICMS);
   AddValue(Result, 'vICMS', AICMS.vICMS);

   AddInteger(Result, 'modBCST', AICMS.modBCST);
   AddValue(Result, 'pMVAST', AICMS.pMVAST);
   AddValue(Result, 'pRedBCST', AICMS.pRedBCST);
   AddValue(Result, 'vBCST', AICMS.vBCST);
   AddValue(Result, 'pICMSST', AICMS.pICMSST);
   AddValue(Result, 'vICMSST', AICMS.vICMSST);

   AddValue(Result, 'pCredSN', AICMS.pCredSN);
   AddValue(Result, 'vCredICMSSN', AICMS.vCredICMSSN);
End;

Class Function TNFeICMSJsonBuilder.Build(AICMS: TNFeICMSDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   If AICMS = Nil Then
      Exit;

   Case IdentificarGrupo(AICMS) Of
      igICMS00:
         Result.AddPair('ICMS00', BuildICMS00(AICMS));

      igICMS10:
         Result.AddPair('ICMS10', BuildICMS10(AICMS));

      igICMS20:
         Result.AddPair('ICMS20', BuildICMS20(AICMS));

      igICMS30:
         Result.AddPair('ICMS30', BuildICMS30(AICMS));

      igICMS40:
         Result.AddPair('ICMS40', BuildICMS40(AICMS));
   End;
End;

End.
