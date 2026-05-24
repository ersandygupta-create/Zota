codeunit 80001 "E3 Item Creation"
{
    trigger OnRun()
    begin

    end;

    procedure CreateItemFromStaging1(var ItemMaster: Record "E3 item staging Master"; var ErrorMsg: Text): Boolean
    var
        ItemRec: Record Item;
    begin
        //Check if Item exists
        if ItemRec.Get(ItemMaster."New Unique Product Code") then begin
            ErrorMsg := StrSubstNo('Item %1 already exists.', ItemMaster."New Unique Product Code");
            exit(false);
        end;

        if ItemMaster.UOM = '' then begin
            ErrorMsg := 'UOM is not filled';
            exit(false);
        end;

        ItemRec.Init();
        ItemRec.Validate("No.", ItemMaster."New Unique Product Code");
        ItemRec.Validate(Description, CopyStr(ItemMaster."Product Name", 1, 60));
        ItemRec."Base Unit of Measure" := ItemMaster.UOM;
        ItemRec.Validate("Unit Cost", ItemMaster."Unit Cost");
        ItemRec.Validate("Costing Method", ItemMaster."Costing Method");

        ItemRec."Existing DC" := ItemMaster."Existing DC";
        ItemRec."Division Code" := ItemMaster."Division Code";
        ItemRec."Division Name" := ItemMaster."Division Name";
        ItemRec."Family Code" := ItemMaster."Family Code";
        ItemRec."Family Name" := ItemMaster."Family Name";
        ItemRec."Segment Code" := ItemMaster."Segment Code";
        ItemRec."Segment Name" := ItemMaster."Segment Name";
        ItemRec."Class Code" := ItemMaster."Class Code";
        ItemRec."Class Name" := ItemMaster."Class Name";

        ItemRec."Product Name" := ItemMaster."Product Name";
        ItemRec."Product Description" := ItemMaster."Product Description";
        ItemRec.Product := ItemMaster.Product;
        ItemRec."Product Code Description" := ItemMaster."Product Code Description";
        ItemRec."Product Type" := ItemMaster."Product Type";
        ItemRec."Item Type" := ItemMaster."Item Type";
        if (ItemMaster."Product Type" = "E3 product type"::Inventory) then
            ItemRec.Type := "Item Type"::Inventory
        else if (ItemMaster."Product Type" = "E3 product type"::Service) then
            ItemRec.Type := "Item Type"::Service
        else if (ItemMaster."Product Type" = "E3 product type"::NonInventory) then
            ItemRec.Type := "Item Type"::"Non-Inventory";
        ItemRec.Insert(true);

        ItemMaster."Item Created" := true;
        ItemMaster.Modify();

        exit(true);
    end;

    procedure CreateItemFromStaging(ItemMaster: Record "E3 item staging Master"; var ErrorMsg: Text): Boolean
    var
        ItemRec: Record Item;
        UnitOfMeasure: Record "Unit of Measure";
    begin
        //Check if Item already exists
        if ItemRec.Get(ItemMaster."New Unique Product Code") then
            Error('Item %1 already exists.', ItemMaster."New Unique Product Code");

        //Create Item
        ItemRec.Init();
        ItemRec.Validate("No.", ItemMaster."New Unique Product Code");
        ItemRec.Validate(Description, CopyStr(ItemMaster."Product Name", 1, 60));
        if (ItemMaster.UOM = '') then
            Error('UOM is not filled')
        else
            ItemRec."Base Unit of Measure" := ItemMaster.UOM;

        UnitOfMeasure.Reset();
        UnitOfMeasure.SetRange(Code, ItemMaster.UOM);
        if UnitOfMeasure.Find('-') then
            ItemRec."UOM Description" := UnitOfMeasure.Description;
        ItemRec.Validate("Unit Cost", ItemMaster."Unit Cost");
        ItemRec.Validate("Costing Method", ItemMaster."Costing Method");
        ItemRec."Existing DC" := ItemMaster."Existing DC";
        ItemRec."Division Code" := ItemMaster."Division Code";
        ItemRec."Division Name" := ItemMaster."Division Name";
        ItemRec."Family Code" := ItemMaster."Family Code";
        ItemRec."Family Name" := ItemMaster."Family Name";
        ItemRec."Segment Code" := ItemMaster."Segment Code";
        ItemRec."Segment Name" := ItemMaster."Segment Name";
        ItemRec."Class Code" := ItemMaster."Class Code";
        ItemRec."Class Name" := ItemMaster."Class Name";
        ItemRec."Product Name" := ItemMaster."Product Name";
        ItemRec."Product Description" := ItemMaster."Product Description";
        ItemRec.Product := ItemMaster.Product;
        ItemRec."Product Code Description" := ItemMaster."Product Code Description";
        ItemRec."Product Type" := ItemMaster."Product Type";
        ItemRec."Item Type" := ItemMaster."Item Type";
        ItemRec.UOM := ItemMaster.UOM;
        ItemRec."Pack Size" := ItemMaster."Pack Size";
        ItemRec."Dosage From" := ItemMaster."Dosage From";
        ItemRec.HSN := ItemMaster.HSN;
        ItemRec."Expiry & Shelf Life" := ItemMaster."Expiry & Shelf Life";
        ItemRec.Batch := ItemMaster.Batch;
        ItemRec."Expiry Date" := ItemMaster."Expiry Date";
        ItemRec."Description 1" := ItemMaster."Description 1";
        ItemRec."Description 2 MDM" := ItemMaster."Description 2";
        ItemRec."Description 3" := ItemMaster."Description 3";
        ItemRec."Description 4" := ItemMaster."Description 4";
        ItemRec."Description 5" := ItemMaster."Description 5";
        ItemRec."Description 6" := ItemMaster."Description 6";
        ItemRec.Rating := ItemMaster.Rating;
        ItemRec."Item Type" := ItemMaster."Item Type";
        if (ItemMaster."Product Type" = "E3 product type"::Inventory) then
            ItemRec.Type := "Item Type"::Inventory
        else if (ItemMaster."Product Type" = "E3 product type"::Service) then
            ItemRec.Type := "Item Type"::Service
        else if (ItemMaster."Product Type" = "E3 product type"::NonInventory) then
            ItemRec.Type := "Item Type"::"Non-Inventory";
        ItemRec.Insert(true);
        //Update staging table
        ItemMaster."Item Created" := true;
        ItemMaster.Modify();
        exit(true);
    end;
}