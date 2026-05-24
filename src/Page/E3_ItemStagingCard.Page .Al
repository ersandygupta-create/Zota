page 80007 "E3 Item Staging Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "E3 Item Staging Master";
    Caption = 'Item Staging Card';

    layout
    {

        area(Content)
        {

            group(GroupName)
            {
                Caption = 'Item Details';
                field("Existing DC"; Rec."Existing DC")
                {

                }

                field("Product Name"; Rec."Product Name")
                {
                    ShowMandatory = true;
                }
                field("Product Description"; Rec."Product Description")
                {

                }

                field("Segment Code"; Rec."Segment Code")
                {
                    ShowMandatory = true;
                    Editable = isEditable;
                    trigger OnValidate()
                    begin
                        CurrPage.Update(); // Refresh page to reflect changes based on Segment Code
                    end;
                }
                field("Segment Name"; Rec."Segment Name")
                {
                    Editable = isEditable;
                }

                field("Family Code"; Rec."Family Code")
                {
                    ShowMandatory = true;
                    Editable = isEditable;
                    trigger OnValidate()
                    begin
                        CurrPage.Update(); // Refresh page to reflect changes based on Family Code
                    end;
                }
                field("Family Name"; Rec."Family Name")
                {
                    Editable = isEditable;
                }

                field("Class Code"; Rec."Class Code")
                {
                    ShowMandatory = true;
                    Editable = isEditable;
                    trigger OnValidate()
                    begin
                        CurrPage.Update(); // Refresh page to reflect changes based on Class Code
                    end;
                }
                field("Class Name"; Rec."Class Name")
                {
                    Editable = isEditable;
                }

                field("Product Code"; Rec.Product)
                {
                    ShowMandatory = true;
                    Editable = isEditable;
                    trigger OnValidate()
                    begin
                        CurrPage.Update(); // Refresh page to reflect changes based on Product Code
                    end;
                }
                field("Product Code Description"; Rec."Product Code Description")
                {
                    Editable = isEditable;
                    trigger OnValidate()
                    begin
                        CurrPage.Update(); // Refresh page to reflect changes based on Product Code Description
                    end;
                }
                field("Defined Product Code"; Rec."Defined Product Code")
                {
                    Visible = false;
                    trigger OnValidate()
                    begin
                        CurrPage.Update(); // Refresh page to reflect changes based on Defined Product Code
                    end;
                }
                field("Unique Product Code"; Rec."Unique Product Code")
                {
                    Visible = false;
                }

                field("Division Code"; Rec."Division Code")
                {
                    ShowMandatory = true;
                    Editable = isEditable;
                    trigger OnValidate()
                    begin
                        rec.TestField("Product Name");
                        //CurrPage.Update(); // Refresh page to reflect changes based on Division Code
                    end;
                }
                field("Division Name"; Rec."Division Name")
                {

                }
                field("New Unique Product Code"; Rec."New Unique Product Code")
                {
                    Editable = false;
                }
                field("Product Type"; Rec."Product Type")
                {

                }
                field("Item Type"; Rec."Item Type")
                {
                }
                field(UOM; Rec.UOM)
                {
                    ShowMandatory = true;
                }
                field("Pack Size"; Rec."Pack Size")
                {
                }
                field("Dosage From"; Rec."Dosage From")
                {
                }
                field(HSN; Rec.HSN)
                {
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                }
                field("Expiry & Shelf Life"; Rec."Expiry & Shelf Life")
                {
                }
                field(Batch; Rec.Batch)
                {
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                }
                field("Costing Method"; Rec."Costing Method")
                {
                }
                field("Description 1"; Rec."Description 1")
                {
                }
                field("Description 2"; Rec."Description 2")
                {
                }
                field("Description 3"; Rec."Description 3")
                {
                }
                field("Description 4"; Rec."Description 4")
                {
                }
                field("Description 5"; Rec."Description 5")
                {
                }
                field("Description 6"; Rec."Description 6")
                {
                }
                field(Rating; Rec.Rating)
                {
                }
                field("Item Created By"; Rec."Item Created By")
                {
                    Editable = false;
                }
                field("Item Created DateTime"; Rec."Item Creation Date time")
                {
                    Editable = false;
                }
                field("Item Modified By"; Rec."Modified by")
                {
                    Editable = false;
                }
                field("Item Modified DateTime"; Rec."Modified DateTime")
                {
                    Editable = false;
                }
                field("Item Created"; Rec."Item Created")
                {
                    Editable = false;
                }


            }


        }


    }
    trigger OnOpenPage()
    begin
        isEditable := true;
        if Rec."New Unique Product Code" <> '' then
            isEditable := false;
    end;

    trigger OnAfterGetRecord()

    begin
        isEditable := Rec."New Unique Product Code" = '';
        //CurrPage.Editable(isEditable);
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        ItemStagingRec: Page "e3 item staging list";
    begin
        if IsAllBlank() then
            exit(true);
        if IsMandatoryMissing() and (not Rec.IsTemporary) then
            Rec.Delete(true);

        exit(true); // Always allow page to close
    end;

    local procedure IsMandatoryMissing(): Boolean
    begin
        exit(
            (Rec."Family Code" = '') or
            (Rec."Segment Code" = '') or
            (Rec."Class Code" = '') or
            (Rec."Product" = '') or
            (Rec."Product Name" = '')
        );
    end;

    local procedure IsAllBlank(): Boolean
    begin
        exit(
            (Rec."Family Code" = '') and
            (Rec."Segment Code" = '') and
            (Rec."Class Code" = '') and
            (Rec."Product" = '') and
            (Rec."Product Name" = '') and
            (Rec."Existing DC" = '') and
            (Rec."Product Description" = '') and
            (Rec."Product Code Description" = '') and
            (Rec."Description 1" = '') and
            (Rec."Description 2" = '') and
            (Rec."Description 3" = '') and
            (Rec."Description 4" = '') and
            (Rec."Description 5" = '') and
            (Rec."Pack Size" = '') and
            (Rec."Dosage From" = '')
        );
    end;

    var
        isEditable: Boolean;
}