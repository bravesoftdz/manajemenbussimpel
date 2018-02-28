unit mnewbus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls;

type
  TfNewBus = class(TForm)
    lblNewBus: TLabel;
    dbBus: TDBEdit;
    btnOk: TButton;
    btnCancel: TButton;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fNewBus: TfNewBus;

implementation

uses Unit1;

{$R *.dfm}

procedure TfNewBus.FormShow(Sender: TObject);
begin
  Form1.dsBuses.DataSet.Append;
end;

end.
