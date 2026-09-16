Unit NFe.IBS.JsonBuilder;

Interface

Uses
   System.JSON, NFe.DTO;

Type
   TNFeIBSJsonBuilder = Class
   Private
      //
   Public
      Class Function BuildIBSUF(ADTO: TNFeIBSUFDTO): TJSONObject; Static;
      Class Function BuildIBSMun(ADTO: TNFeIBSMunDTO): TJSONObject; Static;
   End;

Implementation

Class Function TNFeIBSJsonBuilder.BuildIBSUF(ADTO: TNFeIBSUFDTO): TJSONObject;
Var
   gDif, gRed, gDevTrib: TJSONObject;
Begin
   Result := TJSONObject.Create;

   If Not Assigned(ADTO) Then
      Exit;

   Result.AddPair('pIBSUF', TJSONNumber.Create(ADTO.pIBSUF));
   Result.AddPair('vIBSUF', TJSONNumber.Create(ADTO.vIBSUF));

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
End;

Class Function TNFeIBSJsonBuilder.BuildIBSMun(ADTO: TNFeIBSMunDTO): TJSONObject;
Var
   gDif, gRed, gDevTrib: TJSONObject;
Begin
   Result := TJSONObject.Create;

   If Not Assigned(ADTO) Then
      Exit;

   Result.AddPair('pIBSMun', TJSONNumber.Create(ADTO.pIBSMun));
   Result.AddPair('vIBSMun', TJSONNumber.Create(ADTO.vIBSMun));

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
End;

End.
