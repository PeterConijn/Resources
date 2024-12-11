namespace PC.ResourceDemo.Colors;

codeunit 50100 Colors
{
    Access = Internal;
    InherentEntitlements = X;
    InherentPermissions = X;

    procedure GetColors() Colors: Dictionary of [Text, Text]
    var
        JObject: JsonObject;
        JColorsObject: JsonObject;
        JToken: JsonToken;
        ColorKeys: List of [Text];
        ColorKey: Text;
    begin
        JObject := NavApp.GetResourceAsJson('Colors/colors.json');
        JObject.Get('colors', JToken);
        JColorsObject := JToken.AsObject();

        ColorKeys := JColorsObject.Keys();
        foreach ColorKey in ColorKeys do
            Colors.Add(ColorKey, JColorsObject.GetText(ColorKey));
    end;
}
