namespace PC.ResourceDemo.Localization;

codeunit 50101 Localization
{
    Access = Internal;
    InherentEntitlements = X;
    InherentPermissions = X;

    procedure SetLocalization(Localization: Enum Localization; var RegionDefault: Record "Region Default")
    var
        RecRef: RecordRef;
        JObject: JsonObject;
        JLocalizationObject: JsonObject;
        FieldNos: List of [Text];
        LocalizationName: Text;
        FieldNo: Integer;
        Index: Integer;
    begin
        JObject := NavApp.GetResourceAsJson('Settings/localization.json', TextEncoding::UTF8);
        LocalizationName := Localization.Names().Get(Localization.AsInteger() + 1);
        JLocalizationObject := JObject.GetObject(LocalizationName);

        FieldNos := JLocalizationObject.Keys();
        RecRef.GetTable(RegionDefault);
        for Index := 1 to FieldNos.Count() do begin
            Evaluate(FieldNo, FieldNos.Get(Index));
            if RecRef.FieldExist(FieldNo) then
                RecRef.Field(FieldNo).Value := JLocalizationObject.GetText(FieldNos.Get(Index));
        end;

        RecRef.SetTable(RegionDefault);
    end;
}