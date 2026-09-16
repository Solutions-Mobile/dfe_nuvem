Unit NFe.Ide.JsonBuilder;

Interface

Uses
   System.JSON, NFe.DTO;

Type
   TNFeIdeJsonBuilder = Class
   Public
      Class Function Build(AIde: TNFeIdeDTO): TJSONObject; Static;
   End;

Implementation

Class Function TNFeIdeJsonBuilder.Build(AIde: TNFeIdeDTO): TJSONObject;
Begin
   Result := TJSONObject.Create;

   If AIde = Nil Then
      Exit;

   Result.AddPair('cUF', TJSONNumber.Create(AIde.cUF));
   Result.AddPair('cNF', AIde.cNF);
   Result.AddPair('natOp', AIde.natOp);
   Result.AddPair('mod', TJSONNumber.Create(AIde.mod_));
   Result.AddPair('serie', TJSONNumber.Create(AIde.serie));
   Result.AddPair('nNF', TJSONNumber.Create(AIde.nNF));
   Result.AddPair('dhEmi', AIde.dhEmi);
   Result.AddPair('dhSaiEnt', AIde.dhSaiEnt);
   Result.AddPair('tpNF', TJSONNumber.Create(AIde.tpNF));
   Result.AddPair('idDest', TJSONNumber.Create(AIde.idDest));
   Result.AddPair('cMunFG', TJSONNumber.Create(AIde.cMunFG));
   Result.AddPair('tpImp', TJSONNumber.Create(AIde.tpImp));
   Result.AddPair('tpEmis', TJSONNumber.Create(AIde.tpEmis));
   Result.AddPair('cDV', TJSONNumber.Create(AIde.cDV));
   Result.AddPair('tpAmb', TJSONNumber.Create(AIde.tpAmb));
   Result.AddPair('finNFe', TJSONNumber.Create(AIde.finNFe));
   Result.AddPair('indFinal', TJSONNumber.Create(AIde.indFinal));
   Result.AddPair('indPres', TJSONNumber.Create(AIde.indPres));
   Result.AddPair('indIntermed', TJSONNumber.Create(AIde.indIntermed));
   Result.AddPair('procEmi', TJSONNumber.Create(AIde.procEmi));
   Result.AddPair('verProc', AIde.verProc);
   Result.AddPair('dhCont', AIde.dhCont);
   Result.AddPair('xJust', AIde.xJust);
   Result.AddPair('dPrevEntrega', AIde.dPrevEntrega);
End;

End.
