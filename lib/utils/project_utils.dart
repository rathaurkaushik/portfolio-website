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
    image: 'assets/projects/weather_live.jpg',
    title: 'Weather App',
    tech: ['assets/flutter.png','assets/open_weather.png','assets/dart.png'],
    description:
    'A sleek weather app providing real-time data like temperature, humidity,\nand wind using location-based services.',
    webLink: 'https://weatherapp-live.web.app/',
    githubLink: 'https://github.com/rathaurkaushik/weather_app',
  ),
  ProjectUtils(
    image: 'assets/projects/foot_wear_app.jpg',
    title: 'Zen Shoes',
    tech: ['assets/flutter.png','assets/dart.png','assets/api.png'],
    description:
    'A responsive e-commerce app with cart, product filters,\nand integrated admin panel for product management.',
    githubLink: 'https://github.com/rathaurkaushik/e_commerce',
  ),
  ProjectUtils(
    image: 'assets/projects/task_manage_app.jpg',
    title: 'Task Management App',
    tech: ['assets/flutter.png','assets/dart.png','assets/sql.png'],

    description:
    'A minimalist task manager with CRUD functionality,\nscheduling, reminders, and light/dark theme toggle.',
    githubLink: "https://github.com/rathaurkaushik/Task-Management",
  ),
  ProjectUtils(
    image: 'assets/projects/portfolio_website.png',
    title: 'Portfolio Website',
    tech: ['assets/flutter.png','assets/dart.png','assets/javascript.png'],
    description:
    'Responsive personal portfolio built with Flutter Web,\nshowcasing my projects, skills, and contact details.',
    webLink: 'https://kaushikworks.info',
    githubLink: 'https://github.com/rathaurkaushik/portfolio-website',
  ),
];

