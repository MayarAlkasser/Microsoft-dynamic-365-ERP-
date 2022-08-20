xmlport 50111 ExportFahrt
{
    Format = Xml ;
    Direction = Export ;
    schema
    {
        textelement(Fahrten)
        {
            tableelement(Fahrt; Fahrt)
            {
                fieldelement ( Fahrer ; Fahrt.Fahrer)
                {

                }
                 fieldelement ( Fahrzeug ; Fahrt.Fahrzeug)
                 {


                 }
                 fieldelement ( Nummer ; Fahrt.Nummer)
                 {


                 }
                 fieldelement ( Fahrtbeginn ; Fahrt.Fahrtbeginn)
                 {


                 }
                 fieldelement ( Fahrtende ; Fahrt.Fahrtende)
                 {


                 }
                 fieldelement ( ZweckderFahrt ; Fahrt."Zweck der Fahrt")
                 {


                 }
                 fieldelement ( KMFahrtbeginn ; Fahrt."KM Fahrtbeginn")
                 {


                 }
                 fieldelement ( KMFahrtende ; Fahrt."KM Fahrtende")
                 {


                 }
                 fieldelement ( GefahreneKM; Fahrt."Gefahrene KM")
                 {


                 }
                 
            }
            
        }
    }
    
   
    
        
    
    var
        myInt: Integer;

}