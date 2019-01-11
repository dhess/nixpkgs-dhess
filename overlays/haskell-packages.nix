self: super:

let

  inherit (self.haskell.lib) doJailbreak dontCheck properExtend;

  exeOnly = super.haskell.lib.justStaticExecutables;

  haskellPackages = properExtend super.haskellPackages (self: super: {
    dhess-ssh-keygen = doJailbreak (super.callPackage ../pkgs/haskell/dhess-ssh-keygen.nix {});
    fm-assistant = dontCheck (super.callPackage ../pkgs/haskell/fm-assistant.nix {});
  });

in
{
  inherit haskellPackages;

  fm-assistant = exeOnly (self.haskellPackages.fm-assistant);
  dhess-ssh-keygen = exeOnly (self.haskellPackages.dhess-ssh-keygen);
}
