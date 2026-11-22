#!/system/bin/sh
{
  echo "id: $(id)"
  echo "context: $(cat /proc/self/attr/current)"
  echo "prop before: $(getprop service.adb.tcp.port)"
  setprop service.adb.tcp.port 6666
  echo "prop after: $(getprop service.adb.tcp.port)"
} > /data/local/tmp/di_shell_out.txt 2>&1
