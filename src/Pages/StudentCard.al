page 50101 "Student Card"
{

    Caption = 'Student Card';
    PageType = Card;
    SourceTable = Student;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Broj Indeksa"; Rec."Broj Indeksa")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Broj Indeksa field.';
                }
                field(Ime; Rec.Ime)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ime field.';
                }
                field(Prezime; Rec.Prezime)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Prezime field.';
                }
                field(JMBG; Rec.JMBG)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the JMBG field.';
                    ShowMandatory = true;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(Mesto; Rec.Mesto)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mesto field.';
                }
            }
            group(FakultetGroup)
            {
                Caption = 'Fakultet';
                field(Studije; Rec.Studije)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Studije field.';
                }
                field("Studijski Program"; Rec."Studijski Program")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Studijski Program field.';
                }
                field("Prosecna Ocena"; Rec."Prosecna Ocena")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Prosecna Ocena field.';
                }
                field("Broj polozenih predmeta"; Rec."Broj polozenih predmeta")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Broj polozenih predmeta field.';
                }
                field("ESPB Bodovi"; Rec."ESPB Bodovi")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ESPB Bodovi field.';
                }
            }
        }
    }
}
