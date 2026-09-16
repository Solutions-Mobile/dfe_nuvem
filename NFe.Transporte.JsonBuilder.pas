Unit NFe.Transporte.JsonBuilder;

Interface

Uses
   System.JSON, NFe.DTO;

Type

   TNFeTransporteJsonBuilder = Class
   Private
      Class Function BuildTransporta(AData: TNFeTransportadorDTO): TJSONObject; Static;
      Class Function BuildRetTransp(AData: TNFeRetTranspDTO): TJSONObject; Static;
      Class Function BuildVeicTransp(AData: TNFeVeicTranspDTO): TJSONObject; Static;
      Class Function BuildVolume(AData: TNFeVolumeDTO): TJSONObject; Static;
      Class Function BuildLacre(AData: TNFeLacreDTO): TJSONObject; Static;
      Class Function BuildReboque(AData: TNFeLacreDTO): TJSONObject; Static;
   Public
      Class Function Build(ATransporte: TNFeTransporteDTO): TJSONObject; Static;
   End;

Implementation

{ TNFeTransporteJsonBuilder }

Class Function TNFeTransporteJsonBuilder.Build(ATransporte: TNFeTransporteDTO): TJSONObject;
Var
   Item: TNFeVeicTranspDTO;
   Volume: TNFeVolumeDTO;
   Volumes, Reboques: TJSONArray;
Begin
   Result := TJSONObject.Create;

   Result.AddPair('modFrete', TJSONNumber.Create(ATransporte.modFrete));

   If Assigned(ATransporte.transporta) Then
      Result.AddPair('transporta', BuildTransporta(ATransporte.transporta));

   If Assigned(ATransporte.retTransp) And (ATransporte.retTransp.vServ > 0) Then
      Result.AddPair('retTransp', BuildRetTransp(ATransporte.retTransp));

   If Assigned(ATransporte.veicTransp) And (ATransporte.veicTransp.placa<> '') Then
      Result.AddPair('veicTransp', BuildVeicTransp(ATransporte.veicTransp));

   If Length(ATransporte.reboque) > 0 Then
   Begin
      Reboques := TJSONArray.Create;
      For Item In ATransporte.reboque Do
         Reboques.AddElement(BuildVeicTransp(Item));

      Result.AddPair('reboque', Reboques);
   End;

   If ATransporte.vagao <> '' Then
      Result.AddPair('vagao', ATransporte.vagao);

   If ATransporte.balsa <> '' Then
      Result.AddPair('balsa', ATransporte.balsa);

   If Length(ATransporte.vol) > 0 Then
   Begin
      Volumes := TJSONArray.Create;
      For Volume In ATransporte.vol Do
         Volumes.AddElement(BuildVolume(Volume));

      Result.AddPair('vol', Volumes);
   End;
End;

Class Function TNFeTransporteJsonBuilder.BuildTransporta(AData: TNFeTransportadorDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   If AData.CNPJ <> '' Then
      Result.AddPair('CNPJ', AData.CNPJ);

   If AData.CPF <> '' Then
      Result.AddPair('CPF', AData.CPF);

   If AData.xNome <> '' Then
      Result.AddPair('xNome', AData.xNome);

   If AData.IE <> '' Then
      Result.AddPair('IE', AData.IE);

   If AData.xEnder <> '' Then
      Result.AddPair('xEnder', AData.xEnder);

   If AData.xMun <> '' Then
      Result.AddPair('xMun', AData.xMun);

   If AData.UF <> '' Then
      Result.AddPair('UF', AData.UF);
End;

Class Function TNFeTransporteJsonBuilder.BuildReboque(AData: TNFeLacreDTO): TJSONObject;
Begin

End;

Class Function TNFeTransporteJsonBuilder.BuildRetTransp(AData: TNFeRetTranspDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   Result.AddPair('vServ', TJSONNumber.Create(AData.vServ));
   Result.AddPair('vBCRet', TJSONNumber.Create(AData.vBCRet));
   Result.AddPair('pICMSRet', TJSONNumber.Create(AData.pICMSRet));
   Result.AddPair('vICMSRet', TJSONNumber.Create(AData.vICMSRet));

   If AData.CFOP <> '' Then
      Result.AddPair('CFOP', AData.CFOP);

   Result.AddPair('cMunFG', TJSONNumber.Create(AData.cMunFG));
End;

Class Function TNFeTransporteJsonBuilder.BuildVeicTransp(AData: TNFeVeicTranspDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   If AData.placa <> '' Then
      Result.AddPair('placa', AData.placa);

   If AData.UF <> '' Then
      Result.AddPair('UF', AData.UF);

   If AData.RNTC <> '' Then
      Result.AddPair('RNTC', AData.RNTC);
End;

Class Function TNFeTransporteJsonBuilder.BuildVolume(AData: TNFeVolumeDTO): TJSONObject;
Var
   Lacre: TNFeLacreDTO;
Begin
   Result := TJSONObject.Create;

   Result.AddPair('qVol', TJSONNumber.Create(AData.qVol));

   If AData.esp <> '' Then
      Result.AddPair('esp', AData.esp);

   If AData.marca <> '' Then
      Result.AddPair('marca', AData.marca);

   If AData.nVol <> '' Then
      Result.AddPair('nVol', AData.nVol);

   Result.AddPair('pesoL', TJSONNumber.Create(AData.pesoL));
   Result.AddPair('pesoB', TJSONNumber.Create(AData.pesoB));

   If Length(AData.lacres) > 0 Then
   Begin
      Var
      lacres := TJSONArray.Create;

      For Lacre In AData.lacres Do
         lacres.AddElement(BuildLacre(Lacre));

      Result.AddPair('lacres', lacres);
   End;
End;

Class Function TNFeTransporteJsonBuilder.BuildLacre(AData: TNFeLacreDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   If AData.nLacre <> '' Then
      Result.AddPair('nLacre', AData.nLacre);
End;

End.
