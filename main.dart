
//---------------------------------A-----------------------------
abstract class Role {
  void displayRole();
}
//---------------------------------B----------------------------
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
//-------------------------------------C------------------------
class Student extends Person {
  int ? studentID ;
  String ? grade ;
  List<double> ? courseScores;
  Student(this.studentID,  this.grade, this.courseScores,String ? name, int ? age,String ? address)
      :super (name, age, address);
  @override
  void displayRole() {
    print('Role: Student');
  }
     double calcAverageScore() {
       double score=0;
       for (int i=0; i < courseScores!.length-1; i++)
         {  score=courseScores![i]+score;
             }
       double avgScore =score/courseScores!.length ;
       return avgScore;
     }

  }

//--------------------------------------D------------------------------------------
class Teacher extends Person {
  int ? teacherID ;
  List<String> ? courseTaught ;
    Teacher(this.teacherID,  this.courseTaught,String ? name, int ? age,String ? address)
      :super (name, age, address);

  @override
  void displayRole() {
    print('Role: Teacher');
  }
    void showCoursesTaught() {
           for (var course in courseTaught!) {
        print('- $course');
      }
    }
}

//----------------------------------------E-----------------------------
class StudentManagementSystem{
  void main(){
    var student = new Student(
        45, 'A', [67, 87, 89, 56, 45, 66], 'Hasan', 19, 'Sylhet');
    print('Student Information:');
    student.displayRole();
    print('Name: ${student.name}');
    print('Age: ${student.age}');
    print('Address: ${student.address}');
    print('Avarage Score : ${student.calcAverageScore()}');
print(' ');
    print('------------------------------------------------- ');
    print(' ');

    var teacher = new Teacher(55, ['Bangla', 'English','Math', 'Phy'], 'Nayeem', 35, 'Dhaka');
    print('Teacher Information:');
    teacher.displayRole();
    print('Name: ${teacher.name}');
    print('Age: ${teacher.age}');
    print('Address: ${teacher.address}');
    print('Courses Taught :') ;
    teacher.showCoursesTaught();
  }
}

void main() {

  var sms = new StudentManagementSystem();
  sms.main();
}