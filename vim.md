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

- To navigate between tabs :

\:tabn         go to next tab

\:tabp         go to previous tab

\:tabfirst     go to first tab

\:tablast      go to last tab

# PLUGIN NERDcommenter

It seems useless. If you want to comment several lines in one time there are some vim scripts (or regex i don't know) for that. for exemple 1,3s/^/# to comment the line 1 to 3 or :1,3s/^#/ to uncomment them.

# PLUGIN surround 

No issue for installation. No need to modify vimrc. But in normal mode, use cs "the former quotes" "the new quote" without semi colons. for example cs"' and not :cs"'

# PLUGIN syntastic

- Installed with vundle
- Copy the recommended text in vimrc
- Sudo apt install flake8
- Check the vim PATH (should be the same as the bash launching vim) : :echo syntastic#util#system('echo "$PATH"')

- Each time you save the file it updates the checker

# PLUGIN youcompleteme




- Folding functions and class : it doesn't wrok well but this code in the vimrc works a bit :
   " Enable folding of Class and Methods for Python
   set foldmethod=indent
   set foldlevel=99
  Faut il un plugin pour bien réaliser cette fonction ?? 
   
- PLUGIN youcompleteme : Facile à installer. Se charge bien au démarrage. Mais il faut lire la doc car il y a une hstoir de serveur ycmd

- PLUGIN Vim-colors-solarized : C'est pour améliorer la coloration du texte. Pas encore testé

- I wonder wether any "colorization" plugin is usefull as it seems that it could be possible to play with syntax highlighting (:h syn) and conceallevel=2 to apply a special style (color and font) to some patterns. If you open a file with the extension .md vim with conceallevel=2, vim will apply default rules to markdown (for bold and italic it works well).

- Un code folder pour regrouper les fonctions et classes rapidement. Un moyen d'acceder à la documentation intégrée à la documentation facilement depuis vim (a voir si :!pydoc python_method_or_class is not enough). C'est pas vraiment essentiel.

- Un moyen de debug existe en faisant des breakpoint puis en lisant le code avec ipython mais je n'ai pas compris vraiment comment faire.
On garde le chargement des module sans plugin managers mais il faut au moins savoir comparer le clone du dernier package avec la version actuelle sur github


Super lien pour appliquer des politiques différentes selon le filetype : 
https://vim.works/2019/04/02/per-filetype-commands/

- select and search for a text : 

You can yank the hightlighted text first. Then

    /

    Ctrl + r

    "

Which will paste what you have yanked after the /.


