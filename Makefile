LUASTATIC = luastatic
LUA = lua5.1
LUA_INCLUDE = /usr/include/$(LUA)

PREFIX = /usr/local
BINDIR = $(PREFIX)/bin
DESKTOP_DIR = $(PREFIX)/share/applications

SRC = moonbrowser.lua src/moonbrowser-app.lua

moonbrowser:
	$(LUASTATIC) $(SRC) -l$(LUA) -I$(LUA_INCLUDE)
	strip moonbrowser

install:
	install -Dm775 moonbrowser $(DESTDIR)$(BINDIR)/moonbrowser
	install -Dm775 moonbrowser.desktop $(DESTDIR)$(DESKTOP_DIR)/moonbrowser.desktop

uninstall:
	rm -rf $(DESTDIR)$(BINDIR)/moonbrowser
	rm -rf $(DESTDIR)$(DESKTOP_DIR)/moonbrowser.desktop

clean:
	rm -rf moonbrowser.luastatic.c
	rm -rf moonbrowser

.PHONY: moonbrowser