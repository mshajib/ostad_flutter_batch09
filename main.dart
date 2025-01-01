

abstract class Role {
  void displayRole();
}
class Person implements Role {
  String ? name;
  int ? age;
  String ? address;

  Person(this.name, this.age, this.address);

  @override
  void displayRole() {
    // print('Role: Person');
  }
}
void main()
{
  Person person =Person('Hasan', 30, 'Sylhet');
  person.displayRole();
  print ('Hello: ${person.name}');
}
