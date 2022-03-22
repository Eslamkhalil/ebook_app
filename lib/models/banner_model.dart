class BannerModel {
   String? image;

  BannerModel(this.image);

  BannerModel.fromJson(Map<dynamic, dynamic> json) {
    if (json == null) {
      return;
    }
    image = json['image'];
  }

  toJson() {
    return {'image': image};
  }
}
