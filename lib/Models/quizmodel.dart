import 'dart:convert';

class Quiz {
  String statement;
  List<QuizOption> options;

  Quiz({
    required this.statement,
    required this.options,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'statement': statement,
      'options': options.map((x) => x.toMap()).toList(),
    };
  }

  factory Quiz.fromMap(Map<String, dynamic> map) {
    return Quiz(
      statement: map['statement'] as String,
      options: List<QuizOption>.from(
        (map['options'] as List<int>).map<QuizOption>(
          (x) => QuizOption.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Quiz.fromJson(String source) =>
      Quiz.fromMap(json.decode(source) as Map<String, dynamic>);
}

class QuizOption {
  final String id;
  final String option;

  QuizOption({required this.id, required this.option});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'option': option,
    };
  }

  factory QuizOption.fromMap(Map<String, dynamic> map) {
    return QuizOption(
      id: map['id'] as String,
      option: map['option'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizOption.fromJson(String source) =>
      QuizOption.fromMap(json.decode(source) as Map<String, dynamic>);
}