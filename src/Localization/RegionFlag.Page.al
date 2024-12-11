namespace PC.ResourceDemo.Localization;

page 50102 "Region Flag"
{
    ApplicationArea = All;
    Caption = 'Region Flag';
    PageType = CardPart;
    SourceTable = "Region Default";

    layout
    {
        area(Content)
        {
            field(Flag; Rec.Flag)
            {
                ShowCaption = false;
            }
        }
    }
}
