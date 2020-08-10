-- require('module.airplane')

local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')
local naughty = require('naughty')
local beautiful = require('beautiful')

local dpi = require('beautiful').xresources.apply_dpi

local icons = require('theme.icons')
local tooltip = require('widget.system-elements.tooltip')
local qs_toggle = require('widget.system-elements.quick-settings-toggle')

local widget = wibox.widget {
		id = 'icon',
		widget = wibox.widget.imagebox,
		resize = true
}

local widget_button = qs_toggle(widget)
tooltip(widget_button, 'Airplane Mode')

function widget:update_toggle(module_is_on)
  if module_is_on then
    self.image = icons.symbolic.network.airplane_mode_on
    widget_button.bg = beautiful.system_black_light
  else
    self.image = icons.symbolic.network.airplane_mode_off
    widget_button.bg = beautiful.transparent
  end
  widget.on = module_is_on
end

function widget:turn_on()
  self.on = true
  widget:update_toggle(true)
  awesome.emit_signal('module::airplane:enable')
end

function widget:turn_off()
  self.on = false
  widget:update_toggle(false)
  awesome.emit_signal('module::airplane:disable')
end

function widget:toggle()
  if not self.on then
    widget:turn_on()
  else
    widget:turn_off()
  end
end

widget:update_toggle(widget.on)

widget_button:buttons(
  gears.table.join(
    awful.button(
      {},
      1,
      nil,
      function()
        widget:toggle()
      end
    )
  )
)

awesome.connect_signal(
	'module::airplane:status:reply', 
  function(state) 
    widget:update_toggle(state)
  end
)

awesome.connect_signal(
	'modules:update', 
  function() 
    awesome.emit_signal('module::airplane:status:request')
  end
)

return widget_button