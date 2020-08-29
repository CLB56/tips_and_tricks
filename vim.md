## About VIM Plugins

- I recommand using vundle. The package manager included in VIM8+ doesn't make installation of complicated plugins easy.

- IF I WOULD USE THE NATIVE PLUGIN MANAGER : What is mandatory for plugin hosting is a folder /home/username/.vim/pack/ # At this level it's possible to create forlders to sort plugins : basic, python, coloring, markdown # In each group will be a folder start and a folder opt # In each of these folders will be a folder containg the content of the git repo (just do git clone in the start or opt folder) # In VIM, with this command :packadd {name} it's possible to activate the plugins located in opt folder

- You have to edit the vimrc file and to add it "autocmd VimEnter * NERDTree"

- Enering vim folder_path will open netrw (vim built-in file explorer)...But the PLUGIN NERDTree is much more conveineint (collapse/fold folders) : 

t: Open the selected file in a new tab

i: Open the selected file in a horizontal split window

s: Open the selected file in a vertical split window

I: Toggle hidden files

It's also possible to create symbolic links to get access to other folders from the tree without changing the root folder fo the Tree.

- For navigation between tabs and windows management : 

To navigate between windows

Ctrl+W and then the arrow keys.
Ctrl+W +/-: increase/decrease height (play with figures to do big changes)
Ctrl+W >/<: increase/decrease width (play with figures to do big changes)


To navigate between tabs :

\:tabn         go to next tab

\:tabp         go to previous tab

\:tabfirst     go to first tab

\:tablast      go to last tab

- PLUGIN NERDcommenter seems useless. If you want to comment several lines in one time there are some vim scripts (or regex i don't know) for that. for exemple 1,3s/^/# to comment the line 1 to 3 or :1,3s/^#/ to uncomment them.

- PLUGIN vim-airline : No issue for installation. No need to modify vimrc

- PLUGIN surround : No issue for installation. No need to modify vimrc. But in normal mode, use cs "the former quotes" "the new quote" without semi colons. for example cs"' and not :cs"'

- PLUGIN syntastic : installed with vundle + copy the recommended text in vimrc + sudo apt install flake8 + check the vim PATH (should be the same as the bash luanching it) : :echo syntastic#util#system('echo "$PATH"')

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


