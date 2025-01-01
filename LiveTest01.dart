
/*Write a dart program to calculate the area of the triangle. You have to call a triangle() function from the main then write your solution inside of the triangle functions. 
Triangle area: 0.5*base*heightSubmission Guideline: must submit by github link.
*/ 

triangle(){
  double area;
  double base;
  double height;

  base=2.5;
  height=5.0;
  area = 0.5 * base * height;
  print('The area of the triangle is: $area');
}

void main (){
  triangle() ;
}
