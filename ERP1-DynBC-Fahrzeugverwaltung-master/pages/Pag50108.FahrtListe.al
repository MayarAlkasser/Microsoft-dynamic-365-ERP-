page 50108 "Fahrt Liste"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Fahrt;
      Editable = false ;
      CardPageId = Fahrt ;
      SourceTableView =sorting(Fahrtbeginn ) order (ascending) ;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Fahrer"; "Fahrer")
                {
                    ApplicationArea = All;

                }
                field("Nummer"; "Nummer")
                {
                    ApplicationArea = All;

                }
                field("Fahrzeug"; "Fahrzeug")
                {
                    ApplicationArea = All;

                }
                field("Fahrtbeginn"; "Fahrtbeginn")
                {
                    ApplicationArea = All;


                }
                field("Fahrtende"; "Fahrtende")
                {
                    ApplicationArea = All;


                }
                field("Zweck der Fahrt"; "Zweck der Fahrt")
                {
                    ApplicationArea = All;


                }
                field("Gefahrene KM"; "Gefahrene KM")
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
            RunObject = page "Fahrt" ;
            RunPageLink = Nummer = field ( Nummer) ;
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