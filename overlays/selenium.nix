self: super:

let

  inherit (super) buildEnv;

in
{
  selenium-env = buildEnv {
    name = "selenium-env";
    paths = with super; [
      chromedriver
      selenium-server-standalone
    ];
    meta.platforms = super.chromedriver.meta.platforms;
  };
}
