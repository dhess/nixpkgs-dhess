self: super:

let

  inherit (self) nmap;

in
{

  opsec-env = super.buildEnv {
    name = "opsec-env";
    paths = [
      nmap
    ];
    meta.platforms = nmap.meta.platforms;
  };

}
