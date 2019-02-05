# Based on
# https://github.com/input-output-hk/iohk-ops/blob/df01a228e559e9a504e2d8c0d18766794d34edea/jobsets/default.nix

{ nixpkgs ? <nixpkgs>
, declInput ? {}
}:

let

  nixpkgsDhessUri = "https://github.com/dhess/nixpkgs-dhess.git";

  mkFetchGithub = value: {
    inherit value;
    type = "git";
    emailresponsible = false;
  };

  nixpkgs-src = builtins.fromJSON (builtins.readFile ../nixpkgs-src.json);

  pkgs = import nixpkgs {};

  defaultSettings = {
    enabled = 1;
    hidden = false;
    keepnr = 10;
    schedulingshares = 400;
    checkinterval = 300;
    enableemail = false;
    emailoverride = "";
    nixexprpath = "jobsets/release.nix";
    nixexprinput = "nixpkgsDhess";
    description = "Drew's Nixpkgs overlay";
    inputs = {
      nixpkgsDhess = mkFetchGithub "${nixpkgsDhessUri} master";
    };
  };

  mkBranch = nixpkgsDhessBranch: {
    checkinterval = 300;
    schedulingshares = 100;
    inputs = {
      nixpkgsDhess = mkFetchGithub "${nixpkgsDhessUri} ${nixpkgsDhessBranch}";
    };
  };

  mkAlternate = nixpkgsDhessBranch: nixpkgsRev: {
    checkinterval = 300;
    schedulingshares = 100;
    inputs = {
      nixpkgs_override = mkFetchGithub "https://github.com/NixOS/nixpkgs-channels.git ${nixpkgsRev}";
      nixpkgsDhess = mkFetchGithub "${nixpkgsDhessUri} ${nixpkgsDhessBranch}";
    };
  };

  mkNixpkgs = nixpkgsDhessBranch: nixpkgsRev: {
    checkinterval = 60 * 60 * 12;
    schedulingshares = 100;
    inputs = {
      nixpkgs_override = mkFetchGithub "https://github.com/NixOS/nixpkgs.git ${nixpkgsRev}";
      nixpkgsDhess = mkFetchGithub "${nixpkgsDhessUri} ${nixpkgsDhessBranch}";
    };
  };

  mainJobsets = with pkgs.lib; mapAttrs (name: settings: defaultSettings // settings) (rec {
    master = {};
    nixos-unstable = mkAlternate "master" "nixos-unstable";
    nixpkgs-unstable = mkAlternate "master" "nixpkgs-unstable";
    nixpkgs = mkNixpkgs "master" "master";
  });

  jobsetsAttrs = mainJobsets;

  jobsetJson = pkgs.writeText "spec.json" (builtins.toJSON jobsetsAttrs);

in {
  jobsets = with pkgs.lib; pkgs.runCommand "spec.json" {} ''
    cat <<EOF
    ${builtins.toJSON declInput}
    EOF
    cp ${jobsetJson} $out
  '';
}
