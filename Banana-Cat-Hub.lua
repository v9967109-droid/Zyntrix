-- Banana Cat Hub | Outdated link notice

local TITLE      = "Banana Cat Hub"
local SUBTITLE   = "V2 - Blox Fruits"
local HEADING    = "This link is outdated"
local BODY       = "Join our Discord server to get the new link.\nButton below."
local BUTTON     = "Join Discord"
local INVITE     = "https://discord.gg/fm8QvdqpJX"
local INVITECODE = "fm8QvdqpJX"

local Players          = game:GetService("Players")
local TweenService     = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService      = game:GetService("HttpService")
local StarterGui       = game:GetService("StarterGui")

local GUI_NAME = "BananaOutdatedUI"

-- remove an older copy
pcall(function()
	local old = (gethui and gethui() or game:GetService("CoreGui")):FindFirstChild(GUI_NAME)
	if old then old:Destroy() end
end)
pcall(function()
	local old = Players.LocalPlayer.PlayerGui:FindFirstChild(GUI_NAME)
	if old then old:Destroy() end
end)

local gui = Instance.new("ScreenGui")
gui.Name = GUI_NAME
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.DisplayOrder = 2147483647
local okParent = pcall(function()
	gui.Parent = (gethui and gethui()) or game:GetService("CoreGui")
end)
if not okParent or not gui.Parent then
	gui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
end

local function make(class, props, parent)
	local obj = Instance.new(class)
	for k, v in pairs(props) do
		obj[k] = v
	end
	obj.Parent = parent
	return obj
end

-- ===== window =====
local window = make("Frame", {
	Name = "Window",
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.new(0.5, 0, 0.5, 0),
	Size = UDim2.new(0, 380, 0, 262),
	BackgroundColor3 = Color3.fromRGB(11, 12, 17),
	BorderSizePixel = 0,
}, gui)
make("UICorner", { CornerRadius = UDim.new(0, 18) }, window)
make("UIStroke", { Color = Color3.fromRGB(44, 48, 66), Thickness = 1 }, window)

local targetScale = 1
pcall(function()
	local cam = workspace.CurrentCamera
	if cam and cam.ViewportSize.X < 900 then targetScale = 0.85 end
end)
local scale = make("UIScale", { Scale = targetScale * 0.8 }, window)

-- header
make("TextLabel", {
	BackgroundTransparency = 1,
	Position = UDim2.new(0, 20, 0, 10),
	Size = UDim2.new(1, -80, 0, 22),
	Font = Enum.Font.GothamBold,
	TextSize = 17,
	TextXAlignment = Enum.TextXAlignment.Left,
	TextColor3 = Color3.fromRGB(255, 255, 255),
	Text = TITLE,
}, window)
make("TextLabel", {
	BackgroundTransparency = 1,
	Position = UDim2.new(0, 20, 0, 31),
	Size = UDim2.new(1, -80, 0, 16),
	Font = Enum.Font.GothamMedium,
	TextSize = 12,
	TextXAlignment = Enum.TextXAlignment.Left,
	TextColor3 = Color3.fromRGB(140, 145, 165),
	Text = SUBTITLE,
}, window)

local close = make("TextButton", {
	AnchorPoint = Vector2.new(1, 0),
	Position = UDim2.new(1, -14, 0, 12),
	Size = UDim2.new(0, 30, 0, 30),
	BackgroundColor3 = Color3.fromRGB(28, 30, 42),
	AutoButtonColor = false,
	Font = Enum.Font.GothamBold,
	TextSize = 14,
	TextColor3 = Color3.fromRGB(200, 205, 220),
	Text = "X",
}, window)
make("UICorner", { CornerRadius = UDim.new(0, 9) }, close)

make("Frame", {
	Position = UDim2.new(0, 0, 0, 56),
	Size = UDim2.new(1, 0, 0, 1),
	BackgroundColor3 = Color3.fromRGB(34, 37, 52),
	BorderSizePixel = 0,
}, window)

-- warning badge
local badge = make("Frame", {
	AnchorPoint = Vector2.new(0.5, 0),
	Position = UDim2.new(0.5, 0, 0, 72),
	Size = UDim2.new(0, 44, 0, 44),
	BackgroundColor3 = Color3.fromRGB(255, 170, 0),
	BorderSizePixel = 0,
}, window)
make("UICorner", { CornerRadius = UDim.new(1, 0) }, badge)
make("TextLabel", {
	BackgroundTransparency = 1,
	Size = UDim2.new(1, 0, 1, 0),
	Font = Enum.Font.GothamBold,
	TextSize = 26,
	TextColor3 = Color3.fromRGB(11, 12, 17),
	Text = "!",
}, badge)

-- text
make("TextLabel", {
	BackgroundTransparency = 1,
	AnchorPoint = Vector2.new(0.5, 0),
	Position = UDim2.new(0.5, 0, 0, 124),
	Size = UDim2.new(1, -40, 0, 24),
	Font = Enum.Font.GothamBold,
	TextSize = 19,
	TextColor3 = Color3.fromRGB(255, 255, 255),
	Text = HEADING,
}, window)
make("TextLabel", {
	BackgroundTransparency = 1,
	AnchorPoint = Vector2.new(0.5, 0),
	Position = UDim2.new(0.5, 0, 0, 152),
	Size = UDim2.new(1, -50, 0, 40),
	Font = Enum.Font.GothamMedium,
	TextSize = 14,
	TextWrapped = true,
	TextColor3 = Color3.fromRGB(190, 192, 205),
	Text = BODY,
}, window)

-- blue Discord button
local BLUE       = Color3.fromRGB(47, 111, 237)
local BLUE_HOVER = Color3.fromRGB(70, 130, 250)
local BLUE_DOWN  = Color3.fromRGB(34, 88, 200)

local button = make("TextButton", {
	AnchorPoint = Vector2.new(0.5, 0),
	Position = UDim2.new(0.5, 0, 0, 204),
	Size = UDim2.new(1, -40, 0, 42),
	BackgroundColor3 = BLUE,
	AutoButtonColor = false,
	Font = Enum.Font.GothamBold,
	TextSize = 15,
	TextColor3 = Color3.fromRGB(255, 255, 255),
	Text = BUTTON,
}, window)
make("UICorner", { CornerRadius = UDim.new(0, 12) }, button)

local function tween(obj, time, props)
	pcall(function()
		TweenService:Create(obj, TweenInfo.new(time, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), props):Play()
	end)
end

button.MouseEnter:Connect(function() tween(button, 0.15, { BackgroundColor3 = BLUE_HOVER }) end)
button.MouseLeave:Connect(function() tween(button, 0.15, { BackgroundColor3 = BLUE }) end)
button.MouseButton1Down:Connect(function() tween(button, 0.08, { BackgroundColor3 = BLUE_DOWN }) end)
button.MouseButton1Up:Connect(function() tween(button, 0.12, { BackgroundColor3 = BLUE_HOVER }) end)

close.MouseEnter:Connect(function() tween(close, 0.15, { BackgroundColor3 = Color3.fromRGB(200, 60, 70) }) end)
close.MouseLeave:Connect(function() tween(close, 0.15, { BackgroundColor3 = Color3.fromRGB(28, 30, 42) }) end)

-- ===== open the Discord invite =====
local function notify(text)
	pcall(function()
		StarterGui:SetCore("SendNotification", { Title = TITLE, Text = text, Duration = 4 })
	end)
end

local function openDiscordInvite()
	local req = (syn and syn.request) or (http and http.request) or http_request or request
		or (fluxus and fluxus.request)
	if not req then
		return false
	end
	local ok, res = pcall(function()
		return req({
			Url = "http://127.0.0.1:6463/rpc?v=1",
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json",
				["Origin"] = "https://discord.com",
			},
			Body = HttpService:JSONEncode({
				cmd = "INVITE_BROWSER",
				args = { code = INVITECODE },
				nonce = HttpService:GenerateGUID(false),
			}),
		})
	end)
	return ok and res ~= nil and (res.StatusCode == nil or (res.StatusCode >= 200 and res.StatusCode < 300))
end

local busy = false
button.MouseButton1Click:Connect(function()
	if busy then return end
	busy = true
	button.Text = "Opening Discord..."
	local opened = openDiscordInvite()
	local copied = false
	pcall(function()
		if setclipboard then
			setclipboard(INVITE)
			copied = true
		elseif toclipboard then
			toclipboard(INVITE)
			copied = true
		end
	end)
	if opened then
		button.Text = "Discord opened!"
		notify("Discord invite opened.")
	elseif copied then
		button.Text = "Link copied! Paste it in your browser"
		notify("Discord link copied: " .. INVITE)
	else
		button.Text = INVITE
		notify(INVITE)
	end
	task.wait(3)
	button.Text = BUTTON
	busy = false
end)

-- ===== close =====
local function destroy()
	tween(scale, 0.18, { Scale = targetScale * 0.8 })
	task.wait(0.18)
	gui:Destroy()
end
close.MouseButton1Click:Connect(destroy)

-- ===== drag =====
do
	local dragging, dragStart, startPos
	window.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			local p = input.Position
			local rel = p.Y - window.AbsolutePosition.Y
			if rel <= 56 * scale.Scale then
				dragging, dragStart, startPos = true, p, window.Position
			end
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local d = input.Position - dragStart
			window.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
		end
	end)
	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false
		end
	end)
end

-- open animation
TweenService:Create(scale, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = targetScale }):Play()
