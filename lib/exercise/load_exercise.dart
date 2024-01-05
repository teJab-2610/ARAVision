import 'dart:convert';
import 'dart:io';
import 'package:aravision/exercise/exercise.dart';

List<Exercise> loadExercises() {
  List<Exercise> exercises = [];

  Directory directory = Directory('exercises');
  List<FileSystemEntity> files = directory.listSync();

  for (var file in files) {
    if (file is File) {
      String contents = file.readAsStringSync();
      Map<String, dynamic> exerciseMap = jsonDecode(contents);
      Exercise exercise = Exercise.fromJson(exerciseMap);
      exercises.add(exercise);
    }
  }

  return exercises;
}
