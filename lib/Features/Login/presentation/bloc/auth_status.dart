import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AuthStatus extends Equatable {}

class AuthLoading extends AuthStatus {
  @override
  List<Object?> get props => [];
}

class AuthCompleted extends AuthStatus {
  @override
  List<Object?> get props => [];
}

class AuthError extends AuthStatus {
  final String error;
  AuthError({required this.error});

  @override
  List<Object?> get props => [error];
}
