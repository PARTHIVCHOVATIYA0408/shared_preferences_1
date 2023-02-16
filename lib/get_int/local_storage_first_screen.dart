import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'local_storage_second_screen.dart';

class LocalStorageFirstScreen extends StatefulWidget {
  const LocalStorageFirstScreen({super.key});

  @override
  State<LocalStorageFirstScreen> createState() =>
      _LocalStorageFirstScreenState();
}

class _LocalStorageFirstScreenState extends State<LocalStorageFirstScreen> {
  SharedPreferences? sharedPreferences;
  int counter = 0;
  int counterTwo = 10;

  @override
  void initState() {
    super.initState();
    getInstanceData();
  }

  getInstanceData() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  setData() async {
    await sharedPreferences!.setInt('counter', 10);
    await sharedPreferences!.setInt('counter_two', 20);
  }

  getData() {
    if (sharedPreferences!.containsKey('counter')) {
      debugPrint('true');
      counter = sharedPreferences!.getInt('counter')!;
      counterTwo = sharedPreferences!.getInt('counter_two')!;
    } else {
      debugPrint('false');
      counter = 10;
      counterTwo = 10;
    }
    setState(() {});
  }

  removeData() {
    sharedPreferences!.remove('counter');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared Preference"),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              getData();
              debugPrint("GetData counter---------->>$getData()");
              debugPrint("GetData counter----->>> $counter");
              debugPrint("GetData counter Two ----->>> $counterTwo");
            },
            heroTag: 'get data',
            child: const Icon(Icons.arrow_downward),
          ),
          FloatingActionButton(
            onPressed: () {
              setData();
              debugPrint("SetData--------------->>$setData()");
              debugPrint("SetData counter---------->>$counter");
              debugPrint("SetData counter---------->>$counterTwo");
            },
            heroTag: "set data",
            child: const Icon(Icons.arrow_upward),
          ),
          FloatingActionButton(
            onPressed: () {
              removeData();
              debugPrint("remove counter---------->>$removeData()");
            },
            heroTag: "remove data",
            child: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Counter: $counter",
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "CounterTwo: $counterTwo",
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LocalStorageSecondScreen(),
                  ),
                );
              },
              child: const Text("Next Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
