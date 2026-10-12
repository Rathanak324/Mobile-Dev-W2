class MyDuration {
    late int _milliseconds;

    MyDuration(int millisecond) : _milliseconds = millisecond {
        if (millisecond < 0) {
            throw Exception("Duration cannot be negative");
        }
    }
    
    MyDuration.fromHours(int hours){
        this._milliseconds = hours * 3600 * 1000;
    }

    MyDuration.fromMinutes(int minutes){
        this._milliseconds = minutes * 60 * 1000;
    }

    MyDuration.fromSecond(int second){
        this._milliseconds = second * 1000;
    }

    bool operator > (MyDuration other){
        return this._milliseconds > other._milliseconds;
    }

    MyDuration operator + (MyDuration other){
        return MyDuration(this._milliseconds + other._milliseconds);
    }

    MyDuration operator - (MyDuration other){
        if(this._milliseconds < other._milliseconds){
            throw Exception("The first number need to be bigger than the second");
        }
        return MyDuration(this._milliseconds - other._milliseconds);
    }
    // Close here
  // Display the duration in a readable format
  @override
  String toString() {
    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}

void main() {
  MyDuration duration1 = MyDuration.fromHours(3); // 3 hours
  MyDuration duration2 = MyDuration.fromMinutes(45); // 45 minutes
  print(duration1 + duration2); // 3 hours, 45 minutes, 0 seconds
  print(duration1>duration2); //true

  try {
    print(duration2 - duration1); // This will throw an exception
  } catch (e) {
    print(e); 
  }

// Here

    try{
        MyDuration duration3 = MyDuration.fromHours(0);
    }catch (e){
        print(e);
    }
}
