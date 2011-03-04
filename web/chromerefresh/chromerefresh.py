#!/usr/bin/env python


# this copied from: http://www.emacswiki.org/emacs/SaveAndReloadBrowser 
# thanks!

import chrome_remote_shell

shell = chrome_remote_shell.open(port=9222)

response = shell.request('DevToolsService', command='list_tabs')
tabs = response['data']
first_tab = tabs[0]
tab_id = first_tab[0]

shell.request('V8Debugger', destination=tab_id, command='evaluate_javascript', data="window.location = window.location;")

