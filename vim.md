# If you plan to use the built-in plugin manager (not recommended in 2020)

- What is mandatory for plugin hosting is a folder /home/username/.vim/pack/ 

- At this level it's possible to create forlders to sort plugins : basic, python, coloring, markdown

- In each group will be a folder "start" and a folder "opt"

- In each of these folders will be a folder containg the content of the git repo (just do git clone in the start or opt folder)

- In VIM, with this command :packadd {name} it's possible to activate the plugins located in opt folder

# If you plan to use vundle (recommanded)

- Installation is easy : clone the github repository as described in the README.md + paste the recommended text in .vimrc (comment the examples) + Run from vim ":PluginInstall"

# NERDTree

- NERDTree is much better that the buitin navigator "netrw" as it allows collapsing/expanding folders in a nice way.

- In .vimrc add the lines : 
   " Start NERDTree
   autocmd VimEnter * NERDTree
   " Jump to the main window.
   autocmd VimEnter * wincmd p

- Usefull shortcuts

t = Open the selected file in a new tab

i = Open the selected file in a horizontal split window

s = Open the selected file in a vertical split window

I = Toggle hidden files

- Using symlinks can help to geat easy access to a separate folder (without changing the root folder fo the tree)

- To navigate between windows

Ctrl+W and then the arrow keys = navigate between windows

Ctrl+W +/- = increase/decrease height (play with figures to do big changes)

Ctrl+W >/< = increase/decrease width (play with figures to do big changes)

- To swap or flip windows 

If you have them split vertically "Ctrl + w" and then "J" to move one to the bottom

If you have them split horizontally "Ctrl+ w" and then "L" to move one to the right

- To navigate between tabs :

\:tabn         go to next tab

\:tabp         go to previous tab

\:tabfirst     go to first tab

\:tablast      go to last tab

# PLUGIN NERDcommenter

It seems useless. If you want to comment several lines in one time there are some vim scripts (or regex i don't know) for that. for exemple 1,3s/^/# to comment the line 1 to 3 or :1,3s/^#/ to uncomment them.

# PLUGIN surround 

No issue for installation. No need to modify vimrc. But in normal mode, use cs "the former quotes" "the new quote" without semi colons. for example cs"' and not :cs"'

But is this plugin really usefull ? I think no.

# PLUGIN Airline

No issue for installation and useful.

# PLUGIN syntastic

- Installed with vundle
- Copy the recommended text in vimrc
- Sudo apt install flake8
- Check the vim PATH (should be the same as the bash launching vim) : :echo syntastic#util#system('echo "$PATH"')

- Each time you save the file it updates the checker

- flake8 is well documented but is very severe (full respect of PEP8). To disable syntax message, you can write : 
let g:syntastic_quiet_messages = { "type": "style" }
to precise the checker you want to use you can add to your vimrc : 
let g:syntastic_python_checkers=['flake8'] 
But iy's mot mandatory if you install only one checker per filetype (means per file extension or language)
That seems by far the best way to manage exceptions precisely : 
let g:syntastic_python_flake8_args = '--ignore="E501"'

For json, install jsonlint WITH npm (not with apt)
sudo npm -g install jsonlint




# PLUGIN vim-colors-solarized

- Installation with vundle
- Copy the recommended text to vimrc AT THE END of vimrc
- In the bash you can keep the system theme but you miust change the set of colors (pallette de couleurs in french) to solarized!

BUT, Is it really better than the builtin color scheme ? 
There are some features for syntax highlighting (:h syn). If the parameter conceallevel=2 then it will be fully applied.
It seems that just setting in vimrc the 2 parameters below could be good enough : 
syntax on (if it's not enbaled by default)
set background=dark


Furthermore, it's possible to speicfu rules for specific extensions : 
https://vim.works/2019/04/02/per-filetype-commands/

Je crois vraiment que ce plugin ne sert à rien.
" enable syntax highlighting
syntax enable
" enable all Python syntax highlighting features
let python_highlight_all = 1

Ce lien a l'air très bien et ne contient que l'essentiel:
https://www.fullstackpython.com/vim.html

# PLUGIN IndentLine

As all tabs are turned into 4 spaces, a speical plugin is needed to display indentations.
Easy installation with vundle.

# PLUGIN youcompleteme

Install plugin with vundle (takes several seconds)
apt install build-essential cmake vim python3-dev
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clang-completer

It would have been possible to install more features but for that the README says just : Install mono-complete, go, node and npm
I think it would be sudo apt install mono-complete (golang-go i think and not gccgo-go) nodejs npm
then it's possible to launch : 
python3 install.py --all
But with just the clang-completer option i already have python3, C and C++. I don't need more.

# To get the help of a python function

just write :python3 help(your function)

# To select and search for a text 

You can yank the hightlighted text first. Then

    /

    Ctrl + r

    "

Which will paste what you have yanked after the /.


# To fold functions and class

Adding that to vimrc works with bugs : 

" Enable folding of Class and Methods for Python
set foldmethod=indent
set foldlevel=99

But this is a feature i don't need. I always watch all functions. If folding is vital it menas that the code is bad.

# How to run a python programm in VIM

to run a vim programm, just execute :
:w !python3

NB : to execute any bash command in VIM, we just have to do :!<UNIX command>

The problem is that many libs are missing
tkinter : 
sudo apt-get install python3-tk
Even if pillow is well installed, it can be impossible to import from PIL, ImageTk, so you should do :
sudo apt-get install python-imaging-tk
And then it's still not working, so we have to do : 
sudo pip3 install pillow --upgrade

# To use VIM as a spell checker

it would be possible to enable a spell checker adding ths comment to vimrc : 
set spell spelllang=en_us

# To indent several lines as once

select lines with "Shift + v"
Then press "Ctrl + >" or "Ctrl + <"
As usually it's possible to add a figure to do several identations at once

# How to copy outside of VIM
put in the vimrc
set clipboard=unnamedplus "This allow the right click of the mouse to copy

...But it's not enough.
if you do in bash :
vim --version
xterm-clipboard is not installed with vim, you have to add manually
sudo apt install vim-gtk

# How to debug python with vim

There is a module called pdb which is dedicated to debugging.

1st way of use : 
import pdb in the source code of the programm
add pdb.set_trace() ou breakpoint() where you want your programm to stop (you can programm conditionnal stop if needed)
then execute the code in bash python3 <path to your pogramm>

next to go to the next line
continue to continue to the next breakpoint
possibility to query variables
"? a" provides help for a()

2nd way to use it
python3 -m pdb <path to your python programm>
No modification of the programm needed and enter next to run in step by step mode

to get all possible commands : 
https://docs.python.org/3/library/pdb.html

I think we can get something more convenient so i install ipython with ipdb.
sudo apt install ipython3
sudo apt install python3-ipdb

with ipdb i can write the command below to display 5 lines around the breakpoint
ipdb.set_trace(context=5)

I didn't succeed to make working vim-ipdb (should probably try vim-pdb first)

I well have an issue to run code conatining pdb.set_trace or ipdb.set_trace in vim.
It works from bash but not in vim
Let's be realistic, it's not acceptable. I need debug in vim.
This issue happened suddenly after i played with vundle plugins list.


I think vimspector really worth a try!!!
NON vimspector c'est un leurre. Ca va etre galère à installer et c'est trop jeune.
une bonne fenetre ipython debug dans vim ferait bien le taf et me serait plus formateur.




# PLUGIN vim-ipython-cell
This plugin reproduce the bahviour of Jupyter notebook : code execution cell by cell.
But i think i don't need it.
I prefer writing the full code as it was an one-block entire programm and then paste it to jupyter html interface.



# Link to a quite good vimrc for python
https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
