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
            NotBlank = true;

            trigger OnValidate()
            var
                Student: Record Student;
            begin
                if not Student.Get(Rec."Broj Indeksa") then
                    exit;
                Studije := Student.Studije;
                "Studijski Program ID" := Student."Studijski Program";
            end;
        }
        field(2; Studije; Enum Studije)
        {
            DataClassification = CustomerContent;
            Caption = 'Studije';
            Editable = false;
        }
        field(3; "Studijski Program ID"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Studijski program"."Studijski Program ID" where(Studije = field(Studije));
            Caption = 'Studijski Program ID';
            Editable = false;
        }
        field(4; "Predmet ID"; Code[10])
        {
            DataClassification = CustomerContent;
            NotBlank = true;
            TableRelation = Predmet where(Studije = field(Studije), "Studijski Program Id" = field("Studijski Program ID"));
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
                //V6: 1.3 add currpage.update on the page afterwards to update data
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
        //V6: 1.4
        UserSetup.get(UserId);
        if not UserSetup."Dozvoli Brisanje Ispita" then
            if Polozen = true then
                Error('Nije moguce obrisati pozolen ispit. Morate imati admin prava');
    end;
}