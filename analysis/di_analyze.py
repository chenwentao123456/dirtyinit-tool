import sys, re
from androguard.misc import AnalyzeAPK
from androguard.core.apk import APK

apk_path = sys.argv[1]
a = APK(apk_path)
print("package:", a.get_package())
print("app name:", a.get_app_name())
print("version:", a.get_androidversion_name(), a.get_androidversion_code())
print("targetSdk:", a.get_target_sdk_version(), "minSdk:", a.get_min_sdk_version())
print("permissions:", a.get_permissions())
print("activities:", a.get_activities())
print("main activity:", a.get_main_activity())

# dex
from androguard.core.dex import DEX
raw = a.get_files()
for name, data in raw.items():
    if name.endswith('.dex'):
        d = DEX(data)
        print("\n=== DEX", name, "classes:", len(d.get_classes()))
        for cls in d.get_classes():
            cn = cls.get_name()
            if 'dirty' in cn.lower() or 'init' in cn.lower():
                print("--- class", cn)
                for m in cls.get_methods():
                    print("   method:", m.get_name(), m.get_descriptor())
