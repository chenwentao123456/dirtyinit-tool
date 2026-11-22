import sys, logging
logging.disable(logging.CRITICAL)
try:
    from loguru import logger
    logger.remove()
except Exception:
    pass
from androguard.core.apk import APK
from androguard.core.dex import DEX

apk_path = sys.argv[1]
a = APK(apk_path)
print("package:", a.get_package())
print("version:", a.get_androidversion_name(), a.get_androidversion_code())
print("minSdk:", a.get_min_sdk_version(), "targetSdk:", a.get_target_sdk_version())
print("permissions:", a.get_permissions())
print("activities:", a.get_activities())
print("main:", a.get_main_activity())
print("services:", a.get_services())

for name, data in a.get_files().items():
    if not name.endswith('.dex'):
        continue
    d = DEX(data)
    print("\n=== DEX", name, "classes:", len(d.get_classes()))
    for cls in d.get_classes():
        cn = cls.get_name()
        print("class:", cn)
        for m in cls.get_methods():
            print("   ", m.get_name(), m.get_descriptor())
