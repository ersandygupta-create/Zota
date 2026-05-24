enum 80001 "E3 Product Type"
{
    Extensible = true;

    value(0; Inventory)
    {
        Caption = 'Inventory';
    }
    value(1; Service)
    {
        Caption = 'Service';
    }
    value(3; NonInventory)
    {
        Caption = 'Non-Inventory';
    }
}