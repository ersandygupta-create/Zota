page 80002 "E3 Segment Card"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "E3 Segment";
    Caption = 'Segment Card';
    layout
    {

        area(Content)
        {

            repeater(GroupName)
            {

                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Restrict Duplicate Name"; Rec."Restrict Duplicate Name")
                {
                    ApplicationArea = all;
                }

            }

        }


    }

}