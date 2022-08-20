table 50102 Fahrt
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Fahrer; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No." where("Führerschein" = filter(PKW | LKW));
           // trigger OnValidate()
           // var
           // Employee : Record Employee ;
           // begin
           //       if Employee.get(Fahrer)
           //       then Validate("Führerschein" ,  Employee."Führerschein" ) 
           //          else Validate("Führerschein" ,  "Führerschein" ::keinen )   ;
           // end;
        }
        field(2; Nummer; Integer)
        {
            DataClassification = ToBeClassified;
             AutoIncrement = true ;
        }
        field(3; Fahrzeug; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Fahrzeug.Kennzeichen ;
        }
        field(4; Fahrtbeginn; DateTime)
        {
            DataClassification = ToBeClassified;

        }
        field(5; Fahrtende; DateTime)
        {
            DataClassification = ToBeClassified;

        }
        field(6; "Zweck der Fahrt";
        Text[30])
        {
            DataClassification = ToBeClassified;

        }
        field(7; "KM Fahrtbeginn"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 1 : 1;
        }
        field(8; "KM Fahrtende"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 1 : 1;
        }
        field(9; "Gefahrene KM"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 1 : 1;
        }
        field(10; Führerschein; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "keinen","PKW","LKW";
            TableRelation = IF (Führerschein = CONST(PKW)) Fahrzeug.Kennzeichen WHERE
            (Typ = FILTER(Kombi | Transporter)) ELSE
            Fahrzeug.Kennzeichen;
        }
        field(11; Hersteller; Text[30])
        {   
             FieldClass = FlowField ;
           CalcFormula = lookup( Fahrzeug.Hersteller where(Kennzeichen = field(Fahrzeug))) ;
             Editable = false ;
        }
        field(12; Modell; Text[30])
        {   
              FieldClass = FlowField ;
        CalcFormula = lookup( Fahrzeug.Modell where(Kennzeichen = field(Fahrzeug))) ;
             Editable = false ;
        }

    }

    keys
    {
        key(PK; Fahrer, Nummer)
        {
            Clustered = true;
            SumIndexFields = "Gefahrene KM";
        }
        key(SK; Fahrtbeginn)
        {

        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}