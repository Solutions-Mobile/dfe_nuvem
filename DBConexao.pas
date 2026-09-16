Unit DBConexao;

Interface

Uses
   System.SysUtils,
   FireDAC.Comp.Client,
   FireDAC.Stan.Def,
   FireDAC.Stan.Async,
   FireDAC.Stan.Option,
   FireDAC.Stan.Param,
   FireDAC.Phys,
   FireDAC.Phys.FB,
   FireDAC.Phys.FBDef,
   FireDAC.DApt,
   FireDAC.Comp.UI;

Type
   TDBConnection = Class
   Private
      FConnection: TFDConnection;
   Public
      Constructor Create;
      Destructor Destroy; Override;

      Procedure Connect(Const ADatabase: String; Const AUserName: String; Const APassword: String; Const AServer: String = ''; Const APort: Integer = 3050);
      Procedure Disconnect;
      Property Connection: TFDConnection Read FConnection;
   End;

Implementation

Constructor TDBConnection.Create;
Begin
   Inherited Create;

   FConnection := TFDConnection.Create(Nil);
   FConnection.LoginPrompt := False;

   FConnection.Params.DriverID := 'FB';
End;

Destructor TDBConnection.Destroy;
Begin
   FConnection.Free;
   Inherited;
End;

Procedure TDBConnection.Connect(Const ADatabase: String; Const AUserName: String; Const APassword: String; Const AServer: String; Const APort: Integer);
Begin
   Disconnect;

   FConnection.Params.Clear;
   FConnection.Params.DriverID := 'FB';

   If AServer <> '' Then
      FConnection.Params.Database :=
         Format('%s/%d:%s', [
         AServer,
         APort,
         ADatabase
         ])
   Else
      FConnection.Params.Database := ADatabase;

   FConnection.Params.UserName := AUserName;
   FConnection.Params.Password := APassword;
   // FConnection.Params.CharacterSet := 'UTF8';

   FConnection.Connected := True;
End;

Procedure TDBConnection.Disconnect;
Begin
   If FConnection.Connected Then
      FConnection.Connected := False;
End;

End.
