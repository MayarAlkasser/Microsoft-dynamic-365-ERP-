report 50116 Fahrtenliste
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'RDLFahrtenliste.rdl';

    dataset
    {
        dataitem(Fahrzeug; Fahrzeug)
        {
            column(Kennzeichen; "Kennzeichen")
            {

            }
            column(Typ; "Typ")
            {

            }
            column(Hersteller; "Hersteller")
            {

            }
            column(Modell; "Modell")
            {

            }
            column(Kaufpreis_; "Kaufpreis")
            {

            }
            column(Kraftstoff; "Kraftstoff")
            {

            }
            column(Kilometerstand; "Kilometerstand")
            {

            }
            column(Anhängerkupplung; "Anhängerkupplung")
            {

            }
            column(Kaufdatum; "Kaufdatum")
            {

            }
            column(Restbuchwert; "Restbuchwert")
            {

            }

        
        dataitem(Fahrt; Fahrt)
        {
            DataItemLinkReference = Fahrzeug;
            DataItemLink = Fahrzeug = field(Kennzeichen);
            column(Fahrer; "Fahrer")
            {

            }
            column(Nummer; "Nummer")
            {

            }
            column(KFZ; "Fahrzeug")
            {

            }
            column(Fahrtbeginn; "Fahrtbeginn")
            {

            }
            column(Fahrtende; "Fahrtende")
            {

            }
            column(Zweck_der_Fahrt; "Zweck der Fahrt")
            {

            }
            column(KM_Fahrtbeginn; "KM Fahrtbeginn")
            {

            }
            column(KM_Fahrtende; "KM Fahrtende")
            {

            }
            column(Gefahrene_KM; "Gefahrene KM")
            {

            }
            column(Führerschein; "Führerschein")
            {

            }

        
        dataitem(Employee; Employee)
        {
            DataItemLinkReference = Fahrt;
            DataItemLink = "No." = field(Fahrer);

            column(First_Name; "First Name")
            {

            }
            column(Last_Name; "Last Name")
            {

            
        }

        }
        }
        }
    }
}