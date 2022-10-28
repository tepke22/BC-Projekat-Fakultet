page 50108 "Ispiti List"
{

    Caption = 'Ispiti List';
    PageType = List;
    SourceTable = Ispiti;
    UsageCategory = Lists;
    ApplicationArea = All;

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
                field("Naziv Predmeta"; Rec."Naziv Predmeta")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Naziv Predmeta field.';
                }
                field("Studijski Program ID"; Rec."Studijski Program ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Studijski Program ID field.';
                }
                field(Studije; Rec.Studije)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Studije field.';
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
