unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, SHFolder, DB, ADODB, ComCtrls, dbcgrids,
  Grids, DBGrids, Mask, DBCtrls, Menus;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    lblDaftarBusTersedia: TLabel;
    conn1: TADOConnection;
    qryBuses: TADOQuery;
    dsBuses: TDataSource;
    lstAvailBuses: TListBox;
    grpPilih: TRadioGroup;
    qryBus: TADOQuery;
    dbBusPlate: TDBEdit;
    dbBusNo: TDBEdit;
    chkAvail: TDBCheckBox;
    btnSimpan: TButton;
    dbDriver: TDBLookupComboBox;
    qryDrivers: TADOQuery;
    dsDrivers: TDataSource;
    btnDelDriver: TButton;
    mnBus: TPopupMenu;
    ambahbus1: TMenuItem;
    lblBusPlate: TLabel;
    lblBusNo: TLabel;
    lblDriver: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure conn1AfterConnect(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryBusesAfterOpen(DataSet: TDataSet);
    procedure lstAvailBusesClick(Sender: TObject);
    procedure grpPilihClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure btnDelDriverClick(Sender: TObject);
    procedure ambahbus1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
CONST
  myAppPath='majolelo';
  myAppPat2='bus';

implementation

uses mnewbus;

{$R *.dfm}

function GetSpecialFolderPath(folder : integer) : string;
const
 SHGFP_TYPE_CURRENT = 0;
var
 path: array [0..MAX_PATH] of char;
begin
 if SUCCEEDED(SHGetFolderPath(0,folder,0,SHGFP_TYPE_CURRENT,@path[0])) then
   Result := path
 else
   Result := '';
end;

procedure TForm1.FormCreate(Sender: TObject);
var myPath:PAnsiChar; Bus: TStrings;
begin
  StatusBar1.Panels[0].Text:='Initialising...';
  //ShowMessage(GetSpecialFolderPath(CSIDL_LOCAL_APPDATA));
  //Initialise..
  {if not(DirectoryExists(GetSpecialFolderPath(CSIDL_LOCAL_APPDATA)+'\'+myAppPath))then begin
    myPath:=PAnsiChar(GetSpecialFolderPath(CSIDL_LOCAL_APPDATA)+'\'+myAppPath);
    CreateDirectory(myPath, 0);
  end;
  if not(DirectoryExists(GetSpecialFolderPath(CSIDL_LOCAL_APPDATA)+'\'+myAppPath+'\'+myAppPat2))then begin
    myPath:=PAnsiChar(GetSpecialFolderPath(CSIDL_LOCAL_APPDATA)+'\'+myAppPath+'\'+myAppPat2);
    CreateDirectory(myPath, 0);
  end;
  if not(FileExists(myPath+'\avail.bus'))then begin
    Bus:=TStringList.Create;
    Bus.SaveToFile(myPath+'\avail.bus');
  end;}
  StatusBar1.Panels[0].Text:='Loading database...';
  conn1.Connected:=True;
end;

procedure TForm1.conn1AfterConnect(Sender: TObject);
begin
  qryBuses.Active:=True;
  qryDrivers.Active:=True;
  StatusBar1.Panels[0].Text:='Database connected';
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  conn1.Connected:=False;
end;

procedure TForm1.qryBusesAfterOpen(DataSet: TDataSet);
begin
  lstAvailBuses.Clear;
  lstAvailBuses.Font.Style:=[];  
  qryBuses.First;
  while not qryBuses.Eof do begin
    lstAvailBuses.AddItem(qryBuses.FieldValues['busplate'], TObject(StrToInt(qryBuses.FieldValues['busid'])));
    qryBuses.Next;
  end;
  if(lstAvailBuses.Count=0)then begin
    lstAvailBuses.Tag:=-1;
    lstAvailBuses.Font.Style:=[fsItalic];
    lstAvailBuses.Items[0]:='Tidak ada bus';
  end else begin
    lstAvailBuses.Tag:=0;
    qryBuses.First;
    lstAvailBuses.ItemIndex:=0;

  end;
end;

procedure TForm1.lstAvailBusesClick(Sender: TObject);
begin
  if(lstAvailBuses.Tag>=0)then begin
    dsBuses.DataSet.Locate('busid', Integer(lstAvailBuses.Items.Objects[lstAvailBuses.ItemIndex]), []);
  end;
end;

procedure TForm1.grpPilihClick(Sender: TObject);
begin
  if(grpPilih.ItemIndex=0)then begin
    lstAvailBuses.Clear;
    qryBuses.Active:=false;
    qryBuses.SQL.Clear;
    qryBuses.SQL.Add('SELECT * FROM tbBuses WHERE avail=Yes');
    qryBuses.Active:=True;
  end else begin
    lstAvailBuses.Clear;
    qryBuses.Active:=false;
    qryBuses.SQL.Clear;
    qryBuses.SQL.Add('SELECT * FROM tbBuses');
    qryBuses.Active:=True;
  end;
end;

procedure TForm1.btnSimpanClick(Sender: TObject);
begin
  dsBuses.Edit;
  dsBuses.DataSet.Post;
end;

procedure TForm1.btnDelDriverClick(Sender: TObject);
begin
  dsBuses.Edit;
  dsBuses.DataSet.FieldByName('drivenby').Clear;
end;

procedure TForm1.ambahbus1Click(Sender: TObject);
begin
  FNewBus:=TFNewBus.Create(Self);
  if(FNewBus.ShowModal=mrOk)then begin
    dsBuses.DataSet.Post;
  end;
  FNewBus.Destroy;
end;

end.
