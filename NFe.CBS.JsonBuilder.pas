Unit NFe.CBS.JsonBuilder;

Interface

Uses
   System.JSON, NFe.DTO;

Type
   TNFeCBSJsonBuilder = Class
   Private
      //
   Public
      Class Function Build(ADTO: TNFeCBSDTO): TJSONObject; Static;
   End;

Implementation

Class Function TNFeCBSJsonBuilder.Build(ADTO: TNFeCBSDTO): TJSONObject;
Var
   gDif, gRed, gDevTrib, gALCZFMCBS: TJSONObject;
Begin
   Result := TJSONObject.Create;

   If Not Assigned(ADTO) Then
      Exit;

   Result.AddPair('pCBS', TJSONNumber.Create(ADTO.pCBS));
   Result.AddPair('vCBS', TJSONNumber.Create(ADTO.vCBS));

   If (ADTO.vDif > 0) Then
   Begin
      gDif := TJSONObject.Create;
      Try
         gDif.AddPair('pDif', TJSONNumber.Create(ADTO.pDif));
         gDif.AddPair('vDif', TJSONNumber.Create(ADTO.vDif));
         Result.AddPair('gDif', gDif);
      Finally
         //
      End;
   End;

   If (ADTO.pRedAliq > 0) Then
   Begin
      gRed := TJSONObject.Create;
      Try
         gRed.AddPair('pRedAliq', TJSONNumber.Create(ADTO.pRedAliq));
         gRed.AddPair('pAliqEfet', TJSONNumber.Create(ADTO.pAliqEfet));
         Result.AddPair('gRed', gRed);
      Finally
         //
      End;
   End;

   If (ADTO.vDevTrib > 0) Then
   Begin
      gDevTrib := TJSONObject.Create;
      Try
         gDevTrib.AddPair('pDevTrib', TJSONNumber.Create(ADTO.pDevTrib));
         gDevTrib.AddPair('vDevTrib', TJSONNumber.Create(ADTO.vDevTrib));
         Result.AddPair('gDevTrib', gDevTrib);
      Finally
         //
      End;
   End;

   If (ADTO.gALCZFMCBS.vTribRegCBS > 0) Then
   Begin
      gALCZFMCBS := TJSONObject.Create;
      Try
         gALCZFMCBS.AddPair('tpALCZFMCBS', TJSONNumber.Create(ADTO.gALCZFMCBS.tpALCZFMCBS));
         gALCZFMCBS.AddPair('nProcSuframa', ADTO.gALCZFMCBS.nProcSuframa);
         gALCZFMCBS.AddPair('pAliqEfetRegCBS', TJSONNumber.Create(ADTO.gALCZFMCBS.pAliqEfetRegCBS));
         gALCZFMCBS.AddPair('nProcSuframa', TJSONNumber.Create(ADTO.gALCZFMCBS.nProcSuframa));
         Result.AddPair('gALCZFMCBS', gALCZFMCBS);
      Finally
         //
      End;
   End;
End;

End.
