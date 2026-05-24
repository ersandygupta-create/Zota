table 80003 "E3 Family"
{
    DataClassification = ToBeClassified;
    Caption = 'Family';
    DrillDownPageId = "E3 Family Lookup";
    LookupPageId = "E3 Family Lookup";

    fields
    {


        field(1; Code; Code[2])
        {
            Caption = 'Family Code';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                IF StrLen("Code") <> 2 then
                    Error('Code should contain 2 character');
            end;

        }
        field(2; Name; Text[60])
        {
            Caption = 'Family Name';
            DataClassification = ToBeClassified;

        }

        field(4; SegmentCode; Code[2])
        {
            Caption = 'Segment Code';
            DataClassification = ToBeClassified;
            TableRelation = "E3 Segment".Code
            ;

        }
    }

    keys
    {
        key(Pk; SegmentCode, Code)
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
            Error('Family Code cannot be modified.');
    end;

}