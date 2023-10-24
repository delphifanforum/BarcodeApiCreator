unit BarcodeAPILibrary;

interface

uses
   SysUtils, Classes, Graphics, IdHTTP, IdURI, IdGlobal, Vcl.ExtCtrls;

type
  TBarcodeDownloader = class
  public
    class function DownloadBarcode(BarcodeType, Data, FileName: string): Boolean;
  end;

implementation

{ TBarcodeDownloader }

class function TBarcodeDownloader.DownloadBarcode(BarcodeType, Data, FileName: string): Boolean;
var
  URL: string;
  HTTP: TIdHTTP;
  ResponseStream: TMemoryStream;
begin
  URL := 'https://barcodeapi.org/api/' + LowerCase(BarcodeType) + '/' + TIdURI.ParamsEncode(Data);
  HTTP := TIdHTTP.Create(nil);
  ResponseStream := TMemoryStream.Create;
  try
    try
      HTTP.Get(URL, ResponseStream);
      ResponseStream.Position := 0;

      // Add the '.png' extension to the FileName
      FileName := ChangeFileExt(FileName, '.png');

      ResponseStream.SaveToFile(FileName);
      Result := True;
    except
      Result := False;
    end;
  finally
    ResponseStream.Free;
    HTTP.Free;
  end;
end;

end.
