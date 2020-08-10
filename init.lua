#!/usr/bin/env lua
--[[--
 @package   moonbrowser
 @filename  init.lua  
 @version   1.0
 @author    Diaz Urbaneja Victor Diego Alejandro <sodomon2@gmail.com> 
 @date      10.08.2020 17:01:07 -04
--]]
lgi       = require 'lgi'             -- La libreria que me permitira usar GTK
GObject   = lgi.GObject               -- Parte de lgi
GLib      = lgi.GLib                  -- para el treeview
Gdk       = lgi.Gdk                   -- para las keybindings
Gtk       = lgi.require('Gtk', '3.0') -- El objeto GTK
Webkit    = lgi.require('WebKit2')

assert    = lgi.assert
builder   = Gtk.Builder()

assert(builder:add_from_file('moonbrowser.ui'))
ui = builder.objects
local webview = Webkit.WebView.new()

function ui.menu_about:on_button_press_event()
    ui.about_window:run()
    ui.about_window:hide()
end

function ui.menu_quit:on_button_press_event()
    Gtk.main_quit()
end

function ui.main_window:on_destroy()
    Gtk.main_quit()
end


webview:load_uri('')
ui.entry_url:grab_focus()

function ui.entry_url:on_key_release_event(env)
    if ( env.keyval  == Gdk.KEY_Return ) then
      webview:load_uri('http://' .. ui.entry_url.text)
      ui.url.label = webview:get_uri()
    end
end

function ui.btn_forward:on_clicked()
    webview:go_forward()
end

function ui.btn_back:on_clicked()
    webview:go_back()
end

function ui.btn_reload:on_clicked()
    webview:reload()
end

ui.main_window:show_all(ui.scroll:add(webview))
Gtk.main()
