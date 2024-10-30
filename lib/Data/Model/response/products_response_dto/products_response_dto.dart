import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:e_commerce/Domain/Entities/products_response_entity/products_response_entity.dart';
import 'package:flutter/foundation.dart';

import 'product_dto.dart';
import 'metadata.dart';

@immutable
class ProductsResponseDto extends ProductsResponseEntity {
  final Metadata? metadata;
  final String? message;
  final String? statusMsg;
  const ProductsResponseDto(
      {this.message, this.statusMsg, super.results, this.metadata, super.data});

  factory ProductsResponseDto.fromJson(Map<String, dynamic> data) {
    return ProductsResponseDto(
      message: data['message'] as String?,
      statusMsg: data['statusMsg'] as String?,
      results: data['results'] as int?,
      metadata: data['metadata'] == null
          ? null
          : Metadata.fromMap(data['metadata'] as Map<String, dynamic>),
      data: (data['data'] as List<dynamic>?)
          ?.map((e) => ProductDto.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
