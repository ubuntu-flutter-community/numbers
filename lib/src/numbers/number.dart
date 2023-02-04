import 'package:meta/meta.dart';

@immutable
class Number {
  const Number({
    required this.text,
    required this.found,
    required this.number,
    required this.type,
    this.date,
    this.year,
  });

  final String text;
  final bool found;
  final num number;
  final String type;
  final String? date;
  final String? year;

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'found': found,
      'number': number,
      'type': type,
      if (date != null) 'date': date,
      if (year != null) 'year': year,
    };
  }

  factory Number.fromJson(Map<String, dynamic> json) {
    return Number(
      text: json['text'] as String,
      found: json['found'] as bool,
      number: json['number'] as num,
      type: json['type'] as String,
      date: json['date'] as String?,
      year: json['year'] as String?,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Number &&
        other.text == text &&
        other.found == found &&
        other.number == number &&
        other.type == type &&
        other.date == date &&
        other.year == year;
  }

  @override
  int get hashCode => Object.hash(text, found, number, type, date, year);

  @override
  String toString() {
    return 'Number(text: $text, found: $found, number: $number, type: $type, date: $date, year: $year)';
  }
}
