page 50110 "Fahrt List Factbox"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Fahrt;
    Editable = false;
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field("Fahrtbeginn"; "Fahrtbeginn")
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

            }
        }
    }

  

    var
        myInt: Integer;
}