Unit NFe.ICMS.JsonBuilder;

Interface

Uses
   System.SysUtils, System.JSON, NFe.DTO, System.AnsiStrings;

Type
   TNFeICMSGrupo = (
      igICMS00, igICMS10, igICMS20, igICMS30, igICMS40, igICMS51, igICMS60, igICMS61, igICMS70, igICMS90,
      igICMSSN101, igICMSSN102, igICMSSN201, igICMSSN202, igICMSSN900,
      igICMSPart, igICMSST, igICMSUFDest);

   TNFeICMSJsonBuilder = Class
   Private
      Class Function IdentificarGrupo(AICMS: TNFeICMSDTO): TNFeICMSGrupo; Static;

      Class Function BuildICMS00(AICMS: TNFeICMSDTO): TJSONObject; Static;
      Class Function BuildICMS10(AICMS: TNFeICMSDTO): TJSONObject; Static;
      Class Function BuildICMS20(AICMS: TNFeICMSDTO): TJSONObject; Static;
      Class Function BuildICMS30(AICMS: TNFeICMSDTO): TJSONObject; Static;
      Class Function BuildICMS40(AICMS: TNFeICMSDTO): TJSONObject; Static;
      Class Function BuildICMS51(AICMS: TNFeICMSDTO): TJSONObject; Static;
      Class Function BuildICMS60(AICMS: TNFeICMSDTO): TJSONObject; Static;
      Class Function BuildICMS61(AICMS: TNFeICMSDTO): TJSONObject; Static;
      Class Function BuildICMS70(AICMS: TNFeICMSDTO): TJSONObject; Static;
      Class Function BuildICMS90(AICMS: TNFeICMSDTO): TJSONObject; Static;

      Class Function BuildICMSSN101(AICMS: TNFeICMSDTO): TJSONObject; Static;
      Class Function BuildICMSSN102(AICMS: TNFeICMSDTO): TJSONObject; Static;
      Class Function BuildICMSSN201(AICMS: TNFeICMSDTO): TJSONObject; Static;
      Class Function BuildICMSSN202(AICMS: TNFeICMSDTO): TJSONObject; Static;
      Class Function BuildICMSSN900(AICMS: TNFeICMSDTO): TJSONObject; Static;

      // Class Function BuildICMSPart(AICMS: TNFeICMSDTO): TJSONObject; Static;
      // Class Function BuildICMSST(AICMS: TNFeICMSDTO): TJSONObject; Static;
   Public
      Class Function Build(AICMS: TNFeICMSDTO): TJSONObject; Static;
   End;

Implementation

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

   Result.AddPair('orig', TJSONNumber.Create(AICMS.orig));
   Result.AddPair('CST', AICMS.CST);

   Result.AddPair('modBC', TJSONNumber.Create(AICMS.modBC));
   Result.AddPair('pRedBC', TJSONNumber.Create(AICMS.pRedBC));
   Result.AddPair('vBC', TJSONNumber.Create(AICMS.vBC));
   Result.AddPair('pICMS', TJSONNumber.Create(AICMS.pICMS));
   Result.AddPair('vICMSOp', TJSONNumber.Create(AICMS.vICMSOp));
   Result.AddPair('pDif', TJSONNumber.Create(AICMS.pDif));
   Result.AddPair('vICMSDif', TJSONNumber.Create(AICMS.vICMSDif));
   Result.AddPair('vICMS', TJSONNumber.Create(AICMS.vICMS));

   If AICMS.vBCFCP > 0 Then
   Begin
      Result.AddPair('vBCFCP', TJSONNumber.Create(AICMS.vBCFCP));
      Result.AddPair('pFCP', TJSONNumber.Create(AICMS.pFCP));
      Result.AddPair('vFCP', TJSONNumber.Create(AICMS.vFCP));
   End;
End;

Class Function TNFeICMSJsonBuilder.BuildICMS60(AICMS: TNFeICMSDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   Result.AddPair('orig', TJSONNumber.Create(AICMS.orig));
   Result.AddPair('CST', AICMS.CST);

   Result.AddPair('vBCSTRet', TJSONNumber.Create(AICMS.vBCSTRet));
   Result.AddPair('pST', TJSONNumber.Create(AICMS.pST));
   Result.AddPair('vICMSSTRet', TJSONNumber.Create(AICMS.vICMSSTRet));

   If AICMS.vBCFCPSTRet > 0 Then
   Begin
      Result.AddPair('vBCFCPSTRet', TJSONNumber.Create(AICMS.vBCFCPSTRet));
      Result.AddPair('pFCPSTRet', TJSONNumber.Create(AICMS.pFCPSTRet));
      Result.AddPair('vFCPSTRet', TJSONNumber.Create(AICMS.vFCPSTRet));
   End;
End;

Class Function TNFeICMSJsonBuilder.BuildICMS61(AICMS: TNFeICMSDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   Result.AddPair('orig', TJSONNumber.Create(AICMS.orig));
   Result.AddPair('CST', AICMS.CST);
   // If AICMS.qBCMonoRet > 0 Then
   // Begin
   Result.AddPair('qBCMonoRet', TJSONNumber.Create(AICMS.qBCMonoRet));
   Result.AddPair('adRemICMSRet', TJSONNumber.Create(AICMS.adRemICMSRet));
   Result.AddPair('vICMSMonoRet', TJSONNumber.Create(AICMS.vICMSMonoRet));
   //
End;

Class Function TNFeICMSJsonBuilder.BuildICMS70(AICMS: TNFeICMSDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   Result.AddPair('orig', TJSONNumber.Create(AICMS.orig));
   Result.AddPair('CST', AICMS.CST);

   Result.AddPair('modBC', TJSONNumber.Create(AICMS.modBC));
   Result.AddPair('pRedBC', TJSONNumber.Create(AICMS.pRedBC));
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

Class Function TNFeICMSJsonBuilder.BuildICMS90(AICMS: TNFeICMSDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   Result.AddPair('orig', TJSONNumber.Create(AICMS.orig));
   Result.AddPair('CST', AICMS.CST);

   Result.AddPair('modBC', TJSONNumber.Create(AICMS.modBC));
   Result.AddPair('vBC', TJSONNumber.Create(AICMS.vBC));
   Result.AddPair('pRedBC', TJSONNumber.Create(AICMS.pRedBC));
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

Class Function TNFeICMSJsonBuilder.BuildICMSSN101(AICMS: TNFeICMSDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   Result.AddPair('orig', TJSONNumber.Create(AICMS.orig));
   Result.AddPair('CSOSN', AICMS.CSOSN);
   Result.AddPair('pCredSN', TJSONNumber.Create(AICMS.pCredSN));
   Result.AddPair('vCredICMSSN', TJSONNumber.Create(AICMS.vCredICMSSN));
End;

Class Function TNFeICMSJsonBuilder.BuildICMSSN102(AICMS: TNFeICMSDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   Result.AddPair('orig', TJSONNumber.Create(AICMS.orig));
   Result.AddPair('CSOSN', AICMS.CSOSN);
End;

Class Function TNFeICMSJsonBuilder.BuildICMSSN201(AICMS: TNFeICMSDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   Result.AddPair('orig', TJSONNumber.Create(AICMS.orig));
   Result.AddPair('CSOSN', AICMS.CSOSN);

   Result.AddPair('modBCST', TJSONNumber.Create(AICMS.modBCST));
   Result.AddPair('pMVAST', TJSONNumber.Create(AICMS.pMVAST));
   Result.AddPair('pRedBCST', TJSONNumber.Create(AICMS.pRedBCST));
   Result.AddPair('vBCST', TJSONNumber.Create(AICMS.vBCST));
   Result.AddPair('pICMSST', TJSONNumber.Create(AICMS.pICMSST));
   Result.AddPair('vICMSST', TJSONNumber.Create(AICMS.vICMSST));

   Result.AddPair('pCredSN', TJSONNumber.Create(AICMS.pCredSN));
   Result.AddPair('vCredICMSSN', TJSONNumber.Create(AICMS.vCredICMSSN));

   If AICMS.vBCFCPST > 0 Then
   Begin
      Result.AddPair('vBCFCPST', TJSONNumber.Create(AICMS.vBCFCPST));
      Result.AddPair('pFCPST', TJSONNumber.Create(AICMS.pFCPST));
      Result.AddPair('vFCPST', TJSONNumber.Create(AICMS.vFCPST));
   End;
End;

Class Function TNFeICMSJsonBuilder.BuildICMSSN202(AICMS: TNFeICMSDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   Result.AddPair('orig', TJSONNumber.Create(AICMS.orig));
   Result.AddPair('CSOSN', AICMS.CSOSN);

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

Class Function TNFeICMSJsonBuilder.BuildICMSSN900(AICMS: TNFeICMSDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   Result.AddPair('orig', TJSONNumber.Create(AICMS.orig));
   Result.AddPair('CSOSN', AICMS.CSOSN);

   Result.AddPair('modBC', TJSONNumber.Create(AICMS.modBC));
   Result.AddPair('pRedBC', TJSONNumber.Create(AICMS.pRedBC));
   Result.AddPair('vBC', TJSONNumber.Create(AICMS.vBC));
   Result.AddPair('pICMS', TJSONNumber.Create(AICMS.pICMS));
   Result.AddPair('vICMS', TJSONNumber.Create(AICMS.vICMS));

   Result.AddPair('modBCST', TJSONNumber.Create(AICMS.modBCST));
   Result.AddPair('pMVAST', TJSONNumber.Create(AICMS.pMVAST));
   Result.AddPair('pRedBCST', TJSONNumber.Create(AICMS.pRedBCST));
   Result.AddPair('vBCST', TJSONNumber.Create(AICMS.vBCST));
   Result.AddPair('pICMSST', TJSONNumber.Create(AICMS.pICMSST));
   Result.AddPair('vICMSST', TJSONNumber.Create(AICMS.vICMSST));

   Result.AddPair('pCredSN', TJSONNumber.Create(AICMS.pCredSN));
   Result.AddPair('vCredICMSSN', TJSONNumber.Create(AICMS.vCredICMSSN));

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

   If (AnsiIndexStr(AICMS.CST, ['40', '41', '50']) >= 0) Then
      Exit(igICMS40);

   If AICMS.CST = '51' Then
      Exit(igICMS51);

   If AICMS.CST = '60' Then
      Exit(igICMS60);

   If AICMS.CST = '61' Then
      Exit(igICMS61);

   If AICMS.CST = '70' Then
      Exit(igICMS70);

   If AICMS.CST = '90' Then
      Exit(igICMS90);

   If AICMS.CSOSN = '101' Then
      Exit(igICMSSN101);

   If (AnsiIndexStr(AICMS.CST, ['102', '103', '300', '400']) >= 0) Then
      Exit(igICMSSN102);

   If AICMS.CSOSN = '201' Then
      Exit(igICMSSN201);

   If (AnsiIndexStr(AICMS.CST, ['202', '203']) >= 0) Then
      Exit(igICMSSN202);

   If AICMS.CSOSN = '900' Then
      Exit(igICMSSN900);

   Raise EArgumentException.CreateFmt(
      'CST/CSOSN não suportado. CST=%s CSOSN=%s',
      [AICMS.CST, AICMS.CSOSN]
      );
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

      igICMS51:
         Result.AddPair('ICMS51', BuildICMS51(AICMS));

      igICMS60:
         Result.AddPair('ICMS60', BuildICMS60(AICMS));

      igICMS61:
         Result.AddPair('ICMS61', BuildICMS61(AICMS));

      igICMS70:
         Result.AddPair('ICMS70', BuildICMS70(AICMS));

      igICMS90:
         Result.AddPair('ICMS90', BuildICMS90(AICMS));

      igICMSSN101:
         Result.AddPair('ICMSSN101', BuildICMSSN101(AICMS));

      igICMSSN102:
         Result.AddPair('ICMSSN102', BuildICMSSN102(AICMS));

      igICMSSN201:
         Result.AddPair('ICMSSN201', BuildICMSSN201(AICMS));

      igICMSSN202:
         Result.AddPair('ICMSSN202', BuildICMSSN202(AICMS));

      igICMSSN900:
         Result.AddPair('ICMSSN900', BuildICMSSN900(AICMS));
   End;
End;

End.
