# haskell-hello

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

* Check that you're using the HLS from `/nix/store/...`
    ```sh
    which haskell-language-server-wrapper
    ```

