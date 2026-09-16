Unit NFe.PIS.JsonBuilder;

Interface

Uses
   System.SysUtils, System.JSON, NFe.DTO, System.StrUtils;

Type
   TNFePISGrupo = (pgPISAliq, pgPISQtde, pgPISNT, pgPISOutr);

   TNFePISJsonBuilder = Class
   Private
      Class Function IdentificarGrupo(APIS: TNFePISDTO): TNFePISGrupo; Static;
      //
      Class Function BuildPISAliq(APIS: TNFePISDTO): TJSONObject; Static;
      Class Function BuildPISQtde(APIS: TNFePISDTO): TJSONObject; Static;
      Class Function BuildPISNT(APIS: TNFePISDTO): TJSONObject; Static;
      Class Function BuildPISOutr(APIS: TNFePISDTO): TJSONObject; Static;
   Public
      Class Function Build(APIS: TNFePISDTO): TJSONObject; Static;
   End;

Implementation

{ TNFePISJsonBuilder }

Class Function TNFePISJsonBuilder.IdentificarGrupo(APIS: TNFePISDTO): TNFePISGrupo;
Begin
   If AnsiIndexStr(APIS.CST, ['01', '02']) >= 0 Then
      Exit(pgPISAliq);

   If APIS.CST = '03' Then
      Exit(pgPISQtde);

   If AnsiIndexStr(APIS.CST, ['04', '05', '06', '07', '08', '09']) >= 0 Then
      Exit(pgPISNT);

   If AnsiIndexStr(APIS.CST, [
      '49', '50', '51', '52', '53', '54', '55', '56',
      '60', '61', '62', '63', '64', '65', '66', '67',
      '70', '71', '72', '73', '74', '75',
      '98', '99']) >= 0 Then
      Exit(pgPISOutr);

   Raise EArgumentException.CreateFmt('CST não suportado. CST=%s', [APIS.CST]);
End;

Class Function TNFePISJsonBuilder.Build(APIS: TNFePISDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   If APIS = Nil Then
      Exit;

   Case IdentificarGrupo(APIS) Of
      pgPISAliq:
         Result := BuildPISAliq(APIS);
      pgPISQtde:
         Result := BuildPISQtde(APIS);
      pgPISNT:
         Result := BuildPISNT(APIS);
      pgPISOutr:
         Result := BuildPISOutr(APIS);
   Else
      Raise EArgumentException.CreateFmt('Grupo PIS não suportado. CST=%s', [APIS.CST]);
   End;
End;

Class Function TNFePISJsonBuilder.BuildPISAliq(APIS: TNFePISDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;
   Result.AddPair('CST', APIS.CST);
   Result.AddPair('vBC', TJSONNumber.Create(APIS.vBC));
   Result.AddPair('pPIS', TJSONNumber.Create(APIS.pPIS));
   Result.AddPair('vPIS', TJSONNumber.Create(APIS.vPIS));
End;

Class Function TNFePISJsonBuilder.BuildPISNT(APIS: TNFePISDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;
   Result.AddPair('CST', APIS.CST);
End;

Class Function TNFePISJsonBuilder.BuildPISOutr(APIS: TNFePISDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;
   Result.AddPair('CST', APIS.CST);

   If APIS.qBCProd > 0 Then
   Begin
      Result.AddPair('qBCProd', TJSONNumber.Create(APIS.qBCProd));
      Result.AddPair('vAliqProd', TJSONNumber.Create(APIS.vAliqProd));
   End
   Else
   Begin
      Result.AddPair('vBC', TJSONNumber.Create(APIS.vBC));
      Result.AddPair('pPIS', TJSONNumber.Create(APIS.pPIS));
   End;

   Result.AddPair('vPIS', TJSONNumber.Create(APIS.vPIS));
End;

Class Function TNFePISJsonBuilder.BuildPISQtde(APIS: TNFePISDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;
   Result.AddPair('CST', APIS.CST);
   Result.AddPair('qBCProd', TJSONNumber.Create(APIS.qBCProd));
   Result.AddPair('vAliqProd', TJSONNumber.Create(APIS.vAliqProd));
   Result.AddPair('vPIS', TJSONNumber.Create(APIS.vPIS));
End;

End.
