getgenv().esp = {
    Enabled = false,
    TargetOnly = false,
    MaxDistance = true,
    MaxDistanceAmount = 100,

    AutoStep = true, -- automatically updates the esp, you can disable this and use Player:Step() if you want to manually update them
    CharacterSize = Vector3.new(4.5, 6.25, 2),
    CharacterOffset = CFrame.new(0, -0.25, 0),
    UseBoundingBox = true, -- will use bounding box instead of size preset for dynamic box

    HighlightTarget = true,
    HighlightFriends = true,

    PriorityColor = Color3.fromRGB(255, 0, 0),
    FriendsColor = Color3.fromRGB(0, 255, 0),
    LocalPlayerColor = Color3.fromRGB(255, 0, 255),

    BoxEnabled = true,
    BoxCorners = true,
    BoxDynamic = false,
    BoxStaticXFactor = 1.5,
    BoxStaticYFactor = 2.1,
    BoxColor = Color3.fromRGB(255, 255, 255),

    BoxFill = false,
    BoxFillColor = Color3.fromRGB(0, 255, 0),
    BoxFillTransparency = 0.8,
    
    SkeletonEnabled = false,
    SkeletonColor = Color3.fromRGB(255, 255, 255),
    SkeletonMaxDistance = 300,

    ChamsEnabled = false,
    ChamsInnerColor = Color3.fromRGB(0, 255, 0),
    ChamsOuterColor = Color3.fromRGB(255, 255, 255),
    ChamsInnerTransparency = 0.5,
    ChamsOuterTransparency = 0.2,

    OutOfViewArrows = false,
    OutOfViewArrowColor = Color3.fromRGB(0, 255, 0),
    OutOfViewArrowFilled = true,
    OutOfViewArrowTransparency = 0.7,

    WallCheck = false,
    AliveCheck = true,
    TeamCheck = false,
    KnockedCheck = false,
    VisibleOnly = false,
    VisibleColor = Color3.fromRGB(0, 255, 0),
    NonVisibleColor = Color3.fromRGB(255, 0, 0),

    Icons = true,
    IconsLayout = {
        ['[Revolver]'] = {enabled = true, position = 'bottom', Image = "https://i.imgur.com/5JiCOj2.png" },
        ['[Double-Barrel SG]'] = {enabled = true, position = 'bottom', Image = "https://i.imgur.com/f5g7txh.png" },
        ['[Tactical]'] = {enabled = true, position = 'bottom', Image = "https://i.imgur.com/Z6ZJ6ks.png" },
        ['[Shotgun]'] = {enabled = true, position = 'bottom', Image = "https://i.imgur.com/hcXF7Wi.png" },
        ['[Knife]'] = {enabled = true, position = 'bottom', Image = "https://i.imgur.com/cU5bbdg.png" },
    },
    
    TextEnabled = true,
    UseDisplay = true,
    TextColor = Color3.fromRGB(255, 255, 255),
    TextLayout = {
        ['nametag']  = { enabled = true, position = 'top', order = 1 },
        ['name']     = { enabled = true, position = 'top', order = 2 },
        ['health']   = { enabled = true, position = 'left', order = 1, bar = 'health' },
        ['armor']    = { enabled = true, position = 'bottom', order = 2, bar = 'armor' },
        ['tool']     = { enabled = true, position = 'bottom', suffix = '', prefix = '', order = 2 },
        ['distance'] = { enabled = true, position = 'bottom', suffix = 'st', order = 1 },
        ['flags'] = { enabled = true, position = 'right', order = 2 },
    },

    BarLayout = {
        ['health'] = { enabled = true, position = 'left', order = 1, color_empty = Color3.fromRGB(176, 84, 84), color_full = Color3.fromRGB(140, 250, 140) },
        ['armor']  = { enabled = true, position = 'bottom', order = 2, color_empty = Color3.fromRGB(0, 136, 194), color_full = Color3.fromRGB(0, 136, 194) }
    }
    
}

-- // variables
local runservice = game:GetService('RunService')
local camera = workspace.CurrentCamera
local world_to_viewport = camera.WorldToViewportPoint
local inf = math.huge
--
local ResetMemoryCategory, SetMemoryCategory, SetUpvalueName, SetMetatable, ProfileBegin, GetMetatable, GetConstants, GetRegistry, GetUpvalues, GetConstant, SetConstant, GetUpvalue, ValidLevel, LoadModule, SetUpvalue, ProfileEnd, GetProtos, GetLocals, Traceback, SetStack, GetLocal, DumpHeap, GetProto, SetLocal, GetStack, GetFenv, GetInfo, Info = debug.resetmemorycategory, debug.setmemorycategory, debug.setupvaluename, debug.setmetatable, debug.profilebegin, debug.getmetatable, debug.getconstants, debug.getregistry, debug.getupvalues, debug.getconstant, debug.setconstant, debug.getupvalue, debug.validlevel, debug.loadmodule, debug.setupvalue, debug.profileend, debug.getprotos, debug.getlocals, debug.traceback, debug.setstack, debug.getlocal, debug.dumpheap, debug.getproto, debug.setlocal, debug.getstack, debug.getfenv, debug.getinfo, debug.info
local RandomSeed, Random, Frexp, Floor, Atan2, Log10, Noise, Round, Ldexp, Clamp, Sinh, Sign, Asin, Acos, Fmod, Huge, Tanh, Sqrt, Atan, Modf, Ceil, Cosh, Deg, Min, Log, Cos, Exp, Max, Rad, Abs, Pow, Sin, Tan, Pi = math.randomseed, math.random, math.frexp, math.floor, math.atan2, math.log10, math.noise, math.round, math.ldexp, math.clamp, math.sinh, math.sign, math.asin, math.acos, math.fmod, math.huge, math.tanh, math.sqrt, math.atan, math.modf, math.ceil, math.cosh, math.deg, math.min, math.log, math.cos, math.exp, math.max, math.rad, math.abs, math.pow, math.sin, math.tan, math.pi
local Foreachi, Isfrozen, Foreach, Insert, Remove, Concat, Freeze, Create, Unpack, Clear, Clone, Maxn, Move, Pack, Find, Sort, Getn = table.foreachi, table.isfrozen, table.foreach, table.insert, table.remove, table.concat, table.freeze, table.create, table.unpack, table.clear, table.clone, table.maxn, table.move, table.pack, table.find, table.sort, table.getn
local PackSize, Reverse, SUnpack, Gmatch, Format, Lower, Split, Match, Upper, Byte, Char, Pack, Gsub, SFind, Rep, Sub, Len = string.packsize, string.reverse, string.unpack, string.gmatch, string.format, string.lower, string.split, string.match, string.upper, string.byte, string.char, string.pack, string.gsub, string.find, string.rep, string.sub, string.len
local Countlz, Rrotate, Replace, Lrotate, Countrz, Arshift, Extract, Lshift, Rshift, Btest, Band, Bnot, Bxor, Bor = bit32.countlz, bit32.rrotate, bit32.replace, bit32.lrotate, bit32.countrz, bit32.arshift, bit32.extract, bit32.lshift, bit32.rshift, bit32.btest, bit32.band, bit32.bnot, bit32.bxor, bit32.bor
local NfcNormalize, NfdNormalize, CharPattern, CodePoint, Graphemes, Offset, Codes, Char, Len = utf8.nfcnormalize, utf8.nfdnormalize, utf8.charpattern, utf8.codepoint, utf8.graphemes, utf8.offset, utf8.codes, utf8.char, utf8.len
local Isyieldable, Running, Status, Create, Resume, Close, Yield, Wrap = coroutine.isyieldable, coroutine.running, coroutine.status, coroutine.create, coroutine.resume, coroutine.close, coroutine.yield, coroutine.wrap
local Desynchronize, Synchronize, Cancel, Delay, Defer, Spawn, Wait = task.desynchronize, task.synchronize, task.cancel, task.delay, task.defer, task.spawn, task.wait
--
local skeleton_connections = {
    {'UpperTorso', 'Head', Vector3.new(0,0.4,0), Vector3.new(0,-0.2,0)},
    {'UpperTorso', 'LowerTorso', Vector3.new(0,0.4,0)},

    {'UpperTorso', 'RightUpperArm', Vector3.new(0,0.4,0)},
    {'UpperTorso', 'LeftUpperArm', Vector3.new(0,0.4,0)},
    {'RightUpperArm', 'RightHand'},
    {'LeftUpperArm', 'LeftHand'},

    {'LowerTorso', 'LeftUpperLeg'},
    {'LeftUpperLeg', 'LeftFoot'},
    {'LowerTorso', 'RightUpperLeg'},
    {'RightUpperLeg', 'RightFoot'}
}

function vector2_floor(vector2)
    return Vector2.new(math.floor(vector2.X), math.floor(vector2.Y))
end

function cframe_to_viewport(cframe, floor)
    local position, visible = world_to_viewport(camera, cframe * (cframe - cframe.p):ToObjectSpace(camera.CFrame - camera.CFrame.p).p)
    if floor then
        position = vector2_floor(position)
    end
    return position, visible
end

function IsUsingAntiAim(Player)
    if (Player.Character.HumanoidRootPart.Velocity.Y < -5 and Player.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Freefall) or Player.Character.HumanoidRootPart.Velocity.Y < -50 then
        return true
    elseif Player and (Player.Character.HumanoidRootPart.Velocity.X > 35 or Player.Character.HumanoidRootPart.Velocity.X < -35) then
        return true
    elseif Player and Player.Character.HumanoidRootPart.Velocity.Y > 60 then
        return true
    elseif Player and (Player.Character.HumanoidRootPart.Velocity.Z > 35 or Player.Character.HumanoidRootPart.Velocity.Z < -35) then
        return true
    else
        return false
    end
end

function GetCharacter(Player)
    return Player.Character
end

function GetHumanoid(Player, Character)
    return Character:FindFirstChildOfClass("Humanoid")
end
--
function GetRootPart(Player, Character, Humanoid)
    return Humanoid.RootPart
end

function ClampString(String, Length, Font)
    local Font = (Font or 2)
    local Split = String:split("\n")
    --
    local Clamped = ""
    --
    for Index, Value2 in pairs(Split) do
        if (Index * 13) <= Length then
            Clamped = Clamped .. Value2 .. (Index == #Split and "" or "\n")
        end
    end
    --
    return (Clamped ~= String and (Clamped == "" and "" or Clamped:sub(0, #Clamped - 1) .. " ...") or Clamped)
end

function ValidateClient(Player)
    local Object = GetCharacter(Player)
    local Humanoid = (Object and GetHumanoid(Player, Object))
    local RootPart = (Humanoid and GetRootPart(Player, Object, Humanoid))
    --
    return Object, Humanoid, RootPart
end

function GetHealth(Player, Character, Humanoid)
    if Humanoid then
        return math.clamp(Humanoid.Health, 0, Humanoid.MaxHealth), Humanoid.MaxHealth
    end
end
--
function ClientAlive(Player, Character, Humanoid)
    local Health, MaxHealth = GetHealth(Player, Character, Humanoid)
    --
    return (Health > 0)
end

function GetOrigin(Origin)
        if Origin == "Head" then
            local Object, Humanoid, RootPart = ValidateClient(Client)
            local Head = Object:FindFirstChild("Head")
            --
            if Head and Head:IsA("RootPart") then
                return Head.CFrame.Position
            end
        elseif Origin == "Torso" then
            local Object, Humanoid, RootPart = ValidateClient(Client)
            --
            if RootPart then
                return RootPart.CFrame.Position
            end
        end
        --
    return Workspace.CurrentCamera.CFrame.Position
end
    --
function GetIgnore(Unpacked)
    return
end

function RayCast(Part, Origin, Ignore, Distance)
    local Ignore = Ignore or {}
    local Distance = Distance or 2000
    --
    local Cast = Ray.new(Origin, (Part.Position - Origin).Unit * Distance)
    local Hit = Workspace:FindPartOnRayWithIgnoreList(Cast, Ignore)
    --
    return (Hit and Hit:IsDescendantOf(Part.Parent)) == true, Hit
end

function TableToString(Table)
    if #Table > 1 then
        local Text = ""
        --
        for Index, Value in pairs(Table) do
            Text = Text .. Value .. "\n"
        end
        --
        return Text:sub(0, #Text - 1)
    else
        return Table[1]
    end
end

function CheckFriend(Player)
    if Player:IsFriendsWith(game.Players.LocalPlayer.UserId) then
        return false;
    else
        return true;
    end
end

function AngleEdge(Angle, Inset)
        local ScreenSize = Workspace.CurrentCamera.ViewportSize
        local Sine = Sin(Angle)
        local Cosine = Cos(Angle)
        local Slope = (Sine / Cosine)
        local EdgeX = ScreenSize.X - Inset
        local EdgeY = ScreenSize.Y - Inset
        --
        if Sine < 0 then EdgeY = Inset end
        if Cosine < 0 then EdgeX = Inset end
        --
        local Height = (Slope * EdgeX) + (ScreenSize.y / 2) - Slope * (ScreenSize.x / 2)
        --
        return (Height > 0 and Height < ScreenSize.Y - Inset) and Vector2.new(EdgeX, Height) or Vector2.new((EdgeY - ScreenSize.Y / 2 + Slope * (ScreenSize.X / 2)) / Slope, EdgeY)
    end

function RotatePoint(Point, Radians)
        local Unit = Point.Unit
        --
        local Sine = Sin(Radians)
        local Cosine = Cos(Radians)
        --
        return Vector2.new((Cosine * Unit.X) - (Sine * Unit.Y), (Sine * Unit.X) + (Cosine * Unit.Y)).Unit * Point.Magnitude
    end

-- // drawing
local old; old = hookfunction(Drawing.new, function(class, properties)
    local drawing = old(class)
    for i,v in next, properties or {} do
        drawing[i] = v
    end
    return drawing
end)

-- // player
getgenv().players = {}
local player = {}
player.__index = player

function player:Check()
    
    local character = self.instance.Character
    local rootpart = character and character:FindFirstChild('HumanoidRootPart')
    local torso = character and character:FindFirstChild('UpperTorso')
    local humanoid = rootpart and character:FindFirstChild('Humanoid')
    local bodyeffects = character and character:FindFirstChild('BodyEffects')
    local armor = bodyeffects and bodyeffects:FindFirstChild('Armor')

    if not character or not rootpart or not humanoid or (esp.TeamCheck and (self.instance.Team ~= nil and game.Players.LocalPlayer.Team ~= nil) and self.instance.Team == game.Players.LocalPlayer.Team) or (esp.AliveCheck and (not humanoid or 0 >= humanoid.Health)) or (esp.VisibleOnly and not self.localplayer and not RayCast(rootpart, GetOrigin(character), {GetCharacter(game.Players.LocalPlayer), GetIgnore(true)})) or esp.KnockedCheck and bodyeffects and bodyeffects["K.O"].Value or character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil then
        return false
    end

    local screen_position, screen_visible = cframe_to_viewport(rootpart.CFrame * esp.CharacterOffset, true)

    return true, {
        player = self.instance,
        character = character,
        rootpart = rootpart,
        humanoid = humanoid,
        bodyeffects = bodyeffects,
        armor = armor,
        position = screen_position,
        cframe = rootpart.CFrame * esp.CharacterOffset,
        health = humanoid.Health,
        maxhealth = humanoid.MaxHealth,
        healthfactor = humanoid.Health / humanoid.MaxHealth,
        armorfactor = armor ~= nil and armor.Value / 200,
        distance = (rootpart.CFrame.p - camera.CFrame.p).magnitude
    }
    
end

function player:Step(delta)

    local check_pass, check_data = self:Check()

    self:SetVisible(false)

    if not check_pass or esp.Enabled == false or (esp.TargetOnly and not (self.priority or self.localplayer)) then
        return
    else
        self.visible = true
    end

    local screen_position, screen_visible = cframe_to_viewport(check_data.cframe, true)
    local size
    local position
    local color = (esp.HighlightFriends and (self.friend or not CheckFriend(check_data.player) and esp.FriendsColor)) or (esp.HighlightTarget and (self.priority and esp.PriorityColor)) or not self.priority  and esp.WallCheck and (not RayCast(check_data.rootpart, GetOrigin(check_data.character), {GetCharacter(game.Players.LocalPlayer), GetIgnore(true)}) and esp.NonVisibleColor or esp.VisibleColor)
    local localplayercolor = self.localplayer and esp.LocalPlayerColor
    local box_drawings = self.drawings.box
    local MaxDistance

    if esp.MaxDistance then
        MaxDistance = esp.MaxDistanceAmount
    else
        MaxDistance = 10000
    end

    if not screen_visible then
        if MaxDistance > check_data.distance then
            if esp.OutOfViewArrows and check_data.player ~= game.Players.LocalPlayer then
                local ArrowSize = 20
                local ArrowPosition = 25
                local Relative = Workspace.CurrentCamera.CFrame:PointToObjectSpace(check_data.rootpart.CFrame.Position)
                local Angle = Atan2(-Relative.y, Relative.x)
                local Direction = Vector2.new(Cos(Angle), Sin(Angle))
                local Position = ArrowPosition ~= 101 and (Direction * Workspace.CurrentCamera.ViewportSize.X * ArrowPosition / 200) + (Workspace.CurrentCamera.ViewportSize * 0.5)
    
                if not Position or Position.y > Workspace.CurrentCamera.ViewportSize.Y - 5 or Position.Y < 5 then
                    Position = AngleEdge(Angle, 5)
                end
    
                local PointA = Position
                local PointB = (Position - RotatePoint(Direction, 0.5) * ArrowSize)
                local PointC = (Position - RotatePoint(Direction, -0.5) * ArrowSize)
                local PointD = Vector2.new((PointA.X + PointB.X + PointC.X) / 3, (PointA.Y + PointB.Y + PointC.Y) / 3)
    
                size = Vector2.new(ArrowSize, ArrowSize)
                position = (PointD - Vector2.new((ArrowSize / 2), (ArrowSize / 2)))
    
                self.drawings.arrows.PointA = PointA
                self.drawings.arrows.PointB = PointB
                self.drawings.arrows.PointC = PointC
                self.drawings.arrows.Visible = true
                self.drawings.arrows.Filled = esp.OutOfViewArrowFilled
                self.drawings.arrows.Color = color or esp.OutOfViewArrowColor
                self.drawings.arrows.Transparency = esp.OutOfViewArrowTransparency
    
                for i,v in next, box_drawings do 
                    v.Visible = false 
                end
                
                for i,v in next, self.drawings.skeleton do 
                    v.Visible = false 
                end
                
                self.highlight.Enabled = false
            end
        end
    else
        self.drawings.arrows.Visible = false
        
        if MaxDistance > check_data.distance then
            size = self:GetBoxSize(check_data.position, check_data.cframe)
            position = vector2_floor(check_data.position - size / 2)
            
            if esp.BoxEnabled and esp.BoxCorners then
        
                local corner_size = size.X / 3
        
                box_drawings[9].Position = position
                box_drawings[10].Position = position + Vector2.new(size.X - 1, 0)
                box_drawings[11].Position = position + Vector2.new(0, size.Y - corner_size)
                box_drawings[12].Position = position + Vector2.new(size.X - 1, size.Y - corner_size)
        
                box_drawings[13].Position = position
                box_drawings[14].Position = position + Vector2.new(size.X - corner_size, 0)
                box_drawings[15].Position = position + Vector2.new(0, size.Y - 1)
                box_drawings[16].Position = position + Vector2.new(size.X - corner_size, size.Y - 1)
        
                for i = 1, 8 do
                    local outline = box_drawings[i]
                    local inline = box_drawings[i + 8]
                    local fill = box_drawings[17]
        
                    inline.Visible = true
                    outline.Visible = true
                    inline.Filled = true
                    outline.Filled = true
                    inline.Color = localplayercolor or color or (self.useboxcolor and self.boxcolor) or esp.BoxColor
    
                    fill.Visible = esp.BoxFill
                    fill.Filled = true
                    fill.Size = size - Vector2.new(3.5, 3.5)
                    fill.Position = position + Vector2.new(2, 2)
                    fill.Color = localplayercolor or color or esp.BoxFillColor
                    fill.Transparency = esp.BoxFillTransparency
        
                    outline.Position = inline.Position - Vector2.new(1, 1)
                    
                    if i > 4 then
                        inline.Size = Vector2.new(corner_size, 1)
                        outline.Size = Vector2.new(corner_size + 2, 3)
                    else
                        inline.Size = Vector2.new(1, corner_size)
                        outline.Size = Vector2.new(3, corner_size + 2)
                    end
                end
        
        
        
            elseif esp.BoxEnabled then
                local outline = box_drawings[1]
                local outline2 = box_drawings[2]
                local inline = box_drawings[9]
                local fill = box_drawings[17]
        
                outline.Visible = true
                outline.Size = size + Vector2.new(2, 2)
                outline.Position = position - Vector2.new(1, 1)
                outline.Filled = false
    
                outline2.Visible = true
                outline2.Size = size - Vector2.new(2, 2)
                outline2.Position = position + Vector2.new(1, 1)
                outline2.Filled = false
        
                inline.Visible = true
                inline.Filled = false
                inline.Size = size
                inline.Position = position
                inline.Color = localplayercolor or color or (self.useboxcolor and self.boxcolor) or esp.BoxColor
    
                fill.Visible = esp.BoxFill
                fill.Filled = true
                fill.Size = size
                fill.Position = position
                fill.Color = localplayercolor or color or esp.BoxFillColor
                fill.Transparency = esp.BoxFillTransparency
            end
    
            if not self.localplayer then
                self.highlight.Enabled = esp.ChamsEnabled
                self.highlight.FillColor = color or (self.usehighlightcolor and self.highlightcolor) or esp.ChamsInnerColor
                self.highlight.FillTransparency = esp.ChamsInnerTransparency
                self.highlight.OutlineColor = color or (self.usehighlightcolor and self.outlinehighlightcolor) or esp.ChamsOuterColor
                self.highlight.OutlineTransparency = esp.ChamsOuterTransparency
                self.highlight.Parent = check_data.character
                self.highlight.Adornee = check_data.character
            end

            if esp.SkeletonEnabled and esp.SkeletonMaxDistance > check_data.distance then
        
                local cache = {}
        
                for idx, connection_data in next, skeleton_connections do
                    local drawing = self.drawings.skeleton[idx]
                    local part_a = check_data.character:FindFirstChild(connection_data[1])
                    local part_b = check_data.character:FindFirstChild(connection_data[2])
        
                    if part_a and part_b then
                        local screen_position_a = cache[part_a] or cframe_to_viewport(part_a.CFrame + (connection_data[3] or Vector3.new()), true)
                        local screen_position_b = cache[part_b] or cframe_to_viewport(part_b.CFrame + (connection_data[4] or Vector3.new()), true)
        
                        cache[part_a] = screen_position_a
                        cache[part_b] = screen_position_b
        
                        drawing.Visible = true
                        drawing.Color = esp.SkeletonColor
                        drawing.From = screen_position_a
                        drawing.To = screen_position_b
                    end
                end
            end
        end
    end

        if size and position then
            local bar_data = self:GetBarData(check_data)
            local bar_positions = { top = 0, bottom = 0, left = 0, right = 0 }
        
            for idx, data in next, self.drawings.bar do
                local flag = data[1]
                local layout = data[2]
                local outline = data[3]
                local inline = data[4]
                local data = bar_data[flag]
        
                if not layout.enabled or data.enabled == false then
                    continue
                end
        
                local progress = data.progress or 0
                local vertical = layout.position == 'left' or layout.position == 'right'
        
                outline.Visible = true
                inline.Visible = true
        
                outline.Size = vertical and Vector2.new(3, size.Y + 2) or Vector2.new(size.X + 2, 3)
                outline.Position = position + (
                    layout.position == 'top' and Vector2.new(-1, -(5 + bar_positions.top)) or
                    layout.position == 'bottom' and Vector2.new(-1, size.Y + 2 + bar_positions.bottom) or
                    layout.position == 'left' and Vector2.new(-5-bar_positions.left, -1) or
                    layout.position == 'right' and Vector2.new(size.X + 2 + bar_positions.right, -1)
                )
        
                inline.Color = layout.color_empty:lerp(layout.color_full, progress)
                inline.Size = vertical and Vector2.new(1, progress * size.Y) or Vector2.new(progress * size.X, 1)
        
                if vertical then
                    inline.Position = outline.Position + Vector2.new(1,1 + size.Y - progress * size.Y)
                else
                    inline.Position = outline.Position + Vector2.new(size.X - progress * size.X ,1)
                end
        
                bar_positions[layout.position] += 4
        
            end
            
            if esp.TextEnabled then
                local text_data = self:GetTextData(check_data)
                local text_positions = { top = bar_positions.top, bottom = bar_positions.bottom, left = 0, right = 0 }
        
                for idx, data in next, self.drawings.text do
                    local flag = data[1]
                    local layout = data[2]
                    local drawing = data[3]
                    local data = text_data[flag]
        
                    if not layout.enabled or data.enabled == false then
                        continue
                    end
        
                    drawing.Visible = true
                    drawing.Text = (layout.prefix or '') .. (data.text or '') .. (layout.suffix or '')
                    drawing.Color = data.color or layout.color or esp.TextColor
                    drawing.Size = 13
        
                    if layout.bar then
                        drawing.Position = position + (
                            layout.position == 'left' and Vector2.new(-(bar_positions.left + drawing.TextBounds.X + 4), size.Y - bar_data[layout.bar].progress * size.Y - 3) or
                            layout.position == 'right' and Vector2.new(size.X + bar_positions.right + 2, size.Y - bar_data[layout.bar].progress * size.Y -3) or
                            layout.position == 'bottom' and Vector2.new(size.X + 10, size.Y - 3)
                        )
                    else
                        drawing.Position = position + (
                            layout.position == 'top' and Vector2.new(size.X / 2, -3 - (text_positions.top + 14)) or
                            layout.position == 'bottom' and Vector2.new(size.X / 2, size.Y + text_positions.bottom + 2) or
                            layout.position == 'left' and Vector2.new(-(bar_positions.left + drawing.TextBounds.X + 2), text_positions.left - 3) or
                            layout.position == 'right' and Vector2.new(size.X + bar_positions.right + 3, text_positions.right - 3)               
                        )
            
                        text_positions[layout.position] += 14
                    end
        
                end 
            end
    end
end

function player:GetTextData(data)
    local tool = data.character:FindFirstChildOfClass('Tool')
    local screen_position, screen_visible = cframe_to_viewport(data.cframe, true)
    local Size = self:GetBoxSize(data.position, data.cframe)
    local Text
    local CurrentFlags = {}
    --
    if data.humanoid.MoveDirection.Magnitude > 0 then
        table.insert(CurrentFlags, "Moving")
    end
    --
    if data.humanoid.MoveDirection.Magnitude == 0 then
        table.insert(CurrentFlags, "Standing")
    end
    --
    if data.rootpart.Velocity.Y >= 5 then
        table.insert(CurrentFlags, "Jumping")
    end
    --
    if IsUsingAntiAim(data.player) then
        table.insert(CurrentFlags, "Desynced")
    end
    --
    if self.priority then
        table.insert(CurrentFlags, "Target")
    end
    --
    if screen_visible then
        Text = ClampString(TableToString(CurrentFlags), Size.Y)
    else
        Text = ClampString(TableToString(CurrentFlags), 20)
    end
    --
    return {
        ['nametag']  = { text = self.nametag_text, enabled = self.nametag_enabled, color = self.nametag_color },
        ['name']     = { text = esp.UseDisplay and self.instance.DisplayName or self.instance.Name},
        ['health']   = { text = tostring(math.floor(data.health)), color = esp.BarLayout.health.color_empty:lerp(esp.BarLayout.health.color_full, data.healthfactor) },
        ['armor']    = { text = tostring(math.floor(data.armor.Value)), color = esp.BarLayout.armor.color_empty:lerp(esp.BarLayout.armor.color_full, data.armorfactor)},
        ['distance'] = { text = tostring(math.floor(data.distance)) },
        ['tool']     = { text = tool and tool.Name, enabled = tool ~= nil },
        ['flags']    = { text = Text }
    }
end

function player:GetIconData(data)
    return {
        ['[Knife]'] = { data = "https://i.imgur.com/cU5bbdg.png" }
    }
end

function player:GetBarData(data) -- progress should be a number 0-1, you can get this by doing value / maxvalue aka armor / maxarmor
    return {
        ['health'] = { progress = data.healthfactor },
        ['armor'] = { progress = data.armorfactor }
    }
end

function player:GetBoxSize(position, cframe)
    if esp.BoxDynamic then
        local size = esp.CharacterSize
        
        if esp.UseBoundingBox then
            _, size = self.instance.Character:GetBoundingBox()
        end

        local x = cframe_to_viewport(cframe * CFrame.new(size.X, 0, 0))
        local y = cframe_to_viewport(cframe * CFrame.new(0, size.Y, 0))
        local z = cframe_to_viewport(cframe * CFrame.new(0, 0, size.Z))

        local SizeX = math.max(math.abs(position.X - x.X), math.abs(position.X - z.X))
        local SizeY = math.max(math.abs(position.Y - y.Y), math.abs(position.Y - x.Y))

        return Vector2.new(math.clamp(math.floor(SizeX), 3, inf), math.clamp(math.floor(SizeY), 6, inf))
    else
        local distance = (camera.CFrame.p - cframe.p).magnitude
        local factor = 1 / ((distance / 3) * math.tan(math.rad(camera.FieldOfView / 2)) * 2) * 1000
        return Vector2.new(math.clamp(math.floor(factor * esp.BoxStaticXFactor), 3, inf), math.clamp(math.floor(factor * esp.BoxStaticYFactor), 6, inf))
    end
end

function player:SetPriority(bool)
    self.priority = bool
end

function player:GetPriority()
    return self.priority
end

function player:SetBoxColorEnabled(bool)
    self.useboxcolor = bool
end

function player:SetBoxColor(color)
    self.boxcolor = color
end

function player:SetHighlightColorEnabled(bool)
    self.usehighlightcolor = bool
end

function player:SetHighlightColor(color, color2)
    self.highlightcolor = color
    self.outlinehighlightcolor = color2
end

function player:SetNametagText(str)
    self.nametag_text = str
end

function player:SetNametagEnabled(bool)
    self.nametag_enabled = bool
end

function player:SetNametagColor(color)
    self.nametag_color = color
end

function player:SetNametag(str, bool, color)
    self:SetNametagText(str)
    self:SetNametagEnabled(bool)
    self:SetNametagColor(color)
end

function player:SetVisible(bool)
    if self.visible ~= bool then
        self.visible = bool
        for i,v in next, self.drawings.box do v.Visible = bool end
        for i,v in next, self.drawings.skeleton do v.Visible = bool end
        for i,v in next, self.drawings.text do v[3].Visible = bool end
        for i,v in next, self.drawings.bar do v[3].Visible = bool; v[4].Visible = bool end
        
        self.drawings.arrows.Visible = bool
        self.highlight.Enabled = bool
    end
end

-- // new player
function esp.NewPlayer(player_instance, type)
    local player = setmetatable({}, player)

    if type == "LocalPlayer" then
        player.localplayer = true
    end

    player.instance = player_instance
    player.priority = false
    player.useboxcolor = false
    player.nametag_enabled = false
    player.nametag_text = 'nametag'
    player.nametag_color = Color3.new(1,1,1)
    player.boxcolor = Color3.new(1,1,1)

    player.highlight = Instance.new('Highlight')
    player.drawings = {
        text = {},
        bar = {},
        skeleton = {},
        box = {}
    }

    player.remove_esp = function() 
        for i,v in next, player.drawings.box do v:Remove() end
        for i,v in next, player.drawings.skeleton do v:Remove() end
        for i,v in next, player.drawings.text do v[3]:Remove() end
        for i,v in next, player.drawings.bar do v[3]:Remove(); v[4]:Remove() end
        player.drawings.arrows:Remove()
    end

    for i = 1, 8 do
        player.drawings.box[i] = Drawing.new('Square')
    end

    for i = 9, 16 do
        player.drawings.box[i] = Drawing.new('Square')
    end

    player.drawings.box[17] = Drawing.new('Square')

    for i = 1, 10 do
        player.drawings.skeleton[i] = Drawing.new('Line', { Thickness = 1 })
    end

    player.drawings.arrows = Drawing.new("Triangle")

    for flag, layout in next, esp.TextLayout do
        table.insert(player.drawings.text, { 
            flag,
            layout,
            Drawing.new('Text', { Size = 13, Font = 2, Outline = true, Center = layout.position == 'top' or layout.position == 'bottom' }) 
        })
    end

    for flag, layout in next, esp.BarLayout do
        table.insert(player.drawings.bar, { 
            flag,
            layout,
            Drawing.new('Square', { Thickness = 1, Filled = true }),
            Drawing.new('Square', { Thickness = 1, Filled = true }),
        })
    end

    table.sort(player.drawings.text, function(a,b)
        return a[2].order < a[2].order
    end)

    table.sort(player.drawings.bar, function(a,b)
        return a[2].order < a[2].order
    end)
    
    table.insert(players, player)
    return player
end

function esp.RemovePlayer(player_instance)
    for i, v in pairs(players) do
        local check_pass, check_data = v:Check()

        if check_pass then
            if check_data.character == player_instance.Character then
                v.remove_esp()
            end
        end
    end
end

function esp.UpdateTarget(player_instance)
    for i, v in pairs(players) do
        local check_pass, check_data = v:Check()

        if check_pass then
            if player_instance ~= nil then
                if check_data.character == player_instance.Character then
                    v.priority = true
                end
            else
                v.priority = false
            end
        end
    end
end

function esp.UpdateFriend(player_instance)
    for i, v in pairs(players) do
        local check_pass, check_data = v:Check()

        if check_pass then
            if player_instance ~= nil then
                if check_data.character == player_instance.Character then
                    v.friend = true
                end
            else
                v.friend = false
            end
        end
    end
end

-- // update
game:GetService('RunService').PreRender:Connect(function(delta)
    if esp.AutoStep then
        for i, player in next, players do
            player:Step(delta)
        end
    end
end)

-- // return
return esp
