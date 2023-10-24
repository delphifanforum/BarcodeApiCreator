unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,BarcodeAPILibrary,
  acPNG;

type
  TForm16 = class(TForm)
    cbb1: TComboBox;
    ed1: TEdit;
    btn1: TButton;
    img1: TImage;
    lbl1: TLabel;
    lbl11: TLabel;
    img11: TImage;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation

{$R *.dfm}

procedure TForm16.btn1Click(Sender: TObject);
var
Code_Type :string;
begin
case cbb1.ItemIndex of
    1:
      begin
        Code_Type:='aztec';
      end;
    2:
      begin
        Code_Type:='codabar';
      end;
    3:
      begin
        Code_Type:='39';
      end;
      4:
      begin
        Code_Type:='128';
      end;
      5:
      begin
        Code_Type:='dm';
      end;
      6:
      begin
        Code_Type:='8';
      end;
      7:
      begin
        Code_Type:='13';
      end;
      8:
      begin
        Code_Type:='417';
      end;
      9:
      begin
        Code_Type:='qr';
      end;


  end;
begin
  if TBarcodeDownloader.DownloadBarcode(Code_Type, ed1.Text, 'gen.png') then
  begin
    if Code_Type = 'qr' then

    img1.Picture.LoadFromFile('gen.png')
    else
    img11.Picture.LoadFromFile('gen.png');
  end
  else
  begin
    ShowMessage('Failed to download the barcode image.');
  end;
end;
end;

end.
