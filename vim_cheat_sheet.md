# Vim Cheat Sheet

## Navigation (or Operations)
Move the cursor to a location in the text:  
`h, j, k, l` : right, down, up, left.   
`w, b, e, ge` : word, previous word, end of word, previous end of word.  
`$, 0` : start of line, end of line.  
`{`, `}` : start of paragraph, end of paragraph.  
`shift {, shift }` or `gg, shift G`: start page, end of page.   
`shift H, shift L`: top of screen, bottom of screen. 
`ctrl d` and `ctrl u`: moves down or up half a screen size.   
`df`: go to file from any file definition (like an import).  
`gd`: go to definition from method call or class reference. 

### Search
`f [char]`: move to char in current line (capital F moves back)  
`t [char]`: move to before char (capital T moves back)  
`/ [chars]`: find the char sequence (click enter to move curser to first occurrence. Click `n` repetedly to go to next occurrence.  
`? [ chars ]`: search backwards.  
`/`: + enter will repeat last search forward.  

## Operations (verbs)
`d`: delete (`D`: delete from cursor to end of line).  
`c`: change (`C`: change to end of line).  
`y`: yank (copy) (`yy` or `Y` to yank a whole line). `"ry`: yang to register: 'r'. ``ctrl-r`` r in insert mode will insert content from register: r.
`s`: substitude (deletes and enter insert mode. Same as `cl`)
`r`: replace. Replaces any char and stays in normal mode (`r <enter>` when sitting on top of a space char, replaces it with new line).

`5s`: deletes 5 chars and enters insert mode.
`v`: visual select (follow by using navigation keys to mark area)
`V`: visual select current line
`ctrl v`: block select now using movements. Combine with Shift I or shift A to write chars before or after the selected block.

`p`: paste (character wise, line wise, block wise)   
`"0p`: paste original (when pasting over existing content. p now holds the overwritten string).  
`J`: shift j: will merge the line beneath with current line (from anywhere in the line.)

### Composition
`dt(`: delete untill next (.     
`dd`: delete current line.  
`cc`: change current line.  


## Modifiers (used before nouns to tell how to operate)  
`i`: inside.  
`a`: around.  
`NUM`: number of repetitions.  

## Nouns (objects to work on)  
`w`: word.  
`s`: sentence.  
`p`: paragraph.  
`t`: tag.  
`b`: block of code.

## Composition examples
`20j`: jump down 20 lines   
`d2w`: delete 2 words.  
`cis`: change inside sentence.  
`yip`: yank paragraph.  
`ct<`: change untill next bracket.  
`ysiw{`: surround current word with braces (y: you (meaning whatever vim motion comes next), s: surround, iw: inner word) 
`ys2w}`: surround next 2 words with curlies.
`ds"`: remove surrounding quotes (or any surround type char).
`cs"'`: change surrounding double quotes to single quotes.
`va'`: visually select including sourrounding single quotes
`cst<em>`: change surround from current tag to `<em>`
`VjSth2`: Visually Select current line plus the next (or more lines) then **surround selected with tag**: h2.

`vwS<surround char>`: Select word and **surrounds** with the char or brackets. Surround chars can be `[`,`{`,`(`,`'`,`"`,`*`,`#` and backticks`.   
`v3lc()jj<shift>P`: **surround** next 3 chars with parentheses (v:visual select, 3l: 3 places right, c: change, parenthesis (or any other thing to surround with, jj: normal mode, shift P insert behind last char)).   
`viwSb`: viw:select current word, S:surround, b: braces. (Or use any selection and shift S + any type of brackets).   
`r<enter>`: replace current char (eg a space) with a newline
`yiw`: yank inner word
`viwp`: insert last yanked word in place of current word
`viw"0p`: insert previously yanked word in place of current word.
`ciw CTRL-R 0 Esc`: change inner word to contain last yanked word (this can be replicated many times with . ). Also 0 can be replaced with 1,2,... to get previous yanks.

`vlllo`: Make a selection (4 chars right), then move curser to beginning of selection (to expand in that direction). Do the `o` again to move to end etc.


#### replace one line with another multiple times
`yy`: yank current line 
`Vp`: move to next line and visual select it and replace it.  
`V"0p`: move to the next line and visually select it. NOW PASTE FROM register "0 (instead of default unnamed register "") in order to paste what was yanked and not the intermediate overwrites that are stored in default register "" and pasted from with p.  
`.`: Now this can be repeted on other lines. 

### increment numbers or letters
`CTRL-VjjjjgCTRL-A`: Block select a row of characters that all contains one then with g-CTRL-A all numbers or letters will be incremented (so do not select the first one)

### Macros
` q<letter><commands>q`: To record a macro and
`<number>@<letter>`: to play it number of times
`qp0wd$jq`: record a macro on p-key - move to start of line (always good when recording) move a word and delete til end - Jump to line below (good to end with when recording macro in order for the macro to move to next line if we want to repeat it) - then stop recording: q.

# Substitute
`:[range]s/{pattern}/{string}/[flags] [count]`: general form
`:s/foo/bar/`: replace first instance of foo with bar
`:%s/foo/bar/g`: replace all foo in file with bar. % means range: all file.
`:s/foo//g`: delete all instances of foo in the file. The empty space between // means an empty string.
`:s/foo/bar/gc`: replace all instances of foo in the file with confirmation on each find. 


jj 
BBB1 ['(GGG)'] HHH 
CCC4 
DDD6  
EEE8 
FFF10  
GGG12  
$   

EEE  
FFF  
GGG  