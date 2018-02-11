{ pkgs
, python2Packages
, fetchFromGitHub
, libxslt
, docbook5_xsl
, openssh
}:

python2Packages.buildPythonApplication rec {
  name = "nixops-${version}";
  version = "1.6pre-git";

  src = ./nixops-1.6pre0_abcdef.tar.bz2;

  buildInputs = [ libxslt ];

  pythonPath = with python2Packages; [
    prettytable
    boto
    boto3
    hetzner
    libcloud
    libvirt
    azure-storage
    azure-mgmt-compute
    azure-mgmt-network
    azure-mgmt-resource
    azure-mgmt-storage
    adal
    # Go back to sqlite once Python 2.7.13 is released
    pysqlite
    datadog
    digital-ocean
    vultr
  ];

  doCheck = false;

  postInstall = ''
    make -C doc/manual install nixops.1 docbookxsl=${docbook5_xsl}/xml/xsl/docbook \
      docdir=$out/share/doc/nixops mandir=$out/share/man

    mkdir -p $out/share/nix/nixops
    cp -av "nix/"* $out/share/nix/nixops

    # Add openssh to nixops' PATH. On some platforms, e.g. CentOS and RHEL
    # the version of openssh is causing errors when have big networks (40+)
    wrapProgram $out/bin/nixops --prefix PATH : "${openssh}/bin"
  '';

  meta = with pkgs.lib; {
    homepage = https://github.com/NixOS/nixops;
    description = "NixOS cloud provisioning and deployment tool";
    maintainers = maintainers.dhess-pers;
    platforms = platforms.unix;
  };
}
