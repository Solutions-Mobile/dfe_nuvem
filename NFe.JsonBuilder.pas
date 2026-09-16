Unit NFe.JsonBuilder;

Interface

Uses
   System.JSON, NFe.DTO;

Type
   TNFeJsonBuilder = Class
   Private
      Class Function BuildItem(AItem: TNFeItemDTO): TJSONObject; Static;
   Public
      Class Function Build(ADTO: TNFeDTO): TJSONObject; Static;
   End;

Implementation

Uses
   NFe.Ide.JsonBuilder,
   NFe.Emit.JsonBuilder,
   NFe.Dest.JsonBuilder,
   NFe.Produto.JsonBuilder,
   NFe.Imposto.JsonBuilder,
   NFe.Total.JsonBuilder,
   NFe.Transporte.JsonBuilder,
   NFe.InfoAdicional.JsonBuilder,
   NFe.CompraGov.JsonBuilder,
   NFe.PagamentoAntecipado.JsonBuilder;

Class Function TNFeJsonBuilder.BuildItem(AItem: TNFeItemDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   Result.AddPair('prod', TNFeProdutoJsonBuilder.Build(AItem.prod));
   Result.AddPair('imposto', TNFeImpostoJsonBuilder.Build(AItem.Imposto));
   Result.AddPair('nItem', TJSONNumber.Create(AItem.nItem));
End;

Class Function TNFeJsonBuilder.Build(ADTO: TNFeDTO): TJSONObject;
Var
   LItens: TJSONArray;
   LItem: TNFeItemDTO;
Begin
   Result := TJSONObject.Create;

   If Not Assigned(ADTO) Then
      Exit;

   Result.AddPair('ide', TNFeIdeJsonBuilder.Build(ADTO.Ide));
   Result.AddPair('emit', TNFeEmitJsonBuilder.Build(ADTO.Emit));

   If Assigned(ADTO.Dest) Then
      Result.AddPair('dest', TNFeDestJsonBuilder.Build(ADTO.Dest));

   LItens := TJSONArray.Create;
   For LItem In ADTO.Itens Do
      LItens.AddElement(BuildItem(LItem));
   Result.AddPair('det', LItens);
   Result.AddPair('total', TNFeTotalJsonBuilder.Build(ADTO.Total));

   If Assigned(ADTO.Transporte) And (ADTO.Transporte.modFrete <> 9) Then
   Begin
      Result.AddPair('transp', TNFeTransporteJsonBuilder.Build(ADTO.Transporte));
   End;

   If Assigned(ADTO.CompraGov) And (ADTO.CompraGov.tpEnteGov > 0) Then
   Begin
      Result.AddPair('gCompraGov', TNFeCompraGovJsonBuilder.Build(ADTO.CompraGov));
   End;

   If Assigned(ADTO.PagamentoAntecipado) And (Length(ADTO.PagamentoAntecipado.refNFe) > 0) Then
   Begin
      Result.AddPair('gPagAntecipado', TNFePagamentoAntecipadoJsonBuilder.Build(ADTO.PagamentoAntecipado));
   End;

   If Assigned(ADTO.InfoAdicional) And (
      (ADTO.InfoAdicional.infAdFisco <> '') Or
      (ADTO.InfoAdicional.infCpl <> '') Or
      (Length(ADTO.InfoAdicional.obsCont) > 0) Or
      (Length(ADTO.InfoAdicional.obsFisco) > 0) Or
      (Length(ADTO.InfoAdicional.procRef) > 0)) Then
   Begin
      Result.AddPair('infAdic', TNFeInfoAdicionalJsonBuilder.Build(ADTO.InfoAdicional));
   End;

End;

End.
