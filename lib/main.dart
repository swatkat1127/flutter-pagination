import 'package:flutter/material.dart';
import 'services/network.dart';
import 'screen/detailsPage.dart';
import 'services/connection.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text('Rajasthan Studio'),
              backgroundColor: Colors.blueGrey,
            ),
            body: ListSearch()));
  }
}

class ListSearch extends StatefulWidget {
  ListSearchState createState() => ListSearchState();
}

class ListSearchState extends State<ListSearch> {
  TextEditingController _textController = TextEditingController();
  List<dynamic> mainDataList = [];
  List<dynamic> newDataList = [];
  bool isLoading = false;
  int pageCounter = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Connection.check();
    getMainDataList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                icon: Icon(Icons.search),
                hintText: 'Search Here...',
              ),
              onChanged: onItemChanged,
            ),
          ),
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (!isLoading &&
                    scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent) {
                  pageCounter = pageCounter + 1;
                  getMainDataList(page: pageCounter);
                  print(pageCounter);
                  // start loading data
                  setState(() {
                    isLoading = true;
                  });
                }
                return true;
              },
              child: ListView(
                padding: EdgeInsets.all(10.0),
                children: newDataList.map((d) {
                  return ListTile(
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(d['src']['small'])),
                    title: Text(d['photographer']),
                    subtitle: Text(d['photographer_url']),
                    onTap: () {
                      Navigator.push(
                          (context),
                          MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                    photographerName: d['photographer'],
                                    photographerUrl: d['photographer_url'],
                                    photographerId: d['photographer_id'],
                                    avgColor: d['avg_color'],
                                    image: d['src']['small'],
                                    // Description: d['Description'],
                                    // SubCategory: d['SubCategory'],
                                    // Category: d['Category'],
                                  )));
                    },
                  );
                }).toList(),
              ),
            ),
          ),
          Container(
            height: isLoading ? 50.0 : 0,
            color: Colors.white70,
            child: Center(
              child: new CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }

  onItemChanged(String text) {
    setState(() {
      newDataList = mainDataList
          .where((s) =>
              s["photographer"].toLowerCase().contains(text.toLowerCase()))
          .toList();
    });
    print(newDataList);
  }

  void getMainDataList({int page = 1, int per_page = 20}) async {
    NetworkHelper np = NetworkHelper(
        'https://api.pexels.com/v1/search?query=nature&per_page=$per_page&page=$page');
    var data;
    try {
      data = await np.getData();
    } catch (err) {
      data = {'photos': null};
    }

    setState(() {
      List<dynamic> results = data['photos'];
      mainDataList = results;
      newDataList.addAll(List.from(mainDataList));
      isLoading = false;
    });
  }
}
