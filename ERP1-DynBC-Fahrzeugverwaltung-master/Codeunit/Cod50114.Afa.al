codeunit 50114 Afa
{
    trigger OnRun()
    begin
        
    end;
    
    var
       KFZ : Record Fahrzeug ;
       Nutzungsdaur : Integer ;
       Kaufjahr : Integer ;
       "Aktuelles Jahr" : Integer ;
        Jahr: Integer;

         procedure Initialisierung(Kennzeichen : Code[20])
        var
           
        begin
            KFZ.Get(Kennzeichen);

            case  KFZ.typ of
            KFZ.typ :: Kombi :
                        Nutzungsdaur :=6 ;
            KFZ.typ ::Transporter :
                        Nutzungsdaur :=6 ;
             KFZ.typ ::LKW :
                        Nutzungsdaur :=9 ;

        end;
        "Aktuelles Jahr" := Date2DMY(WorkDate,3) ;
        Kaufjahr := Date2DMY( KFZ.Kaufdatum , 3) ;
        Jahr := Kaufjahr ;
        end;
           procedure Linear(Kennzeichen : Code[20])
        var
           Abschreibung : Decimal ;
        Abschreibungssatz : Decimal ;
        Restbuchwert : Decimal ;
        begin
            Initialisierung(Kennzeichen);
            Restbuchwert := KFZ.Kaufpreis ;
            Abschreibung :=  KFZ.Kaufpreis / Nutzungsdaur ;
            Abschreibungssatz := 100 /Nutzungsdaur ;
            while (Jahr < "Aktuelles Jahr" ) And  (Jahr < (Kaufjahr + Nutzungsdaur ) ) do begin
               Restbuchwert :=  Restbuchwert - Abschreibung ;
               Speicherung(Kennzeichen, Jahr, Abschreibungssatz, Abschreibung,Restbuchwert);
               Jahr := Jahr + 1 ;
              end;
        end;
           procedure Degressiv(Kennzeichen : Code[20])
        var
          Abschreibung : Decimal ;
        Abschreibungssatz : Decimal ;
        Restbuchwert : Decimal ;
        begin
            Initialisierung(Kennzeichen);
            Restbuchwert := KFZ.Kaufpreis ;
            Abschreibung :=  KFZ.Kaufpreis / Nutzungsdaur ;
            Abschreibungssatz := 100 /Nutzungsdaur ;
            while (Jahr < "Aktuelles Jahr" ) And  (Jahr < (Kaufjahr + Nutzungsdaur ) ) do begin
                Abschreibung := Restbuchwert * (0.25) ;
               Restbuchwert :=  Restbuchwert - Abschreibung ;
               Speicherung(Kennzeichen, Jahr, Abschreibungssatz, Abschreibung,Restbuchwert);
               Jahr := Jahr + 1 ;
              end;
        end;
           procedure Kombiniert(Kennzeichen : Code[20])
        var
           Abschreibung : Decimal;
           Restnutzungsdauer : Integer ;
           Einmal : Integer ;
             Restbuchwert :Decimal ;
            Abschreibungssatz :Decimal ;
        begin
            while (Jahr < "Aktuelles Jahr" ) And  (Jahr < (Kaufjahr + Nutzungsdaur ) ) do begin
               Restnutzungsdauer :=  (Kaufjahr - Nutzungsdaur ) - Jahr ;
         if(Restbuchwert * (0.25)) > (  Restbuchwert / Restnutzungsdauer) then begin
                  Abschreibungssatz := 25 ;
             Abschreibung := Restbuchwert * Abschreibungssatz / 100 ;
             Restbuchwert :=  Restbuchwert - Abschreibung ;
             end else begin  
                 if  Einmal = 0 then begin
                    Abschreibung := Restbuchwert / Restnutzungsdauer;
                    Einmal := 1 ;
                 end;
         Abschreibungssatz :=  100 / Restbuchwert * Abschreibung ; 
         Restbuchwert := Restbuchwert - Abschreibung ;
                 end;

               Speicherung(Kennzeichen, Jahr, Abschreibungssatz, Abschreibung,Restbuchwert);
               Jahr := Jahr + 1 ;
              end;
        end;
             procedure Leistungsabhängig(Kennzeichen : Code[20])
        var
           Restbuchwert : Decimal ;
           KMGesamt : Decimal ;
           FahrtenKFZ :  Record Fahrt ;
             FahrtbeginnDatum :  Date ;
           FahrtbeginnJahr :  Integer ;
             KMproJahr : array [3000]  of Decimal;
            Abschreibungssatz :  Decimal ;
            Abschreibung : Decimal ;

        begin
            Initialisierung( Kennzeichen);
            case KFZ.Typ of
            KFZ.Typ :: Transporter :
            KMGesamt := 10000 ;
            else
              Error( 'Method nur für Fahrzeugtyp Transport zulässig');
            end;
               Restbuchwert :=   KFZ.Kaufpreis;
               FahrtenKFZ.SetRange(Fahrzeug,Kennzeichen);
               if FahrtenKFZ.Find('-') then
               repeat

               FahrtbeginnDatum := DT2Date(FahrtenKFZ.Fahrtbeginn);
               FahrtbeginnJahr := Date2DMY(FahrtbeginnDatum,3);
               if(FahrtbeginnJahr < "Aktuelles Jahr" ) AND (FahrtbeginnJahr < (Kaufjahr + Nutzungsdaur)) then
               for Jahr := Kaufjahr to ( "Aktuelles Jahr" - 1) do 
               if Jahr = FahrtbeginnJahr then 
               KMproJahr[Jahr] := KMproJahr[Jahr] + FahrtenKFZ."Gefahrene KM" ;
               until FahrtenKFZ.Next = 0 ;
               Jahr := Kaufjahr ;
               while ( Jahr < "Aktuelles Jahr" ) AND (Jahr < (Kaufjahr + Nutzungsdaur)) do begin
                 Abschreibungssatz:= KMproJahr[Jahr] / KMGesamt*100 ;
                 Abschreibung := kFZ.Kaufpreis * Abschreibungssatz/ 100 ;
                 Restbuchwert := Restbuchwert -Abschreibung ;

                Speicherung(Kennzeichen, Jahr, Abschreibungssatz, Abschreibung,Restbuchwert);
               Jahr := Jahr + 1 ;
               end;
            end;
           procedure Speicherung(Kennzeichen : Code[20] ; Jahr : Integer ; Abschreibungssatz : Decimal ;Abschreibungsbetrag : Decimal ; Restbuchwert :Decimal)
        var
            Abschreibung : Record Abschreibung ;
        begin
            begin
                if Abschreibung.Get(Kennzeichen,Jahr) then begin
                    Abschreibung.Abschreibungssatz := Abschreibungssatz ;
                    Abschreibung.Abschreibungsbetrag := Abschreibungsbetrag ;
                    Abschreibung.Restbuchwert := Restbuchwert ;
                    Abschreibung.Modify;
                    end else begin 
                        Abschreibung.Fahrzeug :=  Kennzeichen ;
                        Abschreibung.Jahr := Jahr;
                        Abschreibung.Abschreibungssatz :=  Abschreibungssatz ;
                        Abschreibung.Abschreibungsbetrag := Abschreibungsbetrag ;
                        Abschreibung.Restbuchwert  := Restbuchwert ;
                        Abschreibung.Insert  ;

            end;
        end;
      end;
      
      
      }