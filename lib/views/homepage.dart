import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:testmobile/controllers/controllers.dart';
import 'package:testmobile/views/adddata.dart';
import 'package:testmobile/views/detail.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  var personCon = Get.put(personController());
  String? dropdownValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(personCon.province.length);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('หน้าแรก'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: 'รายชื่อทั้งหมด',
              ),
              Tab(
                text: 'รายชื่อแยกตามจังหวัด',
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // personCon.addPerson();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => adddata()));
          },
          child: const Icon(Icons.add),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: GetX<personController>(builder: (controller) {
                return ListView.builder(
                    padding: EdgeInsets.all(20),
                    itemCount: controller.person.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => detail(
                                          id: index,
                                        ))));
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'เลขบัตร : ${controller.person[index].citizen}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'ชื่อ-นามสกุล : ${controller.person[index].name}',
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 88, 88, 88)),
                                      )
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        showDialog<void>(
                                          context: context,
                                          barrierDismissible:
                                              false, // user must tap button!
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text('คำเตือน'),
                                              content:
                                                  const SingleChildScrollView(
                                                child: ListBody(
                                                  children: <Widget>[
                                                    Text(
                                                        'ต้องการลบใช่หรือไม่?'),
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: const Text('ลบ'),
                                                  onPressed: () {
                                                    personCon.delPerson(index);
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                TextButton(
                                                  child: const Text('ยกเลิก'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red[200],
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              }),
            ),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Obx(() => DropdownButton(
                              isExpanded: true,
                              hint: Text("เลือกจังหวัด"),
                              icon: Icon(Icons.arrow_drop_down),
                              elevation: 1,
                              underline: Container(),
                              style: const TextStyle(color: Colors.black),
                              items: personCon.province.map((item) {
                                return DropdownMenuItem(
                                  child: Text(item.name_th),
                                  value: item.name_th.toString(),
                                );
                              }).toList(),
                              onChanged: (newVal) {
                                setState(() {
                                  dropdownValue = newVal;
                                });
                              },
                              value: dropdownValue,
                            )),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GetX<personController>(builder: (controller) {
                      return ListView.builder(
                          padding: EdgeInsets.all(20),
                          itemCount: controller.person
                              .where((p0) => p0.province == dropdownValue)
                              .length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => detail(
                                                id: index,
                                              ))));
                                },
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'เลขบัตร : ${controller.person[index].citizen}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'ชื่อ-นามสกุล : ${controller.person[index].name}',
                                              style: TextStyle(
                                                  color: const Color.fromARGB(
                                                      255, 88, 88, 88)),
                                            )
                                          ],
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              showDialog<void>(
                                                context: context,
                                                barrierDismissible:
                                                    false, // user must tap button!
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title:
                                                        const Text('คำเตือน'),
                                                    content:
                                                        const SingleChildScrollView(
                                                      child: ListBody(
                                                        children: <Widget>[
                                                          Text(
                                                              'ต้องการลบใช่หรือไม่?'),
                                                        ],
                                                      ),
                                                    ),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        child: const Text('ลบ'),
                                                        onPressed: () {
                                                          personCon
                                                              .delPerson(index);
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                      TextButton(
                                                        child: const Text(
                                                            'ยกเลิก'),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.red[200],
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
