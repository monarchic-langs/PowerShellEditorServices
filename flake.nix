{
  description = "Nix package for PowerShell Editor Services";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = {nixpkgs, ...}: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    formatter.${system} = pkgs.alejandra;
    packages.${system}.default = pkgs.powershell-editor-services;
    devShells.${system}.default = pkgs.mkShell {
      packages = [pkgs.powershell-editor-services];
    };
  };
}
