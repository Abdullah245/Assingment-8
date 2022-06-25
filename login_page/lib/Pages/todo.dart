import 'package:flutter/material.dart';
import 'package:login_page/Constant/textconst.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

List<String> chats = [];
TextEditingController chatNameText = TextEditingController();
TextEditingController update = TextEditingController();

class _HomeState extends State<Home> {
  addChats() {
    setState(() {
      chats.add(chatNameText.text);
      chatNameText.clear();
    });
  }

  removeChats(index) {
    setState(() {
      chats.removeAt(index);
    });
  }

  updateChats(index) {
    setState(() {
      chats.replaceRange(index, index + 1, {chats[index]});
      update.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextConstants.tittle),
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .7,
            child: TextField(controller: chatNameText),
          ),
          ElevatedButton(
            onPressed: () {
              addChats();
            },
            child: Text(TextConstants.add),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: ((context, index) {
                return ListTile(
                  tileColor: Colors.grey,
                  title: Text(chats[index]),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            removeChats(index);
                          },
                          color: Colors.black,
                          icon: Icon(Icons.delete_forever),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                      title: Text(
                                        TextConstants.update,
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      alignment: Alignment.center,
                                      backgroundColor:
                                          Colors.white.withOpacity(.8),
                                      content: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: TextField(
                                              controller: update,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                              ),
                                              onChanged: (value) {
                                                chats[index] = value;
                                              },
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              updateChats(index);
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(TextConstants.update),
                                          )
                                        ],
                                      ),
                                    ));
                          },
                          color: Colors.black,
                          icon: Icon(Icons.update),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: FloatingActionButton(
              onPressed: addChats,
              child: Icon(Icons.add),
            ),
          )
        ],
      )),
    );
  }
}
