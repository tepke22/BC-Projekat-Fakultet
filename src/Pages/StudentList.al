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
        area(FactBoxes)
        {
            part(IspitiStudentaFB; "Ispiti List Part")
            {
                ApplicationArea = All;
                SubPageLink = "Broj Indeksa" = field("Broj Indeksa"), "Studijski Program ID" = field("Studijski Program"), Studije = field(Studije);
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(SayHello)
            {
                ApplicationArea = All;
                ToolTip = 'Executes the Say Hello action.';
                Caption = 'Say Hello';

                trigger OnAction()
                begin
                    Message('Hello ' + Rec.Ime + ' ' + Rec.Prezime);
                end;
            }
            action(UpdateEmail)
            {
                ApplicationArea = All;
                ToolTip = 'Executes the Update Email action.';
                Caption = 'Update Email';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Image = Email;

                trigger OnAction()
                var
                    Student: Record Student;
                begin
                    if Student.IsEmpty() then
                        exit;
                    Student.FindSet();
                    repeat
                        Student.Email := LowerCase(Student.Ime) + '.' + LowerCase(Student.Prezime) + '@gmail.com';
                        Student.Modify();
                    until Student.Next() = 0;
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
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedOnly = true;
                    Visible = false;
                    ToolTip = 'Executes the Ukupan broj studenata action.';

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
                    ToolTip = 'Executes the Ukupan broj studenata (osnovne studije) action.';

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
                    ToolTip = 'Executes the Imena studenata bez duplikata action.';

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
                    ToolTip = 'Executes the Broj polozenih/nepolozenih ispita action.';

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
                    ToolTip = 'Executes the Promena nepolozenih ispita u polozene action.';

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