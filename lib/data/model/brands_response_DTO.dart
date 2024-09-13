import 'package:ecommerce_app/domain/entites/brands_response_entity.dart';

class BrandsResponseDto extends BrandsResponseEntity {
  BrandsResponseDto(
      {super.results,
      super.metadata,
      super.data,
      this.message,
      this.statusMsg});

  BrandsResponseDto.fromJson(dynamic json) {
    results = json['results'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    metadata = json['metadata'] != null
        ? BrandsMetadataDto.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(BrandsDataDto.fromJson(v));
      });
    }
  }

  String? message;
  String? statusMsg;
}

class BrandsDataDto extends BrandsDataEntity {
  BrandsDataDto({
    super.id,
    super.name,
    super.slug,
    super.image,
    super.createdAt,
    super.updatedAt,
  });

  BrandsDataDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}

class BrandsMetadataDto extends BrandsMetadataEntity {
  BrandsMetadataDto({
    super.currentPage,
    super.numberOfPages,
    super.limit,
    super.nextPage,
  });

  BrandsMetadataDto.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    nextPage = json['nextPage'];
  }
}
