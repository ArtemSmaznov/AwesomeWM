local gears = require('gears')
local beautiful = require('beautiful')

local filesystem = require('gears.filesystem')
local dpi = require('beautiful').xresources.apply_dpi

local theme_dir = filesystem.get_configuration_dir() .. '/theme'
local system_dir = '/usr/share/awesome/themes/default/layouts/'

local titlebar_theme = "stoplight"
local titlebar_icon_path = theme_dir .. "/icons/titlebar/" .. titlebar_theme .. '/'
local tip = titlebar_icon_path

local user_preferences = require('configuration.preferences')

local theme = {}

-- Defaults
theme.font = user_preferences.theme.font or 'SF Pro Text Regular 10'
theme.font_bold = user_preferences.theme.font_bold or 'SF Pro Text Bold 10'
theme.icon_theme = user_preferences.theme.icons or 'Papirus-Dark'
theme.wallpaper = user_preferences.theme.wallpaper or '/usr/share/backgrounds/linuxmint-ulyssa/rbooth_floral.jpg'

-- Colorscheme
theme.system_black_dark = '#3D4C5F'
theme.system_black_light = '#56687E'

theme.system_red_dark = '#EE4F84'
theme.system_red_light = '#F48FB1'

theme.system_green_dark = '#53E2AE'
theme.system_green_light = '#A1EFD3'

theme.system_yellow_dark = '#F1FF52'
theme.system_yellow_light = '#F1FA8C'

theme.system_blue_dark = '#6498EF' 
theme.system_blue_light = '#92B6F4'

theme.system_magenta_dark = '#985EFF'
theme.system_magenta_light = '#BD99FF'

theme.system_cyan_dark = '#24D1E7'
theme.system_cyan_light = '#87DFEB'

theme.system_white_dark = '#E5E5E5'
theme.system_white_light = '#F8F8F2'


-- Accent color
theme.accent = theme.system_white_dark

-- Background color
theme.background = '#000000' .. '66'

-- Transparent
theme.transparent = '#00000000'

-- Awesome icon
theme.awesome_icon = theme_dir .. '/icons/awesome.svg'

local awesome_overrides = function(theme)

  theme.dir = theme_dir

  theme.icons = theme.dir .. '/icons/'

  -- Wallpaper
  -- theme.wallpaper = wallpaper_dir .. 'linuxmint-tricia/rbates_mam_tor.jpg'

  -- Foreground

  theme.font = 'SF Pro Text Regular 10'
  theme.title_font = 'SF Pro Text Bold 14'


  theme.fg_normal = '#ffffffde'
  theme.fg_focus = '#e4e4e4'
  theme.fg_urgent = '#CC9393'

  theme.bat_fg_critical = '#232323'

  theme.bg_normal = theme.background
  theme.bg_focus = '#5a5a5a'
  theme.bg_urgent = '#3F3F3F'

  -- System tray

  theme.bg_systray = theme.background
  theme.systray_icon_spacing = dpi(5)

  -- Titlebar

  theme.titlebar_size = dpi(34)
  theme.titlebar_bg_focus = beautiful.gtk.get_theme_variables().bg_color:sub(1,7) .. '66'
  theme.titlebar_bg_normal = beautiful.gtk.get_theme_variables().base_color:sub(1,7) .. '66'
  theme.titlebar_fg_focus = beautiful.gtk.get_theme_variables().fg_color .. '00'
  theme.titlebar_fg_normal = beautiful.gtk.get_theme_variables().fg_color .. '00'

  -- Close Button
  theme.titlebar_close_button_normal = tip .. "close_normal.svg"
  theme.titlebar_close_button_focus  = tip .. "close_focus.svg"

  -- Minimize Button
  theme.titlebar_minimize_button_normal = tip .. "minimize_normal.svg"
  theme.titlebar_minimize_button_focus  = tip .. "minimize_focus.svg"

  -- Ontop Button
  theme.titlebar_ontop_button_normal_inactive = tip .. "ontop_normal_inactive.svg"
  theme.titlebar_ontop_button_focus_inactive  = tip .. "ontop_focus_inactive.svg"
  theme.titlebar_ontop_button_normal_active = tip .. "ontop_normal_active.svg"
  theme.titlebar_ontop_button_focus_active  = tip .. "ontop_focus_active.svg"

  -- Sticky Button
  theme.titlebar_sticky_button_normal_inactive = tip .. "sticky_normal_inactive.svg"
  theme.titlebar_sticky_button_focus_inactive  = tip .. "sticky_focus_inactive.svg"
  theme.titlebar_sticky_button_normal_active = tip .. "sticky_normal_active.svg"
  theme.titlebar_sticky_button_focus_active  = tip .. "sticky_focus_active.svg"

  -- Floating Button
  theme.titlebar_floating_button_normal_inactive = tip .. "floating_normal_inactive.svg"
  theme.titlebar_floating_button_focus_inactive  = tip .. "floating_focus_inactive.svg"
  theme.titlebar_floating_button_normal_active = tip .. "floating_normal_active.svg"
  theme.titlebar_floating_button_focus_active  = tip .. "floating_focus_active.svg"

  -- Maximized Button
  theme.titlebar_maximized_button_normal_inactive = tip .. "maximized_normal_inactive.svg"
  theme.titlebar_maximized_button_focus_inactive  = tip .. "maximized_focus_inactive.svg"
  theme.titlebar_maximized_button_normal_active = tip .. "maximized_normal_active.svg"
  theme.titlebar_maximized_button_focus_active  = tip .. "maximized_focus_active.svg"

  -- Hovered Close Button
  theme.titlebar_close_button_normal_hover = tip .. "close_normal_hover.svg"
  theme.titlebar_close_button_focus_hover  = tip .. "close_focus_hover.svg"

  -- Hovered Minimize Buttin
  theme.titlebar_minimize_button_normal_hover = tip .. "minimize_normal_hover.svg"
  theme.titlebar_minimize_button_focus_hover  = tip .. "minimize_focus_hover.svg"

  -- Hovered Ontop Button
  theme.titlebar_ontop_button_normal_inactive_hover = tip .. "ontop_normal_inactive_hover.svg"
  theme.titlebar_ontop_button_focus_inactive_hover  = tip .. "ontop_focus_inactive_hover.svg"
  theme.titlebar_ontop_button_normal_active_hover = tip .. "ontop_normal_active_hover.svg"
  theme.titlebar_ontop_button_focus_active_hover  = tip .. "ontop_focus_active_hover.svg"

  -- Hovered Sticky Button
  theme.titlebar_sticky_button_normal_inactive_hover = tip .. "sticky_normal_inactive_hover.svg"
  theme.titlebar_sticky_button_focus_inactive_hover  = tip .. "sticky_focus_inactive_hover.svg"
  theme.titlebar_sticky_button_normal_active_hover = tip .. "sticky_normal_active_hover.svg"
  theme.titlebar_sticky_button_focus_active_hover  = tip .. "sticky_focus_active_hover.svg"

  -- Hovered Floating Button
  theme.titlebar_floating_button_normal_inactive_hover = tip .. "floating_normal_inactive_hover.svg"
  theme.titlebar_floating_button_focus_inactive_hover  = tip .. "floating_focus_inactive_hover.svg"
  theme.titlebar_floating_button_normal_active_hover = tip .. "floating_normal_active_hover.svg"
  theme.titlebar_floating_button_focus_active_hover  = tip .. "floating_focus_active_hover.svg"

  -- Hovered Maximized Button
  theme.titlebar_maximized_button_normal_inactive_hover = tip .. "maximized_normal_inactive_hover.svg"
  theme.titlebar_maximized_button_focus_inactive_hover  = tip .. "maximized_focus_inactive_hover.svg"
  theme.titlebar_maximized_button_normal_active_hover = tip .. "maximized_normal_active_hover.svg"
  theme.titlebar_maximized_button_focus_active_hover  = tip .. "maximized_focus_active_hover.svg"

  -- UI Groups

  theme.groups_title_bg = "#ffffff" .. "15"
  theme.groups_bg = "#ffffff" .. "10"
  theme.groups_radius = dpi(9)

  -- Client Decorations

  -- Borders
  theme.border_focus = beautiful.gtk.get_theme_variables().bg_color
  theme.border_normal = beautiful.gtk.get_theme_variables().base_color
  theme.border_marked = '#CC9393'
  theme.border_width = dpi(0)
  theme.border_radius = dpi(0)

  -- Decorations
  theme.client_radius = dpi(9)
  theme.useless_gap = dpi(4)

  -- Menu
  theme.menu_font = "SF Pro Text Regular 11"
  theme.menu_submenu = '' -- ➤

  theme.menu_height = dpi(34)
  theme.menu_width = dpi(200)
  theme.menu_border_width = dpi(20)
  theme.menu_bg_focus = theme.accent .. 'CC'

  theme.menu_bg_normal =  theme.background:sub(1,7) .. '33'
  theme.menu_fg_normal = '#ffffff'
  theme.menu_fg_focus = '#ffffff'
  theme.menu_border_color = theme.background:sub(1,7) .. '5C'

  -- Tooltips

  theme.tooltip_bg = theme.background
  theme.tooltip_border_color = theme.transparent
  theme.tooltip_border_width = 0
  theme.tooltip_gaps = dpi(15)
  -- theme.tooltip_shape = function(cr, w, h)
  --   gears.shape.rounded_rect(cr, w, h, dpi(6))
  -- end

  -- Separators

  theme.separator_color = '#f2f2f244'

  -- Layoutbox icons

  theme.layout_max = system_dir .. 'maxw.png'
  theme.layout_tile = system_dir .. 'tilew.png'
  theme.layout_dwindle = system_dir .. 'dwindlew.png'
  theme.layout_floating = system_dir .. 'floatingw.png'
  theme.layout_fullscreen = system_dir .. 'fullscreenw.png'

  theme.layout_tilebottom = system_dir .. 'tilebottomw.png'
  theme.layout_tileleft = system_dir .. 'tileleftw.png'
  theme.layout_tiletop = system_dir .. 'tiletopw.png'
  theme.layout_fairv = system_dir .. 'fairvw.png'
  theme.layout_fairh = system_dir .. 'fairhw.png'
  theme.layout_spiral = system_dir .. 'spiralw.png'
  theme.layout_magnifier = system_dir .. 'magnifierw.png'
  theme.layout_cornernw = system_dir .. 'cornernww.png'
  theme.layout_cornerne = system_dir .. 'cornernew.png'
  theme.layout_cornersw = system_dir .. 'cornersww.png'
  theme.layout_cornerse = system_dir .. 'cornersew.png'

  -- Taglist

  theme.taglist_bg_empty = theme.background .. '99'
  theme.taglist_bg_occupied =  '#ffffff' .. '1A'
  theme.taglist_bg_urgent = "#E91E63" .. '99'
  theme.taglist_bg_focus = theme.background
  theme.taglist_spacing = dpi(0)

  -- Tasklist

  theme.tasklist_font = 'SF Pro Text Regular 10'
  theme.tasklist_bg_normal = '#000000' .. '20'
  theme.tasklist_bg_focus = theme.background
  theme.tasklist_bg_urgent = "#E91E63" .. '99'
  theme.tasklist_fg_focus = '#DDDDDD'
  theme.tasklist_fg_urgent = "#ffffff"
  theme.tasklist_fg_normal = '#AAAAAA'

  -- Notification

  theme.notification_position = 'top_right'
  theme.notification_bg = theme.transparent
  theme.notification_margin = dpi(5)
  theme.notification_border_width = dpi(0)
  theme.notification_border_color = theme.transparent
  theme.notification_spacing = dpi(0)
  theme.notification_icon_resize_strategy = 'center'
  theme.notification_icon_size = dpi(32)

  -- Client Snap Theme

  theme.snap_bg = theme.background
  theme.snap_shape = gears.shape.rectangle
  theme.snap_border_width = dpi(15)

  -- Hotkey popup

  theme.hotkeys_font = 'SF Pro Text Bold'
  theme.hotkeys_description_font   = 'SF Pro Text Regular Regular'
  theme.hotkeys_bg = theme.background
  theme.hotkeys_group_margin = dpi(20)

end

return {
  theme = theme,
  awesome_overrides = awesome_overrides
}