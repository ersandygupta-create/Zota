table 80004 "E3 Class"
{
    DataClassification = ToBeClassified;
    Caption = 'Class';
    DrillDownPageId = "E3 Class Lookup";
    LookupPageId = "E3 Class Lookup";

    fields
    {
        field(1; Code; Code[2])
        {
            Caption = 'Class Code';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                IF StrLen("Code") <> 2 then
                    Error('Code should contain 2 character');
            end;

        }
        field(2; Name; Text[60])
        {
            Caption = 'Class Name';
            DataClassification = ToBeClassified;

        }

        field(4; SegmentCode; Code[2])
        {
            Caption = 'Segment Code';
            DataClassification = ToBeClassified;
            TableRelation = "E3 Segment".Code
            ;

        }
        field(5; FamilyCode; Code[2])
        {
            Caption = 'Family Code';
            DataClassification = ToBeClassified;
            TableRelation = "E3 Family".Code
            where(
                  SegmentCode = field(SegmentCode));
        }
    }

    keys
    {
        key(Pk; SegmentCode, FamilyCode, Code)
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
            Error('Class Code cannot be modified.');
    end;

}