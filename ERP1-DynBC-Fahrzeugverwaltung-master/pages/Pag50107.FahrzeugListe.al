page 50107 "Fahrzeug Liste"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Fahrzeug;
      Editable = false ;
    layout
    {
        area(Content)
        {
            repeater(GroupName)
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
                field("Kilometerstand"; "Kilometerstand")
                {
                    ApplicationArea = All;


                }
            }
        }
          area( FactBoxes) {

             part(Fahrtlistfactbox ; "Fahrt List Factbox")
             { 
          SubPageView = sorting(Fahrtbeginn) order(descending) ;

            SubPageLink = Fahrzeug = field( Kennzeichen );
              }

        }
    }

    actions
    {
       
        area(Processing)
        {
            action(Karte)
            {

            ApplicationArea = All;
            RunObject = page Fahrzeug ;
            RunPageLink = Kennzeichen = field ( Kennzeichen) ;
            Promoted = true ;
            PromotedCategory = Process ;
            PromotedIsBig = true ;
            Image = AnalysisView ;

               trigger OnAction() ;
                begin

                end;
            }
        }
        
    }

    var
        myInt: Integer;
}