namespace PC.ResourceDemo.Localization;

table 50101 "Region Default"
{
    Caption = 'Region Default';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            AllowInCustomizations = Never;
            DataClassification = SystemMetadata;
        }
        field(2; "Name"; Text[100])
        {
            Caption = 'Name';
            ToolTip = 'Specifies the name of the country or region.';
        }
        field(3; "Date Format"; Text[20])
        {
            Caption = 'Date Format';
            ToolTip = 'Specifies the format of the date in the selected country or region.';
        }
        field(4; "Time Format"; Text[10])
        {
            Caption = 'Time Format';
            ToolTip = 'Specifies the format of the time in the selected country or region.';
        }
        field(5; "Currency Symbol"; Text[5])
        {
            Caption = 'Currency Symbol';
            ToolTip = 'Specifies the currency symbol in the selected country or region.';
        }
        field(6; "Language ID"; Integer)
        {
            Caption = 'Language ID';
            ToolTip = 'Specifies the language ID in the selected country or region.';
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
