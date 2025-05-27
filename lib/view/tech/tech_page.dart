// widgets/skill_showcase.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/view/tech/tech_controller.dart';
class TechPageShowcase extends StatelessWidget {
  TechPageShowcase({super.key});

  final TechStackController controller = Get.put(TechStackController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final currentSkill = controller.skills[controller.selectedIndex.value];

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Top Card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      currentSkill.imagePath,
                      width: 80,
                      height: 80,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentSkill.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          currentSkill.description,
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      currentSkill.type,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          /// Arrows
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: controller.goToPrevious,
                color: Colors.white,
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: controller.goToNext,
                color: Colors.white,
              ),
            ],
          ),

          const SizedBox(height: 20),

          /// Skill Thumbnails
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: controller.skills.asMap().entries.map((entry) {
                final index = entry.key;
                final skill = entry.value;
                return GestureDetector(
                  onTap: () => controller.selectSkill(index),
                  child: Container(
                    decoration: BoxDecoration(
                      color: index == controller.selectedIndex.value
                          ? Colors.white24
                          : Colors.grey[800],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(
                      skill.imagePath,
                      width: 40,
                      height: 40,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      );
    });
  }
}
