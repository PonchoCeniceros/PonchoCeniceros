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

#### splits
| cmd            | description                                                    |
|----------------|----------------------------------------------------------------|
| ```<ctrl>wh``` | moves the active split to a full-height split across the left  |
| ```<ctrl>wj``` | moves the active split to a full-width split across the bottom |
| ```<ctrl>wk``` | moves the active split to a full-width split across the top    |
| ```<ctrl>wl``` | moves the active split to a full-height split across the right |

#### ```NERDTree``` sidebar
| cmd                   | description                                                                                                                                                                                                                                                                                                                                                                            |
|-----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| nt                    | open tree sidebar                                                                                                                                                                                                                                                                                                                                                                      |
| ```m``` over NERDTree | bring up the NERDTree Filesystem Menu                                                                                                                                                                                                                                                                                                                                                  |
|                       | ```(a)```dd a childnode<br>```(m)```ove the current node<br>```(d)```elete the current node<br>```(r)```eveal in Finder the current node<br>```(o)```pen the current node with system editor<br>```(q)```uicklook the current node<br>```(c)```opy the current node<br>copy ```(p)```ath to clipboard<br>```(l)```ist the current node<br>Run ```(s)```ystem command in this directory |

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

#### **javascript vanilla**
| snippet    | description                               |
|------------|-------------------------------------------|
| ```log```  | ```console.log()```                       |
| ```err```  | ```console.err()```                       |
| ```dir```  | ```console.dir()```                       |
| ```imp```  | ```import from ''```                      |
| ```ed ```  | ```export default ''```                   |
| ```cf ```  | control scructure (```if, for,``` etc...) |
| ```arr```  | declarate arrays                          |
| ```des```  | destructuring on object                   |
| ```desa``` | destructuring on array                    |
| ```fn ```  | arrow function                            |
| ```clb```  | arrow function as callback                |

#### **react/nextjs**
| snippet    | description                               |
|------------|-------------------------------------------|
| ```rfc```  | **react** functional component            |
| ```rnfc``` | **nextjs** functional component           |
| ```rcc```  | **react** class component                 |
| ```uses``` | **react** ```useState``` hook             |
| ```usee``` | react ```useEffect``` hook                |
| ```retf``` | unmounting function for ```useEffect```   |

#### **storybook**
| snippet    | description                               |
|------------|-------------------------------------------|
| ```stb```  | make **Storybook** config for a component |

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

## ```environment.yml``` file for machine learning projects 🤖

```
name: .ml
channels:
  - conda-forge
dependencies:
  - bzip2=1.0.8=h3422bc3_4
  - ca-certificates=2022.12.7=h4653dfc_0
  - libffi=3.4.2=h3422bc3_5
  - libsqlite=3.40.0=h76d750c_0
  - libzlib=1.2.13=h03a7124_4
  - ncurses=6.3=h07bb92c_1
  - openssl=3.0.7=h03a7124_1
  - pip=22.3.1=pyhd8ed1ab_0
  - python=3.9.15=hea58f1e_0_cpython
  - readline=8.1.2=h46ed386_0
  - setuptools=65.6.3=pyhd8ed1ab_0
  - tk=8.6.12=he1e0b03_0
  - tzdata=2022g=h191b570_0
  - wheel=0.38.4=pyhd8ed1ab_0
  - xz=5.2.6=h57fd34a_0
  - pip:
    - anyio==3.6.2
    - appnope==0.1.3
    - argon2-cffi==21.3.0
    - argon2-cffi-bindings==21.2.0
    - arrow==1.2.3
    - asttokens==2.2.1
    - attrs==22.2.0
    - backcall==0.2.0
    - beautifulsoup4==4.11.1
    - bleach==6.0.0
    - certifi==2022.12.7
    - cffi==1.15.1
    - charset-normalizer==2.1.1
    - colorama==0.4.6
    - coloredlogs==15.0.1
    - comm==0.1.2
    - contourpy==1.0.6
    - cycler==0.11.0
    - debugpy==1.6.6
    - decorator==5.1.1
    - defusedxml==0.7.1
    - executing==1.2.0
    - fastjsonschema==2.16.2
    - flatbuffers==23.1.21
    - fonttools==4.38.0
    - fqdn==1.5.1
    - h5py==3.8.0
    - humanfriendly==10.0
    - idna==3.4
    - importlib-metadata==6.0.0
    - ipykernel==6.20.2
    - ipython==8.8.0
    - ipython-genutils==0.2.0
    - isoduration==20.11.0
    - jedi==0.18.2
    - jinja2==3.1.2
    - jsonpointer==2.3
    - jsonschema==4.17.3
    - jupyter-client==8.0.0
    - jupyter-core==5.1.5
    - jupyter-events==0.6.3
    - jupyter-server==2.1.0
    - jupyter-server-terminals==0.4.4
    - jupyterlab-pygments==0.2.2
    - kiwisolver==1.4.4
    - markupsafe==2.1.2
    - matplotlib==3.6.2
    - matplotlib-inline==0.1.6
    - mistune==2.0.4
    - mpmath==1.2.1
    - nbclassic==0.5.1
    - nbclient==0.7.2
    - nbconvert==7.2.9
    - nbformat==5.7.3
    - nest-asyncio==1.5.6
    - notebook==6.5.2
    - notebook-shim==0.2.2
    - numpy==1.24.1
    - onnx==1.13.0
    - onnxruntime==1.13.1
    - opencv-python==4.7.0.68
    - packaging==22.0
    - pandas==1.5.2
    - pandocfilters==1.5.0
    - parso==0.8.3
    - pexpect==4.8.0
    - pickleshare==0.7.5
    - pillow==9.3.0
    - platformdirs==2.6.2
    - prometheus-client==0.16.0
    - prompt-toolkit==3.0.36
    - protobuf==3.20.3
    - psutil==5.9.4
    - ptyprocess==0.7.0
    - pure-eval==0.2.2
    - pycparser==2.21
    - pygments==2.14.0
    - pyparsing==3.0.9
    - pyrsistent==0.19.3
    - python-dateutil==2.8.2
    - python-json-logger==2.0.4
    - pytz==2022.7
    - pyyaml==6.0
    - pyzmq==25.0.0
    - requests==2.28.1
    - rfc3339-validator==0.1.4
    - rfc3986-validator==0.1.1
    - seaborn==0.12.1
    - send2trash==1.8.0
    - six==1.16.0
    - sniffio==1.3.0
    - soupsieve==2.3.2.post1
    - stack-data==0.6.2
    - sympy==1.11.1
    - terminado==0.17.1
    - tinycss2==1.2.1
    - torch==1.13.1
    - torchaudio==0.13.1
    - torchvision==0.14.1
    - tornado==6.2
    - traitlets==5.8.1
    - typing-extensions==4.4.0
    - uri-template==1.2.0
    - urllib3==1.26.13
    - wcwidth==0.2.6
    - webcolors==1.12
    - webencodings==0.5.1
    - websocket-client==1.5.0
    - zipp==3.11.0
prefix: /opt/homebrew/Caskroom/miniforge/base/envs/.ml

```
