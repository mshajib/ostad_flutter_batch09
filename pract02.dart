/* Write a dart program to create a class House
with properties [id, name, price].
Create a constructor of it and create 3 objects of it.
Add them to the list and print all details.
 */

class House{
  int id;
  String name;
  double price;

House (this.id, this.name, this.price);

void displayHouse() {

  print ('House ID: $id ');
  print ('House Name: $name ');
  print ('House Price: $price ');
  print ('--------------------------');
}
}

void main(){
  House house1=House( 24, 'Lake Velly', 34888);
  House house2=House( 512, 'Shewrapara', 4888);
  House house3=House( 75, 'Bengal House', 134888);

  List<House> houses=[house1,house2,house3];

  for (var house in houses)
  { house.displayHouse();

  }

}