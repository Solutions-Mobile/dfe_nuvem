Unit NFe.InfoComplementar;

Interface

Uses
   System.SysUtils, System.Math, FireDAC.Comp.Client;

Type
   TNFeInfoComplementar = Class
   Private
      Class Procedure AdicionarInfo(
         Var AResultado: String;
         Const AInfo: String
         ); Static;

      Class Function PrepararInfoMotorista(
         Const AConexao: TFDConnection;
         Const AIdNFe: Integer
         ): String; Static;

      Class Function PrepararInfoTributosIBPT(
         Const AConexao: TFDConnection;
         Const AIdNFe: Integer
         ): String; Static;

      Class Function PrepararTotalCredSN(
         Const AConexao: TFDConnection;
         Const AIdNFe: Integer
         ): String; Static;

   Public
      Class Function Preparar(
         Const AConexao: TFDConnection;
         Const AIdNFe: Integer
         ): String; Static;
   End;

Implementation

Uses
   Data.DB,
   NFe.Scripts,
   Funcoes;

{ --------------------------------------------------------------------------- }
{ TNFeInfoComplementar }
{ --------------------------------------------------------------------------- }

Class Procedure TNFeInfoComplementar.AdicionarInfo(
   Var AResultado: String;
   Const AInfo: String
   );
Begin
   If Trim(AInfo) = '' Then
      Exit;

   If AResultado <> '' Then
      AResultado := AResultado + ' ';

   AResultado := AResultado + Trim(AInfo);
End;

{ --------------------------------------------------------------------------- }

Class Function TNFeInfoComplementar.Preparar(
   Const AConexao: TFDConnection;
   Const AIdNFe: Integer
   ): String;
Var
   LQuery: TFDQuery;
   LInfo: String;
   LCRT: String;
   LFinNFe: String;
   LTpNF: String;
Begin
   Result := '';

   LQuery := TFDQuery.Create(Nil);
   Try
      LQuery.Connection := AConexao;
      LQuery.SQL.Text :=
         'SELECT CRT_C21, FINNFE_B25, TPNF_B11, INFCPL_Z03 ' +
         'FROM NFE ' +
         'WHERE ID_NFE = :ID_NFE';

      LQuery.ParamByName('ID_NFE').AsInteger := AIdNFe;
      LQuery.Open;

      If LQuery.IsEmpty Then
         Exit;

      Result := TFuncoes.RemoverCharControle(
         LQuery.FieldByName('INFCPL_Z03').AsString
         );

      Result := Copy(Trim(Result), 1, 4000);

      LCRT := LQuery.FieldByName('CRT_C21').AsString;
      LFinNFe := LQuery.FieldByName('FINNFE_B25').AsString;
      LTpNF := LQuery.FieldByName('TPNF_B11').AsString;

      { Informação do Simples Nacional }
      If (LFinNFe = '1') And
         (LTpNF = '1') And
         (LCRT <> '3') Then
      Begin
         AdicionarInfo(
            Result,
            'I - "DOCUMENTO EMITIDO POR ME OU EPP OPTANTE PELO SIMPLES NACIONAL".'
            );

         LInfo := PrepararTotalCredSN(
            AConexao,
            AIdNFe
            );

         AdicionarInfo(Result, LInfo);
      End;

      { Informação dos tributos aproximados - IBPT }
      LInfo := PrepararInfoTributosIBPT(
         AConexao,
         AIdNFe
         );

      AdicionarInfo(Result, LInfo);

      { Informação do motorista }
      LInfo := PrepararInfoMotorista(
         AConexao,
         AIdNFe
         );

      AdicionarInfo(Result, LInfo);

      { Limite da tag InfCpl }
      Result := Copy(Result, 1, 5000);
   Finally
      LQuery.Free;
   End;
End;

{ --------------------------------------------------------------------------- }

Class Function TNFeInfoComplementar.PrepararInfoMotorista(
   Const AConexao: TFDConnection;
   Const AIdNFe: Integer
   ): String;
Var
   LQuery: TFDQuery;
   LPlaca: String;
   LMotorista: String;
   LKM: String;
Begin
   Result := '';

   LQuery := TFDQuery.Create(Nil);
   Try
      LQuery.Connection := AConexao;
      LQuery.SQL.Text :=
         'SELECT ' +
         '   V.VCL_A_PLC, ' +
         '   V.VND_A_MOT, ' +
         '   V.VND_A_KM ' +
         'FROM NFE_VENDA NV ' +
         'LEFT JOIN VENDA V ON ' +
         '   (V.VND_I_COD = NV.VND_I_COD) AND ' +
         '   (V.TER_I_COD = NV.TER_I_COD) ' +
         'LEFT JOIN NFE NF ON ' +
         '   (NF.ID_NFE = NV.ID_NFE) AND ' +
         '   (NF.ID_EMPRESA = V.VND_I_EMP) ' +
         'WHERE NV.ID_NFE = :ID_NFE';

      LQuery.ParamByName('ID_NFE').AsInteger := AIdNFe;
      LQuery.Open;

      If LQuery.IsEmpty Then
         Exit;

      LMotorista := Trim(
         LQuery.FieldByName('VND_A_MOT').AsString
         );

      LPlaca := Trim(
         LQuery.FieldByName('VCL_A_PLC').AsString
         );

      LKM := Trim(
         LQuery.FieldByName('VND_A_KM').AsString
         );
   Finally
      LQuery.Free;
   End;

   If LMotorista <> '' Then
      Result := Result + ' Mot:' + LMotorista;

   If LPlaca <> '' Then
      Result := Result + ' Plc:' + LPlaca;

   If LKM <> '' Then
      Result := Result + ' KM:' + LKM;

   Result := Trim(Result);
End;

{ --------------------------------------------------------------------------- }

Class Function TNFeInfoComplementar.PrepararInfoTributosIBPT(
   Const AConexao: TFDConnection;
   Const AIdNFe: Integer
   ): String;
Var
   LQuery: TFDQuery;
   LVlrProd: Double;
   LAliqFed: Double;
   LAliqNac: Double;
   LAliqEst: Double;
   LAliqMun: Double;
   LTotProd: Double;
   LTotNac: Double;
   LTotEst: Double;
   LTotMun: Double;
   LAliqNac: Double;
   LAliqEst: Double;
   LAliqMun: Double;
   LVersaoIBPT: String;
   LVersao: String;
   LNCM: String;
Begin
   Result := '';

   LQuery := TFDQuery.Create(Nil);
   Try
      LQuery.Connection := AConexao;
      LQuery.SQL.Text :=
         'SELECT NCM_I05, VPROD_I11 ' +
         'FROM NFE_PROD ' +
         'WHERE ID_NFE = :ID_NFE';

      LQuery.ParamByName('ID_NFE').AsInteger := AIdNFe;
      LQuery.Open;

      If LQuery.IsEmpty Then
         Exit;

      While Not LQuery.Eof Do
      Begin
         LNCM := LQuery.FieldByName('NCM_I05').AsString;
         LVlrProd := LQuery.FieldByName('VPROD_I11').AsFloat;

         LTotProd := LTotProd + LVlrProd;

         LAliqFed := 0;
         LAliqNac := 0;
         LAliqEst := 0;
         LAliqMun := 0;
         LVersaoIBPT := '';

         PegarAliquotaTributosIBPT(
            AConexao,
            AIdNFe,
            LNCM,
            LAliqFed,
            LAliqNac,
            LAliqEst,
            LAliqMun,
            LVersaoIBPT
            );

         If Trim(LVersaoIBPT) <> '' Then
            LVersao := LVersaoIBPT;

         LTotNac := LTotNac +
            RoundTo(LVlrProd * (LAliqFed / 100), -2);

         LTotEst := LTotEst +
            RoundTo(LVlrProd * (LAliqEst / 100), -2);

         LTotMun := LTotMun +
            RoundTo(LVlrProd * (LAliqMun / 100), -2);

         LQuery.Next;
      End;

      If LTotProd <= 0 Then
         Exit;

      LAliqNac := RoundTo(
         (LTotNac / LTotProd) * 100,
         -2
         );

      LAliqEst := RoundTo(
         (LTotEst / LTotProd) * 100,
         -2
         );

      LAliqMun := RoundTo(
         (LTotMun / LTotProd) * 100,
         -2
         );

      Result :=
         'Valor aprox. tributos ' +
         'Fed-R$' +
         FormatFloat('###0.00', LTotNac) +
         '(' +
         FormatFloat('#0.00', LAliqNac) +
         '%), ' +

         'Est-R$' +
         FormatFloat('###0.00', LTotEst) +
         '(' +
         FormatFloat('#0.00', LAliqEst) +
         '%), ' +

         'Mun-R$' +
         FormatFloat('###0.00', LTotMun) +
         '(' +
         FormatFloat('#0.00', LAliqMun) +
         '%)';

      If Trim(LVersao) <> '' Then
         Result := Result +
            ' - Fonte IBPT (' + LVersao + ').'
      Else
         Result := Result + '.';
   Finally
      LQuery.Free;
   End;
End;

{ --------------------------------------------------------------------------- }

Class Function TNFeInfoComplementar.PrepararTotalCredSN(
   Const AConexao: TFDConnection;
   Const AIdNFe: Integer
   ): String;
Var
   LQuery: TFDQuery;
   LAliqCred: Double;
   LVlrCred: Double;
   LTotal: Double;
   LTotalCred: Double;
Begin
   Result := '';

   LTotal := 0;
   LTotalCred := 0;

   LQuery := TFDQuery.Create(Nil);
   Try
      LQuery.Connection := AConexao;
      LQuery.SQL.Text :=
         'SELECT ' +
         '   COALESCE(PCREDSN_N29, 0) AS PCREDSN_N29, ' +
         '   COALESCE(VCREDICMSSN_N30, 0) AS VCREDICMSSN_N30 ' +
         'FROM NFE_PROD_ICMS ' +
         'WHERE ID_NFE = :ID_NFE';

      LQuery.ParamByName('ID_NFE').AsInteger := AIdNFe;
      LQuery.Open;

      While Not LQuery.Eof Do
      Begin
         LAliqCred := RoundTo(
            LQuery.FieldByName('PCREDSN_N29').AsFloat,
            -2
            );

         LVlrCred := RoundTo(
            LQuery.FieldByName('VCREDICMSSN_N30').AsFloat,
            -2
            );

         LTotalCred := LTotalCred + LVlrCred;
         LTotal := LTotal + (LVlrCred * LAliqCred);

         LQuery.Next;
      End;
   Finally
      LQuery.Free;
   End;

   LTotal := RoundTo(LTotal, -2);

   If LTotalCred > 0 Then
      LAliqCred := RoundTo(
         LTotal / LTotalCred,
         -2
         )
   Else
      LAliqCred := 0;

   If (LTotalCred > 0) And
      (LAliqCred > 0) Then
   Begin
      Result :=
         'II - "PERMITE O APROVEITAMENTO DO CRÉDITO DE ICMS ' +
         'NO VALOR DE R$ ' +
         FormatFloat('#####0.00', LTotalCred) +
         ' CORRESPONDENTE À ALÍQUOTA DE ' +
         FormatFloat('#0.00', LAliqCred) +
         '%, NOS TERMOS DO ARTIGO 23 DA LC 123".';
   End
   Else
   Begin
      Result :=
         'II - "NÃO GERA DIREITO A CRÉDITO FISCAL DE ICMS, ' +
         'DE ISS E DE IPI".';
   End;
End;

End.
