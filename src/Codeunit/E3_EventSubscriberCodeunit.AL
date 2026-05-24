codeunit 80004 E3_EventSubscriberCodeunit
{

    [EventSubscriber(ObjectType::Table, Database::Item, 'OnAfterValidateEvent', 'Base Unit of Measure', false, false)]
    local procedure OnAfterValidateBaseUOM(var Rec: Record Item; var xRec: Record Item)
    var
        UOMRec: Record "Unit of Measure";
    begin
        if UOMRec.Get(Rec."Base Unit of Measure") then
            Rec."UOM Description" := UOMRec.Description
        else
            Rec."UOM Description" := '';

    end;
}