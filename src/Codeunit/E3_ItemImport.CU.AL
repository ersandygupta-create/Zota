codeunit 80002 "E3 Item Import"
{
    procedure ImportExcel()
    var
        FileName: Text;
        SheetName: Text;
        InStr: InStream;
        ExcelBuffer: Record "Excel Buffer" temporary;
        RowNo: Integer;
        MaxRow: Integer;
        existingDc: Code[20];
        divCode: Code[20];
        familyCode: Code[20];
        segmentCode: Code[20];
        classCode: Code[20];
        product: Code[20];
        productName: Text[250];
        desc: Text[250];
        uom: Code[10];
        packSize: Code[20];
        division: Record "E3 Division";
        class: Record "E3 Class";
        segment: Record "E3 Segment";
        family: Record "E3 Family";
        productMaster: Record "E3 Product";
        insert: Boolean;
        UnitOfMeasure: Record "Unit of Measure";
        I: Integer;
        k: Integer;
        LastEntryNo: Integer;
        ItemTempTable: Record "E3 Item Staging Master Temp";


    begin
        // Upload file
        UploadIntoStream('Select Excel File', '', '', FileName, InStr);

        // Open workbook
        SheetName := ExcelBuffer.SelectSheetsNameStream(InStr);
        ExcelBuffer.OpenBookStream(InStr, SheetName);
        ExcelBuffer.ReadSheet();


        // Get last row
        MaxRow := ExcelBuffer.Count;
        i := 0;
        k := 0;
        for RowNo := 2 to MaxRow do begin
            ItemTempTable.Reset();
            if ItemTempTable.FindLast() then
                LastEntryNo := ItemTempTable."Entry No."
            else
                LastEntryNo := 0;
            ItemTempTable.Init();
            ItemTempTable."Entry No." := LastEntryNo + 1;
            ItemTempTable."Existing DC" := GetCellValue(ExcelBuffer, RowNo, 1);
            ItemTempTable."Division Code" := GetCellValue(ExcelBuffer, RowNo, 2);
            ItemTempTable."Segment Code" := GetCellValue(ExcelBuffer, RowNo, 3);
            ItemTempTable."Family Code" := GetCellValue(ExcelBuffer, RowNo, 4);
            ItemTempTable."Class Code" := GetCellValue(ExcelBuffer, RowNo, 5);
            ItemTempTable.Product := GetCellValue(ExcelBuffer, RowNo, 6);

            ItemTempTable."Product Name" := GetCellValue(ExcelBuffer, RowNo, 7);
            ItemTempTable."Product Description" := GetCellValue(ExcelBuffer, RowNo, 8);
            if not Evaluate(ItemTempTable."Product Type", GetCellValue(ExcelBuffer, RowNo, 9)) then
                ItemTempTable."Product Type" := ItemTempTable."Product Type"::Inventory;

            if not Evaluate(ItemTempTable."Item Type", GetCellValue(ExcelBuffer, RowNo, 10)) then
                ItemTempTable."Item Type" := ItemTempTable."Item Type"::FG;

            if not Evaluate(ItemTempTable."Costing Method", GetCellValue(ExcelBuffer, RowNo, 19)) then
                ItemTempTable."Costing Method" := ItemTempTable."Costing Method"::FIFO;


            ItemTempTable.UOM := GetCellValue(ExcelBuffer, RowNo, 11);
            ItemTempTable."Pack Size" := GetCellValue(ExcelBuffer, RowNo, 12);

            ItemTempTable."Dosage From" := GetCellValue(ExcelBuffer, RowNo, 13);
            ItemTempTable.HSN := GetCellValue(ExcelBuffer, RowNo, 14);
            if not Evaluate(ItemTempTable."Unit Cost", GetCellValue(ExcelBuffer, RowNo, 15)) then
                ItemTempTable."Unit Cost" := 0;

            ItemTempTable."Expiry & Shelf Life" := GetCellValue(ExcelBuffer, RowNo, 16);

            ItemTempTable.Batch := GetCellValue(ExcelBuffer, RowNo, 17);
            if not Evaluate(ItemTempTable."Expiry Date", GetCellValue(ExcelBuffer, RowNo, 18)) then
                ItemTempTable."Expiry Date" := 0D;

            ItemTempTable."Description 1" := GetCellValue(ExcelBuffer, RowNo, 20);
            ItemTempTable."Description 2" := GetCellValue(ExcelBuffer, RowNo, 21);
            ItemTempTable."Description 3" := GetCellValue(ExcelBuffer, RowNo, 22);
            ItemTempTable."Description 4" := GetCellValue(ExcelBuffer, RowNo, 23);
            ItemTempTable."Description 5" := GetCellValue(ExcelBuffer, RowNo, 24);
            ItemTempTable."Description 6" := GetCellValue(ExcelBuffer, RowNo, 25);

            ItemTempTable.Rating := GetCellValue(ExcelBuffer, RowNo, 26);
            if (ItemTempTable."Division Code" <> '') then
                ItemTempTable.Insert();
        end;
        CreateItemInStaging(ItemTempTable);
    end;

    local procedure GetCellValue(var ExcelBuffer: Record "Excel Buffer"; RowNo: Integer; ColNo: Integer): Text
    begin
        if ExcelBuffer.Get(RowNo, ColNo) then
            exit(ExcelBuffer."Cell Value as Text");

        exit('');
    end;

    procedure CreateItemInStaging(var ItemTempTable: Record "E3 Item Staging Master Temp" temporary)
    var
        ItemStaging: Record "E3 Item Staging Master";
        division: Record "E3 Division";
        class: Record "E3 Class";
        segment: Record "E3 Segment";
        family: Record "E3 Family";
        productMaster: Record "E3 Product";
        UnitOfMeasure: Record "Unit of Measure";
        PackSize: Record "E3 Packing Master";
        DosagesMaster: Record "E3 Dosages";
        insert: Boolean;
        ErrorList: List of [Text];
        ErrorMsg: Text;
        RowNo: Integer;
        ErrorText: Text;
        I: Integer;
        K: Integer;
    begin

        if ItemTempTable.FindSet() then
            repeat
                insert := true;
                RowNo += 1;

                ItemStaging.Init();

                // Existing DC
                ItemStaging."Existing DC" := ItemTempTable."Existing DC";

                // Division Validation
                if not division.Get(ItemTempTable."Division Code") then begin
                    insert := false;
                    ErrorList.Add(
                        'Row ' + Format(RowNo) +
                        ' : Division Code ' + ItemTempTable."Division Code" + ' not found');
                end else begin
                    ItemStaging."Division Code" := division.Code;
                    ItemStaging."Division Name" := division.Name;
                end;

                // Segment Validation
                if not segment.Get(ItemTempTable."Segment Code") then begin
                    insert := false;
                    ErrorList.Add(
                        'Row ' + Format(RowNo) +
                        ' : Segment Code ' + ItemTempTable."Segment Code" + ' not found');
                end else begin
                    ItemStaging."Segment Code" := segment.Code;
                    ItemStaging."Segment Name" := segment.Name;
                end;

                // Family Validation
                if not family.Get(ItemTempTable."Segment Code", ItemTempTable."Family Code") then begin
                    insert := false;
                    ErrorList.Add(
                        'Row ' + Format(RowNo) +
                        ' : Family Code ' + ItemTempTable."Family Code" + ' not found');
                end else begin
                    ItemStaging."Family Code" := family.Code;
                    ItemStaging."Family Name" := family.Name;
                end;

                // Class Validation
                if not class.Get(
                    ItemTempTable."Segment Code",
                    ItemTempTable."Family Code",
                    ItemTempTable."Class Code")
                then begin
                    insert := false;
                    ErrorList.Add(
                        'Row ' + Format(RowNo) +
                        ' : Class Code ' + ItemTempTable."Class Code" + ' not found');
                end else begin
                    ItemStaging."Class Code" := class.Code;
                    ItemStaging."Class Name" := class.Name;
                end;

                // Product Validation
                if not productMaster.Get(
                    ItemTempTable."Segment Code",
                    ItemTempTable."Family Code",
                    ItemTempTable."Class Code",
                    ItemTempTable.Product)
                then begin
                    insert := false;
                    ErrorList.Add(
                        'Row ' + Format(RowNo) +
                        ' : Product ' + ItemTempTable.Product + ' not found');
                end else begin
                    ItemStaging.Product := productMaster.Code;
                    ItemStaging."Product Code Description" := productMaster.Name;
                end;

                // UOM Validation
                if not UnitOfMeasure.Get(ItemTempTable.UOM) then begin
                    insert := false;
                    ErrorList.Add(
                        'Row ' + Format(RowNo) +
                        ' : UOM ' + ItemTempTable.UOM + ' not found');
                end
                else
                    ItemStaging.UOM := ItemTempTable.UOM;

                // Copy remaining fields
                ItemStaging."Product Name" := ItemTempTable."Product Name";
                ItemStaging."Product Description" := ItemTempTable."Product Description";
                if not PackSize.Get(ItemTempTable."Pack Size") then begin
                    insert := false;
                    ErrorList.Add(
                        'Row ' + Format(RowNo) +
                        ' : Pack Size ' + ItemTempTable."Pack Size" + ' not found');
                end
                else
                    ItemStaging."Pack Size" := ItemTempTable."Pack Size";
                if not DosagesMaster.Get(ItemTempTable."Dosage From") then begin
                    insert := false;
                    ErrorList.Add(
                        'Row ' + Format(RowNo) +
                        ' : Dosage ' + ItemTempTable."Dosage From" + ' not found');
                end
                else
                    ItemStaging."Dosage From" := ItemTempTable."Dosage From";
                // if not ItemStaging.CheckNameDuplicateMsg(ItemStaging."Segment Code", ItemStaging."Product Name") then begin
                //     insert := false;
                //     ErrorList.Add(
                //         StrSubstNo(
                //             'Row %1 : Product Name %2 already exists in Segment %3',
                //             Format(RowNo) +
                //             ItemStaging."Product Name",
                //             ItemStaging."Segment Code"));
                // end;

                ItemStaging.HSN := ItemTempTable.HSN;
                ItemStaging."Unit Cost" := ItemTempTable."Unit Cost";
                ItemStaging."Expiry & Shelf Life" := ItemTempTable."Expiry & Shelf Life";
                ItemStaging.Batch := ItemTempTable.Batch;
                ItemStaging."Expiry Date" := ItemTempTable."Expiry Date";
                ItemStaging."Description 1" := ItemTempTable."Description 1";
                ItemStaging."Description 2" := ItemTempTable."Description 2";
                ItemStaging."Description 3" := ItemTempTable."Description 3";
                ItemStaging."Description 4" := ItemTempTable."Description 4";
                ItemStaging."Description 5" := ItemTempTable."Description 5";
                ItemStaging."Description 6" := ItemTempTable."Description 6";
                ItemStaging."Product Type" := ItemTempTable."Product Type";
                ItemStaging."Item Type" := ItemTempTable."Item Type";
                ItemStaging.Rating := ItemTempTable.Rating;


                if insert then begin
                    ItemStaging.NumSequenceCode();
                    ItemStaging.Insert(true);
                    I += 1;
                end else
                    K += 1;

            until ItemTempTable.Next() = 0;

        // Build error message
        foreach ErrorMsg in ErrorList do
            ErrorText += ErrorMsg + '\';

        Message(
            'Excel Import Completed\' +
            'Inserted : %1\' +
            'Failed : %2\' +
            'Total : %3\' +
            '\Errors:\' + ErrorText,
            I, K, I + K);
    end;
}