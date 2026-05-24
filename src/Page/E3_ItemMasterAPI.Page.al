page 80000 "E3 Item Master API"
{
    APIGroup = 'apiMindCurve';
    APIPublisher = 'mindcurve';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'e3ItemMasterAPI';
    DelayedInsert = true;
    EntityName = 'e3itemmaster';
    EntitySetName = 'e3itemmasters';
    PageType = API;
    SourceTable = Item;
    ODataKeyFields = SystemId;
    Extensible = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(no; Rec."No.")
                {
                    Caption = 'Item Number';
                }
                field(existingDC; Rec."Existing DC")
                {
                    Caption = 'Existing DC';
                }
                field(divisionCode; Rec."Division Code")
                {
                    Caption = 'Division Code';
                }
                field(divisionName; Rec."Division Name")
                {
                    Caption = 'Division Name';
                }
                field(productName; Rec."Product Name")
                {
                    Caption = 'Product Name';
                }
                field(productDescription; Rec."Product Description")
                {
                    Caption = 'Product Description';
                }
                field(segmentName; Rec."Segment Name")
                {
                    Caption = 'Segment Name';
                }

                field(familyName; Rec."Family Name")
                {
                    Caption = 'Family Name';
                }
                field(familyCode; Rec."Family Code")
                {
                    Caption = 'Family Code';
                }
                field(className; Rec."Class Name")
                {
                    Caption = 'Class Name';
                }
                field(classCode; Rec."Class Code")
                {
                    Caption = 'Class Code';
                }
                field(productType; Rec."Product Type")
                {
                    Caption = 'Product Type';
                }
                field(itemType; Rec."Item Type")
                {
                    Caption = 'Item Type';
                }
                field(uom; Rec."Base Unit of Measure")
                {
                    Caption = 'Base Unit of Measure';
                }
                field(packSize; Rec."Pack Size")
                {
                    Caption = 'Pack Size';
                }
                field(dosageFrom; Rec."Dosage From")
                {
                    Caption = 'Dosage From';
                }
                field(hsn; Rec.HSN)
                {
                    Caption = 'HSN';
                }
                field(unitCost; Rec."Unit Cost")
                {
                    Caption = 'Unit Cost';
                }
                field(expiryShelfLife; Rec."Expiry & Shelf Life")
                {
                    Caption = 'Expiry & Shelf Life';
                }
                field(batch; Rec.Batch)
                {
                    Caption = 'Batch';
                }
                field(expiryDate; Rec."Expiry Date")
                {
                    Caption = 'Expiry Date';
                }
                field(costingMethod; Rec."Costing Method")
                {
                    Caption = 'Costing Method';
                }
                field(description1; Rec."Description 1")
                {
                    Caption = 'Description 1';
                }
                field(description2; Rec."Description 2")
                {
                    Caption = 'Description 2';
                }
                field(description3; Rec."Description 3")
                {
                    Caption = 'Description 3';
                }
                field(description4; Rec."Description 4")
                {
                    Caption = 'Description 4';
                }
                field(description5; Rec."Description 5")
                {
                    Caption = 'Description 5';
                }
                field(description6; Rec."Description 6")
                {
                    Caption = 'Description 6';
                }
                field(rating; Rec.Rating)
                {
                    Caption = 'Rating';
                }
                field(UOMDESCRIPTION; Rec."UOM Description")
                {
                    Caption = 'UOM Description';
                }
            }
        }
    }

    local procedure DuplicateCheck()
    var
        Items: Record Item;
    begin
        Items.SetRange("No.", Rec."No.");
        if not Items.IsEmpty then
            error('Duplicate Entry');
    end;
}
