import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/view/tech/tech_controller.dart';
import 'package:portfolio_website/widgets/mobile/footer_mobile.dart';

class TechSectionMobile extends StatelessWidget {
  final TechStackController controller = Get.put(TechStackController());

  TechSectionMobile({super.key});

  final Shader linearGradient = const LinearGradient(
    colors: <Color>[
      Color(0xFFF15A29), // orange
      Color(0xFFFBB034), // yellow
    ],
  ).createShader(const Rect.fromLTWH(0, 0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Column(
        children: [
          /// Title
          SelectableText(
            "Tech-stack",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              foreground: Paint()..shader = linearGradient,
            ),
          ),
          const SizedBox(height: 12),

          /// Subtitle
          SelectableText(
            "Just like any other dev, I also spend more time searching and experimenting tools\n"
                "than actually coding some senseful things 😎",
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
              fontSize: 14,
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
                  icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                  iconSize: 28,
                  onPressed: controller.prevItem,
                ),

                /// Card
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.all(16),
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
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Image.network(
                            tech.image,
                            height: 50,
                            width: 50,
                          ),
                        ),
                        const SizedBox(width: 12),

                        /// Text
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SelectableText(
                                tech.title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              SelectableText(
                                tech.description,
                                maxLines: 2,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// Category
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SelectableText(
                            tech.category,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
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
                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                  iconSize: 28,
                  onPressed: controller.nextItem,
                ),
              ],
            );
          }),

          SizedBox(height: screenHeight * 0.04),

          /// ==== Grid of Tech Icons ====
          GridView.builder(
            shrinkWrap: true,
            itemCount: controller.techList.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, // 3 per row for mobile
              crossAxisSpacing: 25,
              mainAxisSpacing: 25,
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
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Image.network(
                        item.image,
                        fit: BoxFit.contain,
                        height: 45,
                        width: 45,
                      ),
                    ),
                  ),
                );
              });
            },
          ),
          FooterMobile()
        ],
      ),
    );
  }
}
