self: super:

let

in
{

  opsec-env = super.buildEnv {

    name = "opsec-env";

    paths = with super; [
      nmap
    ];

  };

}
