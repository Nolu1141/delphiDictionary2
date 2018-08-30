unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, System.JSON,
  System.JSON.Builders, System.JSON.Writers, System.JSON.Types;

type
  TForm1 = class(TForm)
    IdHTTP1: TIdHTTP;
    ButtonFindWord: TButton;
    FindWithIp: TButton;
    Edit1: TEdit;
    DeleteWord: TButton;
    Edit2: TEdit;
    Memo1: TMemo;
    AddWord: TButton;
    FindWithPart: TButton;
    Label1: TLabel;
    Label2: TLabel;
    GetAllWords: TButton;
    ListBox1: TListBox;
    Button1: TButton;
    EditButton: TButton;
    procedure ButtonFindWordClick(Sender: TObject);
    procedure FindWithIpClick(Sender: TObject);
    procedure AddWordClick(Sender: TObject);
    procedure FindWithPartClick(Sender: TObject);
    procedure DeleteWordClick(Sender: TObject);
    procedure GetAllWordsClick(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function FindWord (str: string): string;
  var
  WordJSON: TJSONObject;
  Word: String;
  Description: String;

  begin
  WordJSON := TJSONObject.ParseJSONValue(Form1.IdHTTP1.Get(str)) as TJSONObject;
  Word := (WordJson.GetValue('title') as TJSONString).Value;
  Description := (WordJson.GetValue('description') as TJSONString).Value;
  Result:= Word + ' - ' + Description;
  end;


procedure TForm1.AddWordClick(Sender: TObject);
  var
  title : string;
  description: string;
  MyJson: string;
  JsonToSend: TStringStream;

  begin
      edit1.Text := Trim(edit1.Text);
      title:= edit1.Text;
      description := edit2.Text;
      if(Length(edit1.Text) = 0) or (Length(edit2.Text) = 0) then
      begin
        Raise Exception.Create('Введите слово и его значение');
      end;

        MyJson:= '{"title": "'+title+'","description": "'+ description +'"}';
        JsonToSend := TStringStream.Create(MyJson, TEncoding.UTF8);

        Form1.IdHTTP1.Request.ContentType := 'application/json';
        Form1.IdHTTP1.Request.CharSet := 'utf-8';
        try
        Form1.IdHTTP1.Post('http://localhost:8080/dictionary/', JsonToSend);
        except
        on E: Exception do
        ShowMessage('Error on request: '#13#10 + e.Message);
        end;

          Memo1.Clear;
          Memo1.Lines.Add('добавлено слово: ' );
          Memo1.Lines.Add(title + ' - '  + description);
  end;

procedure TForm1.GetAllWordsClick(Sender: TObject);
  var
  WordsArray: TJSONArray;
  I: integer;
  title: string;
  begin
  ListBox1.Clear;
  Memo1.Clear;
  WordsArray := TJSONObject.ParseJSONValue(Form1.IdHTTP1.Get('http://localhost:8080/dictionary/all')) as TJSONArray;
  for I := 0 to (WordsArray.Count-1) do
    begin
    title:=  ((WordsArray.Items[I] as TJSONObject).GetValue('title') as TJSONString).Value;
    ListBox1.Items.Add(title);
    end;
  end;


procedure TForm1.ListBox1Click(Sender: TObject);
  var
  description: string;
  title:string;
  begin
  Memo1.Clear;
  Edit1.Clear;
  description:= FindWord('http://localhost:8080/dictionary/title/'+ ListBox1.Items[ListBox1.ItemIndex]);
  Memo1.Lines.Add(description) ;
  title:= ListBox1.Items[ListBox1.ItemIndex];
  Edit1.Text:=(title);
  end;


procedure TForm1.Button1Click(Sender: TObject);
  begin
  Edit1.Clear;
  Edit2.Clear;
  Memo1.Clear;
  ListBox1.Clear;
  end;

procedure TForm1.EditButtonClick(Sender: TObject);
  var
  title : string;
  description: string;
  MyJson: string;
  JsonToSend: TStringStream;
  begin
      edit1.Text := Trim(edit1.Text);
      title:= edit1.Text;
      description := edit2.Text;
      if(Length(edit1.Text) = 0) or (Length(edit2.Text) = 0) then
      begin
        Raise Exception.Create('Введите слово и его значение');
      end;

      MyJson:= '{"title": "'+title+'","description": "'+ description +'"}';
        JsonToSend := TStringStream.Create(MyJson, TEncoding.UTF8);

        Form1.IdHTTP1.Request.ContentType := 'application/json';
        Form1.IdHTTP1.Request.CharSet := 'utf-8';
        try
        Form1.IdHTTP1.Put('http://localhost:8080/dictionary/', JsonToSend);
        except
        on E: Exception do
        ShowMessage('Error on request: '#13#10 + e.Message);
        end;

          Memo1.Clear;
          Memo1.Lines.Add('изменено слово: ' );
          Memo1.Lines.Add(title + ' - '  + description);
  end;

procedure TForm1.ButtonFindWordClick(Sender: TObject);
  begin
    try
    Memo1.Clear;
    Memo1.Lines.Add(FindWord('http://localhost:8080/dictionary/title/' + Edit1.Text));
    except on E : Exception do
      begin
         ShowMessage ('Слово не найдено');
      end;

    end;
  end;

procedure TForm1.DeleteWordClick(Sender: TObject);
  begin
    try
    Form1.IdHTTP1.Delete('http://localhost:8080/dictionary/' + Edit1.Text);
    Memo1.Clear;
    Memo1.Lines.Add('Слово удалено.');
    Form1.GetAllWords.Click;
    except on E : Exception do
      begin
         ShowMessage ('Слово не найдено');
      end;

    end;
  end;

procedure TForm1.FindWithIpClick(Sender: TObject);
  begin
    try
    Memo1.Clear;
    Memo1.Lines.Add(FindWord('http://localhost:8080/dictionary/id/' + Edit1.Text));
    except on E : Exception do
        begin
           ShowMessage ('Слово не найдено');
        end;
    end;
  end;


procedure TForm1.FindWithPartClick(Sender: TObject);
  var
  WordsArray: TJSONArray;
  I: integer;
  title: string;
  description: string;

  begin
     try
      Memo1.Clear;
      WordsArray := TJSONObject.ParseJSONValue(Form1.IdHTTP1.Get('http://localhost:8080/dictionary/p/' + Edit1.Text)) as TJSONArray;
      for I := 0 to (WordsArray.Count-1) do
      begin
      title:= ((WordsArray.Items[I] as TJSONObject).GetValue('title') as TJSONString).Value;
      description:=  ((WordsArray.Items[I] as TJSONObject).GetValue('description') as TJSONString).Value;
      Memo1.Lines.Add(title + ' - ' + description);
      end;
      except on E : Exception do
          begin
             ShowMessage ('Слово не найдено');
          end;
      end;
  end;



end.
