Unit NFe.Imposto.JsonBuilder;

Interface

Uses
   System.JSON,
   NFe.DTO, NFe.ICMS.JsonBuilder, NFe.PIS.JsonBuilder, NFe.COFINS.JsonBuilder, NFe.ISSQN.JsonBuilder, NFe.IBSCBS.JsonBuilder;

Type
   TNFeImpostoJsonBuilder = Class
   Public
      Class Function Build(AImposto: TNFeImpostoDTO): TJSONObject; Static;
   End;

Implementation

Class Function TNFeImpostoJsonBuilder.Build(AImposto: TNFeImpostoDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   If AImposto = Nil Then
      Exit;

   If AImposto.ICMS <> Nil Then
      Result.AddPair('ICMS', TNFeICMSJsonBuilder.Build(AImposto.ICMS));

   If AImposto.PIS <> Nil Then
      Result.AddPair('PIS', TNFePISJsonBuilder.Build(AImposto.PIS));

   If AImposto.COFINS <> Nil Then
      Result.AddPair('COFINS', TNFeCOFINSJsonBuilder.Build(AImposto.COFINS));

   If AImposto.IBSCBS <> Nil Then
      Result.AddPair('IBSCBS', TNFeIBSCBSJsonBuilder.Build(AImposto.IBSCBS));

   If AImposto.ISSQN <> Nil Then
      Result.AddPair('ISSQN', TNFeISSQNJsonBuilder.Build(AImposto.ISSQN));
End;

End.
