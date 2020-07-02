-- An applications menu
-- Required depends: awesome-freedesktop

local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local apps = require('configuration.apps')
local menubar = require("menubar")

local hotkeys_popup = require('awful.hotkeys_popup').widget

local icons = require('theme.icons')

local editor_cmd = apps.default.terminal .. " -e " .. (os.getenv("EDITOR") or "nano")

local function is_module_available(name)
	if package.loaded[name] then
		return true
	else
		for _, searcher in ipairs(package.searchers or package.loaders) do
			local loader = searcher(name)
			if type(loader) == 'function' then
				package.preload[name] = loader
				return true
			end
		end
		return false
	end
end

-- Create a launcher widget and a main menu
local default_app_menu = {
	{
		"Terminal",
		apps.default.terminal,
		menubar.utils.lookup_icon("utilities-terminal")
	},
	{
		"Web browser",
		apps.default.web_browser,
		menubar.utils.lookup_icon("webbrowser-app")
	},
	{
		"File Manager",
		apps.default.file_manager,
		menubar.utils.lookup_icon("system-file-manager")
	},
	{
		"Text Editor",
		apps.default.text_editor,
		menubar.utils.lookup_icon("accessories-text-editor")
	},
	{
		"---------------"
	}
}

local awesome_menu = {
	{ 
		"Hotkeys",
		function()
		hotkeys_popup.show_help(nil, awful.screen.focused())
		end,
		menubar.utils.lookup_icon("keyboard")
	},
	{ 
		"Edit config",
		editor_cmd .. " " .. awesome.conffile,
		menubar.utils.lookup_icon("accessories-text-editor")
	},
	{ 
		"Restart",
		awesome.restart,
		menubar.utils.lookup_icon("system-restart")
	},
	{
		"Quit",
		function() awesome.quit() end,
		menubar.utils.lookup_icon("system-log-out")
	}
}

-- Screenshot menu
local screenshot_menu = {
	{
		"Full",
		function()
			gears.timer.start_new(
				0.1,
				function()
					require('module.screenshot')('full')
				end
			)
		end,
		menubar.utils.lookup_icon("accessories-screenshot")
	},
	{
		"Area",
		function() 
			gears.timer.start_new(
				0.1,
				function()
					require('module.screenshot')('area')
				end,
				menubar.utils.lookup_icon("accessories-screenshot")
			)
		end,
		menubar.utils.lookup_icon("accessories-screenshot")
	}
}

local tools_menu = {
	{
		"---------------"
	},
	{
		"Awesome",
		awesome_menu,
		beautiful.awesome_icon
	},
	{
		"Take a Screenshot",
		screenshot_menu,
		menubar.utils.lookup_icon("accessories-screenshot")
	},
	{
		"End Session",
		function()
			awesome.emit_signal("module::exit_screen_show")
		end,
		icons.other.shutdown
	}
}

-- A menu generated by awesome-freedesktop
-- https://github.com/lcpz/awesome-freedesktop

if is_module_available("freedesktop") then
	local freedesktop = require("freedesktop")

	mymainmenu = freedesktop.menu.build(
		{
			-- Not actually the size, but the quality of the icon
			icon_size = 48,

			before = default_app_menu,
			after = tools_menu
		}
	)
	mylauncher = awful.widget.launcher(
		{
			image = beautiful.awesome_icon,
			menu = mymainmenu
		}
	)

else
	mymainmenu = awful.menu({

		items = {
			{
				"Instructions",
				function()
					local naughty = require('naughty')

					local open_github = naughty.action {
						name = 'Open Github Page',
					   	icon_only = false,
					}

					open_github:connect_signal('invoked', function()
						awful.spawn.easy_async_with_shell("xdg-open https://github.com/lcpz/awesome-freedesktop")
					end)

					local open_aur = naughty.action {
						name = 'Open AUR Page',
					   	icon_only = false,
					}

					open_aur:connect_signal('invoked', function()
						awful.spawn.easy_async_with_shell("xdg-open https://aur.archlinux.org/packages/awesome-freedesktop-git/")
					end)

					naughty.notification({
						title = 'A dependency is missing!',
						message = "You need to install <b>awesome-freedesktop.</b> " ..
						"This will populate the menu with your installed applications automatically. " ..
						"It is also available in AUR, it is called <b>awesome-freedesktop-git</b>.",
						app_name = 'System Notification',
						timeout = 0,
						urgency = 'normal',
						actions = { open_github, open_aur }
					})
				end,
				menubar.utils.lookup_icon("accessories-text-editor")
			},
			{
				"Awesome",
				awesome_menu,
				beautiful.awesome_icon
			},
			{
				"Take a Screenshot",
				screenshot_menu,
				menubar.utils.lookup_icon("accessories-screenshot")
			},
			{
				"End Session",
				function()
					awesome.emit_signal("module::exit_screen_show")
				end,
				menubar.utils.lookup_icon("system-shutdown") 
			}
		}
	})
end