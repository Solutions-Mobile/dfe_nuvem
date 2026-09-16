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
   NFe.IBSCBSMono.JsonBuilder;

Class Function TNFeIBSCBSJsonBuilder.Build(ADTO: TNFeIBSCBSDTO): TJSONObject;
Var
   subGrupoIBSCBS, grupoIBSCBS: TJSONObject;
Begin
   Result := TJSONObject.Create;

   If ADTO = Nil Then
      Exit;

   subGrupoIBSCBS := TJSONObject.Create;
   Try
      If Assigned(ADTO.gIBSUF) Then
         subGrupoIBSCBS.AddPair('gIBSUF', TNFeIBSJsonBuilder.BuildIBSUF(ADTO.gIBSUF));

      If Assigned(ADTO.gIBSMun) Then
         subGrupoIBSCBS.AddPair('gIBSMun', TNFeIBSJsonBuilder.BuildIBSMun(ADTO.gIBSMun));

      If Assigned(ADTO.gIBSCBSMono) Then
         subGrupoIBSCBS.AddPair('gMono', TNFeIBSCBSMonoJsonBuilder.Build(ADTO.gIBSCBSMono));

      If Assigned(ADTO.gCBS) Then
         subGrupoIBSCBS.AddPair('gCBS', TNFeCBSJsonBuilder.Build(ADTO.gCBS));
   Finally
      //
      {
      FgIBS: TNFeIBSTotDTO;
      FgCBS: TNFeCBSTotDTO;
      FgMono: TNFeMonoTotDTO;
      }
   End;

   grupoIBSCBS := TJSONObject.Create;
   Try
      grupoIBSCBS.AddPair('CST', ADTO.CST);
      grupoIBSCBS.AddPair('cClassTrib', ADTO.cClassTrib);
      grupoIBSCBS.AddPair('indDoacao', TJSONNumber.Create(ADTO.indDoacao));
      grupoIBSCBS.AddPair('vIBS', TJSONNumber.Create(ADTO.vIBS));
      grupoIBSCBS.AddPair('vBC', TJSONNumber.Create(ADTO.vBC));
      grupoIBSCBS.AddPair('gIBSCBS', subGrupoIBSCBS);

      Result.AddPair('IBSCBS', grupoIBSCBS);
   Finally
      //
   End;
End;

End.
