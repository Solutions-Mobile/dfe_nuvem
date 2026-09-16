Unit NFe.RetTribTot.JsonBuilder;

Interface

Uses
   System.JSON, NFe.DTO;

Type
   TNFeRetTribTotJsonBuilder = Class
   Public
      Class Function Build(ADTO: TNFeRetTribTotDTO): TJSONObject; Static;
   End;

Implementation

Class Function TNFeRetTribTotJsonBuilder.Build(ADTO: TNFeRetTribTotDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   If Not Assigned(ADTO) Then
      Exit;

   Result.AddPair('vRetPIS', TJSONNumber.Create(ADTO.vRetPIS));
   Result.AddPair('vRetCOFINS', TJSONNumber.Create(ADTO.vRetCOFINS));
   Result.AddPair('vRetCSLL', TJSONNumber.Create(ADTO.vRetCSLL));
   Result.AddPair('vBCIRRF', TJSONNumber.Create(ADTO.vBCIRRF));
   Result.AddPair('vIRRF', TJSONNumber.Create(ADTO.vIRRF));
   Result.AddPair('vBCRetPrev', TJSONNumber.Create(ADTO.vBCRetPrev));
   Result.AddPair('vRetPrev', TJSONNumber.Create(ADTO.vRetPrev));
End;

End.
