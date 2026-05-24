table 80009 "E3 Item Staging Master Temp"
{
    DataClassification = ToBeClassified;
    Caption = 'Item Staging Master';
    TableType = Temporary;

    fields
    {
        field(1; "Existing DC"; Code[10])
        {
            Caption = 'Existing DC';
            DataClassification = ToBeClassified;

        }
        field(2; "Division Code"; Code[4])
        {
            Caption = 'Division Code';
            DataClassification = ToBeClassified;
            TableRelation = "E3 Division".Code;

            trigger OnValidate()
            var
                divisionRec: Record "E3 Division";
            begin
                if not divisionRec.Get("Division Code") then
                    Error('Division Code %1 does not exist in E3 Division table.', "Division Code")
                else
                    Rec."Division Name" := divisionRec.Name;
                NumSequenceCode(); // Call productCode procedure to update the Unique Product Code when Division Code is validated
            end;

        }
        field(3; "Division Name"; Text[60])
        {
            Caption = 'Division Name';
            DataClassification = ToBeClassified;

        }
        field(4; "Family Code"; Code[2])
        {
            Caption = 'Family Code';
            DataClassification = ToBeClassified;
            TableRelation = "E3 Family".Code
            where(SegmentCode = field("Segment Code"));

            trigger OnValidate()
            var
                familyRec: Record "E3 Family";
            begin

                if not familyRec.Get("Segment Code", "Family Code") then
                    Error('Family Code %1 does not exist in E3 Family table.', "Family Code")
                else
                    Rec."Family Name" := familyRec.Name;
                NumSequenceCode(); // Call productCode procedure to update the Unique Product Code when Family Code is validated
            end;
        }
        field(5; "Family Name"; Text[60])
        {
            Caption = 'Family Name';
            DataClassification = ToBeClassified;

        }
        field(6; "Segment Code"; Code[2])
        {
            Caption = 'Segment Code';
            DataClassification = ToBeClassified;
            TableRelation = "E3 Segment".Code;
            trigger OnValidate()
            var
                segmentRec: Record "E3 Segment";
            begin

                checkNameDuplicate(Rec."Segment Code", "Product Name");
                if not segmentRec.Get("Segment Code") then
                    Error('Segment Code %1 does not exist in E3 Segment table.', "Segment Code")
                else
                    Rec."Segment Name" := segmentRec.Name;

                NumSequenceCode(); // Call productCode procedure to update the Unique Product Code when Segment Code is validated
            end;

        }
        field(7; "Segment Name"; Text[60])
        {
            Caption = 'Segment Name';
            DataClassification = ToBeClassified;

        }
        field(8; "Class Code"; Code[2])
        {
            Caption = 'Class Code';
            DataClassification = ToBeClassified;
            TableRelation = "E3 Class".Code
            where("SegmentCode" = field("Segment Code"),
                  "FamilyCode" = field("Family Code"));
            trigger OnValidate()
            var
                classRec: Record "E3 Class";
            begin

                if not classRec.Get("Segment Code", "Family Code", "Class Code") then
                    Error('Class Code %1 does not exist in E3 Class table.', "Class Code")
                else
                    Rec."Class Name" := classRec.Name;
                NumSequenceCode(); // Call productCode procedure to update the Unique Product Code when Class Code is validated
            end;


        }
        field(9; "Class Name"; Text[60])
        {
            Caption = 'Class Name';
            DataClassification = ToBeClassified;

        }
        field(10; "Product Name"; Text[250])
        {
            Caption = 'Product Name';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // Items.SetRange("Product Name", "Product Name");
                // if Items.Find('-') then
                //     Error('Item having product name %1 already exists', "Product Name");
            end;

        }
        field(11; "Product Description"; Text[250])
        {
            Caption = 'Generic Name/ Product Details';
            DataClassification = ToBeClassified;
        }
        field(12; "Product"; Code[2])
        {
            Caption = 'Product Description Code';
            DataClassification = ToBeClassified;
            TableRelation = "E3 Product".Code
            where("SegmentCode" = field("Segment Code"),
                  "FamilyCode" = field("Family Code"),
                  "ClassCode" = field("Class Code"));
            trigger OnValidate()
            var
                productRec: Record "E3 Product";
            begin
                if not productRec.Get("Segment Code", "Family Code", "Class Code", "Product") then
                    Error('Product Code %1 does not exist in E3 Product table.', "Product")
                else
                    Rec."Product Code Description" := productRec.Name;
                NumSequenceCode(); // Call productCode procedure to update the Unique Product Code when Product Code is validated
            end;
        }
        field(13; "Product Code Description"; Text[100])
        {
            Caption = 'Product Description';
            DataClassification = ToBeClassified;
        }
        field(14; "Defined Product Code"; Text[100])
        {
            Caption = 'Defined Product Code';
            DataClassification = ToBeClassified;
        }
        field(15; "Unique Product Code"; text[100])
        {
            Caption = 'Unique Product Code';
            DataClassification = ToBeClassified;
        }
        field(16; "New Unique Product Code"; text[18])
        {
            Caption = 'New Unique Product Code';
            DataClassification = ToBeClassified;
        }
        field(17; "New Unique Number Seq"; Code[20])
        {
            Caption = 'New Unique Number Sequence';
            DataClassification = ToBeClassified;
        }
        field(19; "Product Type"; Enum "E3 Product Type")
        {
            Caption = 'Product Type';
            DataClassification = ToBeClassified;
        }
        field(20; "Item Type"; Enum "E3 Item Type")
        {
            Caption = 'Item Type';
            DataClassification = ToBeClassified;
        }
        field(21; UOM; Code[10])
        {
            Caption = 'Unit of Measure';
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure".Code;
        }
        field(22; "Pack Size"; Code[10])
        {
            Caption = 'Pack Size';
            DataClassification = ToBeClassified;
            TableRelation = "E3 Packing Master".Code;
        }
        field(23; "Dosage From"; text[100])
        {
            Caption = 'Dosage Form';
            TableRelation = "E3 Dosages".Code;
            DataClassification = ToBeClassified;
        }
        field(24; HSN; Code[10])
        {
            Caption = 'HSN Code';
            DataClassification = ToBeClassified;
            // tableRelation = hsn
            trigger OnValidate()
            var
                i: Integer;
            begin
                for i := 1 to StrLen(HSN) do begin
                    if not (HSN[i] in ['0' .. '9']) then
                        Error('HSN Code must contain only numeric values.');
                end;
            end;
        }
        field(25; "Unit Cost"; Decimal)
        {
            Caption = 'Unit Cost';
            DataClassification = ToBeClassified;
        }
        field(26; "Expiry & Shelf Life"; Text[100])
        {
            Caption = 'Expiry & Shelf Life';
            DataClassification = ToBeClassified;
        }
        field(27; Batch; Text[20])
        {
            Caption = 'Batch';
            DataClassification = ToBeClassified;
        }
        field(28; "Expiry Date"; Date)
        {
            Caption = 'Expiry Date';
            DataClassification = ToBeClassified;
        }
        field(29; "Costing Method"; Enum "Costing Method")
        {
            Caption = 'Costing Method';
            DataClassification = ToBeClassified;
        }
        field(30; "Description 1"; Text[69])
        {
            Caption = 'Description 1';
            DataClassification = ToBeClassified;
        }
        field(31; "Description 2"; Text[60])
        {
            Caption = 'Description 2';
            DataClassification = ToBeClassified;
        }
        field(32; "Description 3"; Text[60])
        {
            Caption = 'Description 3';
            DataClassification = ToBeClassified;
        }
        field(33; "Description 4"; Text[60])
        {
            Caption = 'Description 4';
            DataClassification = ToBeClassified;
        }
        field(34; "Description 5"; Text[60])
        {
            Caption = 'Description 5';
            DataClassification = ToBeClassified;
        }
        field(35; "Description 6"; Text[60])
        {
            Caption = 'Description 6';
            DataClassification = ToBeClassified;
        }
        field(36; "Item Created"; Boolean)
        {
            Caption = 'Item Created';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(37; "Item Creation Date time"; DateTime)
        {
            Caption = 'Item Creation Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(38; "Item Created By"; Text[100])
        {
            Caption = 'Item Created By';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(39; Rating; text[60])
        {
            Caption = 'Rating';
            DataClassification = ToBeClassified;
        }
        field(40; "Modified by"; Text[100])
        {
            Caption = 'Modified By';
            DataClassification = ToBeClassified;
        }
        field(41; "Modified DateTime"; DateTime)

        {
            Caption = 'Modified DateTime';
            DataClassification = ToBeClassified;
        }
        field(42; "Entry No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = SystemMetadata;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }

        key(ProductName; "Product Name") { }

        key(SegmentProduct; "Segment Code", "Product Name") { }
    }

    var
        isEditable: Boolean;
        Items: Record Item;

    trigger OnInsert()
    begin
        "Item Created By" := UserId;
        "Item Creation Date time" := CurrentDateTime;
    end;

    trigger OnRename()
    begin
        // productCode();
    end;

    trigger OnModify()
    begin
        "Modified by" := UserId;
        "Modified DateTime" := CurrentDateTime;
    end;


    procedure validateMandatoryFields(): Boolean
    begin
        TestField("Family Code");
        TestField("Segment Code");
        TestField("Class Code");
        TestField("Product");
    end;

    procedure checkNameDuplicate(SegmentCode: Code[2]; productName: text[250])
    var
        Segement: Record "E3 Segment";
        ItemStaging: Record "E3 Item Staging Master";
        Item: REcord Item;
    begin
        Segement.Reset();
        Segement.get(SegmentCode);
        if Segement."Restrict Duplicate Name" then begin
            ItemStaging.Reset();
            ItemStaging.SetFilter("New Unique Product Code", '<>%1', '');
            ItemStaging.SetRange("Product Name", productName);
            if ItemStaging.Find('-') then
                Error('Item for segment code %1 can not have same name created already', SegmentCode)
            else begin
                Item.Reset();
                Item.SetRange("Product Name", productName);
                if Item.Find('-') then
                    Error('Item for segment code %1 can not have same name created already in Item Table', SegmentCode)
            end;
        end;


    end;

    procedure CheckNameDuplicateMsg(SegmentCode: Code[2]; ProductName: Text[250]): Boolean
    var
        Segment: Record "E3 Segment";
        ItemStaging: Record "E3 Item Staging Master";
        Item: Record Item;
    begin
        if not Segment.Get(SegmentCode) then
            exit(true); // allow if segment not found

        if Segment."Restrict Duplicate Name" then begin
            ItemStaging.Reset();
            ItemStaging.SetFilter("New Unique Product Code", '<>%1', '');
            ItemStaging.SetRange("Product Name", ProductName);
            if ItemStaging.Find('-') then begin
                exit(false);
            end;
        end else begin
            Item.Reset();
            Item.SetRange("Product Name", ProductName);
            if Item.Find('-') then begin
                exit(false);
            end;
        end;
        exit(true);
    end;

    procedure NumSequenceCode()
    var
        NoSeries: Record "No. Series";
        NoSeriesLine: Record "No. Series Line";
        NoSeriesMgt: Codeunit "No. Series";
        NewNo: Code[20];
        Prefix: Code[10];
        Suffix: Code[10];

    begin
        if ("Segment Code" = '') or
        ("Class Code" = '') or
        ("Family Code" = '') or
        ("Product" = '')
        or ("Division Code" = '') then begin
            "New Unique Number Seq" := '';
            exit;
        end;
        "New Unique Number Seq" :=
            "Segment Code" +
            "Family Code" +
            "Class Code" +
            "Product" + '-' //+
                            //"Division Code"
            ;
        Clear(NoSeries);
        if "New Unique Number Seq" <> '' then begin
            if not NoSeries.Get("New Unique Number Seq") then begin

                NoSeries.Init();
                NoSeries.Code := "New Unique Number Seq";
                NoSeries.Description := "New Unique Number Seq";
                NoSeries.Insert();

                NoSeriesLine.Init();
                NoSeriesLine."Series Code" := "New Unique Number Seq";
                NoSeriesLine."Line No." := 10000;
                NoSeriesLine."Starting No." := "New Unique Number Seq" + '-0001';
                NoSeriesLine."Ending No." := "New Unique Number Seq" + '-99999';
                NoSeriesLine."Increment-by No." := 1;
                NoSeriesLine.Open := true;
                NoSeriesLine.Insert();
            end;
        end;
        NewNo := NoSeriesMgt.GetNextNo("New Unique Number Seq", WorkDate(), true);
        Prefix := CopyStr(NewNo, 1, StrPos(NewNo, '-') - 1);
        Suffix := CopyStr(NewNo, StrPos(NewNo, '-') + 1);
        Rec."New Unique Product Code" := Prefix + '-' + "Division Code" + Suffix;
    end;


}