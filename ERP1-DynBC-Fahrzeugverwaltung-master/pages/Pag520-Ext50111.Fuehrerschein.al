pageextension 50111 ExtEmployee extends "Employee Card"
{
    layout
    {
        addafter ("Company E-mail")

         {
         field("Führerschein"; "Führerschein" )
                {
                    ApplicationArea = All;

                }
        }
    }
    
    actions
    {
        addlast(Processing)
        {
            action("SummeFahrleistung"){
              ApplicationArea = All;
              trigger OnAction()
              var
              GesamtKM :Decimal ;
              Fahrten : Record Fahrt ;
              begin
                 Fahrten.Reset();
                 Fahrten.SetRange(Fahrer,"No.");
                 Fahrten.FindFirst();
                 repeat
                 GesamtKM := GesamtKM + Fahrten."Gefahrene KM" ;
                  until Fahrten.Next = 0 ;
                  Message('Gesamte KM : %1', GesamtKM);
                      
              end;


            }

        }
    }
    
    var
        myInt: Integer;
}