page 50106 "Predmet Card"
{

    Caption = 'Predmet Card';
    PageType = Card;
    SourceTable = Predmet;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Predmet ID"; Rec."Predmet ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Predmet ID field.';
                }
                field(Studije; Rec.Studije)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Studije field.';
                }
                field("Studijski Program Id"; Rec."Studijski Program Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Studijski Program Id field.';
                }
                field(Naziv; Rec.Naziv)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Naziv field.';
                }
                field(Profesor; Rec.Profesor)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Profesor field.';
                }
                field("ESPB Bodovi"; Rec."ESPB Bodovi")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ESPB Bodovi field.';
                }
                field("Asistent 1"; Rec."Asistent 1")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Asistent 1 field.';
                }
                field("Asistent 2"; Rec."Asistent 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Asistent 2 field.';
                }
                field(Semestar; Rec.Semestar)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Semestar field.';
                }
                field(Godina; Rec.Godina)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Godina field.';
                }
            }
        }
    }

    local procedure MyProcedure()
    var
        Enum: Enum Studije;
        index: Integer;
        Predmet: Record Predmet;
        brojText: Text;
        brojInteger: integer;
    begin

        brojText := '5ar';
        if not Evaluate(brojInteger, brojText) then
            Error('Nije validan integer podatak!');

        if brojInteger = 5 then
            Message('Broj je 5');

        Predmet.SetRange(Godina, 2, 4);
        Predmet.SetFilter(Naziv, '');
        Predmet.SetRange(Godina, 2, 4);
        Predmet.SetFilter(Naziv, '');
        Predmet.SetRange(Godina, 2, 4);
        Predmet.SetFilter(Naziv, '');

        Predmet.FindSet();

        case Predmet.Naziv of
            'IT', 'TI':
                index := 0;
            'IM':
                begin
                    index := 3;
                    index := 3;
                end;
            else
                index := 5;
        end;

        Message('Hello World!');
        Error('');
        Message('Hello World 2!');
        if Confirm('Da li ste punoletni?', true) then
            Message('Punoletni ste!');
        index := StrMenu('Blue, Plaid, Yellow, Hot Pink, Orange, Unknown', 3);
        Message(Format(index));
    end;

    trigger OnOpenPage()
    begin
        // MyProcedure();
    end;
}
