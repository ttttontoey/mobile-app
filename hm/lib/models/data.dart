class Destination {
  late String name;
  late String image;
  late String rate;
  late String location;

  Destination(this.name, this.image, this.rate, this.location);
}

List<Destination> destination = [
  Destination("Northern Starwood", "assets/images/1.jpg", "4.3", "Thai"), //ป่า
  Destination("Sea of the Sleeping Dragon", "assets/images/2.jpg", "4.9",
      "Maldives"), //ทะเล
  Destination("Guardian's Peak", "assets/images/3.jpg", "5.0", "China"), //ภูเขา
  Destination(
      "Tarnished Aquarium", "assets/images/4.jpg", "4.8", "South Korea"), //อควา
  Destination(
      "Silent Sands", "assets/images/5.jpg", "3.6", "Saudi Arabia"), //ทะเลทราบ
  Destination("Heaven's Ember Volcano", "assets/images/6.jpg", "5.0",
      "Japan"), //ภูเขาไฟ
];
