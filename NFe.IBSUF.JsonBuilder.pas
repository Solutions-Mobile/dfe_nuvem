Unit NFe.IBSUF.JsonBuilder;

Interface

Uses
   System.JSON,
   NFe.DTO;

Type
   TNFeIBSUFTotJsonBuilder = Class
   Public
      Class Function Build(ATotal: TNFeIBSUFDTO): TJSONObject; Static;
   End;

Implementation

Class Function TNFeIBSUFTotJsonBuilder.Build(ATotal: TNFeIBSUFDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   If ATotal = Nil Then
      Exit;

//   Result.AddPair('vIBS', TJSONNumber.Create(ATotal.vIBS));
//   Result.AddPair('vDif', TJSONNumber.Create(ATotal.vDif));
//   Result.AddPair('vDevTrib', TJSONNumber.Create(ATotal.vDevTrib));
//   Result.AddPair('vCredPres', TJSONNumber.Create(ATotal.vCredPres));
//   Result.AddPair('vCredPresCondSus', TJSONNumber.Create(ATotal.vCredPresCondSus));
End;

End.
