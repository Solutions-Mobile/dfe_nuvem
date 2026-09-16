unit NFeJson;

interface

uses
  System.SysUtils;
  
TNFeJson = class
public
  class function Serialize(ANFe: TNFeDTO): string; static;
  class function Deserialize(const AJson: string): TNFeDTO; static;
end;