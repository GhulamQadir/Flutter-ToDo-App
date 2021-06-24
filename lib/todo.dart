import 'package:flutter/material.dart';

class ToDo extends StatefulWidget {
  @override
  _ToDoState createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  List<dynamic> todoList = [];
  var output = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                "ToDo App",
                style: TextStyle(color: Color(0xff070726)),
              ),
            ),
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: Color(0xff070726),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                        child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          todoList.clear();
                        });
                      },
                      child: Text(
                        "Delete All",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                          ),
                          side: BorderSide(color: Colors.white, width: 2)),
                    )),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: todoList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 40,
                            // color: Colors.white,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                )),
                            margin: EdgeInsets.only(top: 15),
                            child: ListTile(
                              title: Text("${todoList[index]}"),
                              trailing: Container(
                                width: 50,
                                child: Row(
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: Text("Edit ToDo"),
                                                  content: TextField(
                                                    onChanged: (value) {
                                                      output = value;
                                                    },
                                                  ),
                                                  actions: [
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                          setState(() {
                                                            todoList
                                                                .replaceRange(
                                                                    index,
                                                                    index + 1,
                                                                    {output});
                                                          });
                                                        },
                                                        child: Text("Edit"))
                                                  ],
                                                );
                                              });
                                        },
                                        child: Icon(
                                          Icons.edit,
                                          color: Color(0xff070726),
                                        )),
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            todoList.removeAt(index);
                                          });
                                        },
                                        child: Icon(
                                          Icons.delete_forever,
                                          color: Color(0xff070726),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Add ToDo"),
                      content: TextField(
                        onChanged: (value) {
                          output = value;
                        },
                      ),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              setState(() {
                                todoList.add(output);
                              });
                            },
                            child: Text("Add"))
                      ],
                    );
                  });
            },
            child: Icon(Icons.add),
          )),
    );
  }
}
