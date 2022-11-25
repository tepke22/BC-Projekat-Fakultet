report 50100 "Spisak Polozenih Ispita"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Spisak Polozenih Ispita';
    DefaultLayout = Word;
    WordLayout = './src/Reports/Layouts/SpisakPolozenihIspita.docx';

    dataset
    {
        dataitem(Ispiti; Ispiti)
        {
            DataItemTableView = sorting(Ocena) where(Polozen = const(true));
            RequestFilterFields = "Broj Indeksa";
            column(NazivPredmeta; Ispiti."Naziv Predmeta")
            {
            }
            column(KomentarPredmeta; Ispiti.Komentar)
            {
            }
            column(OcenaPredmeta; Format(Ispiti.Ocena))
            {
            }
            column(ESPBBodovi; Ispiti."ESPB Bodovi")
            {
            }
            column(BrojIzlazaka; Ispiti."Broj izlazaka")
            {
            }
            dataitem(Student; Student)
            {
                DataItemLinkReference = Ispiti;
                DataItemLink = "Broj Indeksa" = field("Broj Indeksa");
                column(ImeStudenta; Student.Ime)
                {

                }
                column(PrezimeStudenta; Student.Prezime)
                {

                }
                column(JMBGStudenta; Student.JMBG)
                {

                }
                column(EmailStudenta; Student.Email)
                {

                }
                column(BrojPolozenihPredmeta; Student."Broj polozenih predmeta")
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
                        Caption = 'Ispis informacija o studentu (JMBG i E-mail)';
                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    trigger OnPreReport()
    var
        UserSetup: Record "User Setup";
    begin
        IspisStudentInfo := true;
        if not UserSetup.Get(UserId()) then
            exit;
        if not UserSetup."Dozvoli Stampanje Ispita" then
            Error('Nije vam dozvoljeno stampanje izvestaja!!!');
    end;

    var
        myInt: Integer;
        KomentarVar: Text;
        IspisStudentInfo: Boolean;
}