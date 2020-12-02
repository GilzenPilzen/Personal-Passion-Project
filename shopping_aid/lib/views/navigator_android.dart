import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

//import 'package:arkit_plugin/arkit_plugin.dart';
// import 'dart:io' show Platform;

class ArCoreNavigator extends StatefulWidget {

  @override
_ArCoreNavigatorState createState() => _ArCoreNavigatorState();
}

class _ArCoreNavigatorState extends State<ArCoreNavigator> {
  ArCoreController arCoreController;

  _onArCoreViewCreated(ArCoreController _arcoreController) {
    arCoreController = _arcoreController;
    _addSphere(arCoreController);
  }

  _addSphere(ArCoreController _arcoreController){
      final material = ArCoreMaterial(color: Colors.blue);
      final sphere = ArCoreSphere(materials:  [material], radius: 0.2);
      final node = ArCoreNode(
        shape: sphere, 
        position: vector.Vector3(
          0, 0, -1
        )
      );

      _arcoreController.addArCoreNode(node);
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) { 

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        
      ),
      body: 
        ArCoreView(onArCoreViewCreated: _onArCoreViewCreated,)
      

    );
  }
}

// class ArKitNavigator extends StatefulWidget {
//   @override
//   _ArKitNavigatorState createState() => _ArKitNavigatorState();
// }

// class _ArKitNavigatorState extends State<ArKitNavigator> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }