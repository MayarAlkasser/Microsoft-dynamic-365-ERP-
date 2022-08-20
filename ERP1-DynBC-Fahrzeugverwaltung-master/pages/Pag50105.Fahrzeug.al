page 50105 Fahrzeug
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Fahrzeug;

    layout
    {
        area(Content)
        {
            group(Allgemein)
            {
                field("Kennzeichen"; "Kennzeichen")
                {
                    ApplicationArea = All;

                }
                field("Typ"; "Typ")
                {
                    ApplicationArea = All;

                }
                field("Hersteller"; "Hersteller")
                {
                    ApplicationArea = All;

                }
                field("Modell"; "Modell")
                {
                    ApplicationArea = All;


                }
                field("Kraftstoff"; "Kraftstoff")
                {
                    ApplicationArea = All;


                }
                field("Kilometerstand"; "Kilometerstand")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Fahrt Liste" ;
                     Editable = false ;

                }
                field("Anhängerkupplung"; "Anhängerkupplung")
                {
                    ApplicationArea = All;


                }
            }
            group(Abschreibung)
            {
                field("Kaufpreis"; "Kaufpreis")
                {
                    ApplicationArea = All;


                }
                field("Kaufdatum"; "Kaufdatum")
                {
                    ApplicationArea = All;


                }
                 field("Afa-Methode"; "Afa-Methode")
                {
                    ApplicationArea = All;


                }
                field("Restbuchwert"; "Restbuchwert")
                {
                    ApplicationArea = All;
                   DrillDownPageId = "Abschreibung Liste" ;
                     Editable = false ;
                }
            }
        }
         area(Factboxes){

       part(Fahrtlistfactbox ; "Fahrt List Factbox"){

             SubPageView = sorting(Fahrtbeginn) order(descending) ;
            
               SubPageLink =  Fahrzeug = field(Kennzeichen) ;
       }
       }
      
    }

    actions
    {
        area(Processing)
        {
            action("Import Fahrzeug")
            {
                Promoted = true ;
               PromotedCategory = New;

                trigger OnAction()
                begin
                    
                Xmlport.Run(50112,false,true);

                end;
         
            }
            action("Restbuchwert berechnen")
            {
                Promoted = true ;
               PromotedCategory = Process;
               PromotedIsBig = true ;
               Image = CachReceipJournal;

                trigger OnAction()
                begin
                    
                case  "Afa-Methode" of
                   "Afa-Methode" :: linear :
                   AFA.linear (Kennzeichen);
                       "Afa-Methode" :: degressiv :
                   AFA.degressiv (Kennzeichen);
                       "Afa-Methode" :: kombiniert :
                   AFA.kombiniert (Kennzeichen);
                      "Afa-Methode" :: leistungsabh :
                   AFA."Leistungsabhängig" (Kennzeichen);
                end;
                end;
            }
        }
    }
    
  

    var
    "Afa-Methode": Option linear,degressiv,kombiniert,leistungsabh ;
    "Afa" : Codeunit Afa ;
        myInt: Integer;
}