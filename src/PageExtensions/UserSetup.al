pageextension 50100 "User Setup" extends "User Setup"
{
    //V6:1.4
    layout
    {
        addfirst(Control1)
        {
            field("Dozvoli Brisanje Ispita"; Rec."Dozvoli Brisanje Ispita")
            {
                ApplicationArea = All;
                ToolTip = 'Dozvoli Brisanje Ispita';
            }
            field("Dozvoli Stampanje Ispita"; Rec."Dozvoli Stampanje Ispita")
            {
                ApplicationArea = All;
                ToolTip = 'Dozvoli Stampanje Ispita';
            }

        }
    }
}