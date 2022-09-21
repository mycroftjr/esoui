function ZO_Tooltip:LayoutDefaultAccessTooltip(defaultAccess)
    local headerSection = self:AcquireSection(self:GetStyle("title"))
    headerSection:AddLine(GetString(SI_HOUSING_FURNITURE_SETTINGS_GENERAL_DEFAULT_ACCESS_TEXT))
    self:AddSection(headerSection)

    local bodySection = self:AcquireSection(self:GetStyle("attributeBody"))
    bodySection:AddLine(GetString(SI_HOUSING_FURNITURE_SETTINGS_GENERAL_DEFAULT_ACCESS_TOOLTIP_TEXT))
    self:AddSection(bodySection)

    local defaultVisitorAccessTitleSection = self:AcquireSection(self:GetStyle("defaultAccessTopSection"))
    local defaultVisitorAccessBodySection = self:AcquireSection(self:GetStyle("defaultAccessBody"))

    defaultVisitorAccessTitleSection:AddLine(GetString("SI_HOUSEPERMISSIONDEFAULTACCESSSETTING",  defaultAccess), self:GetStyle("defaultAccessTitle"))
    defaultVisitorAccessBodySection:AddLine(GetString("SI_HOUSEPERMISSIONDEFAULTACCESSSETTING_DESCRIPTION", defaultAccess))

    self:AddSection(defaultVisitorAccessTitleSection)
    self:AddSection(defaultVisitorAccessBodySection)
end

function ZO_Tooltip:LayoutHousingLink(link)
    local headerSection = self:AcquireSection(self:GetStyle("topSection"))
    local linkText, _, _, houseId, ownerDisplayName = ZO_LinkHandler_ParseLink(link)
    if linkText == "" then
        linkText = GetHousingLink(houseId, ownerDisplayName)
    end
    headerSection:AddLine(linkText, self:GetStyle("title"))
    self:AddSection(headerSection)

    local footerSection = self:AcquireSection(self:GetStyle("bodySection"))
    footerSection:AddKeybindLine("UI_SHORTCUT_SECONDARY", SI_GAMEPAD_HOUSING_LINK_TOOLTIP_DESCRIPTION, self:GetStyle("flavorText"))
    self:AddSection(footerSection)
end