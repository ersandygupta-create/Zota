pageextension 80001 "E3 Business Manager" extends "Business Manager Role Center"
{
    actions
    {
        addafter(Action39) // Add a new part after the existing Work part
        {
            group(ItemMaster)
            {
                Caption = 'Master Data Management';
                group(Master)
                {
                    Caption = 'Master Data Management';

                    action("E3 Division Card")
                    {
                        Caption = 'Division';
                        ApplicationArea = All;
                        RunObject = page "E3 Division Card";
                        Image = Departments;
                    }
                    action("E3 Segment Card")
                    {
                        Caption = 'Segment';
                        ApplicationArea = All;
                        RunObject = page "E3 Segment Card";
                        Image = Segment;
                    }
                    action("E3 Family Card")
                    {
                        Caption = 'Family';
                        ApplicationArea = All;
                        RunObject = page "E3 Family Card";
                        Image = Category;
                    }
                    action("E3 Class Card")
                    {
                        Caption = 'Class';
                        ApplicationArea = All;
                        RunObject = page "E3 Class Card";
                        Image = Class;
                    }
                    action("E3 Product Card")
                    {
                        Caption = 'Product';
                        ApplicationArea = All;
                        RunObject = page "E3 Product Card";
                        Image = Item;
                    }
                    action("E3 Packing Master")
                    {
                        Caption = 'Packing Master';
                        ApplicationArea = All;
                        RunObject = page "E3 Packing Master";
                        Image = Item;
                    }
                    action("E3 Dosages Card")
                    {
                        Caption = 'Dosages';
                        ApplicationArea = All;
                        RunObject = page "E3 Dosages Card";
                        Image = Item;
                    }


                }
                group(Staging)
                {
                    Caption = 'Item Master Staging';
                    action("E3 Item Staging Card")
                    {

                        Caption = 'Item Master Staging';
                        ApplicationArea = basic, suite;
                        RunObject = page "E3 Item Staging List";
                        ToolTip = 'View and manage staged item master data before it is published to the main item master.';
                        Image = ItemLines;
                    }
                }
            }
        }
    }
}