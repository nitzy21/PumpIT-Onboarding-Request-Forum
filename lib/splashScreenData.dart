class SliderModel {

  String imagePath;
  String title;
  String desc;

  SliderModel({this.imagePath, this.title, this.desc});

  void setImageAssetPath (String getImagepath){
    imagePath = getImagepath;
  }

  void setTitle (String getTitle){
    title = getTitle;
  }

  void setDesc (String getDesc){
    desc = getDesc;
  }

  String getImageAssetPath(){
    return imagePath;
  }

  String getTitle(){
    return title;
  }

  String getDesc(){
    return desc;
  }

}

List<SliderModel> getSlides(){

  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setImageAssetPath('assets/slide1.png');
  sliderModel.setTitle('Donate and Request');
  sliderModel.setDesc('Be able to help mommies by donating or requesting breastmilks.');
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //1
  sliderModel.setImageAssetPath('assets/slide2.png');
  sliderModel.setTitle('Locate Milkbanks');
  sliderModel.setDesc('Milkbank locations in the Philippines are listed.');
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //1
  sliderModel.setImageAssetPath('assets/slide3.png');
  sliderModel.setTitle('Share your journey');
  sliderModel.setDesc('Write and share your experiences as brestdfeeding moms! Our Forum is created for...');
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;

}