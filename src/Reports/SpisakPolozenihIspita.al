report 50100 "Spisak Polozenih Ispita"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = Word;
    WordLayout = './src/Reports/Layouts/SpisakPolozenihIspita.docx';
    Caption = 'Spisak Polozenih Ispita';


    dataset
    {
        dataitem(Ispiti; Ispiti)
        {
            CalcFields = "Naziv Predmeta";
            RequestFilterFields = "Broj Indeksa";
            DataItemTableView = where(Polozen = const(true));

            column(OcenaIspita; Ispiti.Ocena)
            {

            }
            column(KomentarIspita; Ispiti.Komentar)
            {

            }
            column(NazivPredmetaIspita; Ispiti."Naziv Predmeta")
            {

            }
            column(ESPBBodoviIspita; Ispiti."ESPB Bodovi")
            {

            }
            column(BrojIzlazakaIspita; Ispiti."Broj izlazaka")
            {

            }
            dataitem(Student; Student)
            {
                CalcFields = "Prosecna Ocena";
                DataItemLinkReference = Ispiti;
                DataItemLink = "Broj Indeksa" = field("Broj Indeksa");
                column(ImeStudenta; Student.Ime)
                {

                }
                column(PrezimeStudenta; Student.Prezime)
                {

                }
                column(EmailStudenta; Student.Email)
                {

                }
                column(JMBGStudenta; Student.JMBG)
                {

                }
                column(ProsecnaOcena; Student."Prosecna Ocena")
                {

                }
                column(IndeksStudenta; Student."Broj Indeksa")
                {

                }

                trigger OnAfterGetRecord()
                begin
                    if not IspisStudentInfo then begin
                        Student.Email := '';
                        Student.JMBG := '';
                    end;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                if Ispiti.Ocena > 5 then
                    KomentarVar := 'BRAVOOO'
                else
                    KomentarVar := 'Lose...';
            end;

        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(IspisStudentInfo; IspisStudentInfo)
                    {
                        ApplicationArea = All;
                        Caption = 'Ispis Student Info';
                    }
                }
            }
        }
    }


    trigger OnPreReport()
    var
        UserSetup: Record "User Setup";
    begin
        if not UserSetup.Get(UserId) then
            exit;
        if not UserSetup."Dozvoli Stampanje Ispita" then
            Error('Nije vam dozvoljeno stampanje izvestaja!!!');
    end;


    var
        myInt: Integer;
        KomentarVar: Text;
        IspisStudentInfo: Boolean;
}