--Kreasy Trafından Yapılmıştır
local MyMod = RegisterMod("HealthHeartsOnKeyPress", 1)

local cooldown = 0.43  -- 1 saniyelik cooldown süresi
local lastPressRed = 0  -- Son kırmızı kalp basım zamanı
local lastPressSoul = 0  -- Son ruh kalbi basım zamanı

-- Tuşlara basıldığında kalp eklenmesi
function MyMod:onUpdate()
    local player = Isaac.GetPlayer(0)  -- İlk oyuncuyu al
    local currentTime = Isaac.GetFrameCount() / 30  -- Geçerli zamanı saniye cinsinden al

    -- I tuşuna basıldıysa (Kırmızı kalp için)
    if Input.IsButtonPressed(Keyboard.KEY_1, player.ControllerIndex) then
        -- Kırmızı kalp cooldown kontrolü
        if currentTime - lastPressRed >= cooldown then
            local currentHearts = player:GetHearts()  -- Mevcut kırmızı kalp sayısını al
            local maxHearts = player:GetMaxHearts()  -- Maksimum kırmızı kalp sayısını al
            
            -- Eğer mevcut kalp sayısı maksimumdan düşükse
            if currentHearts < maxHearts then
                player:AddHearts(1)  -- 1 tane kırmızı kalp ekle
            else
                print("Maksimum kalp sayısına ulaşıldı.")  -- Konsola mesaj yazdır
            end
            
            lastPressRed = currentTime  -- Son basım zamanını güncelle
        end
    end

    -- 2 tuşuna basıldığında (Ruh kalbi için)
    if Input.IsButtonPressed(Keyboard.KEY_2, player.ControllerIndex) then
        -- Ruh kalbi cooldown kontrolü
        if currentTime - lastPressSoul >= cooldown then
            player:AddSoulHearts(1)  -- 2 tane ruh kalbi ekle
            lastPressSoul = currentTime  -- Son basım zamanını güncelle
        end
    end
end

-- Modun her güncellemede çalışmasını sağla
MyMod:AddCallback(ModCallbacks.MC_POST_UPDATE, MyMod.onUpdate)


local MyMod = RegisterMod("FullHealthOnKPress", 1)

local cooldown = 0.40  -- 1 saniyelik cooldown süresi
local lastPress = 0  -- Son basım zamanı

-- K tuşuna basıldığında oyuncunun para kazanması
function MyMod:onUpdate()
    local player = Isaac.GetPlayer(0)  -- İlk oyuncuyu al
    local currentTime = Isaac.GetFrameCount() / 30  -- Geçerli zamanı saniye cinsinden al

    -- N tuşuna basıldıysa
    if Input.IsButtonPressed(Keyboard.KEY_4, player.ControllerIndex) then
        -- Cooldown kontrolü
        if currentTime - lastPress >= cooldown then
            player:AddCoins(1)  -- 1 para ekle
            lastPress = currentTime  -- Son basım zamanını güncelle
        end
    end
end

-- Modun her güncellemede çalışmasını sağla
MyMod:AddCallback(ModCallbacks.MC_POST_UPDATE, MyMod.onUpdate)

local MyMod = RegisterMod("FullHealthOnKPress", 1)

local cooldown = 0.40  -- 1 saniyelik cooldown süresi
local lastPress = 0  -- Son basım zamanı

-- I tuşuna basıldığında oyuncuya siyah kalp eklenmesi
function MyMod:onUpdate()
    local player = Isaac.GetPlayer(0)  -- İlk oyuncuyu al
    local currentTime = Isaac.GetFrameCount() / 30  -- Geçerli zamanı saniye cinsinden al

    -- I tuşuna basıldıysa
    if Input.IsButtonPressed(Keyboard.KEY_3, player.ControllerIndex) then
        -- Cooldown kontrolü
        if currentTime - lastPress >= cooldown then
            player:AddBlackHearts(1)  -- 1 tane siyah kalp ekle
            lastPress = currentTime  -- Son basım zamanını güncelle
        end
    end
end

-- Modun her güncellemede çalışmasını sağla
MyMod:AddCallback(ModCallbacks.MC_POST_UPDATE, MyMod.onUpdate)

local MyItemsMod = RegisterMod("FullHealthOnKPress", 1)

local cooldown = 0.45  -- 1 saniyelik cooldown süresi
local lastPressBomb = 0  -- Son bomba basım zamanı
local lastPressKey = 0  -- Son anahtar basım zamanı

-- Tuşlara basıldığında nesne eklenmesi
function MyItemsMod:onUpdate()
    local player = Isaac.GetPlayer(0)  -- İlk oyuncuyu al
    local currentTime = Isaac.GetFrameCount() / 30  -- Geçerli zamanı saniye cinsinden al

    -- 5 tuşuna basıldıysa (Bomba için)
    if Input.IsButtonPressed(Keyboard.KEY_5, player.ControllerIndex) then
        -- Bomba cooldown kontrolü
        if currentTime - lastPressBomb >= cooldown then
            player:AddBombs(1)  -- 1 tane bomba ekle
            lastPressBomb = currentTime  -- Son basım zamanını güncelle
        end
    end

    -- 6 tuşuna basıldığında (Anahtar için)
    if Input.IsButtonPressed(Keyboard.KEY_6, player.ControllerIndex) then
        -- Anahtar cooldown kontrolü
        if currentTime - lastPressKey >= cooldown then
            player:AddKeys(1)  -- 1 tane anahtar ekle
            lastPressKey = currentTime  -- Son basım zamanını güncelle
        end
    end
end

-- Modun her güncellemede çalışmasını sağla
MyItemsMod:AddCallback(ModCallbacks.MC_POST_UPDATE, MyItemsMod.onUpdate)