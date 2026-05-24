permissionset 80001 E3Permission
{
    Assignable = true;
    Permissions =
       tabledata "E3 Division" = RIMD,
        tabledata "E3 Segment" = RIMD,
        tabledata "E3 Family" = RIMD,
        tabledata "E3 Item Staging Master" = RIMD,
        tabledata "E3 Product" = RIMD,
        tabledata "E3 Packing Master" = RIMD,
        tabledata "E3 Dosages" = RIMD,
        tabledata "E3 Class" = RIMD,
        tabledata "E3 Item Staging Master Temp" = RIMD,
        page "E3 Item Master API" = X;
}