Unit NFe.CompraGov.JsonBuilder;

Interface

Uses
   System.JSON, NFe.DTO;

Type
 TNFeCompraGovJsonBuilder = Class
   Public
      Class Function Build(ACompraGov: TNFeCompraGovDTO): TJSONObject; Static;
   End;

Implementation

Class Function TNFeCompraGovJsonBuilder.Build(ACompraGov: TNFeCompraGovDTO): TJSONObject;
Var
   Ref: String;
   RefArray: TJSONArray;
Begin
   Result := TJSONObject.Create;

   Result.AddPair('tpEnteGov', TJSONNumber.Create(ACompraGov.tpEnteGov));
   Result.AddPair('pRedutor', TJSONNumber.Create(ACompraGov.pRedutor));
   Result.AddPair('tpOperGov', TJSONNumber.Create(ACompraGov.tpOperGov));

   If Length(ACompraGov.refDFeAnt) > 0 Then
   Begin
      // Var
      RefArray := TJSONArray.Create;

      For Ref In ACompraGov.refDFeAnt Do
         RefArray.Add(Ref);

      Result.AddPair('refDFeAnt', RefArray);
   End;
End;

End.
