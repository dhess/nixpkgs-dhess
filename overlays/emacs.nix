self: super:

let

  inherit (super) buildEnv emacsPackagesNgGen;

in rec
{
  ## Override the emacs used in any expression.
  emacs = super.emacs25Macport;

  ## Emacs.
  emacs-env = buildEnv {
    name = "emacs-env";
    paths = with super; [
      (let customEmacsPackages =
         (emacsPackagesNgGen emacs).overrideScope (super: self: {
           # Use unstable MELPA for these packages.
           async = super.melpaPackages.async;
           auto-compile = super.melpaPackages.auto-compile;
           company = super.melpaPackages.company;
           company-cabal = super.melpaPackages.company-cabal;
           company-nixos-options = super.melpaPackages.company-nixos-options;
           dante = super.melpaPackages.dante;
           dash = super.melpaPackages.dash;
           dhall-mode = super.melpaPackages.dhall-mode;
           elpy = super.melpaPackages.elpy;
           exec-path-from-shell = super.melpaPackages.exec-path-from-shell;
           flycheck = super.melpaPackages.flycheck;
           flycheck-haskell = super.melpaPackages.flycheck-haskell;
           ghc-mod = super.melpaPackages.ghc-mod;
           haskell-mode = super.melpaPackages.haskell-mode;
           hindent = super.melpaPackages.hindent;
           hlint-refactor = super.melpaPackages.hlint-refactor;
           magit = super.melpaPackages.magit;
           magit-popup = super.melpaPackages.magit-popup;
           markdown-mode = super.melpaPackages.markdown-mode;
           nix-mode = super.melpaPackages.nix-mode;
           nix-sandbox = super.melpaPackages.nix-sandbox;
           nixos-options = super.melpaPackages.nixos-options;
           popup = super.melpaPackages.popup;
           projectile = super.melpaPackages.projectile;
           shm = super.melpaPackages.shm;
           web-mode = super.melpaPackages.web-mode;
           znc = super.melpaPackages.znc;

           # Ivy suite
           ivy = super.melpaPackages.ivy;
           swiper = super.melpaPackages.swiper;
           counsel = super.melpaPackages.counsel;
           counsel-projectile = super.melpaPackages.counsel-projectile;
        });
       in customEmacsPackages.emacsWithPackages (epkgs: [
         epkgs.async
         epkgs.auto-compile
         epkgs.auto-complete
         epkgs.company
         epkgs.company-cabal
         epkgs.company-nixos-options
         epkgs.counsel
         epkgs.counsel-projectile
         epkgs.dante
         epkgs.dash
         epkgs.dash-at-point
         epkgs.dhall-mode
         epkgs.elpy
         epkgs.exec-path-from-shell
         epkgs.flycheck
         epkgs.flycheck-haskell
         #epkgs.ghc-mod
         epkgs.go-mode
         epkgs.haskell-mode
         epkgs.hindent
         epkgs.hlint-refactor
         epkgs.magit
         epkgs.magit-popup
         epkgs.markdown-mode
         epkgs.nix-mode
         epkgs.nix-sandbox
         epkgs.nixos-options
         epkgs.org-plus-contrib
         epkgs.paredit
         epkgs.popup
         epkgs.projectile
         epkgs.shm
         epkgs.use-package
         epkgs.web-mode
         epkgs.yaml-mode
         epkgs.yasnippet
         epkgs.znc
        ]))
      aspell
      aspellDicts.en
    ];
  };
}
