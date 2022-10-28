page 50110 "Predmet Card Part"
{

    Caption = 'Predmet Card Part';
    PageType = CardPart;
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
                field(Profesor; Rec.Profesor)
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        Profesor: Record Profesor;
                    begin
                        Profesor.Get(Rec.Profesor);
                        Page.RunModal(Page::"Profesor Card", Profesor);
                    end;
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
                field("Broj studenata na predmetu"; Rec."Broj studenata na predmetu")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
