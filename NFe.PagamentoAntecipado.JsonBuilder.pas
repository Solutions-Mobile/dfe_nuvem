Unit NFe.PagamentoAntecipado.JsonBuilder;

Interface

Uses
   System.JSON, NFe.DTO;

Type

   TNFePagamentoAntecipadoJsonBuilder = Class
   Public
      Class Function Build(APagamentoAntecipado: TNFePagamentoAntecipadoDTO): TJSONObject; Static;
   End;

Implementation

Class Function TNFePagamentoAntecipadoJsonBuilder.Build(APagamentoAntecipado: TNFePagamentoAntecipadoDTO): TJSONObject;
Var
   Ref: String;
   RefArray: TJSONArray;
Begin
   Result := TJSONObject.Create;

   If Length(APagamentoAntecipado.refNFe) > 0 Then
   Begin
      RefArray := TJSONArray.Create;

      For Ref In APagamentoAntecipado.refNFe Do
         RefArray.Add(Ref);

      Result.AddPair('refNFe', RefArray);
   End;
End;

End.
