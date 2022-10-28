page 50104 "Profesor Card"
{
    Caption = 'Profesor Card';
    PageType = Card;
    SourceTable = Profesor;


    layout
    {
        area(content)
        {
            group(General)
            {
                field("Profesor ID"; Rec."Profesor ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Profesor ID field.';
                }
                field(Ime; Rec.Ime)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ime field.';
                }
                field(Prezime; Rec.Prezime)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Prezime field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Email field.';
                }
            }
            part(PredmetiProfesoraPart; "Predmet List Part")
            {
                ApplicationArea = All;
                SubPageLink = Profesor = field("Profesor ID");
            }
        }
        area(FactBoxes)
        {
            part(PredmetInfoFB; "Predmet Card Part")
            {
                ApplicationArea = All;
                Caption = 'Predmet Info';
                Provider = PredmetiProfesoraPart;
                SubPageLink = "Predmet ID" = field("Predmet ID"), "Studijski Program Id" = field("Studijski Program Id"), Studije = field(Studije);
            }
        }
    }
}
