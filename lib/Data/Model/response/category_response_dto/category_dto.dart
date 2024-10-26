import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:e_commerce/Domain/Entities/category_response_entity/category_entity.dart';
import 'package:flutter/material.dart';

@immutable
class CategorDto  extends CategoryEntity{

  final DateTime? createdAt;
  final DateTime? updatedAt;

  const CategorDto({
    super.id,
    super.name,
    super.slug,
    super.image,
    this.createdAt,
    this.updatedAt,
  });

  factory CategorDto.fromJson(Map<String, dynamic> data) => CategorDto(
        id: data['_id'] as String?,
        name: data['name'] as String?,
        slug: data['slug'] as String?,
        image: data['image'] as String?,
        createdAt: data['createdAt'] == null
            ? null
            : DateTime.parse(data['createdAt'] as String),
        updatedAt: data['updatedAt'] == null
            ? null
            : DateTime.parse(data['updatedAt'] as String),
      );
}
