Unit NFe.IBSCBSMono.JsonBuilder;

Interface

Uses
   System.JSON,
   NFe.DTO;

Type
   TNFeIBSCBSMonoJsonBuilder = Class
   Private
      Class Function BuildIBSMonoAdRem(ADTO: TNFeIBSMonoAdRemDTO): TJSONObject; Static;
      Class Function BuildIBSMonoAdRemPadrao(ADTO: TNFeIBSMonoAdRemPadraoDTO): TJSONObject; Static;
      Class Function BuildIBSMonoAdRemReten(ADTO: TNFeIBSMonoAdRemRetenDTO): TJSONObject; Static;
      Class Function BuildIBSMonoAdRemRet(ADTO: TNFeIBSMonoAdRemRetDTO): TJSONObject; Static;
      Class Function BuildIBSMonoAdRemBioDiferenca(ADTO: TNFeIBSMonoAdRemBioDiferencaDTO): TJSONObject; Static;
      Class Function BuildIBSMonoAdValorem(ADTO: TNFeIBSMonoAdValoremDTO): TJSONObject; Static;
      Class Function BuildIBSMonoAdValoremPadrao(ADTO: TNFeIBSMonoAdValoremPadraoDTO): TJSONObject; Static;
      Class Function BuildIBSMonoAdValoremReten(ADTO: TNFeIBSMonoAdValoremRetenDTO): TJSONObject; Static;
      Class Function BuildIBSMonoAdValoremRet(ADTO: TNFeIBSMonoAdValoremRetDTO): TJSONObject; Static;
      Class Function BuildIBSMonoAdValoremBioDiferenca(ADTO: TNFeIBSMonoAdValoremBioDiferencaDTO): TJSONObject; Static;
      Class Function BuildCBSMonoAdRem(ADTO: TNFeCBSMonoAdRemDTO): TJSONObject; Static;
      Class Function BuildCBSMonoAdRemPadrao(ADTO: TNFeCBSMonoAdRemPadraoDTO): TJSONObject; Static;
      Class Function BuildCBSMonoAdRemReten(ADTO: TNFeCBSMonoAdRemRetenDTO): TJSONObject; Static;
      Class Function BuildCBSMonoAdRemRet(ADTO: TNFeCBSMonoAdRemRetDTO): TJSONObject; Static;
      Class Function BuildCBSMonoAdRemBioDiferenca(ADTO: TNFeCBSMonoAdRemBioDiferencaDTO): TJSONObject; Static;
      Class Function BuildCBSMonoAdValorem(ADTO: TNFeCBSMonoAdValoremDTO): TJSONObject; Static;
      Class Function BuildCBSMonoAdValoremPadrao(ADTO: TNFeCBSMonoAdValoremPadraoDTO): TJSONObject; Static;
      Class Function BuildCBSMonoAdValoremReten(ADTO: TNFeCBSMonoAdValoremRetenDTO): TJSONObject; Static;
      Class Function BuildCBSMonoAdValoremRet(ADTO: TNFeCBSMonoAdValoremRetDTO): TJSONObject; Static;
      Class Function BuildCBSMonoAdValoremBioDiferenca(ADTO: TNFeCBSMonoAdValoremBioDiferencaDTO): TJSONObject; Static;
   Public
      Class Function Build(ADTO: TNFeIBSCBSMonoDTO): TJSONObject; Static;
   End;

Implementation

Class Function TNFeIBSCBSMonoJsonBuilder.Build(ADTO: TNFeIBSCBSMonoDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   // If Not Assigned(ADTO) Then
   // Exit;

   // If Assigned(ADTO.gIBSMonoAdRem) Then
   Result.AddPair('gIBSMonoAdRem', BuildIBSMonoAdRem(ADTO.gIBSMonoAdRem));

   // If Assigned(ADTO.gIBSMonoAdValorem) Then
   Result.AddPair('gIBSMonoAdValorem', BuildIBSMonoAdValorem(ADTO.gIBSMonoAdValorem));

   // If Assigned(ADTO.gCBSMonoAdRem) Then
   Result.AddPair('gCBSMonoAdRem', BuildCBSMonoAdRem(ADTO.gCBSMonoAdRem));

   // If Assigned(ADTO.gCBSMonoAdValorem) Then
   Result.AddPair('gCBSMonoAdValorem', BuildCBSMonoAdValorem(ADTO.gCBSMonoAdValorem));

   Result.AddPair('vTotIBSMonoItem', TJSONNumber.Create(ADTO.vTotIBSMonoItem));
   Result.AddPair('vTotCBSMonoItem', TJSONNumber.Create(ADTO.vTotCBSMonoItem));
End;

Class Function TNFeIBSCBSMonoJsonBuilder.BuildIBSMonoAdRem(ADTO: TNFeIBSMonoAdRemDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   // If Not Assigned(ADTO) Then
   // Exit;

   /// If Assigned(ADTO.gMonoPadrao) Then
   Result.AddPair('gMonoPadrao', BuildIBSMonoAdRemPadrao(ADTO.gMonoPadrao));

   // If Assigned(ADTO.gMonoReten) Then
   Result.AddPair('gMonoReten', BuildIBSMonoAdRemReten(ADTO.gMonoReten));

   // If Assigned(ADTO.gMonoRet) Then
   Result.AddPair('gMonoRet', BuildIBSMonoAdRemRet(ADTO.gMonoRet));

   // If Assigned(ADTO.gpBioDiferenca) Then
   Result.AddPair('gpBioDiferenca', BuildIBSMonoAdRemBioDiferenca(ADTO.gpBioDiferenca));
End;

Class Function TNFeIBSCBSMonoJsonBuilder.BuildIBSMonoAdRemPadrao(ADTO: TNFeIBSMonoAdRemPadraoDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   // If Not Assigned(ADTO) Then
   // Exit;

   Result.AddPair('qBCMono', TJSONNumber.Create(ADTO.qBCMono));
   Result.AddPair('adRemIBS', TJSONNumber.Create(ADTO.adRemIBS));
   Result.AddPair('vIBSMono', TJSONNumber.Create(ADTO.vIBSMono));
End;

Class Function TNFeIBSCBSMonoJsonBuilder.BuildIBSMonoAdRemReten(ADTO: TNFeIBSMonoAdRemRetenDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   // If Not Assigned(ADTO) Then
   // Exit;

   Result.AddPair('qBCMonoReten', TJSONNumber.Create(ADTO.qBCMonoReten));
   Result.AddPair('adRemIBSReten', TJSONNumber.Create(ADTO.adRemIBSReten));
   Result.AddPair('vIBSMonoReten', TJSONNumber.Create(ADTO.vIBSMonoReten));
End;

Class Function TNFeIBSCBSMonoJsonBuilder.BuildIBSMonoAdRemRet(ADTO: TNFeIBSMonoAdRemRetDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   // If Not Assigned(ADTO) Then
   // Exit;

   Result.AddPair('vIBSMonoRet', TJSONNumber.Create(ADTO.vIBSMonoRet));
End;

Class Function TNFeIBSCBSMonoJsonBuilder.BuildIBSMonoAdRemBioDiferenca(ADTO: TNFeIBSMonoAdRemBioDiferencaDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   // If Not Assigned(ADTO) Then
   // Exit;

   Result.AddPair('qBCBioComb', TJSONNumber.Create(ADTO.qBCBioComb));
   Result.AddPair('vIBSDiferenca', TJSONNumber.Create(ADTO.vIBSDiferenca));
End;

Class Function TNFeIBSCBSMonoJsonBuilder.BuildIBSMonoAdValorem(ADTO: TNFeIBSMonoAdValoremDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   // If Not Assigned(ADTO) Then
   // Exit;

   // If Assigned(ADTO.gMonoPadrao) Then
   Result.AddPair('gMonoPadrao', BuildIBSMonoAdValoremPadrao(ADTO.gMonoPadrao));

   // If Assigned(ADTO.gMonoReten) Then
   Result.AddPair('gMonoReten', BuildIBSMonoAdValoremReten(ADTO.gMonoReten));

   // If Assigned(ADTO.gMonoRet) Then
   Result.AddPair('gMonoRet', BuildIBSMonoAdValoremRet(ADTO.gMonoRet));

   // If Assigned(ADTO.gpBioDiferenca) Then
   Result.AddPair('gpBioDiferenca', BuildIBSMonoAdValoremBioDiferenca(ADTO.gpBioDiferenca));
End;

Class Function TNFeIBSCBSMonoJsonBuilder.BuildIBSMonoAdValoremPadrao(ADTO: TNFeIBSMonoAdValoremPadraoDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   // If Not Assigned(ADTO) Then
   // Exit;

   Result.AddPair('vBCMono', TJSONNumber.Create(ADTO.vBCMono));
   Result.AddPair('pAliqMonoUF', TJSONNumber.Create(ADTO.pAliqMonoUF));
   Result.AddPair('vIBSMonoUF', TJSONNumber.Create(ADTO.vIBSMonoUF));
   Result.AddPair('pAliqMonoMun', TJSONNumber.Create(ADTO.pAliqMonoMun));
   Result.AddPair('vIBSMonoMun', TJSONNumber.Create(ADTO.vIBSMonoMun));
   Result.AddPair('vIBSMono', TJSONNumber.Create(ADTO.vIBSMono));
End;

Class Function TNFeIBSCBSMonoJsonBuilder.BuildIBSMonoAdValoremReten(ADTO: TNFeIBSMonoAdValoremRetenDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   // If Not Assigned(ADTO) Then
   // Exit;

   Result.AddPair('vBCMonoReten', TJSONNumber.Create(ADTO.vBCMonoReten));
   Result.AddPair('pAliqMonoReten', TJSONNumber.Create(ADTO.pAliqMonoReten));
   Result.AddPair('vIBSMonoReten', TJSONNumber.Create(ADTO.vIBSMonoReten));
End;

Class Function TNFeIBSCBSMonoJsonBuilder.BuildIBSMonoAdValoremRet(ADTO: TNFeIBSMonoAdValoremRetDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   // If Not Assigned(ADTO) Then
   // Exit;

   Result.AddPair('vIBSMonoRet', TJSONNumber.Create(ADTO.vIBSMonoRet));
End;

Class Function TNFeIBSCBSMonoJsonBuilder.BuildIBSMonoAdValoremBioDiferenca(ADTO: TNFeIBSMonoAdValoremBioDiferencaDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   // If Not Assigned(ADTO) Then
   // Exit;

   Result.AddPair('qBCBioComb', TJSONNumber.Create(ADTO.qBCBioComb));
   Result.AddPair('vIBSDiferenca', TJSONNumber.Create(ADTO.vIBSDiferenca));
End;

Class Function TNFeIBSCBSMonoJsonBuilder.BuildCBSMonoAdRem(ADTO: TNFeCBSMonoAdRemDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   // If Not Assigned(ADTO) Then
   // Exit;

   // If Assigned(ADTO.gMonoPadrao) Then
   Result.AddPair('gMonoPadrao', BuildCBSMonoAdRemPadrao(ADTO.gMonoPadrao));

   // If Assigned(ADTO.gMonoReten) Then
   Result.AddPair('gMonoReten', BuildCBSMonoAdRemReten(ADTO.gMonoReten));

   // If Assigned(ADTO.gMonoRet) Then
   Result.AddPair('gMonoRet', BuildCBSMonoAdRemRet(ADTO.gMonoRet));

   // If Assigned(ADTO.gpBioDiferenca) Then
   Result.AddPair('gpBioDiferenca', BuildCBSMonoAdRemBioDiferenca(ADTO.gpBioDiferenca));
End;

Class Function TNFeIBSCBSMonoJsonBuilder.BuildCBSMonoAdRemPadrao(ADTO: TNFeCBSMonoAdRemPadraoDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   // If Not Assigned(ADTO) Then
   // Exit;

   Result.AddPair('qBCMono', TJSONNumber.Create(ADTO.qBCMono));
   Result.AddPair('adRemCBS', TJSONNumber.Create(ADTO.adRemCBS));
   Result.AddPair('vCBSMono', TJSONNumber.Create(ADTO.vCBSMono));
End;

Class Function TNFeIBSCBSMonoJsonBuilder.BuildCBSMonoAdRemReten(ADTO: TNFeCBSMonoAdRemRetenDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   // If Not Assigned(ADTO) Then
   // Exit;

   Result.AddPair('qBCMonoReten', TJSONNumber.Create(ADTO.qBCMonoReten));
   Result.AddPair('adRemCBSReten', TJSONNumber.Create(ADTO.adRemCBSReten));
   Result.AddPair('vCBSMonoReten', TJSONNumber.Create(ADTO.vCBSMonoReten));
End;

Class Function TNFeIBSCBSMonoJsonBuilder.BuildCBSMonoAdRemRet(ADTO: TNFeCBSMonoAdRemRetDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   // If Not Assigned(ADTO) Then
   // Exit;

   Result.AddPair('vCBSMonoRet', TJSONNumber.Create(ADTO.vCBSMonoRet));
End;

Class Function TNFeIBSCBSMonoJsonBuilder.BuildCBSMonoAdRemBioDiferenca(ADTO: TNFeCBSMonoAdRemBioDiferencaDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   // If Not Assigned(ADTO) Then
   // Exit;

   Result.AddPair('qBCBioComb', TJSONNumber.Create(ADTO.qBCBioComb));
   Result.AddPair('vCBSDiferenca', TJSONNumber.Create(ADTO.vCBSDiferenca));
End;

Class Function TNFeIBSCBSMonoJsonBuilder.BuildCBSMonoAdValorem(ADTO: TNFeCBSMonoAdValoremDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   // If Not Assigned(ADTO) Then
   // Exit;

   // If Assigned(ADTO.gMonoPadrao) Then
   Result.AddPair('gMonoPadrao', BuildCBSMonoAdValoremPadrao(ADTO.gMonoPadrao));

   // If Assigned(ADTO.gMonoReten) Then
   Result.AddPair('gMonoReten', BuildCBSMonoAdValoremReten(ADTO.gMonoReten));

   // If Assigned(ADTO.gMonoRet) Then
   Result.AddPair('gMonoRet', BuildCBSMonoAdValoremRet(ADTO.gMonoRet));

   // If Assigned(ADTO.gpBioDiferenca) Then
   Result.AddPair('gpBioDiferenca', BuildCBSMonoAdValoremBioDiferenca(ADTO.gpBioDiferenca));
End;

Class Function TNFeIBSCBSMonoJsonBuilder.BuildCBSMonoAdValoremPadrao(ADTO: TNFeCBSMonoAdValoremPadraoDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   // If Not Assigned(ADTO) Then
   // Exit;

   Result.AddPair('vBCMono', TJSONNumber.Create(ADTO.vBCMono));
   Result.AddPair('pAliqMonoCBS', TJSONNumber.Create(ADTO.pAliqMonoCBS));
   Result.AddPair('vCBSMono', TJSONNumber.Create(ADTO.vCBSMono));
End;

Class Function TNFeIBSCBSMonoJsonBuilder.BuildCBSMonoAdValoremReten(ADTO: TNFeCBSMonoAdValoremRetenDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   // If Not Assigned(ADTO) Then
   // Exit;

   Result.AddPair('vBCMonoReten', TJSONNumber.Create(ADTO.vBCMonoReten));
   Result.AddPair('pAliqMonoReten', TJSONNumber.Create(ADTO.pAliqMonoReten));
   Result.AddPair('vCBSMonoReten', TJSONNumber.Create(ADTO.vCBSMonoReten));
End;

Class Function TNFeIBSCBSMonoJsonBuilder.BuildCBSMonoAdValoremRet(ADTO: TNFeCBSMonoAdValoremRetDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   // If Not Assigned(ADTO) Then
   Exit;

   Result.AddPair('vCBSMonoRet', TJSONNumber.Create(ADTO.vCBSMonoRet));
End;

Class Function TNFeIBSCBSMonoJsonBuilder.BuildCBSMonoAdValoremBioDiferenca(ADTO: TNFeCBSMonoAdValoremBioDiferencaDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   // If Not Assigned(ADTO) Then
   // Exit;

   Result.AddPair('qBCBioComb', TJSONNumber.Create(ADTO.qBCBioComb));
   Result.AddPair('vCBSDiferenca', TJSONNumber.Create(ADTO.vCBSDiferenca));
End;

End.
