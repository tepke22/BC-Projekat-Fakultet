page 50107 "Ispiti List Part"
{

    Caption = 'Ispiti List Part';
    PageType = ListPart;
    SourceTable = Ispiti;
    UsageCategory = None;
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
                field("Naziv Predmeta"; Rec."Naziv Predmeta")
                {
                    ApplicationArea = All;
                }
                field(Polozen; Rec.Polozen)
                {
                    ApplicationArea = All;
                }
                field(Ocena; Rec.Ocena)
                {
                    ApplicationArea = All;
                }
                field("Broj izlazaka"; Rec."Broj izlazaka")
                {
                    ApplicationArea = All;
                }
                field(Komentar; Rec.Komentar)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(OpenPredmetCard)
            {
                ApplicationArea = All;
                Caption = 'Otvori karticu predmeta';
                Image = Card;

                trigger OnAction()
                var
                    Predmet: Record Predmet;
                begin
                    Predmet.Get(Rec."Predmet ID", Rec."Studijski Program ID", Rec.Studije);
                    Page.RunModal(Page::"Predmet Card", Predmet);
                end;
            }
        }
    }
}
