Unit NFe.Emit.JsonBuilder;

Interface

Uses
   System.JSON, NFe.DTO;

Type
   TNFeEmitJsonBuilder = Class
   Public
      Class Function Build(AEmit: TNFeEmitDTO): TJSONObject; Static;
   End;

Implementation

Class Function TNFeEmitJsonBuilder.Build(AEmit: TNFeEmitDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   If AEmit = Nil Then
      Exit;

   Result.AddPair('CNPJ', AEmit.CNPJ);
   Result.AddPair('CPF', AEmit.CPF);
   Result.AddPair('xNome', AEmit.xNome);
   Result.AddPair('xFant', AEmit.xFant);
   Result.AddPair('IE', AEmit.IE);
   Result.AddPair('IEST', AEmit.IEST);
   Result.AddPair('IM', AEmit.IM);
   Result.AddPair('CNAE', AEmit.CNAE);
   Result.AddPair('CRT', TJSONNumber.Create(AEmit.CRT));
   Result.AddPair('ISUFEmit', AEmit.ISUFEmit);

   Result.AddPair('enderEmit', TJSONObject.Create
      .AddPair('xLgr', AEmit.enderEmit.xLgr)
      .AddPair('nro', AEmit.enderEmit.nro)
      .AddPair('xCpl', AEmit.enderEmit.xCpl)
      .AddPair('xBairro', AEmit.enderEmit.xBairro)
      .AddPair('cMun', TJSONNumber.Create(AEmit.enderEmit.cMun))
      .AddPair('xMun', AEmit.enderEmit.xMun)
      .AddPair('UF', AEmit.enderEmit.UF)
      .AddPair('CEP', AEmit.enderEmit.CEP)
      .AddPair('cPais', TJSONNumber.Create(AEmit.enderEmit.cPais))
      .AddPair('xPais', AEmit.enderEmit.xPais)
      .AddPair('fone', AEmit.enderEmit.fone)
      );
End;

End.
