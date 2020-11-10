import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'view/main_router.dart';
import 'data_managment/data_model.dart';
import 'package:provider/provider.dart';

void main() async {
  // var channel = Api.ws.emulator.websocket.channel();
  // channel.sink.add("Hello my server");
  // channel.stream.listen((message) {
  //   print(message);
  //   sleep(Duration(seconds: 1));
  //   channel.sink.add("ABRA cadabra");
  //   //channel.sink.close(status.goingAway);
  // })
  runApp(FutureProvider<DataModel>(
      initialData: DataModel.blank(),
      create: (_) {
        return DataModel.futureCreate();
      },
      child: AssisstantApp()));
}

class AssisstantApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("assets/background_two.jpg"),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        color: Theme.of(context).backgroundColor,
        child: MaterialApp(
            title: 'Assisstant',
            theme: ThemeData(
              primarySwatch: Colors.deepPurple,
              primaryColorLight: Colors.deepPurple[400],
              backgroundColor: Colors.lightBlue[100],
              textTheme: GoogleFonts.nunitoTextTheme(TextTheme(
                  headline5: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black54))),
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: MainRouter()));
  }
}

// class MainProvider extends StatefulWidget {
//   DataModel dataModel;

//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }
// }

// class MainProviderState extends State<MainProvider> {
//   @override
//   Widget build(BuildContext context) {
//     return Provider<Future<DataModel>>(
//       create: (context) => DataModel.futureCreate(),
//       dispose: (context, future_data) => future_data.then((data) => data.dispose()),
//       child: FutureProvider(lazy: ,),
//     )
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//   }
// }
