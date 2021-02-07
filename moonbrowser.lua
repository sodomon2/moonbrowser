#!/usr/bin/env lua
--[[--
 @package   MoonBrowser
 @filename  moonbrowser.lua
 @version   2.0
 @author    Diaz Urbaneja Victor Diego Alejandro <sodomon2@gmail.com>
 @date      06.02.2021 08:50:42 -04
--]]

lgi		  = require("lgi")
Gtk		  = lgi.require('Gtk', '3.0')
Gdk		  = lgi.require('Gdk', '3.0')
GLib	  = lgi.require('GLib', '2.0')
Webkit    = lgi.require('WebKit2','4.0')

app       = Gtk.Application()
webview   = Webkit.WebView()

-- MoonBrowser
require('src.moonbrowser-app')

app:run()