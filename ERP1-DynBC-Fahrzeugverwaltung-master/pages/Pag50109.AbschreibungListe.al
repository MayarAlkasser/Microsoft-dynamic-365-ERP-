page 50109 "Abschreibung Liste"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Abschreibung;
      Editable = false ;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Fahrzeug"; "Fahrzeug")
                {
                    ApplicationArea = All;

                }
                field("Jahr"; "Jahr")
                {
                    ApplicationArea = All;

                }
                field("Abschreibungssatz"; "Abschreibungssatz")
                {
                    ApplicationArea = All;

                }
                field("Abschreibungsbetrag"; "Abschreibungsbetrag")
                {
                    ApplicationArea = All;


                }
                field("Restbuchwert"; "Restbuchwert")
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
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}