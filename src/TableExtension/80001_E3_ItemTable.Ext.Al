tableextension 80001 "E3 Items" extends Item
{
    fields
    {
        field(50001; "Existing DC"; Code[10])
        {
            Caption = 'Existing DC';
            DataClassification = ToBeClassified;

        }
        field(50002; "Division Code"; Code[4])
        {
            Caption = 'Division Code';
            DataClassification = ToBeClassified;
            TableRelation = "E3 Division".Code;

        }
        field(50003; "Division Name"; Text[60])
        {
            Caption = 'Division Name';
            DataClassification = ToBeClassified;

        }
        field(50004; "Family Code"; Code[2])
        {
            Caption = 'Family Code';
            DataClassification = ToBeClassified;
            TableRelation = "E3 Family".Code
            where(SegmentCode = field("Segment Code"));

        }
        field(50005; "Family Name"; Text[60])
        {
            Caption = 'Family Name';
            DataClassification = ToBeClassified;

        }
        field(50006; "Segment Code"; Code[2])
        {
            Caption = 'Segment Code';
            DataClassification = ToBeClassified;
            TableRelation = "E3 Segment".Code;

        }
        field(50007; "Segment Name"; Text[60])
        {
            Caption = 'Segment Name';
            DataClassification = ToBeClassified;

        }
        field(50008; "Class Code"; Code[2])
        {
            Caption = 'Class Code';
            DataClassification = ToBeClassified;
            TableRelation = "E3 Class".Code
            where("SegmentCode" = field("Segment Code"),
                  "FamilyCode" = field("Family Code"));
        }
        field(50009; "Class Name"; Text[60])
        {
            Caption = 'Class Name';
            DataClassification = ToBeClassified;

        }
        field(50010; "Product Name"; Text[250])
        {
            Caption = 'Product Name';
            DataClassification = ToBeClassified;
        }
        field(50011; "Product Description"; Text[250])
        {
            Caption = 'Generic Name/ Product Details';
            DataClassification = ToBeClassified;
        }
        field(50012; "Product"; Code[2])
        {
            Caption = 'Product Description Code';
            DataClassification = ToBeClassified;
            TableRelation = "E3 Product".Code
            where("SegmentCode" = field("Segment Code"),
                  "FamilyCode" = field("Family Code"),
                  "ClassCode" = field("Class Code"));
        }
        field(50013; "Product Code Description"; Text[100])
        {
            Caption = 'Product Description';
            DataClassification = ToBeClassified;
        }
        field(50014; "Product Type"; Enum "E3 Product Type")
        {
            Caption = 'Product Type';
            DataClassification = ToBeClassified;
        }
        field(50015; "Item Type"; Enum "E3 Item Type")
        {
            Caption = 'Item Type';
            DataClassification = ToBeClassified;
        }
        field(50016; UOM; Code[10])
        {
            Caption = 'Unit of Measure';
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure".Code;
        }
        field(50017; "Pack Size"; Code[10])
        {
            Caption = 'Pack Size';
            DataClassification = ToBeClassified;
            TableRelation = "E3 Packing Master".Code;
        }
        field(50018; "Dosage From"; text[100])
        {
            Caption = 'Dosage Form';
            TableRelation = "E3 Dosages".Code;
            DataClassification = ToBeClassified;
        }
        field(50019; HSN; Code[10])
        {
            Caption = 'HSN Code';
            DataClassification = ToBeClassified;
            // tableRelation = hsn
        }

        field(50020; "Expiry & Shelf Life"; Text[100])
        {
            Caption = 'Expiry & Shelf Life';
            DataClassification = ToBeClassified;
        }
        field(50021; Batch; Text[20])
        {
            Caption = 'Batch';
            DataClassification = ToBeClassified;
        }
        field(50022; "Expiry Date"; Date)
        {
            Caption = 'Expiry Date';
            DataClassification = ToBeClassified;
        }
        field(50023; "Description 1"; Text[69])
        {
            Caption = 'Description 1';
            DataClassification = ToBeClassified;
        }
        field(50024; "Description 2 MDM"; Text[60])
        {
            Caption = 'Description 2';
            DataClassification = ToBeClassified;
        }
        field(50025; "Description 3"; Text[60])
        {
            Caption = 'Description 3';
            DataClassification = ToBeClassified;
        }
        field(50026; "Description 4"; Text[60])
        {
            Caption = 'Description 4';
            DataClassification = ToBeClassified;
        }
        field(50027; "Description 5"; Text[60])
        {
            Caption = 'Description 5';
            DataClassification = ToBeClassified;
        }
        field(50028; "Description 6"; Text[60])
        {
            Caption = 'Description 6';
            DataClassification = ToBeClassified;
        }
        field(50029; Rating; text[60])
        {
            Caption = 'Rating';
            DataClassification = ToBeClassified;
        }
        field(50030; "UOM Description"; Text[50])
        {
            Caption = 'UOM Description';
            DataClassification = ToBeClassified;
        }
    }


}