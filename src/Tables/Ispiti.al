table 50104 Ispiti
{
    DataClassification = CustomerContent;
    Caption = 'Ispiti';

    fields
    {
        field(1; "Broj Indeksa"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = Student;
            Caption = 'Broj Indeksa';
        }
        field(2; Studije; Enum Studije)
        {
            DataClassification = CustomerContent;
            Caption = 'Studije';
        }
        field(3; "Studijski Program ID"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Studijski program" where(Studije = field(Studije));
            Caption = 'Studijski Program ID';
        }
        field(4; "Predmet ID"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = Predmet;
            Caption = 'Predmet ID';
        }
        field(5; Polozen; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Polozen';
        }
        field(6; Ocena; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Ocena';
            MinValue = 5;
            MaxValue = 10;
        }
        field(7; "Broj izlazaka"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Broj izlazaka';
            MinValue = 0;
        }
        field(8; Komentar; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Komentar';
        }
    }

    keys
    {
        key(PK; "Broj Indeksa", Studije, "Studijski Program ID", "Predmet ID")
        {
            Clustered = true;
        }
    }
}