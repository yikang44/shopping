import 'package:flutter/material.dart';
import 'package:shopping/edit.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  bool isFull = true;
  bool isChanged = true;
  String select = '全部';

  final List<String> itemList = ['全部', '電子產品', '服裝', '食品', '書籍'];

  final List<Map<String, String>> product = [
    {'name': '電子產品', 'itemLists': '電子產品'},
    {'name': '蘋果西打', 'itemLists': '食品'},
    {'name': 'switch', 'itemLists': '電子產品'},
    {'name': 'iphone16', 'itemLists': '電子產品'},
    {'name': '長尾服', 'itemLists': '服裝'},
    {'name': '三國演義', 'itemLists': '書籍'},
    {'name': '水滸傳', 'itemLists': '書籍'},
    {'name': '鐵路便當', 'itemLists': '食品'},
  ];

  List<Map<String, String>> get productLocation {
    if (select == '全部') {
      return product;
    }

    return product
        .where((product) => product['itemLists'] == select)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Icon(
                    Icons.thirty_fps_sharp,
                    size: 45,
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                Container(
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const edit()));
                      },
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        size: 30,
                      )),
                ),
                Container(
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const edit()));
                      },
                      icon: Icon(
                        Icons.account_circle_rounded,
                        size: 30,
                      )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 1.2,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20.0)),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Search some......",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.search),
                      prefixIconColor: Colors.black,
                      border: InputBorder.none),
                ),
              ),
              Container(
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      isChanged = !isChanged;
                    });
                  },
                  icon: Icon(
                    isChanged ? Icons.list_outlined : Icons.grid_view,
                    color: Colors.black,
                  ),
                ),
              )
            ]),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                ),
              )),
          Expanded(
            child: isChanged ? buildGridView() : buildListView(),
          )
        ]),
      ),
    );
  }

  Widget buildGridView() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            child: Center(
              child: Text("商品 $index"),
            ),
          );
        });
  }

  Widget buildListView() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.short_text_outlined),
            title: Text("商品$index"),
          );
        });
  }
}
