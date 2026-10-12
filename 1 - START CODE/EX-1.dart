enum Skill { FLUTTER, DART, OTHER }

class Employee {
  final String _name;
  double? _baseSalary;


  final Set<Skill> _skills = {};
  Address? _address;
  int? _yearsOfExperience;

  String get name => _name;
  double? get baseSalary => _baseSalary;

  Set<Skill> get skill => _skills;
  Address? get address => _address;
  int? get yearsOfExperience => _yearsOfExperience;

  Employee(this._name, this._baseSalary);

  Employee.mobileDeveloper (this._name, this._yearsOfExperience, [this._address]){
    _skills.add(Skill.DART);
    _skills.add(Skill.FLUTTER);

    _baseSalary = computeSalary();
  }

  void printDetails() {
    print('Employee: $name, Base Salary: \$${baseSalary}');
  }

  double computeSalary(){
    double Base = 40000;
    Base += this._yearsOfExperience! * 2000;

    if(_skills.contains(Skill.FLUTTER)){
      Base += 5000;
    }
    if(_skills.contains(Skill.DART)){
      Base += 3000;
    }
    if(_skills.contains(Skill.OTHER)){
      Base += 1000;
    }
    return Base;
  }
}

class Address {
  String city;
  String street;
  int zipCode;

  Address(this.city, this.street, this.zipCode);
}

void main() {
  var emp1 = Employee('Sokea', 40000);
  emp1.printDetails();

  var emp2 = Employee('Ronan', 45000);
  emp2.printDetails();

  var emp3 = Employee.mobileDeveloper("Bob", 2, Address("YMCA", "12 Pub Street", 72519));
  emp3.computeSalary();
  emp3.printDetails();
}