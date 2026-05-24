page 80005 "E3 Item Staging List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "E3 Item Staging Master";
    Caption = 'Item Staging List';
    CardPageId = "E3 Item Staging Card";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Existing DC"; Rec."Existing DC")
                {

                }
                field("Division Code"; Rec."Division Code")
                {

                }
                field("Division Name"; Rec."Division Name")
                {

                }
                field("Product Name"; Rec."Product Name")
                {

                }
                field("Product Description"; Rec."Product Description")
                {

                }
                field("Segment Name"; Rec."Segment Name")
                {

                }
                field("Segment Code"; Rec."Segment Code")
                {

                }
                field("Family Name"; Rec."Family Name")
                {

                }
                field("Family Code"; Rec."Family Code")
                {

                }
                field("Class Name"; Rec."Class Name")
                {

                }
                field("Class Code"; Rec."Class Code")
                {
                }
                field("Product Code Description"; Rec."Product Code Description")
                {
                }
                field("Product Code"; Rec.Product)
                {
                }
                field("New Unique Product Code"; Rec."New Unique Product Code")
                {
                }
                field("Product Type"; Rec."Product Type")
                {

                }
                field("Item Type"; Rec."Item Type")
                {
                }
                field(UOM; Rec.UOM)
                { }
                field("Pack Size"; Rec."Pack Size")
                {
                }
                field("Dosage From"; Rec."Dosage From")
                {
                }
                field(HSN; Rec.HSN)
                {
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                }
                field("Expiry & Shelf Life"; Rec."Expiry & Shelf Life")
                {
                }
                field(Batch; Rec.Batch)
                {
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                }
                field("Costing Method"; Rec."Costing Method")
                {
                }
                field("Description 1"; Rec."Description 1")
                {
                }
                field("Description 2"; Rec."Description 2")
                {
                }
                field("Description 3"; Rec."Description 3")
                {
                }
                field("Description 4"; Rec."Description 4")
                {
                }
                field("Description 5"; Rec."Description 5")
                {
                }
                field("Description 6"; Rec."Description 6")
                {
                }
                field(Rating; Rec.Rating) { }
                field("Item Created"; Rec."Item Created") { }
                field("Item Created By"; Rec."Item Created By") { }
                field("Item Creation Date time"; Rec."Item Creation Date time") { }
                field("Modified by"; Rec."Modified by") { }
                field("Modified DateTime"; Rec."Modified DateTime") { }


            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ImportExcel)
            {
                Caption = 'Import from Excel';
                ApplicationArea = All;
                Image = Import;

                trigger OnAction()
                var
                    E3ItemImport: Codeunit "E3 Item Import";
                    Import: Codeunit "E3 Item Import Excel";
                begin
                    E3ItemImport.ImportExcel();
                    //Import.ImportExcel();
                    CurrPage.Update();
                end;
            }
            action(CreateItem)
            {
                Caption = 'Create Item';
                ApplicationArea = All;
                Image = Item;

                trigger OnAction()
                var
                    StagingRec: Record "E3 Item Staging Master";
                    E3ItemCreation: Codeunit "E3 Item Creation";
                    ErrorList: List of [Text];
                    ErrorMsg: Text;
                    SuccessCount: Integer;
                    FailCount: Integer;
                    Err: Text;
                begin
                    CurrPage.SetSelectionFilter(StagingRec);

                    if StagingRec.FindSet() then
                        repeat
                            Clear(ErrorMsg);

                            if not StagingRec."Item Created" then begin
                                if E3ItemCreation.CreateItemFromStaging(StagingRec, ErrorMsg) then
                                    SuccessCount += 1
                                else begin
                                    FailCount += 1;
                                    ErrorList.Add(
                                        StrSubstNo(
                                            'Item %1 : %2',
                                            StagingRec."New Unique Product Code",
                                            ErrorMsg));
                                end;
                            end;

                        until StagingRec.Next() = 0;

                    foreach Err in ErrorList do
                        ErrorMsg += Err + '\';

                    Message(
                        'Item Creation Completed\Created : %1\Failed : %2\\Errors:\%3',
                        SuccessCount,
                        FailCount,
                        ErrorMsg);
                end;
            }
        }
    }


}