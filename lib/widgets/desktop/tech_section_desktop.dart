import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/view/tech/tech_controller.dart';
import 'package:portfolio_website/widgets/desktop/footer_desktop.dart';

class TechSectionDesktop extends StatelessWidget {
  final TechStackController controller = Get.put(TechStackController());

  TechSectionDesktop({super.key});

  final Shader linearGradient = const LinearGradient(
    colors: <Color>[
      Color(0xFFF15A29), // left
      Color(0xFFFBB034), // right
    ],
  ).createShader(const Rect.fromLTWH(0, 0, 1000.0, 700.0));

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.25,  // 10% of screen width
        vertical: screenHeight * 0.05 ,  // 5% of screen height
      ),
      child: Column(
        children: [
          // Title
          SelectableText(
            'Tech-Stack',
            style: TextStyle(
              fontSize: screenWidth * 0.03, // Responsive font
              fontWeight: FontWeight.bold,
              fontFamily: 'Aptos',

              foreground: Paint()..shader = linearGradient,
            ),
          ),
          SizedBox(height: screenHeight * 0.03),

          SelectableText(
            'Just like any other dev, I spend more time searching and experimenting tools\n'
                'than coding senseful things 😎 — except now it’s called Data Engineering.',
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
              fontSize: screenWidth * 0.013,
              fontWeight: FontWeight.w500,
              color: CustomColor.whitePrimary,
            ),
          ),
          SizedBox(height: screenHeight * 0.06),

          // ==== Featured Card with Arrows Overlay ====
          Obx(() {
            final tech = controller.techList[controller.currentIndex.value];
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Left Arrow
                GestureDetector(
                  onTap: controller.prevItem,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      Icons.arrow_back_outlined,
                      size: screenWidth * 0.03,
                      color: Colors.white,
                    ),
                  ),
                ),

                // Featured Card (auto-resize)
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    padding: EdgeInsets.all(screenWidth * 0.010),
                    height: screenHeight * 0.20,
                    decoration: BoxDecoration(
                      color: CustomColor.bgLight1,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        // Image Box
                        Container(
                          decoration: BoxDecoration(
                            color: CustomColor.whitePrimary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Image.network(
                            tech.image,
                            height: screenHeight * 0.13,
                            width: screenHeight * 0.13,
                          ),
                        ),

                        SizedBox(width: screenWidth * 0.01),

                        // Text Section
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SelectableText(
                                tech.title,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.013,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 4),
                              Flexible(
                                child: SelectableText(
                                  tech.description,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.010,
                                    color: CustomColor.whitePrimary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Category Tag
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: SelectableText(
                            tech.category,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.010,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Right Arrow
                GestureDetector(
                  onTap: controller.nextItem,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      Icons.arrow_forward_outlined,
                      size: screenWidth * 0.03,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            );
          }),

          SizedBox(height: screenHeight * 0.1),

          // ==== Grid of Tech Icons ====
          GridView.builder(
            shrinkWrap: true,
            itemCount: controller.techList.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (screenWidth ~/ 50).clamp(3, 4), // responsive cols
              crossAxisSpacing: 50,
              mainAxisSpacing: 50,
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
                      child: SizedBox(
                        width: screenWidth * 0.06,
                        height: screenWidth * 0.06,
                        child: Image.network(item.image),
                      ),
                    ),
                  ),
                );
              });
            },
          ),
          SizedBox(
            width: double.infinity,
            child: FooterDesktop(),
          )
        ],
      ),
    );
  }
}
