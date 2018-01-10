self: super:

let

  inherit (super) buildEnv;

in
{
  selenium-env = buildEnv {
    name = "selenium-env";
    paths = with self; [
      chromedriver
      selenium-server-standalone
    ];
    meta.platforms = self.chromedriver.meta.platforms;
  };
}
