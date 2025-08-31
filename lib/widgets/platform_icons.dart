import 'package:flutter/material.dart';
import 'dart:js' as js;

import 'package:portfolio_website/models/project_model.dart';



class PlatformIcons extends StatelessWidget {
  final ProjectUtils project;

  const PlatformIcons({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      children: [
        if (project.androidLink != null)
          InkWell(
            onTap: () => js.context.callMethod("open", [project.androidLink]),
            child: Image.asset("assets/android_icon.png", width: 18),
          ),
        if (project.iosLink != null)
          InkWell(
            onTap: () => js.context.callMethod("open", [project.iosLink]),
            child: Image.asset("assets/ios_icon.png", width: 18),
          ),
        if (project.webLink != null)
          InkWell(
            onTap: () => js.context.callMethod("open", [project.webLink]),
            child: Image.asset("assets/web_icon.png", width: 18),
          ),
        if (project.githubLink != null)
          InkWell(
            onTap: () => js.context.callMethod("open", [project.githubLink]),
            child: Image.asset("assets/github.png", width: 18),
          ),
      ],
    );
  }
}
