import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageSecondScreen extends StatefulWidget {
  const LocalStorageSecondScreen({super.key});

  @override
  State<LocalStorageSecondScreen> createState() =>
      _LocalStorageSecondScreenState();
}

class _LocalStorageSecondScreenState extends State<LocalStorageSecondScreen> {
  SharedPreferences? sharedPreferences;
  int counOne = 0;
  int counTwo = 50;

  @override
  void initState() {
    super.initState();
    getInstanceData();
  }

  getInstanceData() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  getData() {
    if (sharedPreferences!.containsKey('counter')) {
      debugPrint('true');
      counOne = sharedPreferences!.getInt('counter')!;
      counTwo = sharedPreferences!.getInt('counter_two')!;
    } else {
      debugPrint('false');
      counOne = 200;
      counTwo = 200;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LocalStorageSecondScreen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Counter : $counOne",
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Counter : $counTwo",
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getData();
          debugPrint("second screen getData--------------->$getData()");
          debugPrint("counter---------->>$counOne");
          debugPrint("counter---------->>$counTwo");
        },
        heroTag: 'get data second',
        child: const Icon(Icons.arrow_downward),
      ),
    );
  }
}
