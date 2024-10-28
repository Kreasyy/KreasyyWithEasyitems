-- Kreasy Tarafından Yapılmıştır
local MyMod = RegisterMod("HealthHeartsOnKeyPress", 1)

local cooldown = 0.43  -- 1 saniyelik cooldown süresi
local lastPressRed = 0       -- Son kırmızı kalp basım zamanı
local lastPressSoul = 0      -- Son ruh kalbi basım zamanı
local lastPressBlack = 0     -- Son siyah kalp basım zamanı
local lastPressCoin = 0      -- Son para basım zamanı
local lastPressBomb = 0      -- Son bomba basım zamanı
local lastPressKey = 0       -- Son anahtar basım zamanı
local lastPressContainer = 0 -- Son kalp konteyneri basım zamanı

-- Tuşlara basıldığında item eklenmesi
function MyMod:onUpdate()
    local player = Isaac.GetPlayer(0)  -- İlk oyuncuyu al
    local currentTime = Isaac.GetFrameCount() / 30  -- Geçerli zamanı saniye cinsinden al

    -- 1 tuşuna basıldıysa (Kırmızı kalp için)
    if Input.IsButtonPressed(Keyboard.KEY_1, player.ControllerIndex) then
        if currentTime - lastPressRed >= cooldown then
            local currentHearts = player:GetHearts()
            local maxHearts = player:GetMaxHearts()
            if currentHearts < maxHearts then
                player:AddHearts(1)
            else
                print("Maksimum kalp sayısına ulaşıldı.")
            end
            lastPressRed = currentTime
        end
    end

    -- 2 tuşuna basıldığında (Ruh kalbi için)
    if Input.IsButtonPressed(Keyboard.KEY_2, player.ControllerIndex) then
        if currentTime - lastPressSoul >= cooldown then
            player:AddSoulHearts(1)
            lastPressSoul = currentTime
        end
    end

    -- 3 tuşuna basıldığında (Siyah kalp için)
    if Input.IsButtonPressed(Keyboard.KEY_3, player.ControllerIndex) then
        if currentTime - lastPressBlack >= cooldown then
            player:AddBlackHearts(1)
            lastPressBlack = currentTime
        end
    end

    -- 4 tuşuna basıldığında (Para için)
    if Input.IsButtonPressed(Keyboard.KEY_4, player.ControllerIndex) then
        if currentTime - lastPressCoin >= cooldown then
            player:AddCoins(1)
            lastPressCoin = currentTime
        end
    end

    -- 5 tuşuna basıldığında (Bomba için)
    if Input.IsButtonPressed(Keyboard.KEY_5, player.ControllerIndex) then
        if currentTime - lastPressBomb >= cooldown then
            player:AddBombs(1)
            lastPressBomb = currentTime
        end
    end

    -- 6 tuşuna basıldığında (Anahtar için)
    if Input.IsButtonPressed(Keyboard.KEY_6, player.ControllerIndex) then
        if currentTime - lastPressKey >= cooldown then
            player:AddKeys(1)
            lastPressKey = currentTime
        end
    end

    -- 7 tuşuna basıldığında (Kalp konteyneri için)
    if Input.IsButtonPressed(Keyboard.KEY_7, player.ControllerIndex) then
        if currentTime - lastPressContainer >= cooldown then
            player:AddMaxHearts(2, false)  -- 1 tam kalp konteyneri ekle (2 yarım kalp)
            lastPressContainer = currentTime
        end
    end
end

-- Modun her güncellemede çalışmasını sağla
MyMod:AddCallback(ModCallbacks.MC_POST_UPDATE, MyMod.onUpdate)
