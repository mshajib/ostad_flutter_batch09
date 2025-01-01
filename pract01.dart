
/*

Write a dart program to create a class Laptop
with properties [id, name, ram] and
create 3 objects of it and print all details.

* */

class Laptop {
  int id;
  String name;
  int ram;
Laptop(this.id, this.name, this.ram );

  void displayDetails (){
    print('Laptop ID: $id' );
    print('Laptop Name: $name' );
    print('Laptop Ram: $ram GB' );
    print ('-----------------------');
  }
}
void main(){
  Laptop laptop1=Laptop(440, 'HP ProBook', 32);
  Laptop laptop2=Laptop (440, 'Dell Letitude', 16);
  Laptop laptop3 =Laptop(440, 'HP ProBook', 8);

  laptop1.displayDetails();
  laptop2.displayDetails();
  laptop3.displayDetails();

}