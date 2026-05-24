table 80001 "E3 Division"
{
    DataClassification = ToBeClassified;
    Caption = 'Division';

    fields
    {
        field(1; Code; Code[4])
        {
            Caption = 'Division Code';
            DataClassification = ToBeClassified;

        }
        field(2; Name; Text[60])
        {
            Caption = 'Division Name';
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Pk; Code)
        {
            Clustered = true;
        }
    }



    fieldgroups
    {
        fieldgroup(Dropdown; Code, Name)
        {
        }

        fieldgroup(EditableList; Code, Name)
        {
        }
    }
    trigger OnRename()
    begin
        if rec.Code <> xRec.Code then
            Error('Division Code cannot be modified.');
    end;

}