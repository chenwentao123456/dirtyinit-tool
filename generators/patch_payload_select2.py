import re

base = r"C:\Users\tian1\Documents\deepseek-harness\default-workspace\di_apktool\smali\com\dirty\init"

# ---------- 1) 还原 $7.smali：删除之前插入的选择块 ----------
f7 = base + r"\DirtyInitActivity$7.smali"
s = open(f7, "r", encoding="utf-8", newline="").read().replace("\r\n", "\n")
pat = re.compile(r"\n    :goto_0\n\n    iget-object v16, v1,.*?:cond_payload_keep\n", re.S)
if pat.search(s):
    s = pat.sub("\n    :goto_0\n", s)
    open(f7, "w", encoding="utf-8", newline="").write(s)
    print("reverted $7.smali insertion")
else:
    print("no insertion found in $7.smali")

# ---------- 2) loadAsset 里按 autorun extra 切换 asset ----------
fa = base + r"\DirtyInitActivity.smali"
s = open(fa, "r", encoding="utf-8", newline="").read().replace("\r\n", "\n")
marker = ".method private loadAsset(Ljava/lang/String;)[B\n    .locals 5\n"
assert marker in s, "loadAsset header not found"
insert = """
    invoke-virtual {p0}, Lcom/dirty/init/DirtyInitActivity;->getIntent()Landroid/content/Intent;
    move-result-object v0

    const-string v1, "autorun"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
    move-result v0

    if-eqz v0, :cond_asset_orig

    const-string v1, "payload_576.bin"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0

    if-eqz v0, :cond_asset_orig

    const-string p1, "payload_adb.bin"

    :cond_asset_orig
"""
s = s.replace(marker, marker + insert, 1)
open(fa, "w", encoding="utf-8", newline="").write(s)
print("patched loadAsset")
