Unit NFe.ICMSTot.JsonBuilder;

Interface

Uses
   System.JSON, NFe.DTO;

Type
   TNFeICMSTotJsonBuilder = Class
   Public
      Class Function Build(ATotal: TNFeICMSTotDTO): TJSONObject; Static;
   End;

Implementation

Class Function TNFeICMSTotJsonBuilder.Build(ATotal: TNFeICMSTotDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   If ATotal = Nil Then
      Exit;

   Result.AddPair('vBC', TJSONNumber.Create(ATotal.vBC));
   Result.AddPair('vICMS', TJSONNumber.Create(ATotal.vICMS));
   Result.AddPair('vICMSDeson', TJSONNumber.Create(ATotal.vICMSDeson));
   Result.AddPair('vFCP', TJSONNumber.Create(ATotal.vFCP));
   Result.AddPair('vBCST', TJSONNumber.Create(ATotal.vBCST));
   Result.AddPair('vST', TJSONNumber.Create(ATotal.vST));
   Result.AddPair('vFCPST', TJSONNumber.Create(ATotal.vFCPST));
   Result.AddPair('vFCPSTRet', TJSONNumber.Create(ATotal.vFCPSTRet));
   Result.AddPair('vProd', TJSONNumber.Create(ATotal.vProd));
   Result.AddPair('vFrete', TJSONNumber.Create(ATotal.vFrete));
   Result.AddPair('vSeg', TJSONNumber.Create(ATotal.vSeg));
   Result.AddPair('vDesc', TJSONNumber.Create(ATotal.vDesc));
   Result.AddPair('vII', TJSONNumber.Create(ATotal.vII));
   Result.AddPair('vIPI', TJSONNumber.Create(ATotal.vIPI));
   Result.AddPair('vIPIDevol', TJSONNumber.Create(ATotal.vIPIDevol));
   Result.AddPair('vPIS', TJSONNumber.Create(ATotal.vPIS));
   Result.AddPair('vCOFINS', TJSONNumber.Create(ATotal.vCOFINS));
   Result.AddPair('vOutro', TJSONNumber.Create(ATotal.vOutro));
   Result.AddPair('vNF', TJSONNumber.Create(ATotal.vNF));
   Result.AddPair('vTotTrib', TJSONNumber.Create(ATotal.vTotTrib));
   Result.AddPair('vFCPUFDest', TJSONNumber.Create(ATotal.vFCPUFDest));
   Result.AddPair('vICMSUFRemet', TJSONNumber.Create(ATotal.vICMSUFRemet));
   Result.AddPair('vICMSMonoReten', TJSONNumber.Create(ATotal.vICMSMonoReten));
   Result.AddPair('qBCMonoReten', TJSONNumber.Create(ATotal.qBCMonoReten));
   Result.AddPair('vICMSMono', TJSONNumber.Create(ATotal.vICMSMono));
   Result.AddPair('vICMSMonoRet', TJSONNumber.Create(ATotal.vICMSMonoRet));
   Result.AddPair('qBCMono', TJSONNumber.Create(ATotal.qBCMono));
   Result.AddPair('qBCMonoRet', TJSONNumber.Create(ATotal.qBCMonoRet));
   Result.AddPair('vICMSUFDest', TJSONNumber.Create(ATotal.vICMSUFDest));
End;

End.
