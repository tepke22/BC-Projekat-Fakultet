tableextension 50100 "User Setup TableExt" extends "User Setup"
{
    //V6:1.4
    fields
    {
        field(50100; "Dozvoli Brisanje Ispita"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Dozvoli Brisanje Ispita';
        }
    }

}