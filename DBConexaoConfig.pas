Unit DBConexaoConfig;

Interface

Uses
   System.SysUtils, System.Classes, FireDAC.Comp.Client, System.IniFiles;

Type
   TConnectionConfigDTO = Class
   Private
      FCaminhoBanco: String;
      FIdNFe: String;
   Public
      Property CaminhoBanco: String Read FCaminhoBanco Write FCaminhoBanco;
      Property IdNFe: String Read FIdNFe Write FIdNFe;
   End;

   TConnectionConfig = Class
   Private
      Class Function GetConfigPath: String;
   Public
      Class Procedure SalvarConexao(InfoConfig: TConnectionConfigDTO);
      Class Procedure LerConexao(InfoConfig: TConnectionConfigDTO);
   End;

Implementation

{ TConnectionConfig }

Class Function TConnectionConfig.GetConfigPath: String;
Begin
   Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'config_db.cfg';
End;

Class Procedure TConnectionConfig.SalvarConexao(InfoConfig: TConnectionConfigDTO);
Var
   LIni: TIniFile;
Begin
   LIni := TIniFile.Create(GetConfigPath);
   Try
      LIni.WriteString('CONEXAO', 'CaminhoBanco', InfoConfig.CaminhoBanco);
      LIni.WriteString('NFE', 'IdNFe', InfoConfig.IdNFe);
   Finally
      LIni.Free;
   End;
End;

Class Procedure TConnectionConfig.LerConexao(InfoConfig: TConnectionConfigDTO);
var
  LIni: TIniFile;
  LCaminho: string;
begin
  if not Assigned(InfoConfig) then
    Exit;

  InfoConfig.IdNFe := '';

  if FileExists(GetConfigPath) then
  begin
    LIni := TIniFile.Create(GetConfigPath);
    try
      InfoConfig.CaminhoBanco := LIni.ReadString('CONEXAO', 'CaminhoBanco', '');
      InfoConfig.IdNFe := LIni.ReadString('NFE', 'IdNFe', '');
    finally
      LIni.Free;
    end;
  end;
End;

End.
