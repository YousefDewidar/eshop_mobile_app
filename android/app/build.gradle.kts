plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.yousef.rfaye3"
    compileSdk = 34
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

  defaultConfig {
    applicationId = "com.yousef.rfaye3"
    minSdk = 23  
    targetSdk = flutter.targetSdkVersion
    versionCode = flutter.versionCode
    versionName = flutter.versionName
}

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    // إضافة buildFeatures
    buildFeatures {
        dataBinding = true
    }
}

flutter {
    source = "../.."
}

// إضافة التبعيات
dependencies {
    implementation("com.paymob.sdk:Paymob-SDK:1.5.9")
}