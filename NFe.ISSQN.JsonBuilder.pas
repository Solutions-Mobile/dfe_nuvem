Unit NFe.ISSQN.JsonBuilder;

Interface

Uses
   System.JSON,   NFe.DTO;

Type
   TNFeISSQNJsonBuilder = Class
   Public
      Class Function Build(ATotal: TNFeISSQNDTO): TJSONObject; Static;
   End;

Implementation

Class Function TNFeISSQNJsonBuilder.Build(ATotal: TNFeISSQNDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   If ATotal = Nil Then
      Exit;

   Result.AddPair('dCompet', ATotal.dCompet);
   Result.AddPair('vBC', TJSONNumber.Create(ATotal.vBC));
   Result.AddPair('vISS', TJSONNumber.Create(ATotal.vISS));
   Result.AddPair('vPIS', TJSONNumber.Create(ATotal.vPIS));
   Result.AddPair('vISSRet', TJSONNumber.Create(ATotal.vISSRet));
   Result.AddPair('vCOFINS', TJSONNumber.Create(ATotal.vCOFINS));
   Result.AddPair('vDescCond', TJSONNumber.Create(ATotal.vDescCond));
   Result.AddPair('vServ', TJSONNumber.Create(ATotal.vServ));
   Result.AddPair('vOutro', TJSONNumber.Create(ATotal.vOutro));
   Result.AddPair('cRegTrib', TJSONNumber.Create(ATotal.cRegTrib));
   Result.AddPair('vDescIncond', TJSONNumber.Create(ATotal.vDescIncond));
   Result.AddPair('vDeducao', TJSONNumber.Create(ATotal.vDeducao));
End;

End.
