{ stdenv
, mkRosPackage
, fetchFromGitHub
, rosconsole
, rostest
, roscpp
, rosunit
, xmlrpcpp
}:

mkRosPackage rec {
  name = "${pname}-${version}";
  pname = "message_filters";
  version = "1.14.4";
  rosdistro = "melodic";

  src = fetchFromGitHub {
    owner = "ros-gbp";
    repo = "ros_comm-release";
    rev = "release/${rosdistro}/${pname}/${version}-0";
    sha256 = "09y128xbjad9m401xyy1yjc3q6kdyf40y4cb0q3d4fcvvyq4lqiy";
  };

  propagatedBuildInputs = [ rosconsole rostest roscpp rosunit xmlrpcpp ];

  meta = with stdenv.lib; {
    description = "A set of message filters which take in messages and may output those messages at a later time, based on the conditions that filter needs met";
    homepage = http://wiki.ros.org/message_filters;
    license = licenses.bsd3;
    maintainers = [ maintainers.akru ];
  };
}
