report 50100 "Spisak Polozenih Ispita"
{
    ApplicationArea = All;
    Caption = 'Spisak Polozenih Ispita';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = Word;
    WordLayout = './src/Reports/Layouts/SpisakPolozenihIspita.docx';
    dataset
    {
        dataitem(Student; Student)
        {
            CalcFields = "Prosecna Ocena";
            RequestFilterFields = "Broj Indeksa";
            column(ImeStudenta; Student.Ime)
            {
                IncludeCaption = false;
            }
            column(PrezimeStudenta; Student.Prezime)
            {
                IncludeCaption = false;
            }
            column(BrojIndeksaStudenta; Student."Broj Indeksa")
            {
                IncludeCaption = false;
            }
            column(ProsecnaOcena; Student."Prosecna Ocena")
            {
            }
            dataitem(Ispiti; Ispiti)
            {
                DataItemLinkReference = Student;
                DataItemLink = "Broj Indeksa" = field("Broj Indeksa");
                DataItemTableView = sorting("Broj Indeksa", Studije, "Studijski Program ID", "Predmet ID") where(Polozen = const(true));
                column(NazivIspita; Ispiti."Naziv Predmeta")
                {
                    IncludeCaption = false;
                }
                column(OcenaIspita; Ispiti.Ocena)
                {
                    IncludeCaption = false;
                }
                column(ESPBBodoviIspita; ESPBBodoviIspita)
                {
                    IncludeCaption = false;
                }

                trigger OnAfterGetRecord()
                var
                    Predmet: Record Predmet;
                begin
                    if Predmet.Get(Ispiti."Predmet ID", Ispiti."Studijski Program ID", Ispiti.Studije) then
                        ESPBBodoviIspita := Predmet."ESPB Bodovi";
                end;
            }

            trigger OnAfterGetRecord()
            begin
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }

    var
        ESPBBodoviIspita: Integer;
}
