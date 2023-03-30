# haskell-hello
 
* Change directory
    ```sh
    $ cd haskell-hello
    ```

* Run 
    ```sh
    $ nix run
    ```

* Start dev shell: 
    ```sh
    $ nix develop
    ```

* Use [direnv](https://direnv.net/) to enter shell on entering this directory: 
    ```sh
    $ printf "use flake" > .envrc
    ```

* Makes HLS features available in shell. 
    
    * E.g., you can use [VS Code](https://code.visualstudio.com/) with [direnv](https://marketplace.visualstudio.com/items?itemName=mkhl.direnv) and [Haskell](https://marketplace.visualstudio.com/items?itemName=haskell.haskell) extensions. You will need to set `"haskell.serverExecutablePath": "haskell-language-server-wrapper",` in `settings.json` (see [this](https://github.com/haskell/vscode-haskell#path-to-server-executable)).

    * Alternatively, you can make HLS available before you start an IDE, e.g.:
        ```sh
        $ nix develop -c code .
        ```

* Check that you're using the HLS from `/nix/store/...`
    ```sh
    $ which haskell-language-server-wrapper
    ```

