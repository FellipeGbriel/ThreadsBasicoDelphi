unit Threads;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects;

type
  TForm1 = class(TForm)
    Rectangle1: TRectangle;
    Image1: TImage;
    Label1: TLabel;
    cont: TLabel;
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Image1Click(Sender: TObject);


begin

  //Criando uma Thread Anônima

  TThread.CreateAnonymousThread(procedure
    var
    //Declarando o Inteiro do for internamente
      I : Integer;

    begin

      //O for do contador, aumentando um número por segundo.

      for I := 0 to 10 do

      begin

        sleep(1000);

        //Colocando a atualização visual da aplicação na Thread principal.
        TThread.Synchronize(nil, procedure
          begin
            cont.Text := InttoStr(I);
          end
        );


      end;

    end
    ).Start;

end;

end.
