import re

f = r"C:\Users\tian1\Documents\deepseek-harness\default-workspace\di_apktool\smali\com\dirty\init\DirtyInitActivity$7.smali"
s = open(f, "r", encoding="utf-8", newline="").read()
s = s.replace("\r\n", "\n")

# 1) 删除之前误插入的块（位于 goto :goto_0 与 .line 512 之间，或任何包含 payload_adb 的死代码块）
m = re.search(r"\n    goto :goto_0\n(.*?)\n    \.line 512\n", s, re.S)
assert m, "goto/line512 pattern not found"
if "payload_adb.bin" in m.group(1):
    s = s[:m.start()] + "\n    goto :goto_0\n\n    .line 512\n" + s[m.end():]
    print("removed misplaced block")
else:
    print("no misplaced block found")

# 2) 在 :goto_0 标签后插入 payload 选择逻辑
label = "\n    :goto_0\n"
i = s.find(label)
assert i > 0, "label not found"
insert = """
    iget-object v16, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-virtual {v16}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object v17

    const-string v18, "autorun"

    const/4 v16, 0x0

    invoke-virtual {v17, v18, v16}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
    move-result v16

    if-eqz v16, :cond_payload_keep

    const-string v4, "payload_adb.bin"

    :cond_payload_keep
"""
j = i + len(label)
s = s[:j] + insert + s[j:]
open(f, "w", encoding="utf-8", newline="").write(s)
print("inserted payload selection after :goto_0")
