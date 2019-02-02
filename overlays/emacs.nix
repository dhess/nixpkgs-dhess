self: pkgs:

let

  coreEmacsPackages = epkgs: with epkgs; [
    async
    auto-compile
    auto-complete
    company
    company-cabal
    company-nixos-options
    company-terraform
    counsel
    counsel-projectile
    dante
    dash
    deadgrep
    dhall-mode
    direnv
    elpy
    exec-path-from-shell
    find-file-in-project
    flx-ido
    flycheck
    flycheck-haskell
    go-mode
    haskell-mode
    hindent
    hlint-refactor
    ido-describe-bindings
    ido-vertical-mode
    magit
    magit-popup
    markdown-mode
    nix-mode
    nix-sandbox
    nixos-options
    org-plus-contrib
    org-ref
    paredit
    popup
    projectile
    projectile-ripgrep
    rg
    ripgrep
    shm
    smex
    terraform-mode
    use-package
    web-mode
    yaml-mode
    yasnippet
    znc
  ];

  macOSEmacsPackages = epkgs: (with epkgs; [
    dash-at-point
  ]) ++ (coreEmacsPackages epkgs);

  myEmacsPackageOverrides = self: super: {
    # None currently.
  };

  # Taken from:
  # https://github.com/jwiegley/nix-config/blob/d22b72f14510d07e1438907e87cf26b34390a25f/overlays/10-emacs.nix#L929
  mkMelpaPackages = emacs:
    (pkgs.emacsPackagesNgGen emacs).overrideScope' (self: super:
      pkgs.lib.fix
        (pkgs.lib.extends
           myEmacsPackageOverrides
           (_: super.melpaPackages
                 // { inherit emacs;
                      inherit (super) melpaBuild;
                    })));

  emacs-nox = pkgs.emacs26-nox;

  emacsMacportPackagesNg = mkMelpaPackages pkgs.emacsMacport;
  emacsNoXPackagesNg = mkMelpaPackages emacs-nox;

  mkEmacsEnv = name: emacsPackagesFun:
  let
    emacs = emacsPackagesFun.emacsWithPackages coreEmacsPackages;
  in
  pkgs.buildEnv {
    inherit name;
    meta.platforms = emacs.meta.platforms;
    paths = [
      emacs
      pkgs.aspell
      pkgs.aspellDicts.en
      pkgs.ripgrep
    ];
  };

  emacs-nox-env = mkEmacsEnv "emacs-nox-env" emacsNoXPackagesNg;
  emacs-macport-env = mkEmacsEnv "emacs-macport-env" emacsMacportPackagesNg;

in
{
  inherit mkMelpaPackages mkEmacsEnv;
  inherit emacs-nox;
  inherit emacsMacportPackagesNg emacsNoXPackagesNg;
  inherit emacs-nox-env emacs-macport-env;  
}
