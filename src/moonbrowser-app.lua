--[[--
 @package   MoonBrowser
 @filename  moonbrowser-app.lua
 @version   1.0
 @autor     Diaz Urbaneja Victor Diego Alejandro <sodomon2@gmail.com>
 @date      23.12.2020 22:09:44 -04
]]

webview = Webkit.WebView.new()

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

ui.entry_url:grab_focus()

function ui.entry_url:on_key_release_event(env)
    if ( env.keyval  == Gdk.KEY_Return ) then
      webview:load_uri('http://' .. ui.entry_url.text)
      ui.main_window.title = webview:get_title()
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

function ui.btn_home:on_clicked()
    webview:load_uri('http://google.com')
    ui.entry_url.text = 'google.com'
end
