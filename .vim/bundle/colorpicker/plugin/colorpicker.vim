"Script: VIM Color Picker
"Version: 0.1
"Copyright: Copyright (C) 2012  Abimael Martinez,
"           Copyright (C) 2010  Fabien Loison
"Licence: GPLv3+ (see the "COPYING" file for more information)
"
"DEPENDENCIES:
"  For working, this script need:
"    * VIM 7.x with Python support
"    * PyGTK 2.x
"
"INSTALL:
"  Just copy "color_picker.vim" in your pluggin directory.
"
"USE:
"  When your are in insert mode or visual mode, press the <F5> button.
"  The color picker dialog appear, select a color and validate.
"


imap <F5> <Esc>:ColorPickerInsert<Cr>a
vmap <F5> <Esc>:ColorPickerSelect<Cr>

command ColorPickerInsert call ColorPicker("insert")
command ColorPickerSelect call ColorPicker("select")

function! ColorPicker(has_selection)
python << EOF
import pygtk, gtk, vim, re, os
pygtk.require('2.0')

color_dlg = gtk.ColorSelectionDialog("Vim Color Picker")
color_sel = color_dlg.colorsel

b = vim.current.buffer
w = vim.current.window

has_selection = vim.eval('a:has_selection')
endline = False
nextline= ""
orig_selection = ""


if has_selection == "select":
    # gets start and end of selection
    (row, column) = b.mark('<')

    # backup register and copy selection to it
    vim.command("let reg_a = @a")
    vim.command('normal! gv"ad')
    #modified
    selection   = vim.eval("getreg('a')")
    #original
    orig_selection = vim.eval("getreg('a')")

    # restore register contents
    vim.command("let @a = reg_a")

    # remove trailing whitespace and parse
    if re.match(".*\n$", selection):
        endline = True
        if len(b) == row:
            nextline = b[len(b) - 1]
        else:
            nextline = b[row]

    selection = selection.strip()
    selected_color = gtk.gdk.color_parse(selection)

    # set the dialog current and old colors
    color_sel.set_previous_color(selected_color)
    color_sel.set_current_color(selected_color)
else:
    selection = ""
    (row, column) = w.cursor
    column += 1


row = row - 1
current_row = b[row]

response = color_dlg.run()
if  response == gtk.RESPONSE_OK:
    color = color_sel.get_current_color()

    #Convert to 8bit channels
    red     = color.red   * 255 / 65535
    green   = color.green * 255 / 65535
    blue    = color.blue  * 255 / 65535

    #Convert to hex strings
    red = str(hex(red))[2:]
    green = str(hex(green))[2:]
    blue = str(hex(blue))[2:]
    #Format
    if len(red) == 1:
        red = "0%s" % red
    if len(green) == 1:
        green = "0%s" % green
    if len(blue) == 1:
        blue = "0%s" % blue

    #Merge
    color = "#%s%s%s" % (red, green, blue)

    #Insert
    #If selection goes until endline, keep contents of next line
    #on the next line (prevent merging of lines)
    if endline:
        replacement = current_row[:column] + color
        b[row] = replacement
        b.append(nextline, row + 1)
    else:
        replacement = current_row[:column] + color + current_row[column:]
        b[row] = replacement

    #Calculate horizontal movement
    h_movement = len(color) - 1
    w.cursor = (row + 1, column + h_movement)

#if exit from color dialog not OK
else:
    if endline:
        replacement = current_row[:column] + orig_selection
        b[row] = replacement
    else:
        replacement = current_row[:column] + orig_selection + current_row[column:]
        b[row] = replacement

#Close dialog
color_dlg.destroy()

EOF

endfunction
