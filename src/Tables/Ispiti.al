table 50104 Ispiti
{
    DataClassification = CustomerContent;
    Caption = 'Ispiti';
    DrillDownPageId = "Ispiti List";
    LookupPageId = "Ispiti List";

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
            TableRelation = "Studijski program"."Studijski Program ID" where(Studije = field(Studije));
            Caption = 'Studijski Program ID';
        }
        field(4; "Predmet ID"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = Predmet;
            Caption = 'Predmet ID';

            trigger OnValidate()
            var
                Predmet: Record Predmet;
            begin
                if not Predmet.Get(Rec."Predmet ID", Rec."Studijski Program ID", Rec.Studije) then
                    exit;
                Rec."ESPB Bodovi" := Predmet."ESPB Bodovi";
            end;
        }
        field(5; Polozen; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Polozen';
            Editable = false;
        }
        field(6; Ocena; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Ocena';
            InitValue = 5;
            MinValue = 5;
            MaxValue = 10;

            trigger OnValidate()
            begin
                Polozen := (Ocena >= 6) and (Ocena <= 10);
            end;
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
        field(9; "Naziv Predmeta"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Predmet.Naziv where("Predmet ID" = field("Predmet ID"), Studije = field(Studije), "Studijski Program Id" = field("Studijski Program ID")));
            Caption = 'Naziv Predmeta';
            Editable = false;
        }
        field(10; "ESPB Bodovi"; Integer)
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = 'ESPB Bodovi';
        }
    }

    keys
    {
        key(PK; "Broj Indeksa", Studije, "Studijski Program ID", "Predmet ID")
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.Get(UserId);
        if not UserSetup."Dozvoli Brisanje Ispita" then
            Error('Nemate odgovarajuca prava za brisanje ispita!!!');
    end;
}