class messegeModel {
  final String messege;
  final String id;

  messegeModel(this.messege, this.id);
  factory messegeModel.fromJson(jsondata) {
    return messegeModel(jsondata['messege'], jsondata['id']);
  }
}
