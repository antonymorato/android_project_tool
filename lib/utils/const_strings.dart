const String osBuildGradleString = '''buildscript {
    repositories {
        // ...
        maven { url 'https://plugins.gradle.org/m2/' } // Gradle Plugin Portal
    }
    dependencies {
        // ...
        // OneSignal-Gradle-Plugin
        classpath 'gradle.plugin.com.onesignal:onesignal-gradle-plugin:[0.12.6, 0.99.99]'
    }
}

apply plugin: 'com.onesignal.androidsdk.onesignal-gradle-plugin\'\n''';

const String fbAppLinksManifest = '''<meta-data
  android:name="com.facebook.sdk.ApplicationId"
  android:value="@string/facebook_app_id" />\n''';

String getFbAppLinksXml(String fbId) {
  return '''<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="facebook_app_id">$fbId</string>
</resources>\n''';
}

const internetPermissionManifest =
    '<uses-permission android:name="android.permission.INTERNET"/>\n';

const clearTrafficManifest = 'android:usesCleartextTraffic="true"';

const signingConfigs = '''    signingConfigs {
       release {
           keyAlias keystoreProperties['keyAlias']
           keyPassword keystoreProperties['keyPassword']
           storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
           storePassword keystoreProperties['storePassword']
       }
   }\n''';

const keyProperties = '''def keystoreProperties = new Properties()
   def keystorePropertiesFile = rootProject.file('key.properties')
   if (keystorePropertiesFile.exists()) {
       keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
   }\n''';
