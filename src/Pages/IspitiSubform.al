page 50111 "Ispiti Subform"
{

    ApplicationArea = All;
    Caption = 'Ispiti Subform';
    PageType = ListPart;
    SourceTable = Ispiti;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Broj Indeksa"; Rec."Broj Indeksa")
                {
                    ApplicationArea = All;
                }
                field(Studije; Rec.Studije)
                {
                    ApplicationArea = All;
                }
                field("Studijski Program ID"; Rec."Studijski Program ID")
                {
                    ApplicationArea = All;
                }
                field("Predmet ID"; Rec."Predmet ID")
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
}
