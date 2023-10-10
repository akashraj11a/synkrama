import 'package:flutter/material.dart';
import 'package:synkrama_test/homePage.dart';
import 'package:synkrama_test/shared_preference.dart';
import 'image_card.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 0;
  SharedPreferenceClass sharedPreferenceClass = SharedPreferenceClass();

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List widgetOptions = [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  height : 150,
                  child: ListView.builder(scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context,index){
return ImageCard(image: "images/getty_495142964_198701.jpg");
                  }),
                ),
                Container(
                  height: 150,
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context,index){
                        return ImageCard(image: "images/getty_495142964_198701.jpg");
                      }),
                ),
            Container(
              height: 150,
              child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
          ),
    itemCount: 5,
    itemBuilder: (BuildContext context, int index) {
    return ImageCard(
           image: "images/getty_495142964_198701.jpg",
    );
              }
              ),
            )
              ],
            )),

      Text('Order'),
      SizedBox(
        width: 150,
        height: 40,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.deepOrangeAccent),
              shape: MaterialStateProperty.all<
                  RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                          color: Colors.deepOrangeAccent)))),
          onPressed: () async {
            await SharedPreferenceClass().removeItem();
            Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context)=>HomePage()));
          },
          child: Text("Log Out"),
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
         centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.deepOrangeAccent,
        onTap: onItemTapped,
      ),
    );
  }

}

