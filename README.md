This is a sample for Bazel's aapt2 issue.
To reproduce the issue, you can run `bazel build //src/main:app`, and you'll get the following output:

```
java.lang.RuntimeException: Error during Statically linking com.google.devtools.build.android.aapt2.CompiledResources@28194a50:
Command: bazel-out/darwin-opt-exec-2B5CBBC6/bin/external/androidsdk/aapt2_binary\
	link\
	--static-lib\
	--manifest\
	/var/folders/rb/9p01gkyj44192g83kl03rzwh0000gp/T/android_resources_tmp4927927222921530021/manifest-aapt-dummy/AndroidManifest.xml\
	--no-static-lib-packages\
	--no-version-vectors\
	-R\
	/var/folders/rb/9p01gkyj44192g83kl03rzwh0000gp/T/android_resources_tmp4927927222921530021/filtered/bazel-out/android-armeabi-v7a-fastbuild/bin/external/maven/com_jakewharton_butterknife_runtime_symbols/symbols.zip\
	-R\
	/var/folders/rb/9p01gkyj44192g83kl03rzwh0000gp/T/android_resources_tmp4927927222921530021/filtered/bazel-out/android-armeabi-v7a-fastbuild/bin/external/maven/androidx_core_core_symbols/symbols.zip\
	-R\
	/var/folders/rb/9p01gkyj44192g83kl03rzwh0000gp/T/android_resources_tmp4927927222921530021/filtered/bazel-out/android-armeabi-v7a-fastbuild/bin/external/maven/androidx_lifecycle_lifecycle_runtime_symbols/symbols.zip\
	-R\
	/var/folders/rb/9p01gkyj44192g83kl03rzwh0000gp/T/android_resources_tmp4927927222921530021/filtered/bazel-out/android-armeabi-v7a-fastbuild/bin/external/maven/androidx_versionedparcelable_versionedparcelable_symbols/symbols.zip\
	-R\
	/var/folders/rb/9p01gkyj44192g83kl03rzwh0000gp/T/android_resources_tmp4927927222921530021/filtered/bazel-out/android-armeabi-v7a-fastbuild/bin/external/maven/com_jakewharton_butterknife_symbols/symbols.zip\
	-I\
	external/androidsdk/platforms/android-30/android.jar\
	--auto-add-overlay\
	-o\
	/var/folders/rb/9p01gkyj44192g83kl03rzwh0000gp/T/android_resources_tmp4927927222921530021/lib.apk\
	--java\
	/var/folders/rb/9p01gkyj44192g83kl03rzwh0000gp/T/android_resources_tmp4927927222921530021/java\
	--output-text-symbols\
	/var/folders/rb/9p01gkyj44192g83kl03rzwh0000gp/T/android_resources_tmp4927927222921530021/R.txt
Output:
/var/folders/rb/9p01gkyj44192g83kl03rzwh0000gp/T/android_resources_tmp4927927222921530021/manifest-aapt-dummy/AndroidManifest.xml:2: error: attribute 'package' in <manifest> tag is not a valid Android package name: 'butterknife'.

	at com.google.devtools.build.android.CommandHelper.execute(CommandHelper.java:42)
	at com.google.devtools.build.android.AaptCommandBuilder.execute(AaptCommandBuilder.java:297)
	at com.google.devtools.build.android.aapt2.ResourceLinker.linkStatically(ResourceLinker.java:252)
	at com.google.devtools.build.android.ValidateAndLinkResourcesAction.main(ValidateAndLinkResourcesAction.java:207)
	at com.google.devtools.build.android.ResourceProcessorBusyBox$Tool$7.call(ResourceProcessorBusyBox.java:105)
	at com.google.devtools.build.android.ResourceProcessorBusyBox.processRequest(ResourceProcessorBusyBox.java:234)
	at com.google.devtools.build.android.ResourceProcessorBusyBox.main(ResourceProcessorBusyBox.java:177)

Exception in thread "main" java.lang.RuntimeException: Error during Statically linking com.google.devtools.build.android.aapt2.CompiledResources@28194a50:
Command: bazel-out/darwin-opt-exec-2B5CBBC6/bin/external/androidsdk/aapt2_binary\
	link\
	--static-lib\
	--manifest\
	/var/folders/rb/9p01gkyj44192g83kl03rzwh0000gp/T/android_resources_tmp4927927222921530021/manifest-aapt-dummy/AndroidManifest.xml\
	--no-static-lib-packages\
	--no-version-vectors\
	-R\
	/var/folders/rb/9p01gkyj44192g83kl03rzwh0000gp/T/android_resources_tmp4927927222921530021/filtered/bazel-out/android-armeabi-v7a-fastbuild/bin/external/maven/com_jakewharton_butterknife_runtime_symbols/symbols.zip\
	-R\
	/var/folders/rb/9p01gkyj44192g83kl03rzwh0000gp/T/android_resources_tmp4927927222921530021/filtered/bazel-out/android-armeabi-v7a-fastbuild/bin/external/maven/androidx_core_core_symbols/symbols.zip\
	-R\
	/var/folders/rb/9p01gkyj44192g83kl03rzwh0000gp/T/android_resources_tmp4927927222921530021/filtered/bazel-out/android-armeabi-v7a-fastbuild/bin/external/maven/androidx_lifecycle_lifecycle_runtime_symbols/symbols.zip\
	-R\
	/var/folders/rb/9p01gkyj44192g83kl03rzwh0000gp/T/android_resources_tmp4927927222921530021/filtered/bazel-out/android-armeabi-v7a-fastbuild/bin/external/maven/androidx_versionedparcelable_versionedparcelable_symbols/symbols.zip\
	-R\
	/var/folders/rb/9p01gkyj44192g83kl03rzwh0000gp/T/android_resources_tmp4927927222921530021/filtered/bazel-out/android-armeabi-v7a-fastbuild/bin/external/maven/com_jakewharton_butterknife_symbols/symbols.zip\
	-I\
	external/androidsdk/platforms/android-30/android.jar\
	--auto-add-overlay\
	-o\
	/var/folders/rb/9p01gkyj44192g83kl03rzwh0000gp/T/android_resources_tmp4927927222921530021/lib.apk\
	--java\
	/var/folders/rb/9p01gkyj44192g83kl03rzwh0000gp/T/android_resources_tmp4927927222921530021/java\
	--output-text-symbols\
	/var/folders/rb/9p01gkyj44192g83kl03rzwh0000gp/T/android_resources_tmp4927927222921530021/R.txt
Output:
/var/folders/rb/9p01gkyj44192g83kl03rzwh0000gp/T/android_resources_tmp4927927222921530021/manifest-aapt-dummy/AndroidManifest.xml:2: error: attribute 'package' in <manifest> tag is not a valid Android package name: 'butterknife'.

	at com.google.devtools.build.android.CommandHelper.execute(CommandHelper.java:42)
	at com.google.devtools.build.android.AaptCommandBuilder.execute(AaptCommandBuilder.java:297)
	at com.google.devtools.build.android.aapt2.ResourceLinker.linkStatically(ResourceLinker.java:252)
	at com.google.devtools.build.android.ValidateAndLinkResourcesAction.main(ValidateAndLinkResourcesAction.java:207)
	at com.google.devtools.build.android.ResourceProcessorBusyBox$Tool$7.call(ResourceProcessorBusyBox.java:105)
	at com.google.devtools.build.android.ResourceProcessorBusyBox.processRequest(ResourceProcessorBusyBox.java:234)
	at com.google.devtools.build.android.ResourceProcessorBusyBox.main(ResourceProcessorBusyBox.java:177)
Target //src/main:app failed to build
Use --verbose_failures to see the command lines of failed build steps.
INFO: Elapsed time: 3.447s, Critical Path: 3.05s
INFO: 7 processes: 2 internal, 3 darwin-sandbox, 2 worker.
FAILED: Build did NOT complete successfully


```
