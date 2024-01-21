import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:my_workshop/view/home_view.dart';
import 'package:my_workshop/view/input_form_view.dart';
import 'package:my_workshop/view/profile_view.dart';
import 'package:my_workshop/view/shop_view.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  int visit = 0;
  List<TabItem> items = [
    TabItem(
      icon: Icons.home,
      title: 'Home',
    ),
    TabItem(
      icon: Icons.shop,
      title: 'Shop',
    ),
    TabItem(
      icon: Icons.people,
      title: 'Profile',
    ),
  ];

  List<Widget> pages = [
    HomeView(),
    ShopView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Workshop",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InputFormView(),
                ),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 54),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(90),
                  child: Image.network(
                    "https://files.vogue.co.th/uploads/intro-1499809511.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                "robert downey jr",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 32),
              TextButton(
                onPressed: () {},
                child: Text("Menu1"),
              ),
              TextButton(
                onPressed: () {},
                child: Text("Menu2"),
              ),
              TextButton(
                onPressed: () {},
                child: Text("Menu3"),
              ),
              TextButton(
                onPressed: () {},
                child: Text("Menu4"),
              ),
            ],
          ),
        ),
      ),
      body: pages[visit],
      bottomNavigationBar: BottomBarInspiredOutside(
        items: items,
        color: Colors.black45,
        backgroundColor: Colors.white,
        colorSelected: Colors.white,
        itemStyle: ItemStyle.circle,
        borderRadius: BorderRadius.circular(0),
        elevation: 6,
        chipStyle: ChipStyle(
          background: Colors.amber,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
        ),
        indexSelected: visit,
        onTap: (index) => setState(() {
          visit = index;
        }),
      ),
    );
  }
}
