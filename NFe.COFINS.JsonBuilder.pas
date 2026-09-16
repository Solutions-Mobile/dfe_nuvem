Unit NFe.COFINS.JsonBuilder;

Interface

Uses
   System.SysUtils, System.JSON, NFe.DTO, System.StrUtils;

Type
   TNFeCOFINSGrupo = (cgCOFINSAliq, cgCOFINSQtde, cgCOFINSNT, cgCOFINSOutr);

   TNFeCOFINSJsonBuilder = Class
   Private
      Class Function IdentificarGrupo(ACOFINS: TNFeCOFINSDTO): TNFeCOFINSGrupo; Static;
      //
      Class Function BuildCOFINSAliq(ACOFINS: TNFeCOFINSDTO): TJSONObject; Static;
      Class Function BuildCOFINSQtde(ACOFINS: TNFeCOFINSDTO): TJSONObject; Static;
      Class Function BuildCOFINSNT(ACOFINS: TNFeCOFINSDTO): TJSONObject; Static;
      Class Function BuildCOFINSOutr(ACOFINS: TNFeCOFINSDTO): TJSONObject; Static;
   Public
      Class Function Build(ACOFINS: TNFeCOFINSDTO): TJSONObject; Static;
   End;

Implementation

{ TNFeCOFINSJsonBuilder }

Class Function TNFeCOFINSJsonBuilder.IdentificarGrupo(ACOFINS: TNFeCOFINSDTO): TNFeCOFINSGrupo;
Begin
   If AnsiIndexStr(ACOFINS.CST, ['01', '02']) >= 0 Then
      Exit(cgCOFINSAliq);

   If ACOFINS.CST = '03' Then
      Exit(cgCOFINSQtde);

   If AnsiIndexStr(ACOFINS.CST, ['04', '05', '06', '07', '08', '09']) >= 0 Then
      Exit(cgCOFINSNT);

   If AnsiIndexStr(ACOFINS.CST, [
      '49', '50', '51', '52', '53', '54', '55', '56',
      '60', '61', '62', '63', '64', '65', '66', '67',
      '70', '71', '72', '73', '74', '75',
      '98', '99']) >= 0 Then
      Exit(cgCOFINSOutr);

   Raise EArgumentException.CreateFmt('CST não suportado. CST=%s', [ACOFINS.CST]);
End;

Class Function TNFeCOFINSJsonBuilder.Build(ACOFINS: TNFeCOFINSDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   If ACOFINS = Nil Then
      Exit;

   Case IdentificarGrupo(ACOFINS) Of
      cgCOFINSAliq:
         Result := BuildCOFINSAliq(ACOFINS);
      cgCOFINSQtde:
         Result := BuildCOFINSQtde(ACOFINS);
      cgCOFINSNT:
         Result := BuildCOFINSNT(ACOFINS);
      cgCOFINSOutr:
         Result := BuildCOFINSOutr(ACOFINS);
   Else
      Raise EArgumentException.CreateFmt('Grupo COFINS não suportado. CST=%s', [ACOFINS.CST]);
   End;
End;

Class Function TNFeCOFINSJsonBuilder.BuildCOFINSAliq(ACOFINS: TNFeCOFINSDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;
   Result.AddPair('CST', ACOFINS.CST);
   Result.AddPair('vBC', TJSONNumber.Create(ACOFINS.vBC));
   Result.AddPair('pCOFINS', TJSONNumber.Create(ACOFINS.pCOFINS));
   Result.AddPair('vCOFINS', TJSONNumber.Create(ACOFINS.vCOFINS));
End;

Class Function TNFeCOFINSJsonBuilder.BuildCOFINSNT(ACOFINS: TNFeCOFINSDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;
   Result.AddPair('CST', ACOFINS.CST);
End;

Class Function TNFeCOFINSJsonBuilder.BuildCOFINSOutr(ACOFINS: TNFeCOFINSDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;
   Result.AddPair('CST', ACOFINS.CST);

   If ACOFINS.qBCProd > 0 Then
   Begin
      Result.AddPair('qBCProd', TJSONNumber.Create(ACOFINS.qBCProd));
      Result.AddPair('vAliqProd', TJSONNumber.Create(ACOFINS.vAliqProd));
   End
   Else
   Begin
      Result.AddPair('vBC', TJSONNumber.Create(ACOFINS.vBC));
      Result.AddPair('pCOFINS', TJSONNumber.Create(ACOFINS.pCOFINS));
   End;

   Result.AddPair('vCOFINS', TJSONNumber.Create(ACOFINS.vCOFINS));
End;

Class Function TNFeCOFINSJsonBuilder.BuildCOFINSQtde(ACOFINS: TNFeCOFINSDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;
   Result.AddPair('CST', ACOFINS.CST);
   Result.AddPair('qBCProd', TJSONNumber.Create(ACOFINS.qBCProd));
   Result.AddPair('vAliqProd', TJSONNumber.Create(ACOFINS.vAliqProd));
   Result.AddPair('vCOFINS', TJSONNumber.Create(ACOFINS.vCOFINS));
End;

End.
