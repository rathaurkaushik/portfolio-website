class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? androidLink;
  final String? iosLink;
  final String? webLink;
  final String? githubLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.androidLink,
    this.iosLink,
    this.webLink,
    this.githubLink,
  });
}

// ###############
// HOBBY PROJECTS
List<ProjectUtils> hobbyProjectUtils = [
  ProjectUtils(
    image: 'assets/projects/portfolio_website.png',
    title: 'Portfolio website',
    subtitle: 'My PortFolio Website',
    webLink: 'https://portfolio-a8ed3.web.app',
    githubLink: 'https://github.com/rathaurkaushik/portfolio-website',

  ),
];

// ###############
// WORK PROJECTS
List<ProjectUtils> workProjectUtils = [
  ProjectUtils(
    image: 'assets/projects/weather_live.jpg',
    title: 'Weather App',
    subtitle:
        'Live weather data (temperature, description, wind, humidityLocation-based weather).',
    webLink: 'https://weatherapp-live.web.app/',
    githubLink: 'https://github.com/rathaurkaushik/weather_app',
  ),
  ProjectUtils(
    image: 'assets/projects/foot_wear_app.jpg',
    title: 'Online Shop Android & Ios App',
    subtitle: 'This is a responsive online shop application with admin panel.',
    githubLink: 'https://github.com/rathaurkaushik/e_commerce',
  ),
  ProjectUtils(
    image: 'assets/projects/task_manage_app.jpg',
    title: 'Task Management App',
    subtitle:
        ' Add tasks with optional description and due date, Light/Dark mode switch',
    githubLink: "https://github.com/rathaurkaushik/Task-Management",
  ),
];
