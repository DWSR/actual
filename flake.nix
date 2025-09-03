{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.05-darwin";

  outputs = { nixpkgs, ... }: let
    system = "aarch64-darwin";
    pkgs = import nixpkgs { inherit system; };
  in {
    devShells.${system}.default = pkgs.mkShell {
      FLY_APP = "mc-actual";
      packages = with pkgs; [
        yamllint
        yaml-language-server
        flyctl
        jq
        bash-language-server
        shfmt
        shellcheck
        marksman
      ];
    };
  };
}
