pageextension 80003 E3_ItemList_Ext extends "Item List"
{
    layout
    {
        addafter("No.")
        {
            field("Product Name Cust"; Rec."Product Name")
            {
                Caption = 'Product Name';
                ApplicationArea = All;
            }
            field("Segment Code"; Rec."Segment Code")
            {
                Caption = 'Segment Code';
                ApplicationArea = All;
                ShowMandatory = true;
            }
            field("Segment Name"; Rec."Segment Name")
            {
                Caption = 'Segment Name';
                ApplicationArea = All;
                Editable = false;
            }
            field("Product Description"; Rec."Product Description")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the detailed description of the product.';
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
            field("UOM Description"; Rec."UOM Description")
            {
                ApplicationArea = All;
                Caption = 'UOM Description';
                Editable = false;
                ToolTip = 'Specifies the description of the unit of measure.';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}