namespace PC.ResourceDemo.Colors;

page 50100 Colors
{
    ApplicationArea = All;
    Caption = 'Colors';
    PageType = List;
    SourceTable = Color;
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Color; Rec.Color)
                {
                }
                field("Hex Value"; Rec."Hex Value")
                {
                }
            }
        }
    }
    actions
    {
        area(Creation)
        {
            action(GetColors)
            {
                ApplicationArea = All;
                Caption = 'Update Colors';
                ToolTip = 'Update the list of colors.';

                trigger OnAction()
                var
                    Colors: Codeunit Colors;
                    AvailableColors: Dictionary of [Text, Text];
                    ColorName: Text;
                begin
                    Rec.DeleteAll(true);

                    AvailableColors := Colors.GetColors();
                    foreach ColorName in AvailableColors.Keys do begin
                        Rec.Init();
                        Rec.Color := CopyStr(ColorName, 1, MaxStrLen(Rec.Color));
                        Rec."Hex Value" := CopyStr(AvailableColors.Get(ColorName), 1, MaxStrLen(Rec."Hex Value"));
                        Rec.Insert(true);
                    end;
                end;

            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                Caption = 'New';

                actionref(GetColors_Promoted; GetColors)
                {
                }
            }
        }
    }
}
