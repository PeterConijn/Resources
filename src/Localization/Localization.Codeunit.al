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
        if Localization = Enum::Localization::" " then begin
            ClearData(RegionDefault);
            exit;
        end;

        JObject := NavApp.GetResourceAsJson('Settings/localization.json', TextEncoding::UTF8);
        LocalizationName := Localization.Names().Get(Localization.AsInteger() + 1);
        JLocalizationObject := JObject.GetObject(LocalizationName);

        FieldNos := JLocalizationObject.Keys();
        RecRef.GetTable(RegionDefault);
        for Index := 1 to FieldNos.Count() do
            if Evaluate(FieldNo, FieldNos.Get(Index)) then
                if RecRef.FieldExist(FieldNo) then
                    RecRef.Field(FieldNo).Value := JLocalizationObject.GetText(FieldNos.Get(Index));

        RecRef.SetTable(RegionDefault);

        SetFlag(RegionDefault, JLocalizationObject);

        RegionDefault.Modify(true);
    end;

    /// <summary>
    /// Retrieve an image of a flag from the app resources and set it on the record.
    /// </summary>
    /// <param name="RegionDefault">The record to set the flag on</param>
    /// <param name="JLocalizationObject">The JSON object containing the flag</param>
    local procedure SetFlag(var RegionDefault: Record "Region Default"; JLocalizationObject: JsonObject)
    var
        InStream: InStream;
        Flags: List of [Text];
        FlagName: Text;
    begin
        if not JLocalizationObject.Keys.Contains('flag') then
            exit;

        FlagName := 'Settings/Flags/' + JLocalizationObject.GetText('flag');
        Flags := NavApp.ListResources('Settings/Flags/');
        if not Flags.Contains(FlagName) then
            exit;

        NavApp.GetResource(FlagName, InStream);
        if InStream.Length = 0 then
            exit;

        RegionDefault.Flag.ImportStream(InStream, FlagName);
    end;

    local procedure ClearData(var RegionDefault: Record "Region Default")
    begin
        RegionDefault.Name := '';
        RegionDefault."Date Format" := '';
        RegionDefault."Time Format" := '';
        RegionDefault."Language ID" := 0;
        RegionDefault."Currency Symbol" := '';
        Clear(RegionDefault.Flag);

        RegionDefault.Modify(true);
    end;
}