import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/constant/app_image.dart';

class TechItem {
  final String image; // Image asset or network path
  final String title;
  final String description;
  final String category;

  TechItem({
    required this.image,
    required this.title,
    required this.description,
    required this.category,
  });
}

class TechStackController extends GetxController {
  var currentIndex = 0.obs;

  final List<TechItem> techList = [

    // ===== Cloud Platforms =====
    TechItem(
      image: AppImages.azure,
      title: "Azure",
      description: "Microsoft's cloud platform for data and AI workloads",
      category: "Cloud",
    ),
    TechItem(
      image: AppImages.gcp,
      title: "Google Cloud Platform",
      description: "Google's cloud services for data engineering and ML",
      category: "Cloud",
    ),
    TechItem(
      image: AppImages.aws,
      title: "AWS",
      description: "Amazon's cloud computing services",
      category: "Cloud",
    ),

    // ===== Data Warehouses =====
    TechItem(
      image: AppImages.bigquery,
      title: "BigQuery",
      description: "Google's serverless data warehouse",
      category: "Data Warehouse",
    ),
    TechItem(
      image: AppImages.snowflake,
      title: "Snowflake",
      description: "Cloud-based data warehouse solution",
      category: "Data Warehouse",
    ),

    // ===== Data Engineering & Orchestration =====
    TechItem(
      image: AppImages.databricks,
      title: "Databricks",
      description: "Lakehouse platform for big data and AI",
      category: "Data Engineering",
    ),
    TechItem(
      image: AppImages.airflow,
      title: "Apache Airflow",
      description: "Workflow orchestration for data pipelines",
      category: "Orchestration",
    ),
    TechItem(
      image: AppImages.kafka,
      title: "Apache Kafka",
      description: "Real-time data streaming platform",
      category: "Streaming",
    ),
    TechItem(
      image: AppImages.bigquery,
      title: "Apache Spark",
      description: "Distributed data processing engine",
      category: "Big Data",
    ),

    // ===== Coding & Development Tools =====
    TechItem(
      image: AppImages.vscode,
      title: "VS Code",
      description: "Best coding IDE with tons of customization",
      category: "Code",
    ),
    TechItem(
      image: AppImages.flutter,
      title: "Flutter",
      description: "UI toolkit for building cross-platform apps",
      category: "Code",
    ),
    TechItem(
      image: AppImages.cplusplus,
      title: "C++",
      description: "High-performance programming language",
      category: "Programming",
    ),
    TechItem(
      image: AppImages.python,
      title: "Python",
      description: "Versatile language for data, AI, and backend",
      category: "Programming",
    ),
    TechItem(
      image: AppImages.javascript,
      title: "JavaScript",
      description: "Language of the web and full-stack apps",
      category: "Programming",
    ),

    // ===== DevOps & Collaboration =====
    TechItem(
      image: AppImages.docker,
      title: "Docker",
      description: "Containerization platform for apps & services",
      category: "DevOps",
    ),
    TechItem(
      image: AppImages.github,
      title: "GitHub",
      description: "Version control & collaboration platform",
      category: "DevOps",
    ),
    TechItem(
      image: AppImages.api,
      title: "API",
      description: "Interface for communication between services",
      category: "Backend",
    ),

    // ===== Design Tools =====
    TechItem(
      image: AppImages.figma,
      title: "Figma",
      description: "Collaborative UI/UX design tool",
      category: "Design",
    ),



    // ===== Databases =====
    TechItem(
      image: AppImages.sql,
      title: "SQL",
      description: "Query language for relational databases",
      category: "Database",
    ),
    TechItem(
      image: AppImages.firebase,
      title: "Firebase",
      description: "Google's backend services for web & mobile",
      category: "Database",
    ),
  ];

  void nextItem() {
    currentIndex.value = (currentIndex.value + 1) % techList.length;
  }

  void prevItem() {
    currentIndex.value =
        (currentIndex.value - 1 + techList.length) % techList.length;
  }
}
