import 'package:chatuidemo/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chatscreen extends StatefulWidget {
  const Chatscreen({super.key});

  @override
  State<Chatscreen> createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  TextEditingController _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat messages"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
            child: Column(
          children: [
            Expanded(
                child: Container(
              width: w,
              child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                      margin: EdgeInsets.all(5.0),
                      child: Row(
                          mainAxisAlignment: messages[index]['uid'] == 1234
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                          children: [
                            messages[index]['uid'] != 1234
                                ? SizedBox()
                                : giveTime(messages[index]['time']),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 14),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(
                                          messages[index]['uid'] == 1234
                                              ? 0
                                              : 20),
                                      topLeft: Radius.circular(
                                          messages[index]['uid'] == 1234
                                              ? 20
                                              : 00)),
                                  color: messages[index]['uid'] == 1234
                                      ? Colors.grey.shade800
                                      : Colors.grey.shade900.withOpacity(0.8)),
                              constraints: BoxConstraints(maxWidth: w * 2 / 3),
                              child: Text(messages[index]['text']),
                            ),
                            messages[index]['uid'] == 1234
                                ? SizedBox()
                                : giveTime(messages[index]['time'])
                          ]),
                    );
                  }),
            )),
            Container(
              height: 80,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                          hintText: "Enter a Message",
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                  )),
                  IconButton(
                      onPressed: () {
                        messages.add(_messageController.text);
                        print("messagesList-->" + messages.toString());
                      },
                      icon: Icon(Icons.send))
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }

  Widget giveTime(DateTime dateTime) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        DateFormat('kk:mm').format(dateTime),
        style:
            TextStyle(color: Colors.grey.shade600, fontStyle: FontStyle.italic),
      ),
    );
  }
}
