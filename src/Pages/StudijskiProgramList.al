page 50102 "Studijski program List"
{

    ApplicationArea = All;
    Caption = 'Studijski program List';
    PageType = List;
    SourceTable = "Studijski program";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Studije; Rec.Studije)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Studije field.';
                }
                field("Studijski Program ID"; Rec."Studijski Program ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Studijski Program ID field.';
                }
                field(Naziv; Rec.Naziv)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Naziv field.';
                }
                field("Godina akreditacije"; Rec."Godina akreditacije")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Godina akreditacije field.';
                }
            }
        }
    }
}
