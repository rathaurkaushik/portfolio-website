import 'package:get/get.dart';
import 'package:portfolio_website/models/tech_model.dart';

class TechStackController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Skill> skills = [
    Skill(
      name: 'VS Code',
      description: 'Best coding IDE to ever exist, comes with tons of customization',
      imagePath: 'assets/vscode.png',
      type: 'code',
    ),
    Skill(
      name: 'Figma',
      description: 'UI/UX design tool with real-time collaboration',
      imagePath: 'assets/figma.png',
      type: 'design',
    ),
    // Add more skills...
  ];

  void goToPrevious() {
    selectedIndex.value = (selectedIndex.value - 1 + skills.length) % skills.length;
  }

  void goToNext() {
    selectedIndex.value = (selectedIndex.value + 1) % skills.length;
  }

  void selectSkill(int index) {
    selectedIndex.value = index;
  }
}
