-- == [Bypass] ==
loadstring(game:HttpGet("https://pastefy.app/pDhoQmem/raw"))()


if Library then
    Library:Unload()
end

local LoadTick = os.clock()

local Library do
    local Workspace = game:GetService("Workspace")
    local UserInputService = game:GetService("UserInputService")
    local Players = game:GetService("Players")
    local HttpService = game:GetService("HttpService")
    local RunService = game:GetService("RunService")
    local CoreGui = cloneref and cloneref(game:GetService("CoreGui")) or game:GetService("CoreGui")
    local TweenService = game:GetService("TweenService")

    gethui = gethui or function()
        return CoreGui
    end

    local LocalPlayer = Players.LocalPlayer
    local Camera = Workspace.CurrentCamera
    local Mouse = LocalPlayer:GetMouse()

    local FromRGB = Color3.fromRGB
    local FromHSV = Color3.fromHSV
    local FromHex = Color3.fromHex

    local RGBSequence = ColorSequence.new
    local RGBSequenceKeypoint = ColorSequenceKeypoint.new
    local NumSequence = NumberSequence.new
    local NumSequenceKeypoint = NumberSequenceKeypoint.new

    local UDim2New = UDim2.new
    local UDimNew = UDim.new
    local Vector2New = Vector2.new

    local MathClamp = math.clamp
    local MathFloor = math.floor
    local MathAbs = math.abs
    local MathSin = math.sin

    local TableInsert = table.insert
    local TableFind = table.find
    local TableRemove = table.remove
    local TableConcat = table.concat
    local TableClone = table.clone
    local TableUnpack = table.unpack

    local StringFormat = string.format
    local StringFind = string.find
    local StringGSub = string.gsub
    local StringLower = string.lower
    local StringLen = string.len

    local InstanceNew = Instance.new

    local RectNew = Rect.new

    local IsMobile = UserInputService.TouchEnabled or false

    Library = {
        Theme =  { },

        MenuKeybind = tostring(Enum.KeyCode.RightControl), 
        Flags = { },

        Tween = {
            Time = 0.2,
            Style = Enum.EasingStyle.Quad,
            Direction = Enum.EasingDirection.Out
        },

        FadeSpeed = 0.2,

        Folders = {
            Directory = "scoot",
            Configs = "scoot/Configs",
            Assets = "scoot/Assets",
        },

        Images = {
            ["Saturation"] = {"Saturation.png", "https://github.com/sametexe001/images/blob/main/saturation.png?raw=true" },
            ["Value"] = { "Value.png", "https://github.com/sametexe001/images/blob/main/value.png?raw=true" },
            ["Hue"] = { "Hue.png", "https://github.com/sametexe001/images/blob/main/horizontalhue.png?raw=true" },
            ["Checkers"] = { "Checkers.png", "https://github.com/sametexe001/images/blob/main/checkers.png?raw=true" },
        },

        
        Pages = { },
        Sections = { },

        Connections = { },
        Threads = { },

        ThemeMap = { },
        ThemeItems = { },

        CopiedColor = nil,

        OpenFrames = { },

        CurrentPage = nil,

        SearchItems = { },

        SetFlags = { },

        UnnamedConnections = 0,
        UnnamedFlags = 0,

        Holder = nil,
        NotifHolder = nil,
        UnusedHolder = nil,
        Font = nil,
        KeyList = nil,

        Colorpickers = { },
    }

    Library.__index = Library
    Library.Sections.__index = Library.Sections
    Library.Pages.__index = Library.Pages

    local Keys = {
        ["Unknown"]           = "Unknown",
        ["Backspace"]         = "Back",
        ["Tab"]               = "Tab",
        ["Clear"]             = "Clear",
        ["Return"]            = "Return",
        ["Pause"]             = "Pause",
        ["Escape"]            = "Escape",
        ["Space"]             = "Space",
        ["QuotedDouble"]      = '"',
        ["Hash"]              = "#",
        ["Dollar"]            = "$",
        ["Percent"]           = "%",
        ["Ampersand"]         = "&",
        ["Quote"]             = "'",
        ["LeftParenthesis"]   = "(",
        ["RightParenthesis"]  = " )",
        ["Asterisk"]          = "*",
        ["Plus"]              = "+",
        ["Comma"]             = ",",
        ["Minus"]             = "-",
        ["Period"]            = ".",
        ["Slash"]             = "`",
        ["Three"]             = "3",
        ["Seven"]             = "7",
        ["Eight"]             = "8",
        ["Colon"]             = ":",
        ["Semicolon"]         = ";",
        ["LessThan"]          = "<",
        ["GreaterThan"]       = ">",
        ["Question"]          = "?",
        ["Equals"]            = "=",
        ["At"]                = "@",
        ["LeftBracket"]       = "LeftBracket",
        ["RightBracket"]      = "LeftBracked",
        ["BackSlash"]         = "BackSlash",
        ["Caret"]             = "^",
        ["Underscore"]        = "_",
        ["Backquote"]         = "`",
        ["LeftCurly"]         = "{",
        ["Pipe"]              = "|",
        ["RightCurly"]        = "}",
        ["Tilde"]             = "~",
        ["Delete"]            = "Delete",
        ["End"]               = "End",
        ["KeypadZero"]        = "Keypad0",
        ["KeypadOne"]         = "Keypad1",
        ["KeypadTwo"]         = "Keypad2",
        ["KeypadThree"]       = "Keypad3",
        ["KeypadFour"]        = "Keypad4",
        ["KeypadFive"]        = "Keypad5",
        ["KeypadSix"]         = "Keypad6",
        ["KeypadSeven"]       = "Keypad7",
        ["KeypadEight"]       = "Keypad8",
        ["KeypadNine"]        = "Keypad9",
        ["KeypadPeriod"]      = "KeypadP",
        ["KeypadDivide"]      = "KeypadD",
        ["KeypadMultiply"]    = "KeypadM",
        ["KeypadMinus"]       = "KeypadM",
        ["KeypadPlus"]        = "KeypadP",
        ["KeypadEnter"]       = "KeypadE",
        ["KeypadEquals"]      = "KeypadE",
        ["Insert"]            = "Insert",
        ["Home"]              = "Home",
        ["PageUp"]            = "PageUp",
        ["PageDown"]          = "PageDown",
        ["RightShift"]        = "RightShift",
        ["LeftShift"]         = "LeftShift",
        ["RightControl"]      = "RightControl",
        ["LeftControl"]       = "LeftControl",
        ["LeftAlt"]           = "LeftAlt",
        ["RightAlt"]          = "RightAlt"
    }

    local Themes = {
        ["Preset"] = {
            ["Background"] = FromRGB(28, 24, 14),
            ["Border"] = FromRGB(45, 38, 20),
            ["Inline"] = FromRGB(35, 30, 18),
            ["Hovered Element"] = FromRGB(72, 62, 28),
            ["Page Background"] = FromRGB(40, 34, 18),
            ["Outline"] = FromRGB(85, 72, 35),
            ["Element"] = FromRGB(50, 42, 22),
            ["Gradient"] = FromRGB(255, 255, 0),
            ["Text"] = FromRGB(255, 248, 230),
            ["Text Stroke"] = FromRGB(60, 45, 20),
            ["Placeholder Text"] = FromRGB(220, 200, 150),
            ["Accent"] = FromRGB(255, 255, 0)
        }
    }

    Library.Theme = TableClone(Themes["Preset"])

    
    for Index, Value in pairs(Library.Folders) do 
        if not isfolder(Value) then
            makefolder(Value)
        end
    end

    
	for Index, Value in pairs(Library.Images) do
	    local ImageData = Value
	
	    local ImageName = ImageData[1]
	    local ImageLink = ImageData[2]
	    
	    if not isfile(Library.Folders.Assets .. "/" .. ImageName) then
	        local ok, err = pcall(function()
	            local success, data = pcall(game.HttpGet, game, ImageLink)
	            if not success or not data then return end
	            writefile(Library.Folders.Assets .. "/" .. ImageName, data)
	        end)
	    end
	end

    
    local Tween = { } do
        Tween.__index = Tween

        Tween.Create = function(self, Item, Info, Goal, IsRawItem)
            Item = IsRawItem and Item or Item.Instance
            Info = Info or TweenInfo.new(Library.Tween.Time, Library.Tween.Style, Library.Tween.Direction)

            local NewTween = {
                Tween = TweenService:Create(Item, Info, Goal),
                Info = Info,
                Goal = Goal,
                Item = Item
            }

            NewTween.Tween:Play()

            setmetatable(NewTween, Tween)

            return NewTween
        end

        Tween.GetProperty = function(self, Item)
            Item = Item or self.Item 

            if Item:IsA("Frame") then
                return { "BackgroundTransparency" }
            elseif Item:IsA("TextLabel") or Item:IsA("TextButton") then
                return { "TextTransparency", "BackgroundTransparency" }
            elseif Item:IsA("ImageLabel") or Item:IsA("ImageButton") then
                return { "BackgroundTransparency", "ImageTransparency" }
            elseif Item:IsA("ScrollingFrame") then
                return { "BackgroundTransparency", "ScrollBarImageTransparency" }
            elseif Item:IsA("TextBox") then
                return { "TextTransparency", "BackgroundTransparency" }
            elseif Item:IsA("UIStroke") then 
                return { "Transparency" }
            end
        end

        Tween.FadeItem = function(self, Item, Property, Visibility, Speed)
            local Item = Item or self.Item 

            local OldTransparency = Item[Property]
            Item[Property] = Visibility and 1 or OldTransparency

            local NewTween = Tween:Create(Item, TweenInfo.new(Speed or Library.Tween.Time, Library.Tween.Style, Library.Tween.Direction), {
                [Property] = Visibility and OldTransparency or 1
            }, true)

            Library:Connect(NewTween.Tween.Completed, function()
                if not Visibility then 
                    task.wait()
                    Item[Property] = OldTransparency
                end
            end)

            return NewTween
        end

        Tween.Get = function(self)
            if not self.Tween then 
                return
            end

            return self.Tween, self.Info, self.Goal
        end

        Tween.Pause = function(self)
            if not self.Tween then 
                return
            end

            self.Tween:Pause()
        end

        Tween.Play = function(self)
            if not self.Tween then 
                return
            end

            self.Tween:Play()
        end

        Tween.Clean = function(self)
            if not self.Tween then 
                return
            end

            Tween:Pause()
            self = nil
        end
    end

    
    local Instances = { } do
        Instances.__index = Instances

        Instances.Create = function(self, Class, Properties)
            local NewItem = {
                Instance = InstanceNew(Class),
                Properties = Properties,
                Class = Class
            }

            setmetatable(NewItem, Instances)

            for Property, Value in NewItem.Properties do
                NewItem.Instance[Property] = Value
            end

            return NewItem
        end

        Instances.FadeItem = function(self, Visibility, Speed)
            local Item = self.Instance

            if Visibility == true then 
                Item.Visible = true
            end

            local Descendants = Item:GetDescendants()
            TableInsert(Descendants, Item)

            local NewTween

            for Index, Value in Descendants do 
                local TransparencyProperty = Tween:GetProperty(Value)

                if not TransparencyProperty then 
                    continue
                end

                if type(TransparencyProperty) == "table" then 
                    for _, Property in TransparencyProperty do 
                        NewTween = Tween:FadeItem(Value, Property, not Visibility, Speed)
                    end
                else
                    NewTween = Tween:FadeItem(Value, TransparencyProperty, not Visibility, Speed)
                end
            end
        end

        Instances.AddToTheme = function(self, Properties)
            if not self.Instance then 
                return
            end

            Library:AddToTheme(self, Properties)
        end

        Instances.ChangeItemTheme = function(self, Properties)
            if not self.Instance then 
                return
            end

            Library:ChangeItemTheme(self, Properties)
        end

        Instances.Connect = function(self, Event, Callback, Name)
            if not self.Instance then 
                return
            end

            if not self.Instance[Event] then 
                return
            end

            if IsMobile then
                if Event == "MouseButton1Down" or Event == "MouseButton1Click" then
                    Event = "TouchTap"
                elseif Event == "MouseButton2Down" or Event == "MouseButton2Click" then
                    Event = "TouchLongPress"
                end
            end

            return Library:Connect(self.Instance[Event], Callback, Name)
        end

        Instances.Tween = function(self, Info, Goal)
            if not self.Instance then 
                return
            end

            return Tween:Create(self, Info, Goal)
        end

        Instances.Disconnect = function(self, Name)
            if not self.Instance then 
                return
            end

            return Library:Disconnect(Name)
        end

        Instances.Clean = function(self)
            if not self.Instance then 
                return
            end

            self.Instance:Destroy()
            self = nil
        end

        Instances.MakeDraggable = function(self)
            if not self.Instance then 
                return
            end

            local Gui = self.Instance

            local Dragging = false 
            local DragStart
            local StartPosition 

            local Set = function(Input)
                local DragDelta = Input.Position - DragStart
                self:Tween(TweenInfo.new(0.16, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2New(StartPosition.X.Scale, StartPosition.X.Offset + DragDelta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + DragDelta.Y)})
            end

            local InputChanged

            self:Connect("InputBegan", function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    Dragging = true

                    DragStart = Input.Position
                    StartPosition = Gui.Position

                    if InputChanged then 
                        return
                    end

                    InputChanged = Input.Changed:Connect(function()
                        if Input.UserInputState == Enum.UserInputState.End then
                            Dragging = false

                            InputChanged:Disconnect()
                            InputChanged = nil
                        end
                    end)
                end
            end)

            Library:Connect(UserInputService.InputChanged, function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
                    if Dragging then
                        Set(Input)
                    end
                end
            end)

            return Dragging
        end

        Instances.MakeResizeable = function(self, Minimum, Maximum)
            if not self.Instance then 
                return
            end

            local Gui = self.Instance

            local Resizing = false 
            local Start = UDim2New()
            local Delta = UDim2New()
            local ResizeMax = Gui.Parent.AbsoluteSize - Gui.AbsoluteSize

            local ResizeButton = Instances:Create("ImageButton", {
				Parent = Gui,
                Image = "rbxassetid://",
				AnchorPoint = Vector2New(1, 1),
				BorderColor3 = FromRGB(0, 0, 0),
				Size = UDim2New(0, 6, 0, 6),
				Position = UDim2New(1, -4, 1, -4),
                Name = "\0",
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
                ZIndex = 5,
				AutoButtonColor = false,
                Visible = true,
			})  ResizeButton:AddToTheme({ImageColor3 = "Accent"})

            local InputChanged

            ResizeButton:Connect("InputBegan", function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then

                    Resizing = true

                    Start = Gui.Size - UDim2New(0, Input.Position.X, 0, Input.Position.Y)

                    if InputChanged then 
                        return
                    end

                    InputChanged = Input.Changed:Connect(function()
                        if Input.UserInputState == Enum.UserInputState.End then
                            Resizing = false

                            InputChanged:Disconnect()
                            InputChanged = nil
                        end
                    end)
                end
            end)

            Library:Connect(UserInputService.InputChanged, function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
                    if Resizing then
                        ResizeMax = Maximum or Gui.Parent.AbsoluteSize - Gui.AbsoluteSize

                        Delta = Start + UDim2New(0, Input.Position.X, 0, Input.Position.Y)
                        Delta = UDim2New(0, math.clamp(Delta.X.Offset, Minimum.X, ResizeMax.X), 0, math.clamp(Delta.Y.Offset, Minimum.Y, ResizeMax.Y))

                        Tween:Create(Gui, TweenInfo.new(0.17, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = Delta}, true)
                    end
                end
            end)

            return Resizing
        end

        Instances.OnHover = function(self, Function)
            if not self.Instance then 
                return
            end
            
            return Library:Connect(self.Instance.MouseEnter, Function)
        end

        Instances.OnHoverLeave = function(self, Function)
            if not self.Instance then 
                return
            end
            
            return Library:Connect(self.Instance.MouseLeave, Function)
        end

        Instances.Border = function(self, Type)
            if not self.Instance then 
                return
            end

            local Color = Type == "Border" and Library.Theme.Border or Type == "Outline" and Library.Theme.Outline
        
            local UIStroke = Instances:Create("UIStroke", {
                Parent = self.Instance,
                Color = Color,
                Thickness = 1,
                LineJoinMode = Enum.LineJoinMode.Miter
            })  UIStroke:AddToTheme({Color = Type})

            return UIStroke
        end

        Instances.TextBorder = function(self)
            if not self.Instance then 
                return
            end

            local UIStroke = Instances:Create("UIStroke", {
                Parent = self.Instance,
                Color = Library.Theme["Text Stroke"],
                Thickness = 1,
                Transparency = 0.6,
                LineJoinMode = Enum.LineJoinMode.Miter
            })  UIStroke:AddToTheme({Color = "Text Stroke"})

            return UIStroke
        end 
    end

	local CustomFont = { } do
        function CustomFont:New(Name, Weight, Style, Data)
            if not isfile(Library.Folders.Assets .. "/" .. Name .. ".ttf") then 
                writefile(Library.Folders.Assets .. "/" .. Name .. ".ttf", game:HttpGet(Data.Url))
            end

            local AssetId = getcustomasset(Library.Folders.Assets .. "/" .. Name .. ".ttf")

            local FontData = {
                name = Name,
                faces = { {
                    name = "Regular",
                    weight = Weight,
                    style = Style,
                    assetId = AssetId
                } }
            }
            writefile(Library.Folders.Assets .. "/" .. Name .. ".json", HttpService:JSONEncode(FontData))         
            return Font.new(getcustomasset(Library.Folders.Assets .. "/" .. Name .. ".json"))
        end
        function CustomFont:Get(Name)
            if isfile(Library.Folders.Assets .. "/" .. Name .. ".json") then
                return Font.new(getcustomasset(Library.Folders.Assets .. "/" .. Name .. ".json"))
            end
        end

        CustomFont:New("Monaco", 400, "Regular", {
            Url = "https://github.com/sametexe001/luas/raw/refs/heads/main/fonts/Monaco.ttf"
        })

        Library.Font = CustomFont:Get("Monaco")
    end


    Library.Holder = Instances:Create("ScreenGui", {
        Parent = gethui(),
        Name = "\0",
        ZIndexBehavior = Enum.ZIndexBehavior.Global,
        DisplayOrder = 2,
        ResetOnSpawn = false
    })

    Library.UnusedHolder = Instances:Create("ScreenGui", {
        Parent = gethui(),
        Name = "\0",
        ZIndexBehavior = Enum.ZIndexBehavior.Global,
        Enabled = false,
        ResetOnSpawn = false
    })

    Library.NotifHolder = Instances:Create("Frame", {
        Parent = Library.Holder.Instance,
        Name = "\0",
        BackgroundTransparency = 1,
        Size = UDim2New(0, 0, 1, 0),
        BorderColor3 = FromRGB(0, 0, 0),
        BorderSizePixel = 0,
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = FromRGB(255, 255, 255)
    })

    Instances:Create("UIListLayout", {
        Parent = Library.NotifHolder.Instance,
        Name = "\0",
        VerticalAlignment = Enum.VerticalAlignment.Bottom,
        Padding = UDimNew(0, 12),
        SortOrder = Enum.SortOrder.LayoutOrder
    })

    Instances:Create("UIPadding", {
        Parent = Library.NotifHolder.Instance,
        Name = "\0",
        PaddingTop = UDimNew(0, 12),
        PaddingBottom = UDimNew(0, 12),
        PaddingRight = UDimNew(0, 12),
        PaddingLeft = UDimNew(0, 12)
    })

    Library.Unload = function(self)
        for Index, Value in pairs(self.Connections) do 
            Value.Connection:Disconnect()
        end

        for Index, Value in pairs(self.Threads) do 
            coroutine.close(Value)
        end

        if self.Holder then 
            self.Holder:Clean()
        end

        Library = nil 
        getgenv().Library = nil

        UserInputService.MouseIconEnabled = true
    end

    Library.GetImage = function(self, Image)
        local ImageData = self.Images[Image]

        if not ImageData then 
            return
        end

        return getcustomasset(self.Folders.Assets .. "/" .. ImageData[1])
    end

    Library.Round = function(self, Number, Float)
        local Multiplier = 1 / (Float or 1)
        return MathFloor(Number * Multiplier) / Multiplier
    end

    Library.Thread = function(self, Function)
        local NewThread = coroutine.create(Function)
        
        coroutine.wrap(function()
            coroutine.resume(NewThread)
        end)()

        TableInsert(self.Threads, NewThread)
        return NewThread
    end
    
    Library.SafeCall = function(self, Function, ...)
        local Arguements = { ... }
        local Success, Result = pcall(Function, TableUnpack(Arguements))

        if not Success then
            warn(Result)
            return false
        end

        return Success
    end

    Library.Connect = function(self, Event, Callback, Name)
        Name = Name or StringFormat("Connection%s%s", self.UnnamedConnections + 1, HttpService:GenerateGUID(false))

        local NewConnection = {
            Event = Event,
            Callback = Callback,
            Name = Name,
            Connection = nil
        }

        Library:Thread(function()
            NewConnection.Connection = Event:Connect(Callback)
        end)

        TableInsert(self.Connections, NewConnection)
        return NewConnection
    end

    Library.Disconnect = function(self, Name)
        for _, Connection in self.Connections do 
            if Connection.Name == Name then
                Connection.Connection:Disconnect()
                break
            end
        end
    end

    Library.NextFlag = function(self)
        local FlagNumber = self.UnnamedFlags + 1
        return StringFormat("flag_number_%s_%s", FlagNumber, HttpService:GenerateGUID(false))
    end

    Library.AddToTheme = function(self, Item, Properties)
        Item = Item.Instance or Item 

        local ThemeData = {
            Item = Item,
            Properties = Properties,
        }

        for Property, Value in ThemeData.Properties do
            if type(Value) == "string" then
                Item[Property] = self.Theme[Value]
            else
                Item[Property] = Value()
            end
        end

        TableInsert(self.ThemeItems, ThemeData)
        self.ThemeMap[Item] = ThemeData
    end

	Library.ToRich = function(self, Text, Color)
        if not Color then
            return `<font color="rgb(255, 255, 255)">{Text}</font>`
        end

        if not Color.R or not Color.G or not Color.B then
            return `<font color="rgb(255, 255, 255)">{Text}</font>`
        end

		return `<font color="rgb({MathFloor(Color.R * 255)}, {MathFloor(Color.G * 255)}, {MathFloor(Color.B * 255)})">{Text}</font>`
	end

    Library.GetConfig = function(self)
        local c = {}
        for i, v in next, Library.Flags do
            if type(v) == "table" and v.Key then
                c[i] = {Key = tostring(v.Key), Mode = v.Mode, Toggled = v.Toggled}
            elseif type(v) == "table" and v.Color then
                c[i] = {Color = v.Color, Alpha = v.Alpha}
            else
                c[i] = v
            end
        end
        return game:GetService("HttpService"):JSONEncode(c)
    end

    Library.LoadConfig = function(self, g)
        local s, d = pcall(game:GetService("HttpService").JSONDecode, game:GetService("HttpService"), g)
        if not s then return end
        for i, v in next, d do
            local f = Library.SetFlags[i]
            if f then
                if type(v) == "table" and v.Color then
                    f(v.Color, v.Alpha)
                else
                    f(v)
                end
            end
        end
    end

    Library.DeleteConfig = function(self, Config)
        if isfile(Library.Folders.Configs .. "/" .. Config) then 
            delfile(Library.Folders.Configs .. "/" .. Config)
        end
    end

    Library.RefreshConfigsList = function(self, e)
        local l = {}
        for _, v in next, listfiles(Library.Folders.Configs) do
            local n = v:match("([^\\/]+)$")
            table.insert(l, n)
        end
        e:Refresh(l)
    end

    Library.ChangeItemTheme = function(self, Item, Properties)
        Item = Item.Instance or Item

        if not self.ThemeMap[Item] then 
            return
        end

        self.ThemeMap[Item].Properties = Properties
        self.ThemeMap[Item] = self.ThemeMap[Item]
    end

    Library.ChangeTheme = function(self, Theme, Color)
        self.Theme[Theme] = Color

        for _, Item in pairs(self.ThemeItems) do
            for Property, Value in Item.Properties do
                if type(Value) == "string" and Value == Theme then
                    Item.Item[Property] = Color
                elseif type(Value) == "function" then
                    Item.Item[Property] = Value()
                end
            end
        end
    end

    Library.IsMouseOverFrame = function(self, Frame, XOffset, YOffset)
        Frame = Frame.Instance
        XOffset = XOffset or 0 
        YOffset = YOffset or 0

        local MousePosition = Vector2New(Mouse.X + XOffset, Mouse.Y + YOffset)

        return MousePosition.X >= Frame.AbsolutePosition.X and MousePosition.X <= Frame.AbsolutePosition.X + Frame.AbsoluteSize.X 
        and MousePosition.Y >= Frame.AbsolutePosition.Y and MousePosition.Y <= Frame.AbsolutePosition.Y + Frame.AbsoluteSize.Y
    end

    Library.Lerp = function(self, Start, Finish, Time)
        return Start + (Finish - Start) * Time
    end

    
    local Components = { } do
        Components.Window = function(self, Data)
            local Items = { } do
                Items["Window"] = Instances:Create("Frame", {
                    Parent = Data.Parent.Instance,
                    Name = "\0",
                    AnchorPoint = Data.AnchorPoint,
                    Position = Data.Position,
                    BorderColor3 = FromRGB(12, 12, 12),
                    Size = Data.Size,
                    BorderSizePixel = 2,
                    BackgroundColor3 = FromRGB(14, 17, 15)
                })  Items["Window"]:AddToTheme({BackgroundColor3 = "Background", BorderColor3 = "Border"})

                
                local catBg = Instance.new("Frame")
                catBg.Name = "CatBg"
                catBg.Size = UDim2.new(1, 0, 1, 0)
                catBg.Position = UDim2.new(0, 0, 0, 0)
                catBg.BackgroundColor3 = Color3.fromRGB(238, 215, 100)
                catBg.BackgroundTransparency = 0.85
                catBg.ZIndex = 0
                catBg.Parent = Items["Window"].Instance

                local catImg = Instance.new("ImageLabel")
                catImg.Name = "CatImage"
                catImg.Size = UDim2.new(0, 120, 0, 120)
                catImg.Position = UDim2.new(0.7, 0, 0.6, 0)
                catImg.BackgroundTransparency = 1
                catImg.Image = "rbxassetid://18464767590"
                catImg.ImageTransparency = 0.15
                catImg.ZIndex = 1
                catImg.Parent = catBg

                
                local catImg2 = Instance.new("ImageLabel")
                catImg2.Name = "CatImage2"
                catImg2.Size = UDim2.new(0, 80, 0, 80)
                catImg2.Position = UDim2.new(0.15, 0, 0.2, 0)
                catImg2.BackgroundTransparency = 1
                catImg2.Image = "rbxassetid://18464767590"
                catImg2.ImageTransparency = 0.25
                catImg2.ZIndex = 1
                catImg2.Parent = catBg

                
                task.spawn(function()
                    local sparkleContainer = Instance.new("Frame")
                    sparkleContainer.Name = "Sparkles"
                    sparkleContainer.Size = UDim2.new(1, 0, 1, 0)
                    sparkleContainer.BackgroundTransparency = 1
                    sparkleContainer.ZIndex = 1
                    sparkleContainer.ClipsDescendants = true
                    sparkleContainer.Parent = catBg
                    local sparkles = {}
                    for i = 1, 12 do
                        local dot = Instance.new("Frame")
                        dot.Name = "Sparkle" .. i
                        dot.Size = UDim2.new(0, 4, 0, 4)
                        dot.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
                        dot.BackgroundTransparency = 0.3
                        dot.BorderSizePixel = 0
                        dot.ZIndex = 2
                        dot.Parent = sparkleContainer
                        local corner = Instance.new("UICorner")
                        corner.CornerRadius = UDim.new(1, 0)
                        corner.Parent = dot
                        sparkles[i] = {
                            dot = dot,
                            baseX = math.random() * 0.9 + 0.05,
                            baseY = math.random() * 0.9 + 0.05,
                            speed = math.random() * 0.5 + 0.3,
                            phase = math.random() * math.pi * 2,
                            amp = math.random() * 0.03 + 0.01
                        }
                    end
                    local t = 0
                    while sparkleContainer and sparkleContainer.Parent do
                        t = t + 0.03
                        for _, s in pairs(sparkles) do
                            local x = s.baseX + math.sin(t * s.speed + s.phase) * s.amp
                            local y = s.baseY + math.cos(t * s.speed * 0.7 + s.phase) * s.amp
                            s.dot.Position = UDim2.new(x, 0, y, 0)
                            s.dot.BackgroundTransparency = 0.3 + math.sin(t * 2 + s.phase) * 0.3
                        end
                        task.wait(0.03)
                    end
                end)

                
                task.spawn(function()
                    local catStickers = {}
                    local catIds = {
                        "rbxassetid://11176073582", 
                        "rbxassetid://8956925462",  
                        "rbxassetid://6050149849",  
                        "rbxassetid://9913176040",  
                        "rbxassetid://5009915812",  
                        "rbxassetid://6026124707",  
                        "rbxassetid://11104447804", 
                        "rbxassetid://8927509166",  
                        "rbxassetid://14292361849", 
                        "rbxassetid://9637009394",  
                        "rbxassetid://14171374117", 
                        "rbxassetid://9124486583",  
                        "rbxassetid://11609623865", 
                        "rbxassetid://13818855075", 
                        "rbxassetid://13747168088", 
                    }
                    
                    for i = 1, 10 do
                        local sticker = Instance.new("ImageLabel")
                        sticker.Name = "CatSticker" .. i
                        sticker.BackgroundTransparency = 1
                        local size = math.random(20, 50)
                        sticker.Size = UDim2.new(0, size, 0, size)
                        sticker.Image = catIds[math.random(1, #catIds)]
                        sticker.ImageTransparency = 0.7
                        sticker.ZIndex = 2
                        sticker.Parent = catBg
                        sticker.Rotation = math.random(-30, 30)
                        
                        local targetX = math.random() * 0.8 + 0.1
                        local targetY = math.random() * 0.8 + 0.1
                        local speed = math.random(30, 80)
                        
                        catStickers[i] = {
                            sticker = sticker,
                            targetX = targetX,
                            targetY = targetY,
                            speed = speed,
                            currentX = math.random() * 0.8 + 0.1,
                            currentY = math.random() * 0.8 + 0.1,
                        }
                    end
                    
                    local lastUpdate = tick()
                    while #catStickers > 0 do
                        local now = tick()
                        local dt = now - lastUpdate
                        lastUpdate = now
                        
                        for _, cs in ipairs(catStickers) do
                            if cs.sticker and cs.sticker.Parent then
                                cs.currentX = cs.currentX + (cs.targetX - cs.currentX) * dt * (cs.speed * 0.01)
                                cs.currentY = cs.currentY + (cs.targetY - cs.currentY) * dt * (cs.speed * 0.01)
                                
                                if math.abs(cs.targetX - cs.currentX) < 0.01 and math.abs(cs.targetY - cs.currentY) < 0.01 then
                                    cs.targetX = math.random() * 0.8 + 0.1
                                    cs.targetY = math.random() * 0.8 + 0.1
                                    cs.speed = math.random(30, 80)
                                end
                                
                                cs.sticker.Position = UDim2.new(cs.currentX, 0, cs.currentY, 0)
                            end
                        end
                        
                        task.wait(0.05)
                    end
                end)

                Items["Inline"] = Instances:Create("Frame", {
                    Parent = Items["Window"].Instance,
                    Name = "\0",
                    Position = UDim2New(0, 1, 0, 1),
                    BorderColor3 = FromRGB(27, 27, 27),
                    Size = UDim2New(1, -2, 1, -2),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(22, 22, 22)
                })  Items["Inline"]:AddToTheme({BackgroundColor3 = "Inline"})

                Items["Outline"] = Instances:Create("Frame", {
                    Parent = Items["Inline"].Instance,
                    Name = "\0",
                    Position = UDim2New(0, 0, 0, 0),
                    BorderColor3 = FromRGB(49, 49, 49),
                    Size = UDim2New(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(49, 49, 49)
                })  Items["Outline"]:AddToTheme({BackgroundColor3 = "Outline"})

                Items["HolderOutline"] = Instances:Create("Frame", {
                    Parent = Items["Outline"].Instance,
                    Name = "\0",
                    Position = UDim2New(0, 1, 0, 1),
                    BorderColor3 = FromRGB(20, 20, 20),
                    Size = UDim2New(1, -2, 1, -2),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(20, 20, 20)
                })  Items["HolderOutline"]:AddToTheme({BackgroundColor3 = "Background", BorderColor3 = "Background"})

                Items["Background"] = Instances:Create("Frame", {
                    Parent = Items["HolderOutline"].Instance,
                    Name = "\0",
                    Position = UDim2New(0, 1, 0, 1),
                    BorderColor3 = FromRGB(18, 18, 18),
                    Size = UDim2New(1, -2, 1, -2),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(18, 18, 18)
                })  Items["Background"]:AddToTheme({BackgroundColor3 = "Background"})

                Items["Topbar"] = Instances:Create("Frame", {
                    Parent = Items["Background"].Instance,
                    Name = "\0",
                    Size = UDim2New(1, 0, 0, 28),
                    BorderColor3 = FromRGB(18, 18, 18),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(28, 28, 28)
                })  Items["Topbar"]:AddToTheme({BackgroundColor3 = "Inline"})

                Items["TextBorder"] = Instances:Create("Frame", {
                    Parent = Items["Topbar"].Instance,
                    Name = "\0",
                    Position = UDim2New(0, 0, 1, -1),
                    Size = UDim2New(1, 0, 0, 1),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(18, 18, 18)
                })  Items["TextBorder"]:AddToTheme({BackgroundColor3 = "Border"})

                Items["TopbarText"] = Instances:Create("TextLabel", {
                    Parent = Items["Topbar"].Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    Text = Data.Title,
                    TextColor3 = FromRGB(180, 180, 180),
                    Position = UDim2New(0, 8, 0, 0),
                    Size = UDim2New(0, 0, 1, 0),
                    TextSize = 12,
                    BorderColor3 = FromRGB(0, 0, 0),
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    AutomaticSize = Enum.AutomaticSize.X,
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })  Items["TopbarText"]:TextBorder()
                 Items["TopbarText"]:AddToTheme({TextColor3 = "Text"})

                Items["TopbarGradient"] = Instances:Create("Frame", {
                    Parent = Items["Topbar"].Instance,
                    Name = "\0",
                    BorderSizePixel = 0,
                    Size = UDim2New(0.35, 0, 0, 1),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Position = UDim2New(0.325, 0, 1, -1),
                    BackgroundColor3 = FromRGB(52, 88, 40)
                })  Items["TopbarGradient"]:AddToTheme({BackgroundColor3 = "Accent"})

                Items["TopbarLine1"] = Instances:Create("Frame", {
                    Parent = Items["Topbar"].Instance,
                    Name = "\0",
                    Position = UDim2New(0, 0, 0, 0),
                    Size = UDim2New(0.325, 0, 0, 1),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(0, 0, 0)
                })

                Items["TopbarLine2"] = Instances:Create("Frame", {
                    Parent = Items["Topbar"].Instance,
                    Name = "\0",
                    Position = UDim2New(0.675, 0, 0, 0),
                    Size = UDim2New(0.325, 0, 0, 1),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(0, 0, 0)
                })

                Items["KeybindText"] = Instances:Create("TextLabel", {
                    Parent = Items["Topbar"].Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    Text = "[rightcontrol]",
                    Position = UDim2New(1, -8, 0, 0),
                    Size = UDim2New(0, 0, 1, 0),
                    TextColor3 = FromRGB(160, 160, 160),
                    TextSize = 12,
                    BorderColor3 = FromRGB(0, 0, 0),
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Right,
                    AutomaticSize = Enum.AutomaticSize.X,
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })  Items["KeybindText"]:TextBorder()
                 Items["KeybindText"]:AddToTheme({TextColor3 = "Text"})

                local MenuKeybind = Data.Keybind or Enum.KeyCode.RightControl

                Library:Connect(UserInputService.InputBegan, function(Input, GameProcessed) 
                    if Input.KeyCode == MenuKeybind and not GameProcessed then
                        Items["Window"].Instance.Visible = not Items["Window"].Instance.Visible

                        task.spawn(function()
                            if Items["Window"].Instance.Visible then 
                                Items["Window"]:FadeItem(true, Library.FadeSpeed)
                            end
                        end)

                        if not Items["Window"].Instance.Visible then
                            Items["Window"]:FadeItem(false, Library.FadeSpeed)
                        end
                    end
                end)

                Items["Topbar"]:MakeDraggable()

                local SizeX, SizeY = Data.Size.X.Offset, Data.Size.Y.Offset

                Items["Window"]:MakeResizeable(Vector2New(SizeX, SizeY), Vector2New(9999, 9999))

                return Items, Items["Window"].Instance
            end
        end

        Components.Tab = function(self, Data, Items, Window)
            Items["TabHolder"] = Instances:Create("Frame", {
                Parent = Items["Background"].Instance,
                Name = "\0",
                Position = UDim2New(0, 0, 0, 28),
                Size = UDim2New(0, 120, 1, -28),
                BorderColor3 = FromRGB(49, 49, 49),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRGB(20, 20, 20)
            })  Items["TabHolder"]:AddToTheme({BackgroundColor3 = "Inline", BorderColor3 = "Outline"})

            Items["TabInline"] = Instances:Create("Frame", {
                Parent = Items["TabHolder"].Instance,
                Name = "\0",
                Position = UDim2New(1, -1, 0, 5),
                Size = UDim2New(0, 1, 1, -10),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRGB(0, 0, 0)
            })

            Items["TabLayout"] = Instances:Create("UIListLayout", {
                Parent = Items["TabHolder"].Instance,
                Name = "\0",
                Padding = UDimNew(0, 5),
                SortOrder = Enum.SortOrder.LayoutOrder,
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            })

            Items["TabPadding"] = Instances:Create("UIPadding", {
                Parent = Items["TabHolder"].Instance,
                Name = "\0",
                PaddingTop = UDimNew(0, 8),
                PaddingBottom = UDimNew(0, 8)
            })

            Items["TabFrame"] = Instances:Create("Frame", {
                Parent = Items["Background"].Instance,
                Name = "\0",
                Position = UDim2New(0, 120, 0, 28),
                Size = UDim2New(1, -120, 1, -28),
                BorderColor3 = FromRGB(0, 0, 0),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                BackgroundColor3 = FromRGB(255, 255, 255)
            })

            local PageTable = { } 

            PageTable = {
                Button = function(self, Data)
                    local ButtonTable = { }

                    local Items = { } do
                        Items["Button"] = Instances:Create("TextButton", {
                            Parent = Items["TabHolder"].Instance,
                            Name = "\0",
                            FontFace = Library.Font,
                            Text = Data.Name,
                            TextColor3 = FromRGB(150, 150, 150),
                            Position = UDim2New(0, 5, 0, 0),
                            Size = UDim2New(1, -12, 0, 22),
                            TextSize = 12,
                            BorderColor3 = FromRGB(22, 22, 22),
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(22, 22, 22),
                            AutomaticSize = Enum.AutomaticSize.None,
                            TextXAlignment = Enum.TextXAlignment.Center,
                            AutoButtonColor = false
                        })  Items["Button"]:TextBorder()
                         Items["Button"]:AddToTheme({BackgroundColor3 = "Element", TextColor3 = "Text"})

                        Items["Button"]:Connect("MouseButton1Click", function()
                            for _, Page in pairs(Library.Pages) do 
                                if Page ~= ButtonTable then 
                                    if Page.Items["Page"] then
                                        Page.Items["Page"].Instance.Visible = false 
                                    end

                                    Page.Items["Button"].Instance.BackgroundColor3 = Library.Theme["Element"]
                                    Page.Items["GlowLine"].Instance.BackgroundTransparency = 1
                                end
                            end

                            if Items["Page"] then 
                                Items["Page"].Instance.Visible = true 
                            end

                            Items["GlowLine"].Instance.BackgroundTransparency = 0
                            Items["Button"].Instance.BackgroundColor3 = Library.Theme["Hovered Element"]
                        end)

                        Items["Button"]:OnHover(function()
                            if Library.CurrentPage ~= ButtonTable then
                                Items["Button"]:Tween(nil, {BackgroundColor3 = Library.Theme["Hovered Element"]})
                            end
                        end)

                        Items["Button"]:OnHoverLeave(function()
                            if Library.CurrentPage ~= ButtonTable then
                                Items["Button"]:Tween(nil, {BackgroundColor3 = Library.Theme["Element"]})
                            end
                        end)

                        Items["GlowLine"] = Instances:Create("Frame", {
                            Parent = Items["Button"].Instance,
                            Name = "\0",
                            Size = UDim2New(0, 2, 1, 0),
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(40, 40, 40)
                        })  Items["GlowLine"]:AddToTheme({BackgroundColor3 = "Accent"})
                    end

                    ButtonTable.Items = Items
                    ButtonTable.Name = Data.Name
                    ButtonTable.Type = "Page"
                    setmetatable(ButtonTable, Library.Pages)

                    TableInsert(Library.Pages, ButtonTable)
                    return ButtonTable
                end,

                Separator = function(self, Data)
                    local Items = { } do
                        Items["Separator"] = Instances:Create("Frame", {
                            Parent = Items["TabHolder"].Instance,
                            Name = "\0",
                            BorderColor3 = FromRGB(35, 35, 35),
                            Size = UDim2New(1, -20, 0, 1),
                            Position = UDim2New(0, 10, 0, 0),
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(35, 35, 35)
                        })  Items["Separator"]:AddToTheme({BackgroundColor3 = "Border"})
                    end
                end
            }

            return PageTable
        end

        Components.Section = function(self, Data, Tab)
            local SectionTable = { }
            local Items = { } do
                Items["Section"] = Instances:Create("Frame", {
                    Parent = Data.Tab.Items["Page"].Instance,
                    Name = "\0",
                    Position = Data.Side == "Left" and UDim2New(0, 8 + ((Data.SectionSize + 12) * 0), 0, 8) or UDim2New(0, 8 + ((Data.SectionSize + 12) * 1), 0, 8),
                    Size = UDim2New(0, Data.SectionSize, 0, 22),
                    BorderColor3 = FromRGB(28, 28, 28),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundColor3 = FromRGB(28, 28, 28)
                })  Items["Section"]:AddToTheme({BackgroundColor3 = "Page Background"})

                Items["SectionInline"] = Instances:Create("Frame", {
                    Parent = Items["Section"].Instance,
                    Name = "\0",
                    Position = UDim2New(0, 1, 0, 1),
                    Size = UDim2New(1, -2, 1, -2),
                    BorderColor3 = FromRGB(22, 22, 22),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(22, 22, 22)
                })  Items["SectionInline"]:AddToTheme({BackgroundColor3 = "Inline"})

                Items["SectionTopbar"] = Instances:Create("Frame", {
                    Parent = Items["SectionInline"].Instance,
                    Name = "\0",
                    Size = UDim2New(1, 0, 0, 24),
                    BorderColor3 = FromRGB(22, 22, 22),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(22, 22, 22)
                })  Items["SectionTopbar"]:AddToTheme({BackgroundColor3 = "Inline"})

                Items["SectionTopbarAccent"] = Instances:Create("Frame", {
                    Parent = Items["SectionTopbar"].Instance,
                    Name = "\0",
                    BorderSizePixel = 0,
                    Size = UDim2New(0.6, 0, 0, 1),
                    Position = UDim2New(0.2, 0, 1, -1),
                    BackgroundColor3 = FromRGB(100, 100, 100)
                })  Items["SectionTopbarAccent"]:AddToTheme({BackgroundColor3 = "Accent"})

                Items["SectionTitle"] = Instances:Create("TextLabel", {
                    Parent = Items["SectionTopbar"].Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    Text = Data.Name,
                    TextColor3 = FromRGB(160, 160, 160),
                    Position = UDim2New(0, 8, 0, 0),
                    Size = UDim2New(0, 0, 1, 0),
                    TextSize = 12,
                    BorderColor3 = FromRGB(0, 0, 0),
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    AutomaticSize = Enum.AutomaticSize.X,
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })  Items["SectionTitle"]:TextBorder()
                 Items["SectionTitle"]:AddToTheme({TextColor3 = "Text"})

                Items["SectionContentLayout"] = Instances:Create("UIListLayout", {
                    Parent = Items["SectionInline"].Instance,
                    Name = "\0",
                    Padding = UDimNew(0, 4),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })

                Items["SectionContentPadding"] = Instances:Create("UIPadding", {
                    Parent = Items["SectionInline"].Instance,
                    Name = "\0",
                    PaddingTop = UDimNew(0, 28),
                    PaddingBottom = UDimNew(0, 6),
                    PaddingLeft = UDimNew(0, 6),
                    PaddingRight = UDimNew(0, 6)
                })
            end

            local SectionContentTable = { }

            SectionContentTable = {
                Button = function(self, Data)
                    local Items = { } do
                        Items["Button"] = Instances:Create("TextButton", {
                            Parent = Items["SectionInline"].Instance,
                            Name = "\0",
                            FontFace = Library.Font,
                            Text = Data.Name,
                            TextColor3 = FromRGB(180, 180, 180),
                            Size = UDim2New(1, 0, 0, 20),
                            TextSize = 12,
                            BorderColor3 = FromRGB(28, 28, 28),
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(28, 28, 28),
                            TextXAlignment = Enum.TextXAlignment.Center,
                            AutoButtonColor = false
                        })  Items["Button"]:TextBorder()
                         Items["Button"]:AddToTheme({BackgroundColor3 = "Element", TextColor3 = "Text"})

                        Items["Button"]:Connect("MouseButton1Click", function()
                            if Data.Callback then 
                                Data.Callback()
                            end
                        end)

                        Items["Button"]:OnHover(function()
                            Items["Button"]:Tween(nil, {BackgroundColor3 = Library.Theme["Hovered Element"]})
                        end)

                        Items["Button"]:OnHoverLeave(function()
                            Items["Button"]:Tween(nil, {BackgroundColor3 = Library.Theme["Element"]})
                        end)
                    end
                end,

                Toggle = function(self, Data)
                    local ToggleTable = { }
                    ToggleTable.Toggled = Data.Default or false 

                    local Items = { } do
                        Items["Toggle"] = Instances:Create("Frame", {
                            Parent = Items["SectionInline"].Instance,
                            Name = "\0",
                            Size = UDim2New(1, 0, 0, 18),
                            BorderColor3 = FromRGB(0, 0, 0),
                            BorderSizePixel = 0,
                            BackgroundTransparency = 1,
                            BackgroundColor3 = FromRGB(255, 255, 255)
                        })

                        Items["ToggleText"] = Instances:Create("TextLabel", {
                            Parent = Items["Toggle"].Instance,
                            Name = "\0",
                            FontFace = Library.Font,
                            Text = Data.Name,
                            TextColor3 = FromRGB(180, 180, 180),
                            Position = UDim2New(0, 2, 0, 0),
                            Size = UDim2New(1, -24, 1, 0),
                            TextSize = 12,
                            BorderColor3 = FromRGB(0, 0, 0),
                            BackgroundTransparency = 1,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(255, 255, 255)
                        })  Items["ToggleText"]:TextBorder()
                         Items["ToggleText"]:AddToTheme({TextColor3 = "Text"})

                        Items["ToggleBox"] = Instances:Create("Frame", {
                            Parent = Items["Toggle"].Instance,
                            Name = "\0",
                            Position = UDim2New(1, -18, 0, 2),
                            Size = UDim2New(0, 14, 0, 14),
                            BorderColor3 = FromRGB(30, 30, 30),
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(28, 28, 28)
                        })  Items["ToggleBox"]:AddToTheme({BackgroundColor3 = "Element"})

                        Items["ToggleFill"] = Instances:Create("Frame", {
                            Parent = Items["ToggleBox"].Instance,
                            Name = "\0",
                            Position = UDim2New(0, 2, 0, 2),
                            Size = UDim2New(1, -4, 1, -4),
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(52, 88, 40)
                        })  Items["ToggleFill"]:AddToTheme({BackgroundColor3 = "Accent"})

                        Items["ToggleFill"].Instance.BackgroundTransparency = ToggleTable.Toggled and 0 or 1

                        local function ToggleCallback(Value)
                            ToggleTable.Toggled = Value
                            Items["ToggleFill"]:Tween(nil, {BackgroundTransparency = ToggleTable.Toggled and 0 or 1})

                            if Data.Flag then 
                                Library.Flags[Data.Flag] = ToggleTable.Toggled
                                if Data.Callback then 
                                    Data.Callback(ToggleTable.Toggled)
                                end
                            end
                        end

                        Items["Toggle"]:Connect("MouseButton1Click", function()
                            ToggleCallback(not ToggleTable.Toggled)
                        end)

                        Items["ToggleText"]:Connect("MouseButton1Click", function()
                            ToggleCallback(not ToggleTable.Toggled)
                        end)

                        if Data.Default then
                            ToggleCallback(Data.Default)
                        end
                    end

                    ToggleTable.Items = Items
                    return ToggleTable
                end,

                Slider = function(self, Data)
                    local SliderTable = { }
                    SliderTable.Value = Data.Default or Data.Min or 0 

                    local Items = { } do
                        Items["Slider"] = Instances:Create("Frame", {
                            Parent = Items["SectionInline"].Instance,
                            Name = "\0",
                            Size = UDim2New(1, 0, 0, 34),
                            BorderColor3 = FromRGB(0, 0, 0),
                            BorderSizePixel = 0,
                            BackgroundTransparency = 1,
                            BackgroundColor3 = FromRGB(255, 255, 255)
                        })

                        Items["SliderText"] = Instances:Create("TextLabel", {
                            Parent = Items["Slider"].Instance,
                            Name = "\0",
                            FontFace = Library.Font,
                            Text = Data.Name,
                            TextColor3 = FromRGB(180, 180, 180),
                            Position = UDim2New(0, 2, 0, 0),
                            Size = UDim2New(1, 0, 0, 14),
                            TextSize = 12,
                            BorderColor3 = FromRGB(0, 0, 0),
                            BackgroundTransparency = 1,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(255, 255, 255)
                        })  Items["SliderText"]:TextBorder()
                         Items["SliderText"]:AddToTheme({TextColor3 = "Text"})

                        Items["SliderValueText"] = Instances:Create("TextLabel", {
                            Parent = Items["SliderText"].Instance,
                            Name = "\0",
                            FontFace = Library.Font,
                            Text = tostring(SliderTable.Value),
                            Position = UDim2New(1, -40, 0, 0),
                            Size = UDim2New(0, 40, 1, 0),
                            TextColor3 = FromRGB(180, 180, 180),
                            TextSize = 12,
                            BorderColor3 = FromRGB(0, 0, 0),
                            BackgroundTransparency = 1,
                            TextXAlignment = Enum.TextXAlignment.Right,
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(255, 255, 255)
                        })  Items["SliderValueText"]:TextBorder()
                         Items["SliderValueText"]:AddToTheme({TextColor3 = "Text"})

                        Items["SliderBackground"] = Instances:Create("Frame", {
                            Parent = Items["Slider"].Instance,
                            Name = "\0",
                            Position = UDim2New(0, 2, 0, 20),
                            Size = UDim2New(1, -4, 0, 8),
                            BorderColor3 = FromRGB(28, 28, 28),
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(28, 28, 28)
                        })  Items["SliderBackground"]:AddToTheme({BackgroundColor3 = "Element"})

                        Items["SliderFill"] = Instances:Create("Frame", {
                            Parent = Items["SliderBackground"].Instance,
                            Name = "\0",
                            Size = UDim2New(0.5, 0, 1, 0),
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(52, 88, 40)
                        })  Items["SliderFill"]:AddToTheme({BackgroundColor3 = "Accent"})

                        Items["SliderDragging"] = false 

                        local function SliderCallback(Value)
                            SliderTable.Value = Value
                            Items["SliderValueText"].Instance.Text = tostring(Value)
                            Items["SliderFill"].Instance.Size = UDim2New((Value - Data.Min) / (Data.Max - Data.Min), 0, 1, 0)

                            if Data.Flag then 
                                Library.Flags[Data.Flag] = SliderTable.Value
                                if Data.Callback then 
                                    Data.Callback(SliderTable.Value)
                                end
                            end
                        end

                        Items["Slider"]:Connect("InputBegan", function(Input)
                            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                                Items["SliderDragging"] = true 
                            end
                        end)

                        Library:Connect(UserInputService.InputChanged, function(Input)
                            if Items["SliderDragging"] and Input.UserInputType == Enum.UserInputType.MouseMovement then
                                local MousePosition = Mouse.X - Items["SliderBackground"].Instance.AbsolutePosition.X
                                local SliderSize = Items["SliderBackground"].Instance.AbsoluteSize.X
                                local Value = math.clamp(Data.Min + (Data.Max - Data.Min) * (MousePosition / SliderSize), Data.Min, Data.Max)
                                
                                if Data.Precision then
                                    Value = math.round(Value * (10 ^ Data.Precision)) / (10 ^ Data.Precision)
                                else
                                    Value = math.round(Value)
                                end

                                SliderCallback(Value)
                            end
                        end)

                        Library:Connect(UserInputService.InputEnded, function(Input)
                            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                                Items["SliderDragging"] = false 
                            end
                        end)

                        SliderCallback(SliderTable.Value)
                    end

                    SliderTable.Items = Items
                    return SliderTable
                end,

                Dropdown = function(self, Data)
                    local DropdownTable = { }
                    DropdownTable.Value = Data.Default or nil
                    DropdownTable.Open = false

                    local Items = { } do
                        Items["Dropdown"] = Instances:Create("Frame", {
                            Parent = Items["SectionInline"].Instance,
                            Name = "\0",
                            Size = UDim2New(1, 0, 0, 34),
                            BorderColor3 = FromRGB(0, 0, 0),
                            BorderSizePixel = 0,
                            BackgroundTransparency = 1,
                            BackgroundColor3 = FromRGB(255, 255, 255)
                        })

                        Items["DropdownText"] = Instances:Create("TextLabel", {
                            Parent = Items["Dropdown"].Instance,
                            Name = "\0",
                            FontFace = Library.Font,
                            Text = Data.Name,
                            TextColor3 = FromRGB(180, 180, 180),
                            Position = UDim2New(0, 2, 0, 0),
                            Size = UDim2New(1, 0, 0, 14),
                            TextSize = 12,
                            BorderColor3 = FromRGB(0, 0, 0),
                            BackgroundTransparency = 1,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(255, 255, 255)
                        })  Items["DropdownText"]:TextBorder()
                         Items["DropdownText"]:AddToTheme({TextColor3 = "Text"})

                        Items["DropdownButton"] = Instances:Create("TextButton", {
                            Parent = Items["Dropdown"].Instance,
                            Name = "\0",
                            FontFace = Library.Font,
                            Text = Data.Default or "Select...",
                            TextColor3 = FromRGB(180, 180, 180),
                            Position = UDim2New(0, 2, 0, 18),
                            Size = UDim2New(1, -4, 0, 16),
                            TextSize = 12,
                            BorderColor3 = FromRGB(28, 28, 28),
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(28, 28, 28),
                            TextXAlignment = Enum.TextXAlignment.Left,
                            AutoButtonColor = false
                        })  Items["DropdownButton"]:TextBorder()
                         Items["DropdownButton"]:AddToTheme({BackgroundColor3 = "Element", TextColor3 = "Text"})

                        Items["DropdownIcon"] = Instances:Create("TextLabel", {
                            Parent = Items["DropdownButton"].Instance,
                            Name = "\0",
                            FontFace = Library.Font,
                            Text = "▼",
                            Position = UDim2New(1, -18, 0, 0),
                            Size = UDim2New(0, 18, 1, 0),
                            TextColor3 = FromRGB(180, 180, 180),
                            TextSize = 10,
                            BorderColor3 = FromRGB(0, 0, 0),
                            BackgroundTransparency = 1,
                            TextXAlignment = Enum.TextXAlignment.Center,
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(255, 255, 255)
                        })  Items["DropdownIcon"]:AddToTheme({TextColor3 = "Text"})

                        Items["DropdownFrame"] = Instances:Create("Frame", {
                            Parent = Items["Dropdown"].Instance,
                            Name = "\0",
                            Position = UDim2New(0, 2, 0, 36),
                            Size = UDim2New(1, -4, 0, 0),
                            BorderColor3 = FromRGB(28, 28, 28),
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(28, 28, 28),
                            Visible = false,
                            ClipsDescendants = true
                        })  Items["DropdownFrame"]:AddToTheme({BackgroundColor3 = "Element"})

                        Items["DropdownFrameLayout"] = Instances:Create("UIListLayout", {
                            Parent = Items["DropdownFrame"].Instance,
                            Name = "\0",
                            Padding = UDimNew(0, 2),
                            SortOrder = Enum.SortOrder.LayoutOrder
                        })

                        Items["DropdownFramePadding"] = Instances:Create("UIPadding", {
                            Parent = Items["DropdownFrame"].Instance,
                            Name = "\0",
                            PaddingTop = UDimNew(0, 4),
                            PaddingBottom = UDimNew(0, 4),
                            PaddingLeft = UDimNew(0, 4),
                            PaddingRight = UDimNew(0, 4)
                        })

                        local function DropdownCallback(Value)
                            DropdownTable.Value = Value
                            Items["DropdownButton"].Instance.Text = tostring(Value)
                            Items["DropdownFrame"].Instance.Visible = false
                            DropdownTable.Open = false
                            Items["DropdownIcon"].Instance.Text = "▼"

                            if Data.Flag then 
                                Library.Flags[Data.Flag] = DropdownTable.Value
                                if Data.Callback then 
                                    Data.Callback(DropdownTable.Value)
                                end
                            end
                        end

                        for _, Option in ipairs(Data.Options) do
                            local OptionButton = Instances:Create("TextButton", {
                                Parent = Items["DropdownFrame"].Instance,
                                Name = "\0",
                                FontFace = Library.Font,
                                Text = tostring(Option),
                                TextColor3 = FromRGB(180, 180, 180),
                                Size = UDim2New(1, 0, 0, 16),
                                TextSize = 12,
                                BorderColor3 = FromRGB(22, 22, 22),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(22, 22, 22),
                                TextXAlignment = Enum.TextXAlignment.Left,
                                AutoButtonColor = false
                            })  OptionButton:TextBorder()
                             OptionButton:AddToTheme({BackgroundColor3 = "Background", TextColor3 = "Text"})

                            OptionButton:Connect("MouseButton1Click", function()
                                DropdownCallback(Option)
                            end)

                            OptionButton:OnHover(function()
                                OptionButton:Tween(nil, {BackgroundColor3 = Library.Theme["Hovered Element"]})
                            end)

                            OptionButton:OnHoverLeave(function()
                                OptionButton:Tween(nil, {BackgroundColor3 = Library.Theme["Background"]})
                            end)
                        end

                        Items["DropdownButton"]:Connect("MouseButton1Click", function()
                            DropdownTable.Open = not DropdownTable.Open
                            Items["DropdownFrame"].Instance.Visible = DropdownTable.Open
                            Items["DropdownIcon"].Instance.Text = DropdownTable.Open and "▲" or "▼"
                            
                            local OptionCount = #Data.Options
                            local FrameHeight = math.min(OptionCount * 18 + 8, 120)
                            Items["DropdownFrame"].Instance.Size = UDim2New(1, -4, 0, FrameHeight)
                        end)

                        if Data.Default then
                            DropdownCallback(Data.Default)
                        end
                    end

                    DropdownTable.Items = Items
                    return DropdownTable
                end,

                Textbox = function(self, Data)
                    local TextboxTable = { }
                    TextboxTable.Value = Data.Default or ""

                    local Items = { } do
                        Items["Textbox"] = Instances:Create("Frame", {
                            Parent = Items["SectionInline"].Instance,
                            Name = "\0",
                            Size = UDim2New(1, 0, 0, 42),
                            BorderColor3 = FromRGB(0, 0, 0),
                            BorderSizePixel = 0,
                            BackgroundTransparency = 1,
                            BackgroundColor3 = FromRGB(255, 255, 255)
                        })

                        Items["TextboxLabel"] = Instances:Create("TextLabel", {
                            Parent = Items["Textbox"].Instance,
                            Name = "\0",
                            FontFace = Library.Font,
                            Text = Data.Name,
                            TextColor3 = FromRGB(180, 180, 180),
                            Position = UDim2New(0, 2, 0, 0),
                            Size = UDim2New(1, 0, 0, 14),
                            TextSize = 12,
                            BorderColor3 = FromRGB(0, 0, 0),
                            BackgroundTransparency = 1,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(255, 255, 255)
                        })  Items["TextboxLabel"]:TextBorder()
                         Items["TextboxLabel"]:AddToTheme({TextColor3 = "Text"})

                        Items["TextboxInput"] = Instances:Create("TextBox", {
                            Parent = Items["Textbox"].Instance,
                            Name = "\0",
                            FontFace = Library.Font,
                            Text = Data.Default or "",
                            PlaceholderText = Data.Placeholder or "Enter text...",
                            TextColor3 = FromRGB(180, 180, 180),
                            PlaceholderColor3 = FromRGB(100, 100, 100),
                            Position = UDim2New(0, 2, 0, 18),
                            Size = UDim2New(1, -4, 0, 18),
                            TextSize = 12,
                            BorderColor3 = FromRGB(28, 28, 28),
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(28, 28, 28),
                            TextXAlignment = Enum.TextXAlignment.Left,
                            ClearTextOnFocus = false
                        })  Items["TextboxInput"]:TextBorder()
                         Items["TextboxInput"]:AddToTheme({BackgroundColor3 = "Element", TextColor3 = "Text"})

                        Items["TextboxInput"]:Connect("FocusLost", function(EnterPressed)
                            TextboxTable.Value = Items["TextboxInput"].Instance.Text

                            if Data.Flag then 
                                Library.Flags[Data.Flag] = TextboxTable.Value
                                if Data.Callback then 
                                    Data.Callback(TextboxTable.Value, EnterPressed)
                                end
                            end
                        end)
                    end

                    TextboxTable.Items = Items
                    return TextboxTable
                end,

                Keybind = function(self, Data)
                    local KeybindTable = { }
                    KeybindTable.Key = Data.Default or nil
                    KeybindTable.Mode = Data.Mode or "Toggle"
                    KeybindTable.Toggled = false

                    local Items = { } do
                        Items["Keybind"] = Instances:Create("Frame", {
                            Parent = Items["SectionInline"].Instance,
                            Name = "\0",
                            Size = UDim2New(1, 0, 0, 18),
                            BorderColor3 = FromRGB(0, 0, 0),
                            BorderSizePixel = 0,
                            BackgroundTransparency = 1,
                            BackgroundColor3 = FromRGB(255, 255, 255)
                        })

                        Items["KeybindText"] = Instances:Create("TextLabel", {
                            Parent = Items["Keybind"].Instance,
                            Name = "\0",
                            FontFace = Library.Font,
                            Text = Data.Name,
                            TextColor3 = FromRGB(180, 180, 180),
                            Position = UDim2New(0, 2, 0, 0),
                            Size = UDim2New(1, -50, 1, 0),
                            TextSize = 12,
                            BorderColor3 = FromRGB(0, 0, 0),
                            BackgroundTransparency = 1,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(255, 255, 255)
                        })  Items["KeybindText"]:TextBorder()
                         Items["KeybindText"]:AddToTheme({TextColor3 = "Text"})

                        Items["KeybindButton"] = Instances:Create("TextButton", {
                            Parent = Items["Keybind"].Instance,
                            Name = "\0",
                            FontFace = Library.Font,
                            Text = KeybindTable.Key and KeybindTable.Key.Name or "None",
                            TextColor3 = FromRGB(180, 180, 180),
                            Position = UDim2New(1, -48, 0, 1),
                            Size = UDim2New(0, 46, 0, 16),
                            TextSize = 11,
                            BorderColor3 = FromRGB(28, 28, 28),
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(28, 28, 28),
                            TextXAlignment = Enum.TextXAlignment.Center,
                            AutoButtonColor = false
                        })  Items["KeybindButton"]:TextBorder()
                         Items["KeybindButton"]:AddToTheme({BackgroundColor3 = "Element", TextColor3 = "Text"})

                        local Listening = false

                        Items["KeybindButton"]:Connect("MouseButton1Click", function()
                            Listening = true
                            Items["KeybindButton"].Instance.Text = "..."
                        end)

                        Library:Connect(UserInputService.InputBegan, function(Input, GameProcessed)
                            if Listening and Input.UserInputType == Enum.UserInputType.Keyboard then
                                Listening = false
                                KeybindTable.Key = Input.KeyCode
                                Items["KeybindButton"].Instance.Text = Input.KeyCode.Name

                                if Data.Flag then 
                                    Library.Flags[Data.Flag] = {Key = KeybindTable.Key, Mode = KeybindTable.Mode, Toggled = KeybindTable.Toggled}
                                end
                            elseif Input.KeyCode == KeybindTable.Key and not GameProcessed then
                                if KeybindTable.Mode == "Toggle" then
                                    KeybindTable.Toggled = not KeybindTable.Toggled
                                    if Data.Callback then
                                        Data.Callback(KeybindTable.Toggled)
                                    end
                                elseif KeybindTable.Mode == "Hold" then
                                    KeybindTable.Toggled = true
                                    if Data.Callback then
                                        Data.Callback(true)
                                    end
                                end

                                if Data.Flag then 
                                    Library.Flags[Data.Flag] = {Key = KeybindTable.Key, Mode = KeybindTable.Mode, Toggled = KeybindTable.Toggled}
                                end
                            end
                        end)

                        Library:Connect(UserInputService.InputEnded, function(Input)
                            if Input.KeyCode == KeybindTable.Key and KeybindTable.Mode == "Hold" then
                                KeybindTable.Toggled = false
                                if Data.Callback then
                                    Data.Callback(false)
                                end

                                if Data.Flag then 
                                    Library.Flags[Data.Flag] = {Key = KeybindTable.Key, Mode = KeybindTable.Mode, Toggled = KeybindTable.Toggled}
                                end
                            end
                        end)
                    end

                    KeybindTable.Items = Items
                    return KeybindTable
                end,

                Colorpicker = function(self, Data)
                    local ColorpickerTable = { }
                    ColorpickerTable.Color = Data.Default or Color3.fromRGB(255, 255, 255)
                    ColorpickerTable.Alpha = Data.Alpha or 0

                    local Items = { } do
                        Items["Colorpicker"] = Instances:Create("Frame", {
                            Parent = Items["SectionInline"].Instance,
                            Name = "\0",
                            Size = UDim2New(1, 0, 0, 18),
                            BorderColor3 = FromRGB(0, 0, 0),
                            BorderSizePixel = 0,
                            BackgroundTransparency = 1,
                            BackgroundColor3 = FromRGB(255, 255, 255)
                        })

                        Items["ColorpickerText"] = Instances:Create("TextLabel", {
                            Parent = Items["Colorpicker"].Instance,
                            Name = "\0",
                            FontFace = Library.Font,
                            Text = Data.Name,
                            TextColor3 = FromRGB(180, 180, 180),
                            Position = UDim2New(0, 2, 0, 0),
                            Size = UDim2New(1, -24, 1, 0),
                            TextSize = 12,
                            BorderColor3 = FromRGB(0, 0, 0),
                            BackgroundTransparency = 1,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(255, 255, 255)
                        })  Items["ColorpickerText"]:TextBorder()
                         Items["ColorpickerText"]:AddToTheme({TextColor3 = "Text"})

                        Items["ColorpickerBox"] = Instances:Create("TextButton", {
                            Parent = Items["Colorpicker"].Instance,
                            Name = "\0",
                            Position = UDim2New(1, -18, 0, 2),
                            Size = UDim2New(0, 14, 0, 14),
                            BorderSizePixel = 0,
                            BackgroundColor3 = ColorpickerTable.Color,
                            AutoButtonColor = false,
                            Text = ""
                        })

                        Items["ColorpickerFrame"] = Instances:Create("Frame", {
                            Parent = Items["Colorpicker"].Instance,
                            Name = "\0",
                            Position = UDim2New(0, 0, 0, 20),
                            Size = UDim2New(0, 160, 0, 160),
                            BorderColor3 = FromRGB(28, 28, 28),
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(28, 28, 28),
                            Visible = false,
                            ZIndex = 10
                        })  Items["ColorpickerFrame"]:AddToTheme({BackgroundColor3 = "Element"})

                        Items["SaturationFrame"] = Instances:Create("ImageLabel", {
                            Parent = Items["ColorpickerFrame"].Instance,
                            Name = "\0",
                            Position = UDim2New(0, 8, 0, 8),
                            Size = UDim2New(0, 120, 0, 120),
                            BorderSizePixel = 0,
                            Image = Library:GetImage("Saturation"),
                            BackgroundColor3 = Color3.fromRGB(255, 0, 0),
                            ZIndex = 10
                        })

                        Items["HueFrame"] = Instances:Create("ImageLabel", {
                            Parent = Items["ColorpickerFrame"].Instance,
                            Name = "\0",
                            Position = UDim2New(0, 134, 0, 8),
                            Size = UDim2New(0, 16, 0, 120),
                            BorderSizePixel = 0,
                            Image = Library:GetImage("Hue"),
                            ZIndex = 10
                        })

                        local H, S, V = ColorpickerTable.Color:ToHSV()

                        Items["ColorpickerBox"]:Connect("MouseButton1Click", function()
                            Items["ColorpickerFrame"].Instance.Visible = not Items["ColorpickerFrame"].Instance.Visible
                        end)

                        local ColorDragging = false
                        local HueDragging = false

                        Items["SaturationFrame"]:Connect("InputBegan", function(Input)
                            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                                ColorDragging = true
                            end
                        end)

                        Items["HueFrame"]:Connect("InputBegan", function(Input)
                            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                                HueDragging = true
                            end
                        end)

                        Library:Connect(UserInputService.InputChanged, function(Input)
                            if ColorDragging and Input.UserInputType == Enum.UserInputType.MouseMovement then
                                local MousePos = Vector2New(Mouse.X, Mouse.Y)
                                local FramePos = Items["SaturationFrame"].Instance.AbsolutePosition
                                local FrameSize = Items["SaturationFrame"].Instance.AbsoluteSize
                                S = math.clamp((MousePos.X - FramePos.X) / FrameSize.X, 0, 1)
                                V = 1 - math.clamp((MousePos.Y - FramePos.Y) / FrameSize.Y, 0, 1)
                                ColorpickerTable.Color = Color3.fromHSV(H, S, V)
                                Items["ColorpickerBox"].Instance.BackgroundColor3 = ColorpickerTable.Color
                                Items["SaturationFrame"].Instance.BackgroundColor3 = Color3.fromHSV(H, 1, 1)

                                if Data.Callback then
                                    Data.Callback(ColorpickerTable.Color, ColorpickerTable.Alpha)
                                end

                                if Data.Flag then
                                    Library.Flags[Data.Flag] = {Color = ColorpickerTable.Color, Alpha = ColorpickerTable.Alpha}
                                end
                            elseif HueDragging and Input.UserInputType == Enum.UserInputType.MouseMovement then
                                local MousePos = Vector2New(Mouse.Y, 0)
                                local FramePos = Items["HueFrame"].Instance.AbsolutePosition
                                local FrameSize = Items["HueFrame"].Instance.AbsoluteSize
                                H = math.clamp((MousePos.X - FramePos.Y) / FrameSize.Y, 0, 1)
                                ColorpickerTable.Color = Color3.fromHSV(H, S, V)
                                Items["ColorpickerBox"].Instance.BackgroundColor3 = ColorpickerTable.Color
                                Items["SaturationFrame"].Instance.BackgroundColor3 = Color3.fromHSV(H, 1, 1)

                                if Data.Callback then
                                    Data.Callback(ColorpickerTable.Color, ColorpickerTable.Alpha)
                                end

                                if Data.Flag then
                                    Library.Flags[Data.Flag] = {Color = ColorpickerTable.Color, Alpha = ColorpickerTable.Alpha}
                                end
                            end
                        end)

                        Library:Connect(UserInputService.InputEnded, function(Input)
                            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                                ColorDragging = false
                                HueDragging = false
                            end
                        end)

                        if Data.Flag then
                            Library.Flags[Data.Flag] = {Color = ColorpickerTable.Color, Alpha = ColorpickerTable.Alpha}
                        end
                    end

                    ColorpickerTable.Items = Items
                    return ColorpickerTable
                end
            }

            SectionTable.Items = Items
            SectionTable.Name = Data.Name
            SectionTable.Type = "Section"
            setmetatable(SectionTable, Library.Sections)

            return SectionTable, SectionContentTable
        end
    end

    function Library:CreateWindow(Data)
        Data = Data or { }
        Data.Title = Data.Title or "Window"
        Data.Size = Data.Size or UDim2New(0, 550, 0, 400)
        Data.Position = Data.Position or UDim2New(0.5, -275, 0.5, -200)
        Data.Keybind = Data.Keybind or Enum.KeyCode.RightControl

        local Items, Window = Components:Window(Data)
        local PageTable = Components:Tab(Data, Items, Window)

        local WindowTable = {
            Items = Items,
            Window = Window,
            CreatePage = function(self, Data)
                local Page = PageTable:Button(Data)

                Page.Items["Page"] = Instances:Create("ScrollingFrame", {
                    Parent = Items["TabFrame"].Instance,
                    Name = "\0",
                    Position = UDim2New(0, 0, 0, 0),
                    Size = UDim2New(1, 0, 1, 0),
                    BorderColor3 = FromRGB(0, 0, 0),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    ScrollBarThickness = 2,
                    ScrollBarImageColor3 = FromRGB(52, 88, 40),
                    CanvasSize = UDim2New(0, 0, 0, 0),
                    AutomaticCanvasSize = Enum.AutomaticSize.Y,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })

                Page.Items["PageLayout"] = Instances:Create("UIListLayout", {
                    Parent = Page.Items["Page"].Instance,
                    Name = "\0",
                    Padding = UDimNew(0, 8),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })

                Page.Items["PagePadding"] = Instances:Create("UIPadding", {
                    Parent = Page.Items["Page"].Instance,
                    Name = "\0",
                    PaddingTop = UDimNew(0, 8),
                    PaddingBottom = UDimNew(0, 8),
                    PaddingLeft = UDimNew(0, 8),
                    PaddingRight = UDimNew(0, 8)
                })

                Page.Items["Page"].Instance.Visible = false

                if #Library.Pages == 1 then
                    Page.Items["Page"].Instance.Visible = true
                    Page.Items["Button"].Instance.BackgroundColor3 = Library.Theme["Hovered Element"]
                    Page.Items["GlowLine"].Instance.BackgroundTransparency = 0
                    Library.CurrentPage = Page
                end

                return Page
            end,

            CreateSection = function(self, Data)
                Data.Tab = Data.Tab or Library.CurrentPage
                Data.Name = Data.Name or "Section"
                Data.Side = Data.Side or "Left"
                Data.SectionSize = Data.SectionSize or 200

                local Section, Content = Components:Section(Data, Data.Tab)
                return Content
            end
        }

        return WindowTable
    end
end

getgenv().Library = Library

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

local function MonitorChar(c) if c then CurrentHum=c:WaitForChild("Humanoid",10) end end
MonitorChar(LocalPlayer.Character)
LocalPlayer.CharacterAdded:Connect(MonitorChar)

return Library