import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
   MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

  bool isPlaying= false;
  final assetAudioPlayer=AssetsAudioPlayer();

  @override
  void initState(){
    assetAudioPlayer.open(Audio('assets/audio/mp3sample.mp3'),
    autoStart: false);
    assetAudioPlayer.playlistFinished.listen((event) {
      print(" Iam Listening hereeeeeeeeee");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("jijij"),
      ),
      body:Center(
          child:ListView(
            children: [
              ListTile(
                title:const Text("my Audio"),
                trailing:IconButton(
                  onPressed:(){
                    if(assetAudioPlayer.isPlaying.value){
                      assetAudioPlayer.pause();
                      }
                      else{
                      assetAudioPlayer.play();
                    }
                    //assetAudioPlayer.playOrPause();
                    setState(() {
                      isPlaying = !isPlaying;
                    });
                  },
                  icon: isPlaying ? const Icon(Icons.pause):const Icon(Icons.play_arrow),



              ))
            ],
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}



