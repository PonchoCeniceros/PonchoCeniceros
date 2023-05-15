## Structure 🗂

``` Bash
°
├── .vim
│   ├── UltiSnips
│   └── (plugged)
│
└── .vimrc

```

## Configuration 🔧
1. Download the content of editor folder on ```~/.config/``` directory.
2. You need to create a symbolic link of ```.vim``` directory:

``` Bash
ln -s ~/.config/editor/.vim ~/.vim
```

and ```.vimrc``` configuration file:
``` Bash
ln -s ~/.config/editor/.vimrc ~/.vimrc
```

3. You need to install [vim plug](https://github.com/junegunn/vim-plug).


## Smart autocomplete 🤖

1. You need to install [conquer of completion](https://github.com/neoclide/coc.nvim)

2. You can install your favorite language assistants using ```:CocInstall``` command on editor. For example, for JS/TS:

```Vim
:CocInstall coc-tsserver
```
and for Python:
```Vim
:CocInstall coc-pyright
```

## Shortcuts & Commands

#### Generals
| cmd                     | description                             |
|-------------------------|-----------------------------------------|
|```<space>q```           | close tab/window                        |
|```<space>w```           | save file                               |
|```<space>,```           | put ; at the end                        |
|```nt```                 | open tree sidebar                       |

#### Tabs
| cmd                      | description                             |
|--------------------------|-----------------------------------------|
| ```<space>z```           | open new tab                            |
| ```<space>h```           | move to next tab                        |
| ```<space>l```           | move to previous tab                    |
  
#### Documentation
| cmd                      | description                             |
|--------------------------|-----------------------------------------|
| ```K```                  | show documentation                      |
| ```<space>fh```          | find into documentation                 |

#### go to...
| cmd                      | description                             |
|--------------------------|-----------------------------------------|
| ```gd```                 | go to the definition file               |
| ```gr```                 | go to references inside the file        |

#### find or replace
| cmd                      | description                             |
|--------------------------|-----------------------------------------|
| ```<space>ff```          | find an specific file                   |
| ```<space>fg```          | find a match into files                 |
| ```/{text}```            | find **text** ocurrences                |
| ```n```                  | next ocurrence                          |
| ```N```                  | previous ocurrence                      |
| ```:%s/{ptn}/{str}/g```  | change **ptn** by **str** in whole file |
| ```:%s/{ptn}/{str}/gc``` | confirm each substitution               |

#### **snippets**
| cmd                      | description                             |
|--------------------------|-----------------------------------------|
| ```{snippet}<tab>```     | generate **snippet** on file            |
| ```<space>c```           | move to next snippet param              |
| ```<space>x```           | move to previous snippet param          |


## Snippets 📜

#### **Javascript**
| snippet    | description                         |
|------------|-------------------------------------|
| ```log```  | console.log()                       |
| ```err```  | console.err()                       |
| ```dir```  | console.dir()                       |
| ```imp```  | import from ''                      |
| ```ed ```  | export default ''                   |
| ```cf ```  | control scructure (if, for, etc...) |
| ```arr```  | declarate arrays                    |
| ```des```  | destructuring on object             |
| ```desa``` | destructuring on array              |
| ```fn ```  | arrow function                      |
| ```clb```  | arrow function as callback          | 
| ```rfc```  | react functional component          |
| ```rnfc``` | netjs functional component          |
| ```rcc```  | react class component               |
| ```uses``` | react useState hook                 |
| ```usee``` | react useEffect hook                |
| ```retf``` | unmounting function for useEffect   |

## Themes 🎨

#### ```morhetz/gruvbox``` simple configuration

```Vim
colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_termcolors = 16
let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' }
  \ }
```

#### ```olimorris/onedarkpro.nvim``` configuration

```Vim
colorscheme onedark
let g:lightline = {
  \ 'colorscheme': 'one',
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' }
  \ }
```
#### custom configurations
modifying values on ```.vim/plugged/onedarkpro.nvim/lua/onedarkpro/config.lua```:

```Lua
  colors = {
    fg = "#CFD8E8" -- little  more contrast with comments
  }, -- Add/override colors
```

```Lua
  styles = {
    types = "NONE",               -- Style that is applied to types
    methods = "NONE",             -- Style that is applied to methods
    numbers = "NONE",             -- Style that is applied to numbers
    strings = "NONE",             -- Style that is applied to strings
    comments = "italic",          -- Style that is applied to comments
    keywords = "bold,italic",     -- Style that is applied to keywords
    constants = "NONE",           -- Style that is applied to constants
    functions = "italic",         -- Style that is applied to functions
    operators = "NONE",           -- Style that is applied to operators
    variables = "NONE",           -- Style that is applied to variables
    parameters = "NONE",          -- Style that is applied to parameters
    conditionals = "bold,italic", -- Style that is applied to conditionals
    virtual_text = "NONE",        -- Style that is applied to virtual text
  },
```
