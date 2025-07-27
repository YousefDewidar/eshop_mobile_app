# منع حذف الكلاسات أو تحذيرات لمكتبة معينة
-keep class org.bouncycastle.** { *; }
-dontwarn org.bouncycastle.**

# لو بتستخدم Retrofit أو Gson
-keep class com.google.gson.** { *; }
-keepclassmembers class * {
    @com.google.gson.annotations.SerializedName <fields>;
}
-keepattributes Signature

-dontwarn org.openjsse.**
-dontnote org.openjsse.**
-ignorewarnings
