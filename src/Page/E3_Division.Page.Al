page 80001 "E3 Division Card"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "E3 Division";
    Caption = 'Division Card';

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