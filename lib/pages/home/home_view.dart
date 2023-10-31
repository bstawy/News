import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';
import 'package:news/pages/home/widgets/custom_drawer.dart';
import 'package:news/pages/home/widgets/category_item.dart';
import 'package:news/pages/home/widgets/news_view.dart';
import 'package:news/pages/settings/settings_view.dart';

class HomeView extends StatefulWidget {
  static const String routeName = 'home';
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CategoryModel? selectedCategory;

  final List<CategoryModel> categories = const [
    CategoryModel(
      id: 'Sports',
      title: 'Sports',
      imagePath: 'assets/images/sports.png',
      backgroundColor: Color(0xFFC91C22),
    ),
    CategoryModel(
      id: 'General',
      title: 'Politics',
      imagePath: 'assets/images/Politics.png',
      backgroundColor: Color(0xFF003E90),
    ),
    CategoryModel(
      id: 'Health',
      title: 'Health',
      imagePath: 'assets/images/health.png',
      backgroundColor: Color(0xFFED1E79),
    ),
    CategoryModel(
      id: 'Business',
      title: 'Business',
      imagePath: 'assets/images/bussines.png',
      backgroundColor: Color(0xFFCF7E48),
    ),
    CategoryModel(
      id: 'Technology',
      title: 'Environment',
      imagePath: 'assets/images/environment.png',
      backgroundColor: Color(0xFF4882CF),
    ),
    CategoryModel(
      id: 'Science',
      title: 'Science',
      imagePath: 'assets/images/science.png',
      backgroundColor: Color(0xFFF2D352),
    ),
  ];

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
        appBar: AppBar(
          title: selectedCategory == null
              ? const Text('News App')
              : Text(selectedCategory!.title),
          actions: [
            (selectedCategory != null)
                ? IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  )
                : const SizedBox(),
          ],
        ),
        drawer: CustomDrawer(
          title: selectedCategory?.title,
          onCategoryClicked: onDrawerCategoryItemClicked,
          onSettingsClicked: onDrawerSettingsItemClicked,
        ),
        body: selectedCategory != null
            ? NewsView(categoryModel: selectedCategory!)
            : Padding(
                padding: EdgeInsets.only(
                    left: width * 0.08,
                    right: width * 0.08,
                    top: height * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pick your category \nof interest',
                      style: theme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return CategoryItem(
                            category: categories[index],
                            index: index,
                            onClicked: () {
                              onCategoryItemClicked(categories[index]);
                            },
                          );
                        },
                        itemCount: categories.length,
                        padding: const EdgeInsets.all(0),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  onCategoryItemClicked(CategoryModel category) {
    selectedCategory = category;
    setState(() {});
  }

  onDrawerCategoryItemClicked() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }

  onDrawerSettingsItemClicked() {
    Navigator.pushReplacementNamed(context, SettingsView.routeName);
  }
}
