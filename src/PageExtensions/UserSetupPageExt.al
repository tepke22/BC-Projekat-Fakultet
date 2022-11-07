pageextension 50100 "User Setup" extends "User Setup"
{
    layout
    {
        modify("Purchase Resp. Ctr. Filter")
        {
            Visible = false;
        }
        modify("Sales Resp. Ctr. Filter")
        {
            Visible = false;
        }
        modify("Service Resp. Ctr. Filter")
        {
            Visible = false;
        }
        addafter("User ID")
        {
            field("Dozvoli Brisanje Ispita"; Rec."Dozvoli Brisanje Ispita")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Dozvoli Brisanje Ispita field.';
            }
        }
    }
}