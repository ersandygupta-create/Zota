codeunit 80003 "E3 Item Import Excel"
{


    procedure ImportExcel()
    var
        FileName: Text;
        InStr: InStream;
    begin
        UploadIntoStream('Select Excel File', '', '', FileName, InStr);
        ReadExcelSheet(InStr);
    end;

    procedure ReadExcelSheet(InStr: InStream)
    var
        ExcelBuffer: Record "Excel Buffer" temporary;
    begin
        ExcelBuffer.OpenBookStream(InStr, 'Sheet1');
        ExcelBuffer.ReadSheet();

        ProcessExcelData(ExcelBuffer);
    end;

    procedure ProcessExcelData(var ExcelBuffer: Record "Excel Buffer" temporary)
    var
        a: Code[100];
        count: Integer;
        CurrentRow: Integer;
    begin
        if ExcelBuffer.FindSet() then begin
            CurrentRow := 0;

            repeat
                if ExcelBuffer."Row No." <> CurrentRow then begin
                    // Insert previous record
                    if CurrentRow <> 0 then
                        // Start new row
                        CurrentRow := ExcelBuffer."Row No.";
                end;

                case ExcelBuffer."Column No." of
                    1:
                        a := ExcelBuffer."Cell Value as Text";

                    2:
                        a := ExcelBuffer."Cell Value as Text";

                    3:
                        a := ExcelBuffer."Cell Value as Text";

                end;
            until ExcelBuffer.Next() = 0;
            Message(Format(count));
            // Insert last row
            if CurrentRow <> 0 then;
        end;
    end;


}