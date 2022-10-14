table 50100 Student
{
    Caption = 'Student';
    DataClassification = CustomerContent;
    DataCaptionFields = "Broj Indeksa", Ime, Prezime, Mesto;

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

}