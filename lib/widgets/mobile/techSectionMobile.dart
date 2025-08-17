import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/view/tech/tech_controller.dart';

class TechSectionMobile extends StatelessWidget {
  final TechStackController controller = Get.put(TechStackController());

  TechSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Column(
        children: [
          Text(
            'Tech-Stack',
            style: TextStyle(
              fontSize: screenWidth * 0.03,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Just like any other dev, I spend more time searching and experimenting tools\nthan coding senseful things 😎 — except now it’s called Data Engineering.',
            textAlign: TextAlign.center,
            style: TextStyle(color: CustomColor.whitePrimary, fontSize: 16),
          ),
          const SizedBox(height: 30),

          // Featured card
          Obx(() {
            final tech = controller.techList[controller.currentIndex.value];
            return Container(
              padding: const EdgeInsets.all(16),
              height: screenHeight * 0.25,
              decoration: BoxDecoration(
                color: CustomColor.hintDark,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Image.asset(tech.image, height: 80),
                  const SizedBox(height: 12),
                  Text(
                    tech.title,
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 6),
                  Text(tech.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(tech.category,
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  )
                ],
              ),
            );
          }),
          const SizedBox(height: 20),

          // Arrows
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_outlined,
                    size: 30, color: Colors.white),
                onPressed: controller.prevItem,
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_outlined,
                    size: 30, color: Colors.white),
                onPressed: controller.nextItem,
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Grid
          GridView.builder(
            shrinkWrap: true,
            itemCount: controller.techList.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final item = controller.techList[index];
              return Obx(() {
                final isSelected = controller.currentIndex.value == index;
                return GestureDetector(
                  onTap: () => controller.currentIndex.value = index,
                  child: Container(
                    decoration: BoxDecoration(
                      color: CustomColor.bgLight1,
                      borderRadius: BorderRadius.circular(12),
                      border: isSelected
                          ? Border.all(color: Colors.blue, width: 2)
                          : null,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset(item.image, fit: BoxFit.contain),
                      ),
                    ),
                  ),
                );
              });
            },
          ),
        ],
      ),
    );
  }
}
