page 80010 "E3 Family Lookup"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "E3 Family";
    Caption = 'Family Lookup';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
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