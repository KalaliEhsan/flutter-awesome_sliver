
class BottomNavModel{
  bool? isSelected;
  String? icon;

  BottomNavModel.fromJson(Map<String,dynamic> json){
    isSelected=json['isSelected'];
    icon=json['icon'];
  }
}