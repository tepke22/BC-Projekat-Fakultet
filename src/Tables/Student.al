table 50100 Student
{
    Caption = 'Student';
    DataClassification = CustomerContent;
    DataCaptionFields = "Broj Indeksa", Ime, Prezime, Mesto;
    LookupPageId = "Student List";
    DrillDownPageId = "Student Card";

    fields
    {
        field(1; "Broj Indeksa"; Code[10])
        {
            Caption = 'Broj Indeksa';
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(2; Ime; Text[100])
        {
            Caption = 'Ime';
            DataClassification = CustomerContent;
        }
        field(3; Prezime; Text[100])
        {
            Caption = 'Prezime';
            DataClassification = CustomerContent;
        }
        field(4; JMBG; Text[13])
        {
            Caption = 'JMBG';
            DataClassification = CustomerContent;
            CharAllowed = '09';
            NotBlank = true;

            trigger OnValidate()
            begin
                if StrLen(Rec.JMBG) <> 13 then
                    Error('JMBG mora da sadrzi 13 karaktera.');
            end;
        }
        field(5; Email; Text[100])
        {
            Caption = 'Email';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                if Rec.Email <> '' then
                    MailManagement.ValidateEmailAddressField(Rec.Email);
            end;
        }
        field(6; Mesto; Text[100])
        {
            Caption = 'Mesto';
            DataClassification = ToBeClassified;
        }
        field(7; Studije; Enum Studije)
        {
            Caption = 'Studije';
            DataClassification = CustomerContent;
        }
        field(8; "Studijski Program"; Code[10])
        {
            Caption = 'Studijski Program';
            DataClassification = CustomerContent;
            TableRelation = "Studijski Program"."Studijski Program ID" where(Studije = field(Studije));
        }
        field(9; "Prosecna Ocena"; Decimal)
        {
            BlankZero = true;
            Caption = 'Prosecna Ocena';
            FieldClass = FlowField;
            CalcFormula = average(Ispiti.Ocena where(Studije = field(Studije), "Studijski Program ID" = field("Studijski Program"), "Broj Indeksa" = field("Broj Indeksa"), Polozen = const(true)));
            Editable = false;
        }
        field(10; "Broj nepolozenih predmeta"; Integer)
        {
            BlankZero = true;
            Caption = 'Broj nepolozenih predmeta';
            FieldClass = FlowField;
            CalcFormula = count(Ispiti where(Studije = field(Studije), "Studijski Program ID" = field("Studijski Program"), "Broj Indeksa" = field("Broj Indeksa"), Polozen = const(false)));
            Editable = false;
        }
        field(11; "ESPB Bodovi"; Integer)
        {
            BlankZero = true;
            Caption = 'ESPB Bodovi';
            FieldClass = FlowField;
            CalcFormula = sum(Ispiti."ESPB Bodovi" where(Studije = field(Studije), "Studijski Program ID" = field("Studijski Program"), "Broj Indeksa" = field("Broj Indeksa"), Polozen = const(true)));
            Editable = false;
        }

    }

    keys
    {
        key(PK; "Broj Indeksa")
        {
            Clustered = true;
        }
        key(Unique; JMBG)
        {
            Unique = true;
        }
    }

    //V6: 1.0
    trigger OnDelete()
    var
        Ispiti: Record Ispiti;
    begin
        //V6: 1.2 +
        if not PreventDeleteStudentIfThereIsPassedExam() then
            Error('Student ima polozenih ispita. Brisanje nije moguce');
        //V6: 1.2 -
        Ispiti.SetRange("Broj Indeksa", "Broj Indeksa");
        if not Ispiti.IsEmpty() then
            Ispiti.DeleteAll();

    end;
    //V6: 1.1
    trigger OnRename()
    var
        Ispiti: Record Ispiti;
        IspitiInsert: Record Ispiti;
        IspitiBck: Record Ispiti temporary;
    begin
        Ispiti.SetRange("Broj Indeksa", "Broj Indeksa");
        if not Ispiti.IsEmpty() then begin
            Ispiti.FindSet();
            repeat
                IspitiBck := Ispiti;
                Ispiti.Delete();
                IspitiInsert.Init();
                IspitiInsert := IspitiBck;
                IspitiInsert."Broj Indeksa" := "Broj Indeksa";
                IspitiInsert.Insert();
            until Ispiti.Next() = 0;
        end;
    end;

    local procedure PreventDeleteStudentIfThereIsPassedExam(): Boolean
    var
        Ispiti: Record Ispiti;
    begin
        //V6: 1.2
        Ispiti.SetRange("Broj Indeksa", "Broj Indeksa");
        Ispiti.SetRange(Polozen, true);
        exit(Ispiti.IsEmpty());
    end;
}