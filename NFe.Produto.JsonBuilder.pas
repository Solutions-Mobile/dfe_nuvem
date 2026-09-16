Unit NFe.Produto.JsonBuilder;

Interface

Uses
   System.JSON, NFe.DTO;

Type
   TNFeProdutoJsonBuilder = Class
   Public
      Class Function Build(AProduto: TNFeProdutoDTO): TJSONObject; Static;
   End;

Implementation

Class Function TNFeProdutoJsonBuilder.Build(AProduto: TNFeProdutoDTO): TJSONObject;
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

   If AProduto.CEST <> '' Then
      Result.AddPair('CEST', AProduto.CEST);

   If AProduto.cBenef <> '' Then
      Result.AddPair('cBenef', AProduto.cBenef);

   If AProduto.NVE <> '' Then
      Result.AddPair('NVE', AProduto.NVE);

   If AProduto.NFCI <> '' Then
      Result.AddPair('NFCI', AProduto.NFCI);

   If AProduto.vTotTrib > 0 Then
      Result.AddPair('vTotTrib', TJSONNumber.Create(AProduto.vTotTrib));

   If AProduto.indEscala <> '' Then
      Result.AddPair('indEscala', AProduto.indEscala);

   If AProduto.CNPJFab <> '' Then
      Result.AddPair('CNPJFab', TJSONNumber.Create(AProduto.CNPJFab));
End;

End.
