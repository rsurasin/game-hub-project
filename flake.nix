{
    description = "Web Development using React and TypeScript";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        flake-utils.url = "github:numtide/flake-utils";
    };

    outputs = { self, nixpkgs, flake-utils }:
        flake-utils.lib.eachDefaultSystem (system:
            let
                pkgs = import nixpkgs {
                inherit system;
                config.allowUnfree = true;
                };
            in
            {
                devShells.default = pkgs.mkShell {
                    buildInputs = with pkgs; [
                        nodejs_latest
                        nodePackages.npm
                        nodePackages.typescript
                        nodePackages.typescript-language-server
                        nodePackages.eslint
                    ];

                    shellHook = ''
                        echo "React Development environment loaded!"
                        echo "Available tools:"
                        echo "- Node.js $(node --version)"
                        echo "- npm $(npm --version)"
                        echo "- TypeScript $(tsc --version)"
                        echo "- TypeScript Language Server $(typescript-language-server --version)"
                        echo "- ESLint $(eslint --version)"
                        '';
                };
            }
    );
}
