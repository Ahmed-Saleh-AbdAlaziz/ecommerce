import 'package:ecommerce_app/domain/entites/category_response_entity.dart';

class CategoryResponseDto extends CategoryResponseEntity {
  CategoryResponseDto(
      {super.results,
      super.metadata,
      super.data,
      this.message,
      this.statusMsg});

  CategoryResponseDto.fromJson(dynamic json) {
    results = json['results'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    metadata = json['metadata'] != null
        ? MetadataDto.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryDataDto.fromJson(v));
      });
    }
  }

  String? message;
  String? statusMsg;
}

class CategoryDataDto extends CategoryDataEntity {
  CategoryDataDto({
    super.id,
    super.name,
    super.slug,
    super.image,
    super.createdAt,
    super.updatedAt,
  });

  CategoryDataDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}

class MetadataDto extends MetadataEntity {
  MetadataDto({
    super.currentPage,
    super.numberOfPages,
    super.limit,
  });

  MetadataDto.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
}
