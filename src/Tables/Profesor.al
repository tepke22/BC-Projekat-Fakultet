table 50103 Profesor
{
    Caption = 'Profesor';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Profesor ID"; Code[10])
        {
            Caption = 'Profesor ID';
            DataClassification = CustomerContent;
        }
        field(2; Ime; Text[50])
        {
            Caption = 'Ime';
            DataClassification = CustomerContent;
        }
        field(3; Prezime; Text[50])
        {
            Caption = 'Prezime';
            DataClassification = CustomerContent;
        }
        field(4; Email; Text[100])
        {
            Caption = 'Email';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Profesor ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Profesor ID", Ime, Prezime)
        {

        }
    }

}
