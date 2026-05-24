page 80013 "E3 Dosages Card"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "E3 Dosages";
    Caption = 'Dosages Card';
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

            }

        }


    }

}