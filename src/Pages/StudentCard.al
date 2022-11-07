page 50101 "Student Card"
{
    PageType = Card;
    UsageCategory = None;
    Caption = 'Student';
    SourceTable = Student;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
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
                    Visible = false;
                }
                field(Mesto; Rec.Mesto)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mesto field.';
                    Visible = false;
                }

            }
            group(FakultetGroup)
            {
                Caption = 'Fakultet';
                field(Studije; Rec.Studije)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Studije field.';
                    ShowMandatory = true;
                }
                field("Studijski Program"; Rec."Studijski Program")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Studijski Program field.';
                    ShowMandatory = true;
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
                field("Prosecna Ocena"; Rec."Prosecna Ocena")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Prosecna Ocena field.';
                }
            }
            part(IspitiStudentaPart; "Ispiti List Part")
            {
                ApplicationArea = All;
                SubPageLink = "Broj Indeksa" = field("Broj Indeksa"), "Studijski Program ID" = field("Studijski Program"), Studije = field(Studije);
                Caption = 'Ispiti';
            }
        }
        area(FactBoxes)
        {
            part(PredmetInfoFB; "Predmet Card Part")
            {
                ApplicationArea = All;
                Caption = 'Predmet Info';
                Provider = IspitiStudentaPart;
                SubPageLink = "Predmet ID" = field("Predmet ID"), "Studijski Program Id" = field("Studijski Program Id"), Studije = field(Studije);
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                ToolTip = 'Executes the ActionName action.';
                Caption = 'Say Hello';

                trigger OnAction()
                begin
                    Message('Hello ' + Rec.Ime + ' ' + Rec.Prezime);
                end;
            }
            action(BrojPolozenihINePolozenihIspita)
            {
                ApplicationArea = All;
                Caption = 'Broj polozenih/nepolozenih ispita';
                Image = CoupledUsers;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    FakultetMgt: Codeunit "Fakultet Mgt.";
                begin
                    FakultetMgt.BrojPolozenihINePolozenihIspita(Rec);
                end;
            }
            action(PromenaNepolozeniUPolozeni)
            {
                ApplicationArea = All;
                Caption = 'Promena nepolozenih ispita u polozene';
                Image = CoupledUsers;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    FakultetMgt: Codeunit "Fakultet Mgt.";
                begin
                    FakultetMgt.PromeniNepolozenUPolozen(Rec);
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin

    end;

    trigger OnAfterGetRecord()
    begin

    end;

    trigger OnOpenPage()
    begin

    end;

}