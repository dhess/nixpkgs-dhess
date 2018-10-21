self: super:

let

  inherit (super) buildEnv emacsPackagesNgGen;

in
{
  ## Override the emacs used in any expression.
  emacs = if super.stdenv.system == "x86_64-darwin"
          then self.emacs25Macport
          else self.emacs25-nox;

  ## Emacs.
  emacs-env = buildEnv {
    name = "emacs-env";
    meta.platforms = self.emacs.meta.platforms;
    paths = [
      (let customEmacsPackages =
        # XXX dhess - can we do this with an overlay?
        (emacsPackagesNgGen self.emacs).overrideScope' (self: super: {
           # Use unstable MELPA for these packages.
           async = super.melpaPackages.async;
           auto-compile = super.melpaPackages.auto-compile;
           company = super.melpaPackages.company;
           company-cabal = super.melpaPackages.company-cabal;
           company-nixos-options = super.melpaPackages.company-nixos-options;
           company-terraform = super.melpaPackages.company-terraform;
           dante = super.melpaPackages.dante;
           dash = super.melpaPackages.dash;
           dhall-mode = super.melpaPackages.dhall-mode;
           elpy = super.melpaPackages.elpy;
           exec-path-from-shell = super.melpaPackages.exec-path-from-shell;
           find-file-in-project = super.melpaPackages.find-file-in-project;
           flx-ido = super.melpaPackages.flx-ido;
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
           projectile-ripgrep = super.melpaPackages.projectile-ripgrep;
           rg = super.melpaPackages.rg;
           ripgrep = super.melpaPackages.ripgrep;
           shm = super.melpaPackages.shm;
           terraform-mode = super.melpaPackages.terraform-mode;
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
         epkgs.company-terraform
         epkgs.counsel
         epkgs.counsel-projectile
         epkgs.dante
         epkgs.dash
         epkgs.dash-at-point
         epkgs.dhall-mode
         epkgs.elpy
         epkgs.exec-path-from-shell
         epkgs.find-file-in-project
         epkgs.flx-ido
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
         #epkgs.org-plus-contrib
         epkgs.paredit
         epkgs.popup
         epkgs.projectile
         epkgs.projectile-ripgrep
         epkgs.rg
         epkgs.ripgrep
         epkgs.shm
         epkgs.terraform-mode
         epkgs.use-package
         epkgs.web-mode
         epkgs.yaml-mode
         epkgs.yasnippet
         epkgs.znc
        ]))

      self.aspell
      self.aspellDicts.en
      self.ripgrep
    ];
  };
}
