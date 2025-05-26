import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phrases/phrases.dart';
import 'controller.dart';

class CategoryView extends StatefulWidget {
  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final CategoryController categoryController = Get.put(CategoryController());
  final List<IconData> iconsList = [
    Icons.sentiment_satisfied_alt,
    Icons.chat,
    Icons.calculate,
    Icons.access_time,
    Icons.place,
    Icons.directions_bus,
    Icons.hotel,
    Icons.restaurant,
    Icons.shopping_cart,
    Icons.palette,
    Icons.apartment,
    Icons.public,
    Icons.account_balance,
    Icons.family_restroom,
    Icons.card_giftcard,
    Icons.local_hospital,
    Icons.healing,
    Icons.face,
    Icons.sensor_occupied_outlined,
    Icons.fitness_center,
  ];

  @override
  void initState() {
    super.initState();
    categoryController
        .fetchCategories(); // Fetch categories when the view is created
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Categories")),
      body: Obx(() {
        if (categoryController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        // Check if the category list is empty
        if (categoryController.category.isEmpty) {
          return Center(child: Text("No categories found."));
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Dropdowns with Swap Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildDropdown(categoryController.languageKeys,
                      categoryController.selectedLanguage1, (value) {
                        setState(() {
                          categoryController
                              .changeLanguage1(value!); // Update language 1
                        });
                      }),
                  Icon(Icons.swap_horiz, size: 32), // Swap icon
                  _buildDropdown(categoryController.languageKeys,
                      categoryController.selectedLanguage2, (value) {
                        setState(() {
                          categoryController
                              .changeLanguage2(value!); // Update language 2
                        });
                      }),
                ],
              ),
              SizedBox(height: 16),
              // List of Sentences
              Expanded(
                child: ListView.builder(
                  itemCount: categoryController.filteredSentences.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>PhraseListScreen(id:index+1,)
                          ),
                        );
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(categoryController.filteredSentences[index]),
                          subtitle: Text("${index+1}"),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  // Dropdown builder
  Widget _buildDropdown(List<String> languages, String selectedLanguage,
      ValueChanged<String?> onChanged) {
    return Expanded(
      child:Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), // Add border radius to the dropdown
          color: Colors.purple, // Purple background for the dropdown container
        ),
        child: DropdownButton<String>(
          isExpanded: true,
          underline: SizedBox(), // Remove underline
          value: selectedLanguage,
          onChanged: onChanged,
          iconEnabledColor: Colors.white, // White dropdown arrow
          iconSize: 30,
          // Text style for the selected item shown in the Container
          style: TextStyle(
            inherit: false,
            color: Colors.white, // White color for selected item in the Container
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
          ),
          dropdownColor: Colors.white, // Background color of the dropdown when opened
          items: languages.map((language) {
            return DropdownMenuItem<String>(
              value: language,
              child: Row(
                children: [
                  SizedBox(
                    width: 70,
                    child: Text(
                      language,
                      style: TextStyle(
                        color: selectedLanguage == language
                            ? Colors.white // White text for the selected item
                            : Colors.black, // Black text for non-selected items
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Spacer(),
                  if (selectedLanguage == language)
                    Icon(Icons.check, color: Colors.purple), // Purple tick for selected item
                ],
              ),
            );
          }).toList(),
        ),
      ),

    );
  }



}