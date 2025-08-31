import 'package:portfolio_website/constant/app_image.dart';

class ProjectUtils {
  final String image;
  final String title;
  final String description;
  final List<String> tech;
  final String? androidLink;
  final String? iosLink;
  final String? webLink;
  final String? githubLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.description,
    required this.tech,
    this.androidLink,
    this.iosLink,
    this.webLink,
    this.githubLink,
  });
}


// ###############
// WORK PROJECTS
List<ProjectUtils> workProjectUtils = [
  ProjectUtils(
    image: AppImages.weather,
    title: 'Weather App',
    tech: [AppImages.flutter,AppImages.open_weather, AppImages.dart],
    description:
    'A sleek weather app providing real-time data like temperature, humidity,\nand wind using location-based services.',
    webLink: 'https://weatherapp-live.web.app/',
    githubLink: 'https://github.com/rathaurkaushik/weather_app',
  ),
  ProjectUtils(
    image: AppImages.shoes,
    title: 'Ecommerce App',
    tech: [AppImages.flutter, AppImages.dart, AppImages.api],
    description:
    'A responsive e-commerce app with cart, product filters,\nand integrated admin panel for product management.',
    githubLink: 'https://github.com/rathaurkaushik/e_commerce',
  ),
  ProjectUtils(
    image: AppImages.task,
    title: 'Task Management App',
    tech: [AppImages.flutter,AppImages.dart, AppImages.sql],

    description:
    'A minimalist task manager with CRUD functionality,\nscheduling, reminders, and light/dark theme toggle.',
    githubLink: "https://github.com/rathaurkaushik/Task-Management",
  ),
  ProjectUtils(
    image: AppImages.portfolio,
    title: 'Portfolio Website',
    tech: [AppImages.flutter,AppImages.javascript,AppImages.firebase, AppImages.dart],
    description:
    'Responsive personal portfolio built with Flutter Web,\nshowcasing my projects, skills, and contact details.',
    webLink: 'https://kaushikworks.info',
    githubLink: 'https://github.com/rathaurkaushik/portfolio-website',
  ),
  ProjectUtils(
    image: AppImages.smart,
    title: 'Smart Clean',
    tech: [AppImages.flutter,AppImages.sql,AppImages.firebase, AppImages.dart],
    description:
    'Smart Clean is a smart waste management system designed to promote a cleaner and eco-friendly environment through real-time reporting and tracking.',
    githubLink: 'https://github.com/rathaurkaushik/smart_clean.git',
  ),
];

