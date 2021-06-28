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
        // appBar: AppBar(
        //   title: Center(
        //     child: Text(
        //       "ToDo App",
        //       style: TextStyle(color: Color(0xff070726)),
        //     ),
        //   ),
        //   backgroundColor: Colors.white,
        // ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Color(0xff070726),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                      ),
                      child: Text(
                        "ToDo List",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 40,
                          child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("Add Item"),
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
                              style: ElevatedButton.styleFrom(
                                primary: Colors.cyan,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                              ))),
                      Container(
                          height: 40,
                          margin: EdgeInsets.all(10),
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  todoList.clear();
                                });
                              },
                              child: Icon(Icons.delete_forever_outlined),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                              ))),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, bottom: 15),
                    child: Text(
                      "MY Todos",
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: todoList.length,
                      itemBuilder: (context, index) {
                        if (todoList.isNotEmpty) {
                          return Center(
                            child: Container(
                              height: 40,
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
                                                            Navigator.of(
                                                                    context)
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
                                            Icons.delete,
                                            color: Color(0xff070726),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return ListTile(
                            title: Text(
                              "NO ITEMS AVAILABLE",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          );
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
