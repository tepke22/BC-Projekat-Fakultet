codeunit 50100 "Fakultet Mgt."
{
    trigger OnRun()
    begin

    end;

    #region Procedura koja broji i ispisuje ukupan broj studenata

    procedure CountAllStudents()
    var
        Student: Record Student;
        UkupanBrojStudenataLbl: Label 'Ukupan broj studenata je %1.';
        Count: Integer;
    begin
        Count := Student.Count();
        Message(UkupanBrojStudenataLbl, Format(Count));
    end;

    #endregion

    #region Procedure koja broji i ispisuje broj studenata na osnovnim studijama

    procedure CountStudentsOsnovneStudije()
    var
        Student: Record Student;
        UkupanBrojStudenataLbl: Label 'Ukupan broj studenata na Osnovnim studijama je %1.';
        Count: Integer;
    begin
        Student.SetRange(Studije, Studije::Osnovne);
        Count := Student.Count();
        Message(UkupanBrojStudenataLbl, Format(Count));
    end;

    #endregion

    #region Procedura koja ispisuje imena. Ukoliko postoji ispisano ime preskace ga i ne duplira ispis

    procedure StudentsNamesWithoutDuplicates()
    var
        Student: Record Student;
        Imena: Text;
        ListaImena: List of [Text];
    begin
        if Student.IsEmpty() then
            exit;
        Student.FindSet();
        repeat
            if not ListaImena.Contains(Student.Ime) then begin
                ListaImena.Add(Student.Ime);
                Imena += Student.Ime + ' ';
            end;
        until Student.Next() = 0;
        Message(Imena);
    end;

    #endregion

    #region Procedure koja prebroji broj polozenih/nepolozenih ispita studenta

    procedure BrojPolozenihINePolozenihIspita(Student: Record Student)
    var
        Ispiti: Record Ispiti;
        IspitiErr: Label 'Student ne pohadja nijedan predmet!';
        Polozeni: Integer;
        NePolozeni: Integer;
    begin
        Ispiti.SetRange("Broj Indeksa", Student."Broj Indeksa");
        if Ispiti.IsEmpty() then
            Error(IspitiErr);
        Ispiti.SetRange(Polozen, true);
        Polozeni := Ispiti.Count();
        Ispiti.SetRange(Polozen, false);
        NePolozeni := Ispiti.Count();
        Message('Broj polozenih ispita: %1 \\Broj nepolozenih ispita: %2', Format(Polozeni), Format(NePolozeni));
    end;

    #endregion

    #region Procedura koja menja nepolozene ispite u polozene

    procedure PromeniNepolozenUPolozen(Student: Record Student)
    var
        Ispiti: Record Ispiti;
    begin
        Ispiti.SetRange("Broj Indeksa", Student."Broj Indeksa");
        Ispiti.SetRange(Polozen, false);
        if Ispiti.IsEmpty() then
            exit;
        Ispiti.ModifyAll(Polozen, true);
        // Ispiti.FindSet();
        // repeat
        //     Ispiti.Polozen := true;
        //     Ispiti.Modify();
        // until Ispiti.Next() = 0;
    end;

    #endregion

    #region Nasumicno dodavanja Ispita 

    internal procedure InsertRandomIspiti()
    var
        Student: Record Student;
        Predmet: Record Predmet;
    begin
        i := 0;
        if Student.IsEmpty() then
            exit;
        Student.FindSet();
        repeat
            Predmet.SetRange(Studije, Student.Studije);
            Predmet.SetRange("Studijski Program Id", Student."Studijski Program");
            InsertIspiti(Student, Predmet);
        until Student.Next() = 0;
    end;

    local procedure InsertIspiti(var Student: Record Student; var Predmet: Record Predmet)
    var
        Ispiti: Record Ispiti;
    begin
        if Predmet.IsEmpty() then
            exit;
        Predmet.FindSet();
        repeat
            Ispiti.Init();
            Ispiti."Broj Indeksa" := Student."Broj Indeksa";
            Ispiti.Studije := Student.Studije;
            Ispiti."Studijski Program ID" := Student."Studijski Program";
            Ispiti.Validate("Predmet ID", Predmet."Predmet ID");
            Ispiti.Validate(Ocena, RandomOcena());
            Ispiti."Broj izlazaka" := RandomBrojIzlazaka();
            Ispiti.Komentar := 'Ocena ' + Format(Ispiti.Ocena) + ', upisao/la ' + Predmet."Naziv Profesora";
            if Ispiti.Insert() then;
        until Predmet.Next() = 0;
    end;

    local procedure RandomOcena(): Integer
    var
        RandOcena: Integer;
    begin
        RandOcena := Random(5) + 5;
        i += 1;
        if (i mod 5) = 0 then
            RandOcena := 5;
        exit(RandOcena);
    end;

    local procedure RandomBrojIzlazaka(): Integer
    begin
        exit(Random(10));
    end;

    var
        i: Integer;

    #endregion

}