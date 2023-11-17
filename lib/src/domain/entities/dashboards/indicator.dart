import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Indicator extends Equatable {
  final int? id;
  final String? name;
  final String? isAllowed;
  final Color? color;


  const Indicator({
    this.id = 0,
    this.name = "",
    this.isAllowed = "",
    this.color = Colors.white,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    isAllowed,
    color,
  ];
}
