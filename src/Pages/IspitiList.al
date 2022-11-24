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
                    ToolTip = 'Specifies the value of the Broj Indeksa field.';
                }
                field(Studije; Rec.Studije)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Studije field.';
                }
                field("Studijski Program ID"; Rec."Studijski Program ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Studijski Program ID field.';
                }
                field("Predmet ID"; Rec."Predmet ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Predmet ID field.';
                    ShowMandatory = true;
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
                field("Broj Izlazaka"; Rec."Broj Izlazaka")
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
            action(RandomIspiti)
            {
                ApplicationArea = All;
                Caption = 'Random Ispiti';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = ReturnRelated;

                trigger OnAction()
                var
                    FakultetMgt: Codeunit "Fakultet Mgt.";
                begin
                    FakultetMgt.InsertRandomIspiti();
                end;
            }
        }
    }

}
