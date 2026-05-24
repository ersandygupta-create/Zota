table 80007 "E3 Packing Master"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Code; Code[2])
        {
            Caption = 'Packing Code';
            DataClassification = ToBeClassified;
        }
        field(2; Name; Text[60])
        {
            Caption = 'Packing Name';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
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
        if rec.Code <> xRec.Code then
            Error('Packing Code cannot be modified.');
    end;

}