# Customizations steps :

## Installing vundle

 - git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
 - Paste the recommended text in .vimrc (comment the examples)
 - Fom vim ":PluginInstall"

## Allowing copy-paste out of VIM

It requires to install gtk-vim.

- sudo apt install gtk-vim
- in .vimrc add "set clipboard=unnamedplus"

## Installing Syntastic

- Installed with vundle
- Copy the recommended text in .vimrc
- Sudo apt install flake8 (yo get a python spellchecker)

_NB : To install the jsonlint checker, it must be done with npm (with apt it doesn't work) : sudo npm -g install jsonlint (before install node and npm)_

## Installing Youcompleteme

- Install plugin with vundle (takes several seconds)
- apt install build-essential cmake vim python3-dev
- cd ~/.vim/bundle/YouCompleteMe
- python3 install.py --clang-completer

_NB : I have only C, C++, Python syntax checking. it seems it's possible to get more language but for that it would require to install : sudo apt install mono-complete golang-go (or gccgo-go ?) nodejs npm. Then python3 install.py --all.

# Shortcuts & features

## VIM General

Navigate between windows :  
Ctrl+W and then the arrow keys

Increase/decrease height of a window :  
Ctrl+W and then +/- (you can add figure before +/- for bigger change)

Increase/decrease width of a window :  
Ctrl+W and then >/< (you can add figure before +/- for bigger change)

Move a window in a given direction :  
Ctrl + w and then K (higher) or J (lower) or L (to the left) or R (to the right)

Go to next tab :  
:tabn         

Go to previous tab :  
:tabp

Search for text :  
/ + the text you search for
n : Search forward
N : Search backward

Use the spellchecker :   
set spell spelllang=en_us  
zG : To ignore this word

Indent serevral lines :  
select lines with v   
Then press "Ctrl + >" or "Ctrl + <"  

Manage folding : 
zf : Fold the selected lines  
space bar : Remove the fold  
zc : Close a fold  
zo : Open the fold  
za : Toggle the fold  
zC, zO and zA : for all the folds  

## NERDTree

t = Open the selected file in a new tab  

i = Open the selected file in a horizontal split window  

s = Open the selected file in a vertical split window  

I = Toggle hidden files  

Using symlinks can help to geat easy access to a separate folder (without changing the root folder of the tree)  

# Opinion about other plugins  

## PLUGIN NERDcommenter  

I think it's better to understand vim and to use regular experessions if one day i really have the need of automatizing commenting/uncommenting.  

For python regex would be like that :  
To comment the line 1 to 3 : 1,3s/^/#  
To uncomment the line 1 to 3 : 1,3s/^#/  

## PLUGIN Surround  

I think it's better to understand vim and to use regular experessions if one day i really have the need of automatizing the change of surrounding caracters (", ', ...)  

## PLUGIN vim-colors-solarized

- Installation with vundle  
- Copy the recommended text to vimrc *AT THE END* of vimrc  
- In the bash settings, you can keep the system theme but you must change the set of colors (pallette de couleurs in french) to solarized!  

But default colorization and highlighting is nice..and I can change graphically the background color of the bash in the preferences.

## PLUGIN to fold code  

Here also i think it can be done with good vim settings.  
With this setting : 
set foldmethod=manual
It's possible to fold/unfold code manually :

I can't use "set foldmethod=indent", as my identations are turned into 4 spaces (python standard).

But with set foldmethod=expr, i could write regex for folding. It's the right way to do auto folding.

# Specific for python developpement  

## To get the help of a python function  

:python3 help(your function)

## Installing packages pip and apt

If you install with apt the package will be installed in "/usr/lib/python3.X/tkinter"

If you install with pip3 the package will be installed in ~/.local/bin/. 

And that's good because files installed outside of /home/ must be tracked by apt!

I think i will use apt most of the time and pip only when i need to do a virtenv with special libraries.

## Executing a module

2 existing python module, ther are 2 possibilities :  
- python3 <full_path_to_the_module.py>
- python3 -m module_name

It will execute the module as "main" programm and so if the mdoule is well done execute the code located in 'if __name__ == "__main__"'.

Otherwise an import of a module just read the core code which will usually do nothing except declaring variables, functions and class.

## Installing with pip without any mistake   (PATHS, python version, rights...)

python3.6 -m pip install black (--user really needed ?)   

## Small issues to run floupy program 

I installed tkinter in wide-system :  
sudo apt-get install python3-tk  

pillow was already installed but it was impossible to import it. So I run :   
sudo pip3 install pillow --upgrade  
It's not ideal as i don't know. I would have preferred to use pip only in virtenvs.

# How to debug python with vim

sudo apt install python3-ipython
sudo apt install python3-ipdb

I don't recommend to run the programm from VIM. It's better to launch a terminal.

Shortucts in ipdb shell : 
l pour afficher du code
ll pour en afficher plus
s pour step into a function
n for next
w to see where we are
continue to continue to the next breakpoint
"? a" provides help for a()

To create a breakpoint with ipython (it gives access to magic words - %lsmagic -  but it's not step by step):  
from IPython import embed; embed()  
Then Ctrl + D to resume the program

To create a breakpoint with ipdb and get access to the step by step mode :  
ipdb.set_trace(context=5)

To open the terminal in a vertical split (and get the source code and the debugging console in the same screen)  
:vert term  
To come back to a vim buffer without exiting the terminal, i didn't find any other solution that to enable the mouse  

Once in ipdb shell, execute the code till the next embed(), to come back to ipython shell.

# Use vim for markdown

No customization required.

Use pandoc for vizualization.

sudo apt install libjs-mathjax
pandoc -f markdown -t html -c github.css -s --mathjax --metadata pagetitle="my_title" -o <path_to_output_file.html> input_file.md

# If you plan to use the built-in plugin manager (not recommended in 2020)

- What is mandatory for plugin hosting is a folder /home/username/.vim/pack/ 

- At this level it's possible to create forlders to sort plugins : basic, python, coloring, markdown

- In each group will be a folder "start" and a folder "opt"

- In each of these folders will be a folder containg the content of the git repo (just do git clone in the start or opt folder)

- In VIM, with this command :packadd {name} it's possible to activate the plugins located in opt folder
