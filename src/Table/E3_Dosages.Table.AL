table 80008 "E3 Dosages"
{
    DataClassification = ToBeClassified;
    Caption = 'Dosages';


    fields
    {

        field(1; Code; Code[2])
        {
            Caption = 'Dosage Code';
            DataClassification = ToBeClassified;

        }
        field(2; Name; Text[60])
        {
            Caption = 'Dosage Name';
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
        fieldgroup(DropDown; Code, Name)
        {
        }

        fieldgroup(EditableList; Code, Name)
        {
        }
    }
    trigger OnRename()
    begin
        if rec.Code <> xRec.Code then
            Error('Dosage Code cannot be modified.');
    end;

}