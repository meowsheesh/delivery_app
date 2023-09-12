import 'dart:async';

import 'package:delivery_test/domain/entities/points.dart';
import 'package:delivery_test/presentation/pages/home/bloc/home_page_bloc.dart';
import 'package:delivery_test/presentation/pages/home/widgets/my_tile_widget.dart';
import 'package:delivery_test/presentation/pages/home/widgets/reusable_choose_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui' as ui;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

late GoogleMapController mapController;
late String mapStyle;



class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin  {
  late BitmapDescriptor customIcon;
  late Uint8List markerIcon;
  late TabController tabController;

  @override
  void initState() {
    BitmapDescriptor.fromAssetImage(const ImageConfiguration(devicePixelRatio: 2.0,size: Size(50,50)),
        'assets/Active.png')
        .then((d) {
      customIcon = d;
    });
    loadMarkerIcon();
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  Future<void> loadMarkerIcon() async {
    final Uint8List iconData = await getBytesFromCanvas();
    setState(() {
      markerIcon = iconData;
    });
  }

  Future<Uint8List> getBytesFromCanvas() async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder, Rect.fromPoints(Offset(0, 0), Offset(130, 130)));

    final paint = Paint();
    paint.color = Color.fromRGBO(251, 75, 89, 0.5);
    canvas.drawCircle(Offset(100, 100), 54, paint);
    paint.color = Color.fromRGBO(251, 75, 89, 0.5);
    canvas.drawCircle(Offset(100, 100), 36, paint);
    paint.color = Color.fromRGBO(245, 96, 110, 1);
    canvas.drawCircle(Offset(100, 100), 18, paint);

    final img = await recorder.endRecording().toImage(155, 155);

    final scaledImg = await img.toByteData(format: ui.ImageByteFormat.png);
    return scaledImg!.buffer.asUint8List();
  }

  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    DefaultAssetBundle.of(context)
        .loadString('assets/google_map_style.json')
        .then((string) {
      mapStyle = string;
    }).catchError((error) {
      print(error.toString());
    });

    List<Marker> markers = <Marker>[
      Marker(
          markerId: const MarkerId('1'),
          position: const LatLng(59.936381, 30.316905),
          icon: BitmapDescriptor.fromBytes(markerIcon),
          draggable: false,
          infoWindow: const InfoWindow(
            title: 'Вы здесь',
          ),
          anchor: const Offset(1.0, 0.5),
          onTap: (){}
      ),
    ];

    _firstScreen(){
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: const Text('Доставка', style: TextStyle(color: Color(0xff1E1F1E), fontSize: 22, fontWeight: FontWeight.bold),),
          ),
          MyTileWidget(address: 'Проспект Ленина, 99 А', color: Color(0xffE53919), workingTime: DateTime.now()),
          Text('Доставка осуществляется от 999 ₽', style: TextStyle(color: Color(0xff1E1F1E), fontWeight: FontWeight.bold),),
          chooseButton(),
        ],
      );
    }

    _secondScreen(List<PointsEntity> points){
      return SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: const Text('Точки самовывоза', style: TextStyle(color: Color(0xff1E1F1E), fontSize: 22, fontWeight: FontWeight.bold),),
            ),
            ...points.map((e) => MyTileWidget(address: '${e.name}, ${e.address}', color: Colors.black, workingTime: e.workingTime!)),
            chooseButton(),
            SizedBox(height: 20,)
          ],
        ),
      );
    }


    return Scaffold(
      body: BlocBuilder<HomePageBloc,HomePageState>(
        builder: (_, state){
          if(state is HomePageReadyState){

            return Column(
              children: [
                // Half-height container for Google Maps widget
                ClipRRect(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
                  child: SizedBox(
                    height: 300,
                    child: GoogleMap(
                      zoomControlsEnabled: false,
                      initialCameraPosition: const CameraPosition(
                        target: LatLng(59.938529, 30.311696), // Initial map location
                        zoom: 14.0, // Initial zoom level
                      ),
                      onMapCreated: (GoogleMapController controller) {
                        controller.setMapStyle(mapStyle);
                        _controller.complete(controller);
                      },
                      markers: Set<Marker>.of(markers), // Add markers as needed
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 48),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffBCB9B9)),
                      borderRadius: BorderRadius.circular(40),
                      color: Color(0xffFCFCFC),
                    ),
                    child: TabBar(
                      onTap: (_){
                        if(tabController.index == 1){
                          List<Marker> updatedMarkers = [];
                          for(var point in state.points!){
                            updatedMarkers.add(
                                Marker(
                                    markerId:  MarkerId('${point.id}'),
                                    position: LatLng(point.lat!, point.lon!),
                                    draggable: false,
                                    infoWindow: InfoWindow(
                                      title: point.name!,
                                    ),
                                    onTap: (){}
                                )
                            );
                          }
                          setState(() {

                          });
                          markers = updatedMarkers;
                          print(markers.length);
                        }
                      },
                        unselectedLabelColor: Colors.black,
                        controller: tabController,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xff1E1F1E)),
                        tabs: [
                          Tab(text: 'Заберу сам(а)',),
                          Tab(text: 'Доставка',)
                        ]),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      _firstScreen(),
                      _secondScreen(state.points!),
                    ],
                  ),
                ),
              ],
            );
          }
          if(state is HomePageErrorState){
            return Center(child: Text('error'),);
          }
          return const Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
}