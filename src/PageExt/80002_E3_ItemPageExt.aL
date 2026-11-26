pageextension 80002 "E3 Item Card" extends "Item Card"
{
    layout
    {
        addafter("Base Unit of Measure")
        {
            field("UOM Description"; Rec."UOM Description")
            {
                ApplicationArea = All;
                Caption = 'UOM Description';
                Editable = false;
                ToolTip = 'Specifies the description of the unit of measure.';
            }
        }
        addlast(content)
        {
            group(MSD)
            {
                Caption = 'MDM';

                field("Existing DC"; Rec."Existing DC")
                {
                    ApplicationArea = All;
                    Caption = 'Existing Code';
                    ToolTip = 'Specifies the existing distribution center associated with the product.';
                }
                field("Product Name"; Rec."Product Name")
                {
                    ShowMandatory = true;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the product.';
                }
                field("Product Description"; Rec."Product Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the detailed description of the product.';
                }
                field("Segment Code"; Rec."Segment Code")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Editable = false;
                    ToolTip = 'Specifies the segment code associated with the product.';
                }
                field("Segment Name"; Rec."Segment Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the name of the product segment.';
                }
                field("Family Code"; Rec."Family Code")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Editable = false;
                    ToolTip = 'Specifies the product family code.';
                }
                field("Family Name"; Rec."Family Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the name of the product family.';
                }
                field("Class Code"; Rec."Class Code")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Editable = false;
                    ToolTip = 'Specifies the product class code.';
                }
                field("Class Name"; Rec."Class Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the name of the product class.';
                }
                field("Product Code"; Rec.Product)
                {
                    ShowMandatory = true;
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the product code.';
                }
                field("Product Code Description"; Rec."Product Code Description")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the description of the product code.';
                }
                field("Division Code"; Rec."Division Code")
                {
                    ShowMandatory = true;
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the division code associated with the product.';
                }
                field("Division Name"; Rec."Division Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the product division.';
                }
                field("Product Type"; Rec."Product Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the type or category of the product.';
                }
                field("Item Type"; Rec."Item Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the type of item.';
                }
                field("Pack Size"; Rec."Pack Size")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the pack size of the product.';
                }
                field("Dosage From"; Rec."Dosage From")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the dosage information for the product.';
                }
                field(HSN; Rec.HSN)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Harmonized System of Nomenclature (HSN) code for the product.';
                }
                field("Expiry & Shelf Life"; Rec."Expiry & Shelf Life")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the expiry and shelf life details of the product.';
                }
                field(Batch; Rec.Batch)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the product requires batch tracking.';
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the expiry date of the product.';
                }
                field("Description 1"; Rec."Description 1")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the first additional product description.';
                }
                field("Description 2 MDM"; Rec."Description 2 MDM")
                {
                    ApplicationArea = All;
                    Caption = 'Description 2';
                    ToolTip = 'Specifies the second additional product description.';
                }
                field("Description 3"; Rec."Description 3")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the third additional product description.';
                }
                field("Description 4"; Rec."Description 4")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the fourth additional product description.';
                }
                field("Description 5"; Rec."Description 5")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the fifth additional product description.';
                }
                field("Description 6"; Rec."Description 6")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the sixth additional product description.';
                }
                field(Rating; Rec.Rating)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the rating assigned to the product.';
                }
            }
        }
    }
}