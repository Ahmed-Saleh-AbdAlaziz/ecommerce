class BrandsResponseEntity {
  BrandsResponseEntity({
    this.results,
    this.metadata,
    this.data,
  });

  int? results;
  BrandsMetadataEntity? metadata;
  List<BrandsDataEntity>? data;
}

class BrandsDataEntity {
  BrandsDataEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;
}

class BrandsMetadataEntity {
  BrandsMetadataEntity({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage,
  });

  int? currentPage;
  int? numberOfPages;
  int? limit;
  int? nextPage;
}
