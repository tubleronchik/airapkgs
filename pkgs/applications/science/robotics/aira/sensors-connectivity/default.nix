{ pkgs ? import <nixpkgs> { }
, stdenv
, fetchFromGitHub
, mkRosPackage
, robonomics_comm
, python3Packages
}:

mkRosPackage rec {
  name = "${pname}-${version}";
  pname = "sensors-connectivity";
  version = "274cc1a";

  src = fetchFromGitHub {
    owner = "airalab";
    repo = "${pname}";
    rev = "274cc1a12608db657d8fa3c289c82bee16656cd6";
    sha256 = "sha256:0fdwda0al1wx8fsh2nr327s0fb8x6gfclxrwj1wis34dg6m1abh6";
  };

  propagatedBuildInputs = [ robonomics_comm python3Packages.pyserial python3Packages.sentry-sdk python3Packages.pynacl];

  meta = with stdenv.lib; {
    description = "Aira source package to input data from sensors. ROS-enabled telemetry agent";
    homepage = http://github.com/airalab/sensors-connectivity;
    license = licenses.bsd3;
    maintainers = with maintainers; [ vourhey spd ];
  };
}
