class BookModel{
  String? title;
  String? image;

  BookModel.fromJson(Map<String,dynamic> json){
    title=json['title'];
    image=json['image'];
  }
}