table 80002 "E3 Segment"
{
    DataClassification = ToBeClassified;
    Caption = 'Segment';
    LookupPageId = "E3 Segment Lookup";
    DrillDownPageId = "E3 Segment Lookup";

    fields
    {

        field(1; Code; Code[2])
        {
            Caption = 'Segment Code';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                IF StrLen("Code") <> 2 then
                    Error('Code should contain 2 character');
            end;

        }
        field(2; Name; Text[60])
        {
            Caption = 'Segment Name';
            DataClassification = ToBeClassified;

        }
        field(3; "Restrict Duplicate Name"; Boolean)
        {
            Caption = 'Restrict Duplicate Name';
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
            Error('Segment Code cannot be modified.');
    end;

}