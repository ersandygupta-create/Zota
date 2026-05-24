table 80006 "E3 Product"
{
    DataClassification = ToBeClassified;
    Caption = 'Product';
    DrillDownPageId = "E3 Product Lookup";
    LookupPageId = "E3 Product Lookup";

    fields
    {
        field(1; Code; Code[2])
        {
            Caption = 'Product Code';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                IF StrLen("Code") <> 2 then
                    Error('Code should contain 2 character');
            end;

        }
        field(2; Name; Text[60])
        {
            Caption = 'Product Description';
            DataClassification = ToBeClassified;

        }

        field(4; SegmentCode; Code[20])
        {
            Caption = 'Segment Code';
            DataClassification = ToBeClassified;
            TableRelation = "E3 Segment".Code;

        }
        field(5; FamilyCode; Code[20])
        {
            Caption = 'Family Code';
            DataClassification = ToBeClassified;
            TableRelation = "E3 Family".Code
            where(
                  SegmentCode = field(SegmentCode));

        }
        field(6; ClassCode; Code[20])
        {
            Caption = 'Class Code';
            DataClassification = ToBeClassified;
            TableRelation = "E3 Class".Code
            where(
                  SegmentCode = field(SegmentCode),
                  FamilyCode = field(FamilyCode));

        }
    }


    keys
    {
        key(Pk; SegmentCode, FamilyCode, ClassCode, Code)
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
            Error('Product Code cannot be modified.');
    end;

}