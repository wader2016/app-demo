import 'package:flutter/material.dart';
import 'package:amap_base/amap_base.dart';

class DriverRecord extends StatefulWidget {
  DriverRecord({Key key}) : super(key: key);

  _DriverRecordState createState() => _DriverRecordState();
}

class _DriverRecordState extends State<DriverRecord> {

  AMapController aMapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('行车'),
      ),
      body: AMapView(
        onAMapViewCreated: (controller) {
          aMapController = controller;
        },
        amapOptions: AMapOptions(
          compassEnabled: false,
          zoomControlsEnabled: true,
          logoPosition: LOGO_POSITION_BOTTOM_CENTER,
          camera: CameraPosition(
            target: LatLng(41.851827, 112.801638),
            zoom: 10
          )
        ),
      )
    );
  }
}
