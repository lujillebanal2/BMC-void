class MobileApp {
  String appName;
  String developer;
  String version;

  MobileApp(this.appName, this.developer, this.version);

  void displayInfo() {
    print("App Name: $appName");
    print("Developer: $developer");
    print("Version: $version");
    print("-" * 30);
  }
}

void main() {
  MobileApp app1 = MobileApp("Messenger", "Meta", "v400.0");
  MobileApp app2 = MobileApp("Spotify", "Spotify AB", "v8.8");
  MobileApp app3 = MobileApp("Google Maps", "Google", "v11.10");

  app1.displayInfo();
  app2.displayInfo();
  app3.displayInfo();
}