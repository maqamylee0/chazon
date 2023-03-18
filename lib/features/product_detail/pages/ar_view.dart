import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:ar_flutter_plugin/widgets/ar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ARViewPage extends StatefulWidget {
  const ARViewPage({Key? key}) : super(key: key);

  @override
  State<ARViewPage> createState() => _ARViewPageState();
}

class _ARViewPageState extends State<ARViewPage> {
  late ARSessionManager arSessionManager;
  late ARObjectManager arObjectManager;

//String localObjectReference;
  ARNode? localObjectNode;

//String webObjectReference;
  ARNode? webObjectNode;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
         child:ARView(onARViewCreated: onARViewCreated,)
      ),
    ));
  }

  void onARViewCreated( ARSessionManager arSessionManager,
      ARObjectManager arObjectManager, ARAnchorManager arAnchorManager,
      ARLocationManager arLocationManager){
    this.arSessionManager = arSessionManager;
    this.arObjectManager = arObjectManager;

    this.arSessionManager.onInitialize(
      showFeaturePoints: false,
      showPlanes: true,
      customPlaneTexturePath: "",
      showWorldOrigin: true,
      handleTaps: false,
    );

    this.arObjectManager.onInitialize();
    onLocalObjectButtonPressed();
  }
  Future<void> onLocalObjectButtonPressed() async {
    // 1
    if (localObjectNode != null) {
      arObjectManager.removeNode(localObjectNode!);
      localObjectNode = null;
    } else {
      // 2
      print("Beforeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
      var newNode = ARNode(
          type: NodeType.localGLTF2,
          // uri: "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/Duck/glTF/Duck.gltf",
          //  uri:"https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/Duck/glTF-Binary/Duck.glb",
          uri: "assets/mods/rover.gltf",
          scale: vector.Vector3(0.2, 0.2, 0.2),
          position: vector.Vector3(0.0, 0.0, 0.0),
          rotation: vector.Vector4(1.0, 0.0, 0.0, 0.0)
          );
      // 3
      bool? didAddLocalNode = await arObjectManager.addNode(newNode);
      print("Aftereeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");

      localObjectNode = (didAddLocalNode!) ? newNode : null;
    }
  }
}
