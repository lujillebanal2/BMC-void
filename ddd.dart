class MobileDevice {
  String brand;
  String model;

  MobileDevice(this.brand, this.model);

  void displayDeviceInfo() {
    print("Brand: $brand");
    print("Model: $model");
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
}

void main() {
  AndroidDevice androidPhone = AndroidDevice("Samsung", "Galaxy S24", "14");
  IOSDevice iphone = IOSDevice("Apple", "iPhone 15", "17");

  
  print("--- Android Device Info ---");
  androidPhone.displayAndroidInfo();

  print("\n--- iOS Device Info ---");
  iphone.displayIOSInfo();
}