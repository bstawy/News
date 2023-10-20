import 'package:flutter/material.dart';
import 'package:news/pages/home/widgets/custom_drawer.dart';
import 'package:news/pages/home/widgets/item_card.dart';

class HomeView extends StatelessWidget {
  static const String routeName = 'home';
  final List<ItemCard> itemCards = [
    ItemCard(
      color: const Color(0xFFC91C22),
      title: 'Sports',
      imagePath: 'assets/images/sports.png',
      index: 0,
      onClicked: () {},
    ),
    ItemCard(
      color: const Color(0xFF003E90),
      title: 'Politics',
      imagePath: 'assets/images/Politics.png',
      index: 1,
      onClicked: () {},
    ),
    ItemCard(
      color: const Color(0xFFED1E79),
      title: 'Health',
      imagePath: 'assets/images/health.png',
      index: 2,
      onClicked: () {},
    ),
    ItemCard(
      color: const Color(0xFFCF7E48),
      title: 'Business',
      imagePath: 'assets/images/bussines.png',
      index: 3,
      onClicked: () {},
    ),
    ItemCard(
      color: const Color(0xFF4882CF),
      title: 'Environment',
      imagePath: 'assets/images/environment.png',
      index: 4,
      onClicked: () {},
    ),
    ItemCard(
      color: const Color(0xFFF2D352),
      title: 'Science',
      imagePath: 'assets/images/science.png',
      index: 5,
      onClicked: () {},
    ),
  ];

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var width = mediaQuery.width;
    var height = mediaQuery.height;
    var theme = Theme.of(context);

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/images/background_pattern.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(title: const Text('News App')),
        drawer: const CustomDrawer(),
        body: Padding(
          padding: EdgeInsets.only(
              left: width * 0.08, right: width * 0.08, top: height * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pick your category \nof interest',
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return itemCards[index];
                  },
                  itemCount: itemCards.length,
                  padding: const EdgeInsets.all(0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
