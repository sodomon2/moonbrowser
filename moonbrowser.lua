#!/usr/bin/env lua
--[[--
 @package   MoonBrowser
 @filename  moonbrowser.lua  
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
webview   = Webkit.WebView.new()

assert    = lgi.assert
builder   = Gtk.Builder()

assert(builder:add_from_file('moonbrowser.ui'))
ui = builder.objects

require('src.moonbrowser-app')

ui.main_window:show_all(ui.scroll:add(webview))
Gtk.main()
