Unit NFe.InfoAdicional.JsonBuilder;

Interface

Uses
   System.JSON, NFe.DTO;

Type

   TNFeInfoAdicionalJsonBuilder = Class
   Private
      Class Function BuildObsCont(AData: TNFeObsContDTO): TJSONObject; Static;
      Class Function BuildObsFisco(AData: TNFeObsFiscoDTO): TJSONObject; Static;
      Class Function BuildProcRef(AData: TNFeProcRefDTO): TJSONObject; Static;
   Public
      Class Function Build(AInfo: TNFeInfoAdicionalDTO): TJSONObject; Static;
   End;

Implementation

{ TNFeInfoAdicionalJsonBuilder }

Class Function TNFeInfoAdicionalJsonBuilder.Build(AInfo: TNFeInfoAdicionalDTO): TJSONObject;
Var
   Item: TNFeObsContDTO;
   ObsFisco: TNFeObsFiscoDTO;
   ProcRef: TNFeProcRefDTO;
   ProcRefArray, ObsContArray, ObsFiscoArray: TJSONArray;
Begin
   Result := TJSONObject.Create;

   If AInfo.infAdFisco <> '' Then
      Result.AddPair('infAdFisco', AInfo.infAdFisco);

   If AInfo.infCpl <> '' Then
      Result.AddPair('infCpl', AInfo.infCpl);

   If Length(AInfo.obsCont) > 0 Then
   Begin
      ObsContArray := TJSONArray.Create;
      For Item In AInfo.obsCont Do
         ObsContArray.AddElement(BuildObsCont(Item));

      Result.AddPair('obsCont', ObsContArray);
   End;

   If Length(AInfo.ObsFisco) > 0 Then
   Begin
      ObsFiscoArray := TJSONArray.Create;
      For ObsFisco In AInfo.ObsFisco Do
         ObsFiscoArray.AddElement(BuildObsFisco(ObsFisco));

      Result.AddPair('obsFisco', ObsFiscoArray);
   End;

   If Length(AInfo.ProcRef) > 0 Then
   Begin
      ProcRefArray := TJSONArray.Create;
      For ProcRef In AInfo.ProcRef Do
         ProcRefArray.AddElement(BuildProcRef(ProcRef));

      Result.AddPair('procRef', ProcRefArray);
   End;
End;

Class Function TNFeInfoAdicionalJsonBuilder.BuildObsCont(AData: TNFeObsContDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   If AData.xCampo <> '' Then
      Result.AddPair('xCampo', AData.xCampo);

   If AData.xTexto <> '' Then
      Result.AddPair('xTexto', AData.xTexto);
End;

Class Function TNFeInfoAdicionalJsonBuilder.BuildObsFisco(AData: TNFeObsFiscoDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   If AData.xCampo <> '' Then
      Result.AddPair('xCampo', AData.xCampo);

   If AData.xTexto <> '' Then
      Result.AddPair('xTexto', AData.xTexto);
End;

Class Function TNFeInfoAdicionalJsonBuilder.BuildProcRef(AData: TNFeProcRefDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   If AData.nProc <> '' Then
      Result.AddPair('nProc', AData.nProc);

   Result.AddPair('indProc', TJSONNumber.Create(AData.indProc));
   Result.AddPair('tpAto', TJSONNumber.Create(AData.tpAto));
End;

End.
