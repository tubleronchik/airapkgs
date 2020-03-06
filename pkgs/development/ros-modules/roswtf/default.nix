{ stdenv
, mkRosPackage
, fetchFromGitHub
, catkin
, rosbuild
, rosgraph
, roslaunch
, roslib
, rosnode
, rosservice
, rostest
}:

let
  pname = "roswtf";
  version = "1.14.4";
  rosdistro = "melodic";

in mkRosPackage {
  name = "${pname}-${version}";

  src = fetchFromGitHub {
    owner = "ros-gbp";
    repo = "ros_comm-release";
    rev = "release/${rosdistro}/${pname}/${version}-0";
    sha256 = "149dsivpkr1ylf6600mn4251585dj5vacn1g5jgxay67ihj9k4mj";
  };

  propagatedBuildInputs = [ catkin rosbuild rosgraph roslaunch roslib rosnode rosservice rostest ];

  meta = with stdenv.lib; {
    description = "Tool for diagnosing issues with a running ROS system";
    homepage = http://wiki.ros.org/roswtf;
    license = licenses.bsd3;
    maintainers = [ maintainers.akru ];
  };
}
