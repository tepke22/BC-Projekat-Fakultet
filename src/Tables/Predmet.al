table 50105 Predmet
{
    DataClassification = CustomerContent;
    DrillDownPageId = "Predmet Card";
    LookupPageId = "Predmet List";

    fields
    {
        field(1; "Predmet ID"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Predmet ID';
        }
        field(2; Studije; Enum Studije)
        {
            DataClassification = CustomerContent;
            Caption = 'Studije';
        }
        field(3; "Studijski Program Id"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Studijski Program Id';
            TableRelation = "Studijski program"."Studijski Program ID" where(Studije = field(Studije));
        }
        field(10; Naziv; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Naziv';
        }
        field(11; "Profesor"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Profesor';
            TableRelation = Profesor;

            trigger OnValidate()
            var
                Profesor: Record Profesor;
            begin
                if not Profesor.Get(Rec.Profesor) then
                    exit;
                Rec."Naziv Profesora" := Profesor.Ime + ' ' + Profesor.Prezime;
                Rec.Modify();
            end;
        }
        field(12; "ESPB Bodovi"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'ESPB Bodovi';
            BlankZero = true;
            MinValue = 3;
            MaxValue = 10;
        }
        field(13; "Asistent 1"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Asistent 1';
        }
        field(14; "Asistent 2"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Asistent 2';
        }
        field(15; Semestar; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Semestar';
            MinValue = 1;
            MaxValue = 8;

            trigger OnValidate()
            begin
                case Rec.Semestar of
                    1, 2:
                        Rec.Godina := 1;
                    3, 4:
                        Rec.Godina := 2;
                    5, 6:
                        Rec.Godina := 3;
                    7, 8:
                        Rec.Godina := 4;
                end;
            end;
        }
        field(16; Godina; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Godina';
            Editable = false;
        }
        field(18; "Broj studenata na predmetu"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(Ispiti where("Predmet ID" = field("Predmet ID"), Studije = field(Studije), "Studijski Program ID" = field("Studijski Program Id")));
            Caption = 'Broj studenata na predmetu';
            Editable = false;
        }
        field(20; "Naziv Profesora"; Text[200])
        {
            DataClassification = CustomerContent;
            Caption = 'Naziv Profesora';
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Predmet ID", "Studijski Program Id", Studije)
        {
            Clustered = true;
        }
    }

}