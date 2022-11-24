page 50111 "Ispiti List Part"
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
                    ToolTip = 'Specifies the value of the Predmet ID field.';
                }
                field("Naziv Predmeta"; Rec."Naziv Predmeta")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Naziv Predmeta field.';
                }
                field(Polozen; Rec.Polozen)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Polozen field.';
                }
                field(Ocena; Rec.Ocena)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ocena field.';
                }
                field("Broj izlazaka"; Rec."Broj izlazaka")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Broj izlazaka field.';
                }
                field(Komentar; Rec.Komentar)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Komentar field.';
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
                ToolTip = 'Executes the Otvori karticu predmeta action.';

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
