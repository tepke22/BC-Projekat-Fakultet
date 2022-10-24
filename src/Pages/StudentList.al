page 50100 "Student List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Student;
    CardPageId = "Student Card";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
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
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Email field.';
                }
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
            group("Menadment Fakulteta")
            {
                Image = Company;
                action(UkupanBrojSvihStudenata)
                {
                    ApplicationArea = All;
                    Caption = 'Ukupan broj studenata';
                    Image = Users;

                    trigger OnAction()
                    var
                        FakultetMgt: Codeunit "Fakultet Mgt.";
                    begin
                        FakultetMgt.CountAllStudents();
                    end;
                }
                action(UkupanBrojStudenataNaOsnovnimStudijama)
                {
                    ApplicationArea = All;
                    Caption = 'Ukupan broj studenata (osnovne studije)';
                    Image = CoupledUsers;

                    trigger OnAction()
                    var
                        FakultetMgt: Codeunit "Fakultet Mgt.";
                    begin
                        FakultetMgt.CountStudentsOsnovneStudije();
                    end;
                }
                action(StudentNamesWithoutDuplicates)
                {
                    ApplicationArea = All;
                    Caption = 'Imena studenata bez duplikata';
                    Image = CoupledUsers;

                    trigger OnAction()
                    var
                        FakultetMgt: Codeunit "Fakultet Mgt.";
                    begin
                        FakultetMgt.StudentsNamesWithoutDuplicates();
                    end;
                }
                action(BrojPolozenihINePolozenihIspita)
                {
                    ApplicationArea = All;
                    Caption = 'Broj polozenih/nepolozenih ispita';
                    Image = CoupledUsers;

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

                    trigger OnAction()
                    var
                        FakultetMgt: Codeunit "Fakultet Mgt.";
                    begin
                        FakultetMgt.PromeniNepolozenUPolozen(Rec);
                    end;
                }
            }
        }
    }
}