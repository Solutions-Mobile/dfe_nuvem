Unit NFeApi;

Interface

Uses
   System.SysUtils, System.Classes, System.Net.URLClient, System.Net.HttpClient, System.Net.HttpClientComponent;

Type

   TNFeApi = Class
   Private
      FBaseURL: String;
      FToken: String;
      FHTTP: TNetHTTPClient;
   Public
      Constructor Create(Const ABaseURL: String; Const AToken: String);
      Destructor Destroy; Override;

      Function Emitir(Const JSON: String): String;
      Function Consultar(Const Chave: String): String;
      Function Cancelar(Const JSON: String): String;
   End;

Implementation

Constructor TNFeApi.Create(
   Const ABaseURL: String;
   Const AToken: String);
Begin
   Inherited Create;

   FBaseURL := ABaseURL;
   FToken := AToken;

   FHTTP := TNetHTTPClient.Create(Nil);
   FHTTP.ContentType := 'application/json';
   FHTTP.Accept := 'application/json';
End;

Destructor TNFeApi.Destroy;
Begin
   FHTTP.Free;
   Inherited;
End;

Function TNFeApi.Emitir(Const JSON: String): String;
Var
   Response: IHTTPResponse;
   Content: TStringStream;
Begin
   Content := TStringStream.Create(
      JSON,
      TEncoding.UTF8
      );

   Try
      Response := FHTTP.Post(
         FBaseURL + '/nfe',
         Content
         );

      Result := Response.ContentAsString(
         TEncoding.UTF8
         );
   Finally
      Content.Free;
   End;
End;

Function TNFeApi.Consultar(Const Chave: String): String;
Var
   Response: IHTTPResponse;
Begin
   Response := FHTTP.Get(
      FBaseURL + '/nfe/' + Chave
      );

   Result := Response.ContentAsString(
      TEncoding.UTF8
      );
End;

Function TNFeApi.Cancelar(Const JSON: String): String;
Var
   Response: IHTTPResponse;
   Content: TStringStream;
Begin
   Content := TStringStream.Create(
      JSON,
      TEncoding.UTF8
      );

   Try
      Response := FHTTP.Post(
         FBaseURL + '/nfe/cancelar',
         Content
         );

      Result := Response.ContentAsString(
         TEncoding.UTF8
         );
   Finally
      Content.Free;
   End;
End;

End.
