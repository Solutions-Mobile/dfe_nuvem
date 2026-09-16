Unit NFe.ISSQNTot.JsonBuilder;

Interface

Uses
   System.JSON,
   NFe.DTO;

Type
   TNFeISSQNTotJsonBuilder = Class
   Public
      Class Function Build(ADTO: TNFeISSQNTotDTO): TJSONObject; Static;
   End;

Implementation
                                                   //TNFeISSQNDTO
Class Function TNFeISSQNTotJsonBuilder.Build(ADTO: TNFeISSQNTotDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   If Not Assigned(ADTO) Then
      Exit;

   Result.AddPair('vServ', TJSONNumber.Create(ADTO.ISSQN.vServ));
   Result.AddPair('vBC', TJSONNumber.Create(ADTO.ISSQN.vBC));
   Result.AddPair('vISS', TJSONNumber.Create(ADTO.ISSQN.vISS));
   Result.AddPair('vPIS', TJSONNumber.Create(ADTO.ISSQN.vPIS));
   Result.AddPair('vCOFINS', TJSONNumber.Create(ADTO.ISSQN.vCOFINS));
   Result.AddPair('vDeduc', TJSONNumber.Create(ADTO.ISSQN.vDeducao));
   Result.AddPair('vOutro', TJSONNumber.Create(ADTO.ISSQN.vOutro));
   Result.AddPair('vDescIncond', TJSONNumber.Create(ADTO.ISSQN.vDescIncond));
   Result.AddPair('vDescCond', TJSONNumber.Create(ADTO.ISSQN.vDescCond));
   Result.AddPair('vISSRet', TJSONNumber.Create(ADTO.ISSQN.vISSRet));
   Result.AddPair('cRegTrib', TJSONNumber.Create(ADTO.ISSQN.cRegTrib));
End;

End.
