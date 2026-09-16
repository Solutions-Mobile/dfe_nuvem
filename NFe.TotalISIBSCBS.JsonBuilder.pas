Unit NFe.TotalISIBSCBS.JsonBuilder;

Interface

Uses
   System.JSON, NFe.DTO, NFe.IBSCBSTot.JsonBuilder;

Type
   TNFeTotalISIBSCBSJsonBuilder = Class
   Public
      Class Function Build(ADTO: TNFeTotalISIBSCBSDTO): TJSONObject; Static;
   End;

Implementation

Class Function TNFeTotalISIBSCBSJsonBuilder.Build(ADTO: TNFeTotalISIBSCBSDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   If Not Assigned(ADTO) Then
      Exit;

  // If Assigned(ADTO.ISTot) Then
  //    Result.AddPair('ISTot', TNFeISTotJsonBuilder.Build(ADTO.ISTot));

   If Assigned(ADTO.IBSCBSTot) Then
      Result.AddPair('IBSCBSTot', TNFeIBSCBSTotJsonBuilder.Build(ADTO.IBSCBSTot));
End;

End.
