import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataList extends StatefulWidget {
  const DataList({super.key});

  @override
  State<DataList> createState() => _DataListState();
}

class _DataListState extends State<DataList> {
  List<String> data = [];
  TextEditingController datactr = TextEditingController();

//sharedprifernce work

  setdata() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setStringList("store", data);
  }

  getdata() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    setState(() {
      data = shared.getStringList("store") ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(data);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.camera_alt),
          )
        ],
        leading: Icon(Icons.manage_search_sharp),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            data.removeAt(index); // Corrected line
                          });
                        },
                        icon: const Icon(Icons.delete),
                      ),
                      tileColor: Colors.lightBlueAccent,
                      title: Text(
                        data[index],
                        style: const TextStyle(color: Colors.black),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: data.length)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                onChanged: (value) { 
                  setState(() {});
                },
                controller: datactr,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    suffixIcon: datactr.text.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                data.add(datactr.text);
                                datactr.clear();
                              });
                            },
                            icon: const Icon(Icons.send))
                        : IconButton(
                            icon: const Icon(Icons.camera_alt_outlined),
                            onPressed: () {},
                          ))),
          ),
        ],
      ),
    );
  }
}
