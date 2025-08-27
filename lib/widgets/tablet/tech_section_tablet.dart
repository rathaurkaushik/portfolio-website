import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/view/tech/tech_controller.dart';

class TechSectionTablet extends StatelessWidget {
  final TechStackController controller = Get.put(TechStackController());

  TechSectionTablet({super.key});

  final Shader linearGradient = const LinearGradient(
    colors: <Color>[
      Color(0xFFF15A29),
      Color(0xFFFBB034),
    ],
  ).createShader(const Rect.fromLTWH(0, 0, 400.0, 200.0));

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // responsive font sizes
    final titleSize = (screenWidth * 0.05).clamp(20.0, 32.0);
    final descSize = (screenWidth * 0.028).clamp(12.0, 18.0);
    final cardTitleSize = (screenWidth * 0.035).clamp(14.0, 22.0);
    final cardDescSize = (screenWidth * 0.025).clamp(12.0, 16.0);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.08,
        vertical: screenHeight * 0.05,
      ),
      child: Column(
        children: [
          /// Title
          Text(
            'Tech-Stack',
            style: TextStyle(
              fontSize: titleSize,
              fontWeight: FontWeight.bold,
              fontFamily: 'Aptos',
              foreground: Paint()..shader = linearGradient,
            ),
          ),
          SizedBox(height: screenHeight * 0.02),

          /// Sub-title
          Text(
            'Just like any other dev, I spend more time searching and experimenting tools\n'
                'than coding senseful things 😎 — except now it’s called Data Engineering.',
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
              fontSize: descSize,
              fontWeight: FontWeight.w500,
              color: CustomColor.whitePrimary,
            ),
          ),
          SizedBox(height: screenHeight * 0.04),

          /// ==== Featured Card with Arrows ====
          Obx(() {
            final tech = controller.techList[controller.currentIndex.value];
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Left Arrow
                IconButton(
                  icon: const Icon(Icons.arrow_back_outlined, color: Colors.white),
                  iconSize: (screenWidth * 0.07).clamp(28.0, 42.0),
                  onPressed: controller.prevItem,
                ),

                /// Card
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    padding: EdgeInsets.all(screenWidth * 0.03),
                    height: screenHeight * 0.22,
                    decoration: BoxDecoration(
                      color: CustomColor.bgLight1,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        /// Image
                        Container(
                          decoration: BoxDecoration(
                            color: CustomColor.whitePrimary,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Image.network(
                            tech.image,
                            height: (screenHeight * 0.12).clamp(60.0, 100.0),
                            width: (screenHeight * 0.12).clamp(60.0, 100.0),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.03),

                        /// Text
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tech.title,
                                style: TextStyle(
                                  fontSize: cardTitleSize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                tech.description,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: cardDescSize,
                                  color: CustomColor.whitePrimary,
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// Category
                        Container(
                          margin: const EdgeInsets.only(left: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            tech.category,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: (screenWidth * 0.022).clamp(10.0, 14.0),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// Right Arrow
                IconButton(
                  icon: const Icon(Icons.arrow_forward_outlined, color: Colors.white),
                  iconSize: (screenWidth * 0.07).clamp(28.0, 42.0),
                  onPressed: controller.nextItem,
                ),
              ],
            );
          }),

          SizedBox(height: screenHeight * 0.06),

          /// ==== Grid of Tech Icons ====
          GridView.builder(
            shrinkWrap: true,
            itemCount: controller.techList.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: screenWidth < 800 ? 2 : 3, // responsive
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1,
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
                      border: isSelected
                          ? Border.all(color: Colors.blue, width: 2)
                          : null,
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Center(
                      child: Image.network(
                        item.image,
                        fit: BoxFit.contain,
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
