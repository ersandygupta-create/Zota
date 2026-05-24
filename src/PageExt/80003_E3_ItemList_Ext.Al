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
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}