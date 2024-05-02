import 'package:flutter/material.dart';
import 'package:projecthealthapp/models/Edamam.dart';
import 'package:projecthealthapp/presentation/screens/diary_page.dart';
import 'package:projecthealthapp/presentation/screens/main_page.dart';
import 'package:projecthealthapp/presentation/screens/settings_screen.dart';
import 'package:projecthealthapp/ui/widgets/LoadingCard.dart';
import 'package:projecthealthapp/ui/widgets/RecipeCard.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  EdamamApiService api = EdamamApiService();
  List<EdamamRecipeModel> recipes = [];

  @override
  void initState() {
    _fetchRecipes(); // Fetch data asynchronously
    super.initState();
  }

  Future<void> _fetchRecipes() async {
    recipes = await api.getRecipes('pork', 'balanced'); // Await the future
    setState(() {}); // Trigger a rebuild after fetching data
  }

  List<String> selectedIngredients = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/logi.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Card(
                        child: Container(
                          width: 381,
                          height: 68,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/logo.png',
                                height: 58,
                                width: 78,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'Hello, Name',
                                style: TextStyle(
                                  color: Color.fromRGBO(30, 30, 30, 1),
                                  fontWeight: FontWeight.w100,
                                  fontFamily: 'Poppins-n',
                                  fontSize: 20,
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                icon: const ImageIcon(
                                  AssetImage('assets/settings_icon.png'),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SettingsScreen()));
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/sakutes.png',
                                      height: 70,
                                      width: 70,
                                    ),
                                    const SizedBox(width: 18),
                                    const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Food suggestions',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Poppins-n',
                                            fontSize: 19,
                                            color:
                                                Color.fromRGBO(59, 59, 59, 1),
                                          ),
                                        ),
                                        Text(
                                          'Based on your preferences',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Poppins-n',
                                            fontSize: 13,
                                            color: Color.fromRGBO(
                                                153, 153, 153, 1),
                                          ),
                                        ),
                                        Text(
                                          'get 3 daily recipes!',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Poppins-n',
                                            fontSize: 13,
                                            color: Color.fromRGBO(
                                                153, 153, 153, 1),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height *
                                    0.5, // Adjust the height as needed
                                child: ListView.builder(
                                  itemCount: 3, // +1 for the loading indicator
                                  itemBuilder: (context, index) {
                                    if (index < recipes.length) {
                                      return RecipeCard(recipe: recipes[index]);
                                    } else {
                                      return LoadingCard();
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(height: 30),
                              Container(
                                width: 500,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Ingredient suggestions',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins-n',
                                        fontSize: 19,
                                        color: Color.fromRGBO(59, 59, 59, 1),
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            5), // Spacer between the two text widgets
                                    Text(
                                      'If you consumed these ingredients click on them',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins-n',
                                        fontSize: 13,
                                        color: Color.fromRGBO(153, 153, 153, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: SizedBox(
                                  height: 50,
                                  width: 300,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        if (selectedIngredients
                                            .contains('Nuts')) {
                                          selectedIngredients.remove('Nuts');
                                        } else {
                                          selectedIngredients.add('Nuts');
                                        }
                                      });
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        selectedIngredients.contains('Nuts')
                                            ? const Color.fromRGBO(
                                                255, 199, 199, 1)
                                            : Colors.white,
                                      ),
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                        selectedIngredients.contains('Nuts')
                                            ? Colors.white
                                            : const Color.fromRGBO(
                                                135, 133, 162, 1),
                                      ),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      'Nuts',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: SizedBox(
                                  height: 50,
                                  width: 300,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        if (selectedIngredients
                                            .contains('Milk')) {
                                          selectedIngredients.remove('Milk');
                                        } else {
                                          selectedIngredients.add('Milk');
                                        }
                                      });
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        selectedIngredients.contains('Milk')
                                            ? const Color.fromRGBO(
                                                255, 199, 199, 1)
                                            : Colors.white,
                                      ),
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                        selectedIngredients.contains('Milk')
                                            ? Colors.white
                                            : const Color.fromRGBO(
                                                135, 133, 162, 1),
                                      ),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      'Milk',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: SizedBox(
                                  height: 50,
                                  width: 300,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        if (selectedIngredients
                                            .contains('Chicken')) {
                                          selectedIngredients.remove('Chicken');
                                        } else {
                                          selectedIngredients.add('Chicken');
                                        }
                                      });
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        selectedIngredients.contains('Chicken')
                                            ? const Color.fromRGBO(
                                                255, 199, 199, 1)
                                            : Colors.white,
                                      ),
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                        selectedIngredients.contains('Chicken')
                                            ? Colors.white
                                            : const Color.fromRGBO(
                                                135, 133, 162, 1),
                                      ),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      'Chicken',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 45,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(children: [
                    IconButton(
                      color: const Color.fromRGBO(135, 133, 162, 1),
                      icon: const ImageIcon(
                        AssetImage('assets/diary.png'),
                      ),
                      iconSize: 28,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DiaryPage()));
                      },
                    ),
                    const Text(
                      "Diary",
                      style: TextStyle(
                        color: Color.fromRGBO(135, 133, 162, 1),
                        fontWeight: FontWeight.w100,
                        fontFamily: 'Poppins',
                        fontSize: 15,
                      ),
                    ),
                  ]),
                  Column(
                    children: [
                      IconButton(
                          color: const Color.fromRGBO(135, 133, 162, 1),
                          icon: const ImageIcon(
                            AssetImage('assets/home.png'),
                          ),
                          iconSize: 28,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MainScreen(),
                                ));
                          }),
                      const Text(
                        "Home",
                        style: TextStyle(
                          color: Color.fromRGBO(135, 133, 162, 1),
                          fontWeight: FontWeight.w100,
                          fontFamily: 'Poppins',
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Column(children: [
                    IconButton(
                      color: const Color.fromRGBO(255, 199, 199, 1),
                      icon: const ImageIcon(
                        AssetImage('assets/food.png'),
                      ),
                      iconSize: 28,
                      onPressed: () => print('home pressed'),
                    ),
                    const Text(
                      "Food",
                      style: TextStyle(
                        color: Color.fromRGBO(255, 199, 199, 1),
                        fontWeight: FontWeight.w100,
                        fontFamily: 'Poppins',
                        fontSize: 15,
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
