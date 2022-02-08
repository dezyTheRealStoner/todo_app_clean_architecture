import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class SignUpData extends Equatable {
  const SignUpData({
    this.name = '',
    this.email = '',
    this.password = '',
  });

  SignUpData.fromMap(Map<String, String> map)
      : name = map['name']!,
        email = map['email']!,
        password = map['password']!;

  final String name;
  final String email;
  final String password;

  SignUpData copyWith({
    String? name,
    String? email,
    String? password,
  }) {
    return SignUpData(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, String> toMap() {
    return <String, String>{
      'name': name,
      'email': email,
      'password': password,
    };
  }

  @override
  String toString() {
    return 'SignUpData{name: $name, email: $email}';
  }

  @override
  List<Object?> get props => [name, email, password];
}
