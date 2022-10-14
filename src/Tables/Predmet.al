table 50101 Predmet
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Predmet ID"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Predmet ID';
        }
        field(2; Naziv; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Naziv';
        }
        field(3; "Profesor"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Profesor';
            TableRelation = Profesor;
        }
        field(4; "ESPB Bodovi"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'ESPB Bodovi';
            BlankZero = true;
        }
        field(5; "Asistent 1"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Asistent 1';
        }
        field(6; "Asistent 2"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Asistent 2';
        }
        field(7; Semestar; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Semestar';
        }
        field(8; Godina; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Godina';
        }
    }

    keys
    {
        key(PK; "Predmet ID")
        {
            Clustered = true;
        }
    }

}