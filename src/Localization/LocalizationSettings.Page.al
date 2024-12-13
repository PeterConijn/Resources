namespace PC.ResourceDemo.Localization;

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
                    BlankZero = true;
                }
                field("Currency Symbol"; Rec."Currency Symbol")
                {
                }
            }
        }
        area(FactBoxes)
        {
            part(RegionFlag; "Region Flag")
            {
                SubPageLink = "Code" = field(Code);
            }
        }
    }

    trigger OnOpenPage()
    begin
        if Rec.IsEmpty() then begin
            Rec.Init();
            Rec.Insert(true);
        end;

        CurrentLocalization := Enum::Localization::" ";
        Localization.SetLocalization(CurrentLocalization, Rec);
    end;

    var
        Localization: Codeunit Localization;
        CurrentLocalization: Enum Localization;
}
