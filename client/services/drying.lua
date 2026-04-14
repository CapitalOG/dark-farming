local isDrying    = false
local isPackaging = false

-- ─── Drying ──────────────────────────────────────────────────────────────────

RegisterNetEvent('bcc-farming:StartDrying', function(dryItem)
    if isDrying then
        Core.NotifyRightTip('You are already drying something.', 4000)
        return
    end

    isDrying = true
    local dryingTime = Config.dryingSetup.dryingTime * 1000 -- convert to ms

    -- Play an idle animation for the duration of the drying process
    PlayAnim('amb_rest@world_rest_male_a@wip_base', 'wip_base', dryingTime, false, true)

    local success = Core.Callback.TriggerAwait('bcc-farming:CompleteDrying', dryItem.wetItem, dryItem.driedItem)

    isDrying = false

    if not success then
        DBG:Warning('Drying failed or was cancelled for: ' .. tostring(dryItem.wetItem))
    end
end)

-- ─── Packaging ───────────────────────────────────────────────────────────────

RegisterNetEvent('bcc-farming:StartPackaging', function(pkgItem, budCount)
    if isPackaging then
        Core.NotifyRightTip('You are already packaging something.', 4000)
        return
    end

    isPackaging = true

    -- Build a simple prompt-based choice using native prompts
    local bulkAmount  = Config.packagingSetup.bulkAmount
    local canDoBulk   = budCount >= bulkAmount

    local singleKey = 0x4CC0E2FE -- B key
    local bulkKey   = 0x9959A6F0 -- C key
    local cancelKey = 0x27D1C284 -- R key

    local singlePrompt = UiPromptRegisterBegin()
    UiPromptSetControlAction(singlePrompt, singleKey)
    UiPromptSetText(singlePrompt, CreateVarString(10, 'LITERAL_STRING', 'Pack Single Bag (1 bud)'))
    UiPromptSetVisible(singlePrompt, true)
    UiPromptSetEnabled(singlePrompt, true)
    UiPromptSetHoldMode(singlePrompt, 1500)
    UiPromptRegisterEnd(singlePrompt)

    local bulkPrompt = UiPromptRegisterBegin()
    UiPromptSetControlAction(bulkPrompt, bulkKey)
    UiPromptSetText(bulkPrompt, CreateVarString(10, 'LITERAL_STRING', 'Pack Bulk Bag (' .. bulkAmount .. ' buds)'))
    UiPromptSetVisible(bulkPrompt, canDoBulk)
    UiPromptSetEnabled(bulkPrompt, canDoBulk)
    UiPromptSetHoldMode(bulkPrompt, 1500)
    UiPromptRegisterEnd(bulkPrompt)

    local cancelPrompt = UiPromptRegisterBegin()
    UiPromptSetControlAction(cancelPrompt, cancelKey)
    UiPromptSetText(cancelPrompt, CreateVarString(10, 'LITERAL_STRING', 'Cancel'))
    UiPromptSetVisible(cancelPrompt, true)
    UiPromptSetEnabled(cancelPrompt, true)
    UiPromptSetHoldMode(cancelPrompt, 1500)
    UiPromptRegisterEnd(cancelPrompt)

    local promptGroup = GetRandomIntInRange(0, 0xffffff)

    -- Move all prompts into the group
    UiPromptSetGroup(singlePrompt, promptGroup, 0)
    UiPromptSetGroup(bulkPrompt,   promptGroup, 0)
    UiPromptSetGroup(cancelPrompt, promptGroup, 0)

    local chosen = nil
    local header = CreateVarString(10, 'LITERAL_STRING',
        'Package ' .. pkgItem.label .. ' (' .. budCount .. ' dried buds available)')

    while not chosen do
        UiPromptSetActiveGroupThisFrame(promptGroup, header, 1, 0, 0, 0)

        if Citizen.InvokeNative(0xE0F65F0640EF0617, singlePrompt) then
            chosen = 'single'
        elseif canDoBulk and Citizen.InvokeNative(0xE0F65F0640EF0617, bulkPrompt) then
            chosen = 'bulk'
        elseif Citizen.InvokeNative(0xE0F65F0640EF0617, cancelPrompt) then
            chosen = 'cancel'
        end

        Wait(0)
    end

    -- Clean up prompts
    UiPromptDelete(singlePrompt)
    UiPromptDelete(bulkPrompt)
    UiPromptDelete(cancelPrompt)

    isPackaging = false

    if chosen == 'cancel' then return end

    -- Play a quick packaging animation
    PlayAnim('mech_pickup@plant@berries', 'base', 2000, false, false)

    Core.Callback.TriggerAwait('bcc-farming:CompletePackaging', pkgItem.budItem, chosen, pkgItem.label)
end)
