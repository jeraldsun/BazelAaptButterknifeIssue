def aar_fix_manifest(name, aar):
    """
    Patches AndroidManifest.xml package to contain `.` as expected by aapt2 in bazel.
    """
    aar_out = "patched_" + name + ".aar"
    native.genrule(
        name = name,
        srcs = [aar],
        outs = [aar_out],
        tools = ["@bazel_tools//tools/zip:zipper"],
        cmd = """
         TEMP="aar"
         mkdir -p $$TEMP
         unzip -q -o $< -d $$TEMP/
         sed -i.bak -e 's/package=\\"butterknife\\"/package=\\"com.butterknife\\"/g' $$TEMP/AndroidManifest.xml
         rm $$TEMP/AndroidManifest.xml.bak
         out=$$(pwd)/out.aar
         zipper=$$(pwd)/$(location {zipper})
         cd $$TEMP; find * -type f -exec $$zipper c $$out {{}} +
         cd ..
         cp $$out $(OUTS)
         rm -rf $$TEMP
         """.format(zipper = "@bazel_tools//tools/zip:zipper"),
    )
    return aar_out
