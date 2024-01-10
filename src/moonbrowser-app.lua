--[[--
 @package   MoonBrowser
 @filename  moonbrowser-app.lua
 @version   2.0
 @autor     Diaz Urbaneja Victor Diego Alejandro <sodomon2@gmail.com>
 @date      06.02.2021 08:50:42 -04
]]

content = Gtk.Box {
    orientation = 'VERTICAL',
    Gtk.Box {
        expand = false,
        orientation = 'HORIZONTAL',
        Gtk.Button {
            relief = Gtk.ReliefStyle.NONE,
            Gtk.Image { icon_name = 'back-symbolic' },
            on_clicked = function() webview:go_back() end
        },
        Gtk.Button {
            relief = Gtk.ReliefStyle.NONE,
            Gtk.Image { icon_name = 'next-symbolic' },
            on_clicked = function() webview:go_forward() end
        },
        Gtk.Button {
            relief = Gtk.ReliefStyle.NONE,
            Gtk.Image { icon_name = 'reload-symbolic' },
            on_clicked = function() webview:reload() end
        },
        Gtk.Separator(),
        Gtk.Entry { id = 'entry_url', expand = true },
        Gtk.Separator(),
        Gtk.Button {
            relief = Gtk.ReliefStyle.NONE,
            Gtk.Image { icon_name = 'gtk-home-symbolic' },
            on_clicked = function()
                webview:load_uri('http://duckduckgo.com')
                content.child.entry_url.text = 'duckduckgo.com'
            end
        }
    },
    Gtk.Box {
        orientation = 'VERTICAL',
        Gtk.ScrolledWindow { id = 'scroll', expand = true }
   },
}

main_window	= Gtk.Window {
	width_request	= 800,
	height_request	= 600,
    content
}

function moonbrowser_init()
    webview:load_uri('http://duckduckgo.com')
    main_window.child.entry_url.text = 'http://duckduckgo.com'
end

function webview:on_load_changed(event)
	print(event)
	if event == 'STARTED' then
		main_window.title = 'Loading Page'
	elseif event == 'FINISHED' then
		main_window.title = webview:get_title()
	end
end

function main_window:on_destroy()
    Gtk.main_quit()
end

function main_window.child.entry_url:on_key_release_event(event)
	if ( event.keyval == Gdk.KEY_Return ) then
		webview:load_uri('http://' and 'https://' .. main_window.child.entry_url.text)
	end
end

function app:on_activate()
	main_window.child.scroll:add(webview)
    main_window.child.entry_url.set_icon_from_icon_name(
        main_window.child.entry_url,
        1,
        'find-symbolic'
    )
    main_window:show_all()
    moonbrowser_init()
	self:add_window(main_window)
end

