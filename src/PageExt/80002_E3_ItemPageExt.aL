pageextension 80002 "E3 Item Card" extends "Item Card"
{
    layout
    {
        addafter("Base Unit of Measure")
        {
            field("UOM Description"; Rec."UOM Description")
            {
                ApplicationArea = all;
                Caption = 'UOM Description';
                Editable = false;
            }
        }
        addlast(content)
        {

            group(MSD)
            {
                Caption = 'MDM';
                field("Existing DC"; Rec."Existing DC")
                {
                    ApplicationArea = all;

                }

                field("Product Name"; Rec."Product Name")
                {
                    ShowMandatory = true;
                    ApplicationArea = all;
                }
                field("Product Description"; Rec."Product Description")
                {
                    ApplicationArea = all;
                }

                field("Segment Code"; Rec."Segment Code")
                {
                    ApplicationArea = all;
                    ShowMandatory = true;
                    Editable = false;
                }
                field("Segment Name"; Rec."Segment Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                }

                field("Family Code"; Rec."Family Code")
                {
                    ApplicationArea = all;
                    ShowMandatory = true;
                    Editable = false;
                }
                field("Family Name"; Rec."Family Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                }

                field("Class Code"; Rec."Class Code")
                {
                    ApplicationArea = all;
                    ShowMandatory = true;
                    Editable = false;
                }
                field("Class Name"; Rec."Class Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                }

                field("Product Code"; Rec.Product)
                {
                    ShowMandatory = true;
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Product Code Description"; Rec."Product Code Description")
                {
                    Editable = false;
                    ApplicationArea = all;
                }

                field("Division Code"; Rec."Division Code")
                {
                    ShowMandatory = true;
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Division Name"; Rec."Division Name")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Product Type"; Rec."Product Type")
                {
                    ApplicationArea = all;
                }
                field("Item Type"; Rec."Item Type")
                {
                    ApplicationArea = all;
                }
                field("Pack Size"; Rec."Pack Size")
                {
                    ApplicationArea = all;
                }
                field("Dosage From"; Rec."Dosage From")
                {
                    ApplicationArea = all;
                }
                field(HSN; Rec.HSN)
                {
                    ApplicationArea = all;
                }
                field("Expiry & Shelf Life"; Rec."Expiry & Shelf Life")
                {
                    ApplicationArea = all;
                }
                field(Batch; Rec.Batch)
                {
                    ApplicationArea = all;
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    ApplicationArea = all;
                }
                field("Description 1"; Rec."Description 1")
                {
                    ApplicationArea = all;
                }
                field("Description 2 MDM"; Rec."Description 2 MDM")
                {
                    ApplicationArea = all;
                    Caption = 'Description 2';
                }
                field("Description 3"; Rec."Description 3")
                {
                    ApplicationArea = all;
                }
                field("Description 4"; Rec."Description 4")
                {
                    ApplicationArea = all;
                }

                field("Description 5"; Rec."Description 5")
                {
                    ApplicationArea = all;
                }
                field("Description 6"; Rec."Description 6")
                {
                    ApplicationArea = all;
                }
                field(Rating; Rec.Rating)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}