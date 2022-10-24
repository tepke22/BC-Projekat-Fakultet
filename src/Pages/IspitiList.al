page 50108 "Ispiti List"
{

    Caption = 'Ispiti List';
    PageType = List;
    SourceTable = Ispiti;
    UsageCategory = None;

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
                field("Broj Izlazaka"; Rec."Broj Izlazaka")
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
