class RadioModel {
  bool? isSelected;
  String? buttonText;
  String? value;

  RadioModel.fromJson(Map<String, dynamic> json) {
    isSelected = json['isSelected'];
    buttonText = json['buttonText'];
    value = json['value'];
  }
}
