class MobileDevice {
  String brand;
  String model;

  MobileDevice(this.brand, this.model);

  void displayDeviceInfo() {
    print("Brand: $brand");
    print("Model: $model");
  }

  void showPlatform() {
    print("Generic Mobile Platform");
  }
}

class AndroidDevice extends MobileDevice {
  String androidVersion;

  AndroidDevice(
    String brand,
    String model,
    this.androidVersion,
  ) : super(brand, model);

  void displayAndroidInfo() {
    displayDeviceInfo();
    print("Android Version: $androidVersion");
  }

  @override
  void showPlatform() {
    print("Android Platform");
  }
}

class IOSDevice extends MobileDevice {
  String iosVersion;

  IOSDevice(
    String brand,
    String model,
    this.iosVersion,
  ) : super(brand, model);

  void displayIOSInfo() {
    displayDeviceInfo();
    print("iOS Version: $iosVersion");
  }

  @override
  void showPlatform() {
    print("iOS Platform");
  }
}

void main() {
  MobileDevice device1 = AndroidDevice("Samsung", "Galaxy A26", "14");
  MobileDevice device2 = IOSDevice("Apple", "iPhone 15", "17");

  device1.showPlatform();
  device2.showPlatform();
}