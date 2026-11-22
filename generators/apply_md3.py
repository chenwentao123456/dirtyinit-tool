import re, shutil, os

root = r'C:\Users\tian1\Documents\deepseek-harness\default-workspace'
target = os.path.join(root, 'di_apktool', 'smali', 'com', 'dirty', 'init', 'DirtyInitActivity.smali')
backup = os.path.join(root, 'DirtyInitActivity_pre_md3.smali')
if not os.path.exists(backup):
    shutil.copy2(target, backup)

helpers = open(os.path.join(root, 'md3_helpers.smali'), encoding='utf-8').read()
buildui = open(os.path.join(root, 'md3_buildUi.smali'), encoding='utf-8').read()

# split helpers into method blocks keyed by signature
blocks = {}
for m in re.finditer(r'(?ms)^\.method ([^\n]*)\n.*?^\.end method\n', helpers):
    sig = m.group(1).strip()
    blocks[sig] = m.group(0)

def get_block(fragment):
    for sig, blk in blocks.items():
        if fragment in sig:
            return blk
    raise SystemExit('missing helper: ' + fragment)

cb = get_block('createButton(Ljava/lang/String;I)')
cl = get_block('createLabel(Ljava/lang/String;)')
bg = get_block('makeBg(IIII)')
ov = get_block('oval(I)')
tx = get_block('md3Text(Ljava/lang/String;FII)')
dp = get_block('dpI(F)')

text = open(backup, encoding='utf-8').read()

def replace_method(text, sig, new):
    pat = re.compile(r'(?ms)^\.method [^\n]*' + re.escape(sig) + r'[^\n]*\n.*?^\.end method\n')
    out, n = pat.subn(lambda m: new, text, count=1)
    if n != 1:
        raise SystemExit('method not found: ' + sig)
    return out

text = replace_method(text, 'createButton(Ljava/lang/String;)Landroid/widget/Button;', cb)
text = replace_method(text, 'createLabel(Ljava/lang/String;)Landroid/widget/TextView;', cl)
text = replace_method(text, 'makeGlassButton(Z)Landroid/graphics/drawable/GradientDrawable;', bg + '\n' + ov + '\n' + tx + '\n' + dp)

# replace onCreate UI construction block with buildUi() call
start = text.index('    .line 144\n')
endmark = '    invoke-virtual {p0, p1}, Lcom/dirty/init/DirtyInitActivity;->setContentView(Landroid/view/View;)V\n'
end = text.index(endmark, start) + len(endmark)
text = text[:start] + '    invoke-direct {p0}, Lcom/dirty/init/DirtyInitActivity;->buildUi()V\n' + text[end:]

# append buildUi
text = text.rstrip('\n') + '\n\n' + buildui + '\n'

open(target, 'w', encoding='utf-8', newline='\n').write(text)

# update inner class button label
inner = os.path.join(root, 'di_apktool', 'smali', 'com', 'dirty', 'init', 'DirtyInitActivity$8.smali')
s = open(inner, encoding='utf-8').read()
s = s.replace('const-string v1, "EXECUTE EXPLOIT"', 'const-string v1, "Execute exploit"')
open(inner, 'w', encoding='utf-8', newline='\n').write(s)

# update running label
text = open(target, encoding='utf-8').read()
text = text.replace('const-string v1, "RUNNING..."', 'const-string v1, "Running..."')
open(target, 'w', encoding='utf-8', newline='\n').write(text)

print('patched OK, size', os.path.getsize(target))
