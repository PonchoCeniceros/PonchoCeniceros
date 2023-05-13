from colorama import init, Fore, Back, Style
import re, json

def logo() -> None:
    print()
    print(f"{Style.BRIGHT}{Fore.RED    }            _       _                   ")
    print(f"{Style.BRIGHT}{Fore.GREEN  }  _ __ __ _(_)_ __ | |__   _____      __")
    print(f"{Style.BRIGHT}{Fore.YELLOW } | '__/ _` | | '_ \| '_ \ / _ \ \ /\ / /")
    print(f"{Style.BRIGHT}{Fore.BLUE   } | | | (_| | | | | | |_) | (_) \ V  V / ")
    print(f"{Style.BRIGHT}{Fore.MAGENTA} |_|  \__,_|_|_| |_|_.__/ \___/ \_/\_/  ")
    print(f"{Style.BRIGHT}{Fore.CYAN   }                                        ")

def finish() -> None:
    sb: str = Style.BRIGHT
    a:  str = Fore.RED
    b:  str = Fore.GREEN
    c:  str = Fore.YELLOW
    d:  str = Fore.BLUE
    e:  str = Fore.MAGENTA
    f:  str = Fore.CYAN
    print()
    print(f" {sb}{a}e{b}n{c}j{d}o{e}y{f} {a}c{b}o{c}d{d}i{e}n{f}g{a}!{Fore.RESET}")
    print()


def getBanners() -> dict:
    sb: str  = Style.BRIGHT
    rst: str = Fore.RESET
    a:  str  = Fore.RED
    b:  str  = Fore.GREEN
    c:  str  = Fore.YELLOW
    d:  str  = Fore.BLUE
    e:  str  = Fore.MAGENTA
    f:  str  = Fore.CYAN

    return {
        "new_project": f" {sb}creating new project{rst}",
        "file_structure": f" {sb}creating file structure{rst}",
        "creating_assets": f" creating {sb}{a}theme{rst} file and {sb}{d}Tailwind{rst} configuration",
        "creating_components": f" creating {sb}{c}components{rst} folder",
        "creating_hooks": f" creating {sb}{f}hooks{rst} folder",
        "creating_helpers": f" creating {sb}{b}helpers{rst} folder",
        "config_storybook": f" configuring {sb}{e}storybook{rst} server",
        "dependencies_for_desktop": f" installing dependencies for desktop applications",
        #  "git_project": f" instantiating {sb}{b}git{rst} project...",
        #  "jsconfig_json": f"please copy {sb}{c}" + '{"compilerOptions": {"baseUrl": "src", "paths": {"*": ["src/*"]}}}' + f"{rst} on jsconfig.json",
        "OK": f"{sb}{b}ok{rst}",
    }
