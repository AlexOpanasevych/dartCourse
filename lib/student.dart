enum StudentType {
  master,
  bachelor,
  aspirant
}
abstract class Student {
  // int timeOfStudy;

  // int get timeOfStudy => _timeOfStudy;

  // set timeOfStudy(int timeOfStudy) {
  //   _timeOfStudy = timeOfStudy;
  // }

  // static Student student = Student._instance("");

  String get lastname;
  set lastname(String lastname);
  String get firstname;
  set firstname(String firstname);
  // String get lastname => _lastname;
  //
  // set lastname(String lastname) {
  //   _lastname = lastname;
  // }
  factory Student.fabric(StudentType type){
    switch (type){
      case StudentType.bachelor:
        return Bachelor();
      case StudentType.master:
        return Master();
      case StudentType.aspirant:
        return Aspirant(''); // fails on assert
      default:
        throw 'No types to instantiate!';
    }
  }
}

class StudentImpl implements Student {
  late String _lastname;
  late String _firstname;

  @override
  String get firstname => _firstname;

  @override
  set firstname(String firstname) {
    _firstname = firstname;
  }

  @override
  String get lastname => _lastname;

  @override
  set lastname(String lastname) => _lastname = lastname;

  final int timeOfStudy;
  StudentImpl(this.timeOfStudy, [this._firstname = '', this._lastname = '']);
}

class Bachelor extends StudentImpl {
  Bachelor() : super(4);
}

class Master extends StudentImpl {
  Master() : super(6);
}

mixin StudentEmployee {
  late String work;
}

class Aspirant extends StudentImpl with StudentEmployee {
  Aspirant(String work) : super(8){
    assert(work.isNotEmpty);
    this.work = work;
  }
}