import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/screens/details.dart';
import 'package:mealsapp/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:google_fonts/google_fonts.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});
  final Meal meal;

  String get complexityText {
    return meal.complexity.name[0].toString() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toString() +
        meal.affordability.name.substring(1);
  }

  void showDetail(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Details(meal: meal)));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.hardEdge,
      elevation: 20,
      child: InkWell(
          onTap: () {
            showDetail(context);
          },
          child: Stack(
            children: [
              FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 300,
                width: double.infinity,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(horizontal: 44, vertical: 6),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            color: Colors.amber,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          MealItemTrait(
                              icon: Icons.schedule,
                              label: '${meal.duration} min'),
                          const SizedBox(
                            width: 17,
                          ),
                          MealItemTrait(
                              icon: Icons.work, label: complexityText),
                          const SizedBox(
                            width: 17,
                          ),
                          MealItemTrait(
                              icon: Icons.attach_money,
                              label: affordabilityText),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          showDetail(context);
                        },
                        child: const Text("Details"),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
