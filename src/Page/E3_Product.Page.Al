page 80006 "E3 Product Card"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "E3 Product";
    Caption = 'Products';
    layout
    {
        area(content)
        {
            repeater(Group)
            {

                field(SegmentCode; Rec.SegmentCode)
                {
                    ApplicationArea = All;
                }
                field(FamilyCode; Rec.FamilyCode)
                {
                    ApplicationArea = All;
                }
                field(ClassCode; Rec.ClassCode)
                {
                    ApplicationArea = All;
                }

                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}