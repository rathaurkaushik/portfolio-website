import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/view/tech/tech_controller.dart';

class TechSectionTablet extends StatelessWidget {
  final TechStackController controller = Get.put(TechStackController());

  TechSectionTablet({super.key});

  final Shader linearGradient = const LinearGradient(
    colors: <Color>[
      Color(0xFFF15A29), // left
      Color(0xFFFBB034), // right
    ],
  ).createShader(const Rect.fromLTWH(0, 0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 150),
      child: Column(
        children: [
          // Title
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Tech-Stack',
              style: TextStyle(
                fontSize: screenWidth * 0.03,
                fontFamily: 'Aptos',
                fontWeight: FontWeight.bold,
                foreground: Paint()..shader = linearGradient,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Subtitle (auto-wrap with flexible width)
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: screenWidth * 0.9),
            child: Text(
              'Just like any other dev, I spend more time searching and experimenting tools '
              'than coding senseful things 😎 — except now it’s called Data Engineering.',
              textAlign: TextAlign.center,
              style: TextStyle(color: CustomColor.whitePrimary, fontSize: 16),
              softWrap: true,
              overflow: TextOverflow.visible,
            ),
          ),
          const SizedBox(height: 40),

          // ==== Featured Card (smaller & responsive) ====
          Obx(() {
            final tech = controller.techList[controller.currentIndex.value];
            return Container(
              padding: const EdgeInsets.all(0),
              width: screenWidth * 0.7,
              constraints: BoxConstraints(
                maxHeight: screenHeight * 0.22, // smaller height
              ),
              decoration: BoxDecoration(
                color: CustomColor.bgLight1,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: CustomColor.whitePrimary,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.all(15),
                      child: Image.asset(tech.image, fit: BoxFit.cover),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tech.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            tech.description,
                             style: const TextStyle(
                              fontSize: 14,
                              color: CustomColor.whitePrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 1,
                      ),
                      decoration: BoxDecoration(
                        color: CustomColor.whitePrimary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        tech.category,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontFamily: 'Aptos',
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          const SizedBox(height: 20),

          // ==== Arrows ====
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_outlined,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: controller.prevItem,
              ),
              IconButton(
                icon: const Icon(
                  Icons.arrow_forward_outlined,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: controller.nextItem,
              ),
            ],
          ),
          const SizedBox(height: 20),

          // ==== Grid of Tech Icons ====
          GridView.builder(
            shrinkWrap: true,
            itemCount: controller.techList.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1, // makes square cells
            ),
            itemBuilder: (context, index) {
              final item = controller.techList[index];
              return Obx(() {
                final isSelected = controller.currentIndex.value == index;
                return GestureDetector(
                  onTap: () => controller.currentIndex.value = index,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(12),
                      border:
                          isSelected
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
