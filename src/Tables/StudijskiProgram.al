table 50102 "Studijski program"
{
    DataClassification = CustomerContent;
    Caption = 'Studijski Program';

    fields
    {
        field(1; Studije; Enum Studije)
        {
            DataClassification = ToBeClassified;
            Caption = 'Studije';
        }
        field(2; "Studijski Program ID"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Studijski Program ID';
        }
        field(3; Naziv; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Naziv';
        }
        field(4; "Godina akreditacije"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Godina akreditacije';
        }

    }

    keys
    {
        key(PK; Studije, "Studijski Program ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Studijski Program ID", Naziv, "Godina akreditacije")
        {

        }
    }

}