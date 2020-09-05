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

But default colorization is nice..and I can change graphically the background color of the bash in preferences.

## PLUGIN to fold code  

Here also i think it can be done with good vim settings.  
With this setting : 
set foldmethod=manual
It's possible to fold/unfold code manually :
Fold : you select text manually + zf
Unfold : With the spacebar

I can't use "set foldmethod=indent", as my identations are turned into 4 spaces (python standard).

But with set foldmethod=expr, i could write regex for folding. It's the right way to do auto folding.

# Specific for python developpement  

## To get the help of a python function  

:python3 help(your function)  

The problem is that many libs are missing  
tkinter : 
sudo apt-get install python3-tk  
Even if pillow is well installed, it can be impossible to import from PIL, ImageTk, so you should do :  
sudo apt-get install python-imaging-tk  
And then it's still not working, so we have to do : 
sudo pip3 install pillow --upgrade


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






# PLUGIN vim-ipython-cell
This plugin reproduce the bahviour of Jupyter notebook : code execution cell by cell.
But i think i don't need it.
I prefer writing the full code as it was an one-block entire programm and then paste it to jupyter html interface.



# Link to a quite good vimrc for python
https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim


# Python -m 

2 existing python module, 2 ways : 
python3 <full_path_to_the_module.py>

python3 -m module_name

It will execute the module as "main" programm and so if the mdoule is well done execute the code located in
if __name__ == "__main__":

Otherwise an import of a module just read the core code which will usually do nothing except declaring variables, functions and class.

It's recommended to always ecxecute python modules like that : python3.X -m name_of_the_module
It will avoid issues : PATH, rights, versions

Here is an example for installation : 
python3.6 -m pip install black --user 
python3.6 -m black mon_fichier.py

--user is just to installl at user level and not at system level

This is good to get the basic installation.

For any further package installation, tests, projects...I must use virtual_environnements.

Soit on execute avec python3

Soit on execute directement avec ipython3 (c'est sous nom sous ubuntu). Mais il faut l'avoit installé avec apt et je prefererai faire tous mes package python avec pip3 (j'aurais que pip3 a installer avec apt).

Mais sinon on peut executer avec python3 et importer Ipython dedans et on rentrera dans le ipdb des qu'on fera un ipdb.set_trace

Mais le truc pas mal c'est d'executer avec python3 (on va privlégier ce scenario) puis de faire : 
from IPython import embed; embed()

Ca bloque la console ipython
et ensuite on a acces a tous les mots magique et notamment %whos pour l'exploration de variable.
ensuite Controle + D

sinon dans ipdb on joue avec les set_trace()
l pour afficher du code
ll pour en afficher plus
s pour step into a function
n for next
w to see where we are


# If you plan to use the built-in plugin manager (not recommended in 2020)

- What is mandatory for plugin hosting is a folder /home/username/.vim/pack/ 

- At this level it's possible to create forlders to sort plugins : basic, python, coloring, markdown

- In each group will be a folder "start" and a folder "opt"

- In each of these folders will be a folder containg the content of the git repo (just do git clone in the start or opt folder)

- In VIM, with this command :packadd {name} it's possible to activate the plugins located in opt folder






