import 'package:flutter/material.dart';
import 'package:wheatherapp/services/data/countries.dart';
import 'package:wheatherapp/ui/widgets/bottompart.dart';
import 'package:wheatherapp/ui/widgets/loading.dart';
import 'package:wheatherapp/ui/widgets/toppart.dart';
import 'package:wheatherapp/services/get_api.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String country = 'Turkey';
  bool isLoading = false;
  dynamic decoded;

  getDataFromApi() {
    isLoading = true;
    GetApi().getData(country).then((value) {
      setState(() {
        decoded = value;

        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    isLoading = true;
    super.initState();
    getDataFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingView(
      isLoading: isLoading,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text(
            "Weather Now",
            style: TextStyle(
              fontFamily: "mainfont",
              fontSize: 30,
            ),
          ),
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.map_outlined),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        drawer: Drawer(
          child: ListView.builder(
              itemCount: countries.length,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text(countries[i]),
                  onTap: () {
                    country = countries[i];
                    print(country);
                    getDataFromApi();
                    Navigator.pop(context);
                  },
                );
              }),
        ),
        body: Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Container(
                width: (MediaQuery.of(context).size.width) - 50,
                height: 1,
                color: Colors.white70,
              ),
              SizedBox(height: 50),
              TopPart(decoded: decoded, country: country),
              SizedBox(height: 40),
              BottomPart(decoded: decoded, country: country),
            ],
          ),
        ),
      ),
    );
  }
}
