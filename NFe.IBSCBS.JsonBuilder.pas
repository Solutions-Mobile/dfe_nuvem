Unit NFe.IBSCBS.JsonBuilder;

Interface

Uses
   System.JSON, NFe.DTO;

Type
   TNFeIBSCBSJsonBuilder = Class
   Public
      Class Function Build(ADTO: TNFeIBSCBSDTO): TJSONObject; Static;
   End;

Implementation

Uses
   NFe.IBS.JsonBuilder,
   NFe.CBS.JsonBuilder,
   NFe.IBSCBSMono.JsonBuilder,
   NFe.TribCompraGov.JsonBuilder,
   NFe.TribRegular.JsonBuilder;

Class Function TNFeIBSCBSJsonBuilder.Build(ADTO: TNFeIBSCBSDTO): TJSONObject;
Var
   subGrupoIBSCBS, grupoIBSCBS: TJSONObject;
Begin
   Result := TJSONObject.Create;

   If ADTO = Nil Then
      Exit;

   subGrupoIBSCBS := TJSONObject.Create;
   Try
      subGrupoIBSCBS.AddPair('vIBS', TJSONNumber.Create(ADTO.vIBS));
      subGrupoIBSCBS.AddPair('vBC', TJSONNumber.Create(ADTO.vBC));

      If Assigned(ADTO.gIBSUF) Then
         subGrupoIBSCBS.AddPair('gIBSUF', TNFeIBSJsonBuilder.BuildIBSUF(ADTO.gIBSUF));

      If Assigned(ADTO.gIBSMun) Then
         subGrupoIBSCBS.AddPair('gIBSMun', TNFeIBSJsonBuilder.BuildIBSMun(ADTO.gIBSMun));

      If Assigned(ADTO.gCBS) Then
         subGrupoIBSCBS.AddPair('gCBS', TNFeCBSJsonBuilder.Build(ADTO.gCBS));

      If Assigned(ADTO.gTribRegular) Then
         subGrupoIBSCBS.AddPair('gTribRegular', TNFeTribRegularJsonBuilder.Build(ADTO.gTribRegular));

      If Assigned(ADTO.gTribCompraGov) Then
         subGrupoIBSCBS.AddPair('gTribCompraGov', TNFeTribCompraGovJsonBuilder.Build(ADTO.gTribCompraGov));

      If Assigned(ADTO.gIBSCBSMono) Then
         subGrupoIBSCBS.AddPair('gIBSCBSMono', TNFeIBSCBSMonoJsonBuilder.Build(ADTO.gIBSCBSMono));

   Finally
      //
   End;

   grupoIBSCBS := TJSONObject.Create;
   Try
      grupoIBSCBS.AddPair('CST', ADTO.CST);
      grupoIBSCBS.AddPair('cClassTrib', ADTO.cClassTrib);
      grupoIBSCBS.AddPair('indDoacao', TJSONNumber.Create(ADTO.indDoacao));
      grupoIBSCBS.AddPair('gIBSCBS', subGrupoIBSCBS);
      Result := grupoIBSCBS;
   Finally
      //
   End;
End;

End.
