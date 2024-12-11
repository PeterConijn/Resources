namespace PC.ResourceDemo.Colors;

table 50100 Color
{
    Caption = 'Color';
    DataClassification = CustomerContent;
    TableType = Temporary;
    InherentEntitlements = X;
    InherentPermissions = X;

    fields
    {
        field(1; Color; Code[50])
        {
            Caption = 'Color';
            ToolTip = 'Specifies the color name.';
        }
        field(2; "Hex Value"; Code[10])
        {
            Caption = 'Hex Value';
            ToolTip = 'Specifies the hexadecimal value of the color.';
        }
    }
    keys
    {
        key(PK; Color)
        {
            Clustered = true;
        }
    }
}
