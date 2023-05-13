from utils import LoadingSpinner, logo, getBanners, finish
import os, io, argparse, subprocess
from colorama import init, Fore, Back, Style

def getCurrentPath(filename) -> str:
    return os.path.join(os.path.dirname(__file__), filename)

def main() -> None:
    parser: argparse.ArgumentParser = argparse.ArgumentParser(description="CLI for building full-satck projects")

    parser.add_argument("--client", type=str, default="", help="generate NextJS custom client project")
    parser.add_argument("--api", type=str, default="", help="generate API project with node/express")
    parser.add_argument("--route", type=str, default="", help="generate API route and proper controller")
    # parser.add_argument("--component", type=str, default="", help="generate client component")
    # parser.add_argument("--desktop", action="store_true", help="adding desktop environment for client project")
    
    args: argparse.Namespace = parser.parse_args()
    banners: dict = getBanners()
    logo()
    
    #
    # (1) app name is provided but app route isn't
    #
    if args.api != "" and args.route == "":
        
        # run make api script replacing argument by app name
        with LoadingSpinner():
            script: io.TextIOWrapper = open(getCurrentPath("api/makeApi.sh"), "r")
            cmds: str = script.read().replace("$1", args.api)
            subprocess.call([cmds], shell=True)
        finish()

    #
    # (2) app name is provided and app route is provided too (app name serves to locate project)
    #
    if args.api != "" and args.route != "":
        existsSrcDir: bool = os.path.isdir(getCurrentPath(f"{args.api}/src"))
        existsIndex:  bool = os.path.isfile(getCurrentPath(f"{args.api}/src/index.js"))
        existsRoute:  bool = os.path.isfile(getCurrentPath(f"{args.api}/src/routes/{args.route}.js"))

        # checking if project files and directories exists in current path
        if existsSrcDir and existsIndex and not existsRoute:
            # run make route script replacing argument by app name and app route
            script: io.TextIOWrapper = open(getCurrentPath("api/makeRoute.sh"), "r")
            cmds: str = script.read().replace("$1", args.api).replace("$2", args.route)
            subprocess.call([cmds], shell=True)
        finish()

    #
    # (3) client name is provided
    #
    if args.client != "":
        # making project with create-next-app script replacing argument by app name
        with LoadingSpinner(desc=banners['new_project'], end=banners['OK']):
            script: io.TextIOWrapper = open(getCurrentPath("client/next/makeProject.sh"), "r")
            cmds: str = script.read().replace("$1", args.client)
            subprocess.call([cmds], shell=True)

        # creating needed files and directories
        print(banners["file_structure"], end='\n')
        print(banners["creating_components"], end='\n')
        print(banners["creating_hooks"], end='\n')
        print(banners["creating_helpers"], end='... ')       
        script: io.TextIOWrapper = open(getCurrentPath("client/next/makeStructure.sh"), "r")
        cmds: str = script.read().replace("$1", args.client)
        subprocess.call([cmds], shell=True)
        print(banners['OK'])

        # making needed files and directories for Tailwind
        print(banners["creating_assets"], end='... ')
        script: io.TextIOWrapper = open(getCurrentPath("client/next/configTailwind.sh"), "r")
        cmds: str = script.read().replace("$1", args.client)
        subprocess.call([cmds], shell=True)
        print(banners['OK'])

        # making needed files and directories for Storybook
        print(banners["config_storybook"], end='... ')
        script: io.TextIOWrapper = open(getCurrentPath("client/next/configStorybook.sh"), "r")
        cmds: str = script.read().replace("$1", args.client)
        subprocess.call([cmds], shell=True)
        print(banners['OK'])
        finish()

if __name__ == "__main__":
    main()
