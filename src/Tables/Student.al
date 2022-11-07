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

            trigger OnValidate()
            begin
                ProveraZaPostojecimIspitima('studije');
            end;
        }
        field(8; "Studijski Program"; Code[10])
        {
            Caption = 'Studijski Program';
            DataClassification = CustomerContent;
            TableRelation = "Studijski Program"."Studijski Program ID" where(Studije = field(Studije));

            trigger OnValidate()
            begin
                ProveraZaPostojecimIspitima('studijski program');
            end;
        }
        field(9; "Prosecna Ocena"; Decimal)
        {
            BlankZero = true;
            Caption = 'Prosecna Ocena';
            Editable = false;
        }
        field(10; "Broj polozenih predmeta"; Integer)
        {
            BlankZero = true;
            Caption = 'Broj polozenih predmeta';
            Editable = false;
        }
        field(11; "ESPB Bodovi"; Integer)
        {
            BlankZero = true;
            Caption = 'ESPB Bodovi';
            DataClassification = CustomerContent;
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

    trigger OnDelete()
    var
        Ispiti: Record Ispiti;
    begin

        if StudentPolozioNekiIspit() then
            Error('Student ima polozen barem jedan ispit, brisanje nije moguce!!!');

        Ispiti.SetRange("Broj Indeksa", Rec."Broj Indeksa");
        if not Ispiti.IsEmpty() then
            Ispiti.DeleteAll(true);
    end;

    local procedure StudentPolozioNekiIspit(): Boolean
    var
        Ispiti: Record Ispiti;
    begin
        Ispiti.SetFilter("Broj Indeksa", '=%1', Rec."Broj Indeksa");
        Ispiti.SetRange(Polozen, true);
        exit(not Ispiti.IsEmpty());
    end;

    local procedure ProveraZaPostojecimIspitima(IzmenjenoPolje: Text)
    var
        Ispiti: Record Ispiti;
    begin
        Ispiti.SetRange("Broj Indeksa", Rec."Broj Indeksa");
        Ispiti.SetRange(Studije, xRec.Studije);
        Ispiti.SetRange("Studijski Program ID", xRec."Studijski Program");
        if not Ispiti.IsEmpty() then
            Error('Nije moguce izmeniti %1 studentu, vec je upisan na neke ispite!', IzmenjenoPolje);
    end;

}