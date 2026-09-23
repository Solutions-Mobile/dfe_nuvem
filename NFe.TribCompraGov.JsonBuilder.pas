Unit NFe.TribCompraGov.JsonBuilder;

Interface

Uses
   System.JSON, NFe.DTO;

Type
   TNFeTribCompraGovJsonBuilder = Class
   Public
      Class Function Build(ADTO: TNFeTribCompraGov): TJSONObject; Static;
   End;

Implementation

{ TNFeTribCompraGovJsonBuilder }

Class Function TNFeTribCompraGovJsonBuilder.Build(
   ADTO: TNFeTribCompraGov
   ): TJSONObject;
Begin
   Result := TJSONObject.Create;

   // If Not Assigned(ADTO) Then
   // Exit;

   Result.AddPair('pAliqIBSUF', TJSONNumber.Create(ADTO.pAliqIBSUF));
   Result.AddPair('vTribIBSUF', TJSONNumber.Create(ADTO.vTribIBSUF));
   Result.AddPair('pAliqIBSMun', TJSONNumber.Create(ADTO.pAliqIBSMun));
   Result.AddPair('vTribIBSMun', TJSONNumber.Create(ADTO.vTribIBSMun));
   Result.AddPair('pAliqCBS', TJSONNumber.Create(ADTO.pAliqCBS));
   Result.AddPair('vTribCBS', TJSONNumber.Create(ADTO.vTribCBS));
End;

End.
