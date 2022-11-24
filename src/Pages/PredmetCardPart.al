page 50110 "Predmet Card Part"
{

    Caption = 'Predmet Card Part';
    PageType = CardPart;
    SourceTable = Predmet;


    layout
    {
        area(content)
        {
            group(General)
            {
                field("Predmet ID"; Rec."Predmet ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Predmet ID field.';
                }
                field(Studije; Rec.Studije)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Studije field.';
                }
                field("Studijski Program Id"; Rec."Studijski Program Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Studijski Program Id field.';
                }
                field(Naziv; Rec.Naziv)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Naziv field.';
                }
                field(Profesor; Rec.Profesor)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Profesor field.';
                    trigger OnDrillDown()
                    var
                        Profesor: Record Profesor;
                    begin
                        Profesor.Get(Rec.Profesor);
                        Page.RunModal(Page::"Profesor Card", Profesor);
                    end;
                }
                field("ESPB Bodovi"; Rec."ESPB Bodovi")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ESPB Bodovi field.';
                }
                field("Asistent 1"; Rec."Asistent 1")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Asistent 1 field.';
                }
                field("Asistent 2"; Rec."Asistent 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Asistent 2 field.';
                }
                field(Semestar; Rec.Semestar)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Semestar field.';
                }
                field(Godina; Rec.Godina)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Godina field.';
                }
                field("Broj studenata na predmetu"; Rec."Broj studenata na predmetu")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Broj studenata na predmetu field.';
                }
            }
        }
    }
}
