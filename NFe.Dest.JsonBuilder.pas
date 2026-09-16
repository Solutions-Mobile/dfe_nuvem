Unit NFe.Dest.JsonBuilder;

Interface

Uses
   System.JSON, NFe.DTO;

Type
   TNFeDestJsonBuilder = Class
   Public
      Class Function Build(ADest: TNFeDestDTO): TJSONObject; Static;
   End;

Implementation

Class Function TNFeDestJsonBuilder.Build(ADest: TNFeDestDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   If ADest = Nil Then
      Exit;

   Result.AddPair('CNPJ', ADest.CNPJ);
   Result.AddPair('CPF', ADest.CPF);
   Result.AddPair('idEstrangeiro', ADest.idEstrangeiro);
   Result.AddPair('xNome', ADest.xNome);
   Result.AddPair('indIEDest', TJSONNumber.Create(ADest.indIEDest));
   Result.AddPair('IE', ADest.IE);
   Result.AddPair('ISUF', ADest.ISUF);
   Result.AddPair('IM', ADest.IM);
   Result.AddPair('email', ADest.email);

   Result.AddPair('enderDest', TJSONObject.Create
      .AddPair('xLgr', ADest.enderDest.xLgr)
      .AddPair('nro', ADest.enderDest.nro)
      .AddPair('xCpl', ADest.enderDest.xCpl)
      .AddPair('xBairro', ADest.enderDest.xBairro)
      .AddPair('cMun', TJSONNumber.Create(ADest.enderDest.cMun))
      .AddPair('xMun', ADest.enderDest.xMun)
      .AddPair('UF', ADest.enderDest.UF)
      .AddPair('CEP', ADest.enderDest.CEP)
      .AddPair('cPais', TJSONNumber.Create(ADest.enderDest.cPais))
      .AddPair('xPais', ADest.enderDest.xPais)
      .AddPair('fone', ADest.enderDest.fone));
End;

End.
