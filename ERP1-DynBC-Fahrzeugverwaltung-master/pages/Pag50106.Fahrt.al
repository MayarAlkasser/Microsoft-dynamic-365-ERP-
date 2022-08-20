page 50106 Fahrt
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Fahrt;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Fahrer"; "Fahrer")
                {
                    
                    ApplicationArea = All;

                     trigger OnValidate()
                  var
                      Employee : Record Employee ;
                  begin
                      Employee.Get(Fahrer);
                      "Führerschein" := Employee."Führerschein" ;
                  end;

                }
                field("Nummer"; "Nummer")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Fahrzeug"; "Fahrzeug")
                {
                     ApplicationArea = All;

                  trigger OnValidate()
                  var
                      KFZ : Record Fahrzeug ;
                  begin
                      KFZ.Get(Fahrzeug) ;
                      KFZ.CalcFields(Kilometerstand) ;
                      "KM Fahrtbeginn" := KFZ.Kilometerstand ;
                  end;
                   

                }
                field("Fahrtbeginn"; "Fahrtbeginn")
                {
                    ApplicationArea = All;

                 trigger OnValidate()
                  var
                      FahrtenKFZ : Record Fahrt ;
                  begin
                      
                  end;

                }
                field("Fahrtende"; "Fahrtende")
                {
                    ApplicationArea = All;
                     trigger OnValidate()
                 var
                     myInt: Integer;
                 begin
                     if Fahrtbeginn > Fahrtende then
        
                     Error('das Fahrtende liegt vor dem Fahrtbeginn !');
                 end;

                }
                field("Zweck der Fahrt"; "Zweck der Fahrt")
                {
                    ApplicationArea = All;


                }
                field("KM Fahrtbeginn"; "KM Fahrtbeginn")
                {
                    ApplicationArea = All;
                   trigger OnValidate()
                 var
                     FahrtenKFZ: Record Fahrt;
                 begin
                     FahrtenKFZ.SetRange(Fahrzeug ,Fahrzeug);
                     if FahrtenKFZ.Find('-')  then
                     repeat
                     if Fahrtbeginn = FahrtenKFZ.Fahrtbeginn
                      then  Error('Die Fahrt wurde schon erfasst!');
                      until FahrtenKFZ.Next() = 0 ;
                 end;

                }
                field("KM Fahrtende"; "KM Fahrtende")
                {
                    ApplicationArea = All;
                 trigger OnValidate()
                 var
                     myInt: Integer;
                 begin
                     if "KM Fahrtende" > "KM Fahrtbeginn" then
                     "Gefahrene KM" := "KM Fahrtende" - "KM Fahrtbeginn"
                     else 
                     Error('Ungültige Eingabe');
                 end;

                }
                field("Gefahrene KM"; "Gefahrene KM")
                {
                    ApplicationArea = All;
                    Editable = false;

                }
               

            }
        }
       
    }
     

    actions
    {
        area(Processing)
        {
            action("Exportieren als XML")
            {
               Promoted = true ;
               PromotedCategory = New ;

                trigger OnAction()
                begin
                    Xmlport.Run(50111,false,false);
                end;
            }
        }
    }

    var
        myInt: Integer;
}