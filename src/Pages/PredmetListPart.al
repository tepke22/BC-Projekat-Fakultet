page 50109 "Predmet List Part"
{

    Caption = 'Predmet List Part';
    PageType = ListPart;
    SourceTable = Predmet;
    UsageCategory = none;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Predmet ID"; Rec."Predmet ID")
                {
                    ApplicationArea = All;
                }
                field(Studije; Rec.Studije)
                {
                    ApplicationArea = All;
                }
                field("Studijski Program Id"; Rec."Studijski Program Id")
                {
                    ApplicationArea = All;
                }
                field(Naziv; Rec.Naziv)
                {
                    ApplicationArea = All;
                }
                field("ESPB Bodovi"; Rec."ESPB Bodovi")
                {
                    ApplicationArea = All;
                }
                field("Asistent 1"; Rec."Asistent 1")
                {
                    ApplicationArea = All;
                }
                field("Asistent 2"; Rec."Asistent 2")
                {
                    ApplicationArea = All;
                }
                field(Semestar; Rec.Semestar)
                {
                    ApplicationArea = All;
                }
                field(Godina; Rec.Godina)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
