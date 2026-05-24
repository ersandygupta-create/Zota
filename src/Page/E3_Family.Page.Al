page 80003 "E3 Family Card"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "E3 Family";
    Caption = 'Family Card';

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

                field(Code; Rec.Code)
                {

                }
                field(Name; Rec.Name)
                {
                }
            }
        }
    }


}