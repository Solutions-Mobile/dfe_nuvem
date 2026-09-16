Unit NFe.IBSCBSTot.JsonBuilder;

Interface

Uses
   System.JSON, NFe.DTO;

Type
   TNFeIBSCBSTotJsonBuilder = Class
   Private
      Class Function BuildIBSUF(ADTO: TNFeIBSUFTotDTO): TJSONObject; Static;
      Class Function BuildIBSMun(ADTO: TNFeIBSMunTotDTO): TJSONObject; Static;
      Class Function BuildIBS(ADTO: TNFeIBSTotDTO): TJSONObject; Static;
      Class Function BuildCBS(ADTO: TNFeCBSTotDTO): TJSONObject; Static;
      Class Function BuildMono(ADTO: TNFeMonoTotDTO): TJSONObject; Static;
   Public
      Class Function Build(ADTO: TNFeIBSCBSTotDTO): TJSONObject; Static;
   End;

Implementation

Class Function TNFeIBSCBSTotJsonBuilder.BuildIBSUF(ADTO: TNFeIBSUFTotDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   If Not Assigned(ADTO) Then
      Exit;

   Result.AddPair('vDif', TJSONNumber.Create(ADTO.vDif));
   Result.AddPair('vDevTrib', TJSONNumber.Create(ADTO.vDevTrib));
   Result.AddPair('vIBSUF', TJSONNumber.Create(ADTO.vIBSUF));
End;

Class Function TNFeIBSCBSTotJsonBuilder.BuildIBSMun(ADTO: TNFeIBSMunTotDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   If Not Assigned(ADTO) Then
      Exit;

   Result.AddPair('vDif', TJSONNumber.Create(ADTO.vDif));
   Result.AddPair('vDevTrib', TJSONNumber.Create(ADTO.vDevTrib));
   Result.AddPair('vIBSMun', TJSONNumber.Create(ADTO.vIBSMun));
End;

Class Function TNFeIBSCBSTotJsonBuilder.BuildIBS(ADTO: TNFeIBSTotDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   If Not Assigned(ADTO) Then
      Exit;

   If Assigned(ADTO.gIBSUF) Then
      Result.AddPair('gIBSUF', BuildIBSUF(ADTO.gIBSUF));

   If Assigned(ADTO.gIBSMun) Then
      Result.AddPair('gIBSMun', BuildIBSMun(ADTO.gIBSMun));

   Result.AddPair('vIBS', TJSONNumber.Create(ADTO.vIBS));
   Result.AddPair('vCredPres', TJSONNumber.Create(ADTO.vCredPres));
   Result.AddPair('vCredPresCondSus', TJSONNumber.Create(ADTO.vCredPresCondSus));
End;

Class Function TNFeIBSCBSTotJsonBuilder.BuildCBS(ADTO: TNFeCBSTotDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   If Not Assigned(ADTO) Then
      Exit;

   Result.AddPair('vDif', TJSONNumber.Create(ADTO.vDif));
   Result.AddPair('vDevTrib', TJSONNumber.Create(ADTO.vDevTrib));
   Result.AddPair('vCBS', TJSONNumber.Create(ADTO.vCBS));
   Result.AddPair('vCredPres', TJSONNumber.Create(ADTO.vCredPres));
   Result.AddPair('vCredPresCondSus', TJSONNumber.Create(ADTO.vCredPresCondSus));
End;

Class Function TNFeIBSCBSTotJsonBuilder.BuildMono(ADTO: TNFeMonoTotDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   If Not Assigned(ADTO) Then
      Exit;

   Result.AddPair('vIBSMono', TJSONNumber.Create(ADTO.vIBSMono));
   Result.AddPair('vCBSMono', TJSONNumber.Create(ADTO.vCBSMono));
   Result.AddPair('vIBSMonoReten', TJSONNumber.Create(ADTO.vIBSMonoReten));
   Result.AddPair('vCBSMonoReten', TJSONNumber.Create(ADTO.vCBSMonoReten));
   Result.AddPair('vIBSMonoRet', TJSONNumber.Create(ADTO.vIBSMonoRet));
   Result.AddPair('vCBSMonoRet', TJSONNumber.Create(ADTO.vCBSMonoRet));
End;

Class Function TNFeIBSCBSTotJsonBuilder.Build(ADTO: TNFeIBSCBSTotDTO
   ): TJSONObject;
Begin
   Result := TJSONObject.Create;

   If Not Assigned(ADTO) Then
      Exit;

   Result.AddPair('vBCIBSCBS', TJSONNumber.Create(ADTO.vBCIBSCBS));

   If Assigned(ADTO.gIBS) Then
      Result.AddPair('gIBS', BuildIBS(ADTO.gIBS));

   If Assigned(ADTO.gCBS) Then
      Result.AddPair('gCBS', BuildCBS(ADTO.gCBS));

   If Assigned(ADTO.gMono) Then
      Result.AddPair('gMono', BuildMono(ADTO.gMono));

   Result.AddPair('vNFTot', TJSONNumber.Create(ADTO.vNFTot));
End;

End.
