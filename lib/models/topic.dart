import 'package:flutter/foundation.dart';

class Topic {
  String name;
  DateTime lastModified;
  Lesson lesson;
  Topic({
    required this.name,
    required this.lastModified,
    required this.lesson,
  });
}

class Lesson {
  Introduction introduction;
  Content content;
  List<Example> examples;
  Summary summary;
  List<Review> reviews;
  Resources resources;
  List<FAQ> faqs;
  Lesson({
    required this.resources,
    required this.examples,
    required this.introduction,
    required this.content,
    required this.faqs,
    required this.reviews,
    required this.summary,
  });
}

class FAQ {
  String faq;
  FAQ({
    required this.faq,
  });
}

class Resources {
  String videoUrl;
  String resource;
  Resources({
    required this.resource,
    required this.videoUrl,
  });
}

class Review {
  String review;
  Review({
    required this.review,
  });
}

class Example {
  String formula;
  String example;
  Example({
    required this.example,
    required this.formula,
  });
}

class Content {
  List<String> videoUrls;
  String body;
  Content({
    required this.body,
    required this.videoUrls,
  });
}

class Introduction {
  String imageUrl;
  String body;
  Introduction({
    required this.body,
    required this.imageUrl,
  });
}
// enum Topic{circular,centripetal,gravity}
