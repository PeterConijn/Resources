namespace Resources.Resources;

using PC.ResourceDemo.Localization;

page 50101 "Localization Settings"
{
    ApplicationArea = All;
    Caption = 'Localization Settings';
    PageType = Card;
    SourceTable = "Region Default";
    SaveValues = true;

    layout
    {
        area(Content)
        {
            group(Country)
            {
                Caption = 'Country';

                field(Localization; CurrentLocalization)
                {
                    ApplicationArea = All;
                    Caption = 'Localization';
                    ToolTip = 'Specifies the localization of the country or region.';

                    trigger OnValidate()
                    var
                        Localization: Codeunit Localization;
                    begin
                        Localization.SetLocalization(CurrentLocalization, Rec);
                    end;
                }
            }
            group(Settings)
            {
                Caption = 'Settings';
                Editable = false;

                field(Name; Rec.Name)
                {
                }
                field("Date Format"; Rec."Date Format")
                {
                }
                field("Time Format"; Rec."Time Format")
                {
                }
                field("Language ID"; Rec."Language ID")
                {
                }
                field("Currency Symbol"; Rec."Currency Symbol")
                {
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.IsEmpty() then
            exit;

        Rec.Init();
        Rec.Insert(true);
    end;

    var
        CurrentLocalization: Enum Localization;
}
