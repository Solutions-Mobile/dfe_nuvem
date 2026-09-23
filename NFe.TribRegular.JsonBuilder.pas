Unit NFe.TribRegular.JsonBuilder;

Interface

Uses
   System.JSON, NFe.DTO;

Type

   TNFeTribRegularJsonBuilder = Class
   Public
      Class Function Build(ADTO: TNFeTribRegularDTO): TJSONObject; Static;
   End;

Implementation

{ TNFeTribRegularJsonBuilder }

Class Function TNFeTribRegularJsonBuilder.Build(ADTO: TNFeTribRegularDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

//   If Not Assigned(ADTO) Then
//      Exit;

   Result.AddPair('CSTReg', ADTO.CSTReg);
   Result.AddPair('cClassTribReg', ADTO.cClassTribReg);
   Result.AddPair('pAliqEfetRegIBSUF', TJSONNumber.Create(ADTO.pAliqEfetRegIBSUF));
   Result.AddPair('vTribRegIBSUF', TJSONNumber.Create(ADTO.vTribRegIBSUF));
   Result.AddPair('pAliqEfetRegIBSMun', TJSONNumber.Create(ADTO.pAliqEfetRegIBSMun));
   Result.AddPair('vTribRegIBSMun', TJSONNumber.Create(ADTO.vTribRegIBSMun));
   Result.AddPair('pAliqEfetRegCBS', TJSONNumber.Create(ADTO.pAliqEfetRegCBS));
   Result.AddPair('vTribRegCBS', TJSONNumber.Create(ADTO.vTribRegCBS));
End;

End.
