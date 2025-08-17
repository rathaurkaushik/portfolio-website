import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/view/tech/tech_controller.dart';

class TechSaction extends StatelessWidget {
  final TechStackController controller = Get.put(TechStackController());
  Shader linearGradient = LinearGradient(
    colors: <Color>[
      Color(0xFFF15A29), // left
      Color(0xFFFBB034), // right
    ],
  ).createShader(Rect.fromLTWH(00, 300,200.0, 200.0));
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.symmetric(horizontal: 160, vertical: 25),
      child: Column(
        children: [
          // Technical skils

    Text(
      'Tech-Stack',
      style: TextStyle(
        fontSize: 60,
        fontFamily: 'Aptos',
        fontWeight: FontWeight.bold,
        foreground: Paint()..shader = linearGradient,
      ),
    ),
    const SizedBox(height: 30),

          Text(
            'Just like any other dev, I spend more time searching and experimenting tools\n than coding senseful things 😎 — except now it’s called Data Engineering.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: CustomColor.whitePrimary,
              fontSize: 20,
              fontFamily: 'Aptos',
            ),
          ),

          // Work projects cards

          //
          const SizedBox(height: 50),
          // ==== Main Featured Card ====
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 300),
            child: Obx(() {
              final tech = controller.techList[controller.currentIndex.value];
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: screenHeight * 0.22,
                decoration: BoxDecoration(
                  color: CustomColor.hintDark,
                  borderRadius: BorderRadius.circular(20),
                ),
                child:
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 20,
                          ),
                          decoration: BoxDecoration(
                            color: CustomColor.whitePrimary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            tech.image,
                            height: 140,
                            width: 140,
                          ),
                        ),

                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            tech.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            tech.description,
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        tech.category,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),

          SizedBox(height: 16),

          // ==== Arrows ====
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_outlined, size: 40, color: Colors.white),
                onPressed: controller.prevItem,
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_outlined, size: 40, color: Colors.white),
                onPressed: controller.nextItem,
              ),
            ],
          ),
          SizedBox(height: 20),

          // ==== Grid of Icons ====
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: controller.techList.length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width < 600 ? 3 : 5,
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
                        border:
                            isSelected
                                ? Border.all(color: Colors.blue, width: 2)
                                : null,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(item.image ,),
                    ),
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
