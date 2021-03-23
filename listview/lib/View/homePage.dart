import 'package:flutter/material.dart';
import 'package:listview/Controller/controller.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Size screen;
  Controller controller = Controller();
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          width: screen.width,
          height: screen.height,
          //color: Colors.grey[300],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screen.height * 0.1),
              Text(
                "Browse Jobs",
                style: TextStyle(fontSize: 32),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    width: screen.width * 0.70,
                    child: TextField(
                      controller: name,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.gps_not_fixed_rounded,
                          color: Colors.black,
                        ),
                        hintText: "Search for job title",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey[400])),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        String nameUniversity = name.value.text;
                        controller.list(nameUniversity);
                      },
                      child: Icon(
                        Icons.gps_not_fixed_outlined,
                        color: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.black),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              if (name.value.text.isEmpty)
                Container(
                  height: screen.height * 0.6,
                  width: screen.width,
                  //color: Colors.blue,
                  child: Center(
                    child: Text(
                      "Enter name University",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                )
              else
                Container(
                    //color: Colors.grey[300],
                    height: screen.height * 0.60,
                    width: screen.width * 0.88,
                    child: buildContainer(name.value.text))
            ],
          ),
        ),
      ),
    );
  }

  buildContainer(val) {
    return Container(
      child: FutureBuilder(
        future: controller.list(val),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Container(
                  child: ListTile(
                    trailing: Icon(
                      Icons.toc_rounded,
                      color: Colors.black,
                    ),
                    leading: Icon(Icons.school_rounded, color: Colors.black),
                    dense: true,
                    title: Text(
                      "University: " + snapshot.data[index].name,
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    subtitle: Text(
                      "Country: " +
                          snapshot.data[index].country +
                          "\nAlpha Two Code: " +
                          snapshot.data[index].alphaTwoCode,
                      style: TextStyle(color: Colors.blue[600]),
                    ),
                  ),
                  margin: EdgeInsets.only(top: 3, bottom: 3),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[400]),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
