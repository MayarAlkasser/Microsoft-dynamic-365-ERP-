report 50117  Artikellagerwertliste
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC ;
    RDLCLayout = 'ErweiterungsReport.rdl' ;

    dataset
    {
        dataitem( Artikellagerwertliste ; Item )
        {
            column(Artikelnummer; "No." )
            {
                
            }
             column(Beschreibung; "Description" )
            {
                
            }
             column(Einstandpreis; "Unit Price" )
            {
                
            }
             column(Lagerbestand; "inventory" )
            {
             
               
            }

             trigger  OnAfterGetRecord()

              begin
                      
                Artikellagerwertliste.calcfields(Inventory)
                
              end; 
   
        }
    }

    
    
}