Unit NFe.JsonBuilder;

Interface

Uses
   System.JSON, NFe.DTO, NFe.ICMS.JsonBuilder, NFe.PIS.JsonBuilder,
  NFe.COFINS.JsonBuilder;

Type
   TNFeJsonBuilder = Class
   Private
      Class Function BuildProduto(AProduto: TNFeProdutoDTO): TJSONObject; Static;
      Class Function BuildImposto(AImposto: TNFeImpostoDTO): TJSONObject; Static;
      Class Function BuildItem(AItem: TNFeItemDTO): TJSONObject; Static;
   Public
      Class Function Build(ADTO: TNFeDTO): TJSONObject; Static;
   End;

Implementation

Class Function TNFeJsonBuilder.BuildProduto(AProduto: TNFeProdutoDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   If AProduto = Nil Then
      Exit;

   Result.AddPair('cProd', AProduto.cProd);
   Result.AddPair('cEAN', AProduto.cEAN);
   Result.AddPair('xProd', AProduto.xProd);
   Result.AddPair('NCM', AProduto.NCM);
   Result.AddPair('EXTIPI', AProduto.EXTIPI);
   Result.AddPair('CFOP', AProduto.CFOP);
   Result.AddPair('uCom', AProduto.uCom);
   Result.AddPair('qCom', TJSONNumber.Create(AProduto.qCom));
   Result.AddPair('vUnCom', TJSONNumber.Create(AProduto.vUnCom));
   Result.AddPair('vProd', TJSONNumber.Create(AProduto.vProd));
   Result.AddPair('cEANTrib', AProduto.cEANTrib);
   Result.AddPair('uTrib', AProduto.uTrib);
   Result.AddPair('qTrib', TJSONNumber.Create(AProduto.qTrib));
   Result.AddPair('vUnTrib', TJSONNumber.Create(AProduto.vUnTrib));

   If AProduto.vFrete > 0 Then
      Result.AddPair('vFrete', TJSONNumber.Create(AProduto.vFrete));

   If AProduto.vSeg > 0 Then
      Result.AddPair('vSeg', TJSONNumber.Create(AProduto.vSeg));

   If AProduto.vDesc > 0 Then
      Result.AddPair('vDesc', TJSONNumber.Create(AProduto.vDesc));

   If AProduto.vOutro > 0 Then
      Result.AddPair('vOutro', TJSONNumber.Create(AProduto.vOutro));

   Result.AddPair('indTot', TJSONNumber.Create(AProduto.indTot));

   If AProduto.xPed <> '' Then
      Result.AddPair('xPed', AProduto.xPed);

   If AProduto.nItemPed <> '' Then
      Result.AddPair('nItemPed', AProduto.nItemPed);

   If AProduto.nFCI <> '' Then
      Result.AddPair('NFCI', AProduto.nFCI);

   If AProduto.nVE <> '' Then
      Result.AddPair('nVE', AProduto.nVE);

   If AProduto.CEST <> '' Then
      Result.AddPair('CEST', AProduto.CEST);

   If AProduto.indEscala <> '' Then
      Result.AddPair('indEscala', AProduto.indEscala);

   If AProduto.CNPJFab <> '' Then
      Result.AddPair('CNPJFab', AProduto.CNPJFab);

   If AProduto.cBenef <> '' Then
      Result.AddPair('cBenef', AProduto.cBenef);

   If AProduto.vTotTrib > 0 Then
      Result.AddPair('vTotTrib', TJSONNumber.Create(AProduto.vTotTrib)
         );
End;

Class Function TNFeJsonBuilder.BuildImposto(AImposto: TNFeImpostoDTO): TJSONObject;
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
End;

Class Function TNFeJsonBuilder.BuildItem(AItem: TNFeItemDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   If AItem = Nil Then
      Exit;

   Result.AddPair('prod', BuildProduto(AItem.prod));
   Result.AddPair('imposto', BuildImposto(AItem.Imposto));

   If AItem.infAdProd <> '' Then
      Result.AddPair('infAdProd', AItem.infAdProd);
   Result.AddPair('nItem', TJSONNumber.Create(AItem.nItem));
End;

Class Function TNFeJsonBuilder.Build(ADTO: TNFeDTO): TJSONObject;
Var
   I: Integer;
   LItens: TJSONArray;
Begin
   Result := TJSONObject.Create;

   If ADTO = Nil Then
      Exit;

   LItens := TJSONArray.Create;

   For I := 0 To High(ADTO.Itens) Do
      LItens.AddElement(BuildItem(ADTO.Itens[I]));

   Result.AddPair('itens', LItens);
End;

End.

