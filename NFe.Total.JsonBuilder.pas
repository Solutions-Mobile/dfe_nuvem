Unit NFe.Total.JsonBuilder;

Interface

Uses
   System.JSON,
   NFe.DTO, NFe.ICMSTot.JsonBuilder, NFe.TotalISIBSCBS.JsonBuilder, NFe.ISSQNTot.JsonBuilder,
  NFe.IBSCBSTot.JsonBuilder;

Type
   TNFeTotalJsonBuilder = Class
   Public
      Class Function Build(ATotal: TNFeTotalDTO): TJSONObject; Static;
   End;

Implementation

Class Function TNFeTotalJsonBuilder.Build(ATotal: TNFeTotalDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   If ATotal = Nil Then
      Exit;

   If ATotal.ICMSTot <> Nil Then
      Result.AddPair('ICMSTot', TNFeICMSTotJsonBuilder.Build(ATotal.ICMSTot));

   If ATotal.IBSCBSTot <> Nil Then
      Result.AddPair('IBSCBSTot', TNFeIBSCBSTotJsonBuilder.Build(ATotal.IBSCBSTot));

   If (Assigned(ATotal.ISSQNTot)) and (ATotal.ISSQNTot.ISSQN.vISS > 0)then
      Result.AddPair('ISSQNtot', TNFeISSQNTotJsonBuilder.Build(ATotal.ISSQNTot));

   If ATotal.vNFTot > 0 Then
      Result.AddPair('vNFTot', TJSONNumber.Create(ATotal.vNFTot));
End;

End.
