page 80004 "E3 Class Card"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "E3 Class";
    Caption = 'Class Card';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field(SegmentCode; Rec.SegmentCode)
                {
                    ApplicationArea = All;
                }
                field(FamilyCode; Rec.FamilyCode)
                {
                    ApplicationArea = All;
                }
                field(Code; Rec.Code)
                {

                }
                field(Name; Rec.Name)
                {
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(CreateItem)
            {
                Caption = 'Create Item';
                ApplicationArea = All;
                Image = Item;

                trigger OnAction()
                var
                    E3ProductCardPage: Page "E3 Product Card";
                begin
                    // E3ProductCardPage.SetFilter(DivisionCode, Rec.DivisionCode);
                    // E3ProductCardPage.SetFilter(SegmentCode, Rec.SegmentCode);
                    // E3ProductCardPage.SetFilter(FamilyCode, Rec.FamilyCode);
                    // E3ProductCardPage.SetFilter(ClassCode, Rec.Code);
                    // E3ProductCardPage.Run();
                end;
            }
        }
    }


}