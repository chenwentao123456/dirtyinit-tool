import os

root = r'C:\Users\tian1\Documents\deepseek-harness\default-workspace'
smali_dir = os.path.join(root, 'di_apktool', 'smali', 'com', 'dirty', 'init')
act_path = os.path.join(smali_dir, 'DirtyInitActivity.smali')
p7_path = os.path.join(smali_dir, 'DirtyInitActivity$7.smali')
act_listener = os.path.join(smali_dir, 'DirtyInitActivity$Act.smali')

def hx(n):
    return '0x%x' % n

F0 = [1954000, 1748000, 1512000, 1200000, 903000, 554000]
F1 = [2360000, 2200000, 2000000, 1800000, 1500000, 1200000]
F2 = [2861000, 2600000, 2400000, 2200000, 2000000, 1800000]

text = open(act_path, encoding='utf-8').read()

# ---------------- 1. fields ----------------
assert '.field public stage:I\n' in text
fields = ('.field public stage:I\n\n'
          '.field public markerSeq:I\n\n'
          '.field public cpuNow:[I\n\n'
          '.field public cpuVals:[I\n\n'
          '.field private cpuLists:[[I\n\n'
          '.field private cpuButtons:[Landroid/widget/Button;\n')
text = text.replace('.field public stage:I\n', fields, 1)

# ---------------- 2. buildUi snippet ----------------
def cpu_row(pol, label, top):
    return f'''    const/4 v2, 0x{pol:x}
    const-string v3, "{label}"
    const/high16 v4, 0x{int(round(top*2)) and 0:08x}''' + f'''
'''

snippet = ['    # ================= quick actions card =================']
snippet.append('''    new-instance v1, Landroid/widget/LinearLayout;
    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    const/4 v2, 0x1
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V
    const v2, -0xDEE0DA
    const/16 v3, 0x18
    const/4 v4, 0x1
    const v5, -0xB6BAB1
    invoke-direct {p0, v2, v3, v4, v5}, Lcom/dirty/init/DirtyInitActivity;->makeBg(IIII)Landroid/graphics/drawable/GradientDrawable;
    move-result-object v2
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V
    const/high16 v2, 0x41800000    # 16.0f
    invoke-direct {p0, v2}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v2
    invoke-virtual {v1, v2, v2, v2, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    # cpu lists + button array
    invoke-direct {p0}, Lcom/dirty/init/DirtyInitActivity;->loadCpuLists()V
    const/4 v2, 0x6
    new-array v2, v2, [Landroid/widget/Button;
    iput-object v2, p0, Lcom/dirty/init/DirtyInitActivity;->cpuButtons:[Landroid/widget/Button;

    # header
    const-string v2, "Quick actions"
    const/high16 v3, 0x41600000    # 14.0f
    const v4, -0x353B30
    const/4 v5, 0x1
    invoke-direct {p0, v2, v3, v4, v5}, Lcom/dirty/init/DirtyInitActivity;->md3Text(Ljava/lang/String;FII)Landroid/widget/TextView;
    move-result-object v2
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    # ADB 5555
    const-string v2, "Enable ADB 5555"
    const/4 v3, 0x2
    invoke-direct {p0, v2, v3}, Lcom/dirty/init/DirtyInitActivity;->createButton(Ljava/lang/String;I)Landroid/widget/Button;
    move-result-object v2
    const/4 v3, 0x1
    invoke-direct {p0, v2, v3}, Lcom/dirty/init/DirtyInitActivity;->attachAct(Landroid/widget/Button;I)V
    const/high16 v3, 0x41000000    # 8.0f
    invoke-direct {p0, v1, v2, v3}, Lcom/dirty/init/DirtyInitActivity;->addBtn(Landroid/widget/LinearLayout;Landroid/widget/Button;F)V

    # thermal row
    invoke-direct {p0}, Lcom/dirty/init/DirtyInitActivity;->row()Landroid/widget/LinearLayout;
    move-result-object v2
    const-string v3, "Disable thermal"
    const/4 v4, 0x2
    invoke-direct {p0, v3, v4}, Lcom/dirty/init/DirtyInitActivity;->createButton(Ljava/lang/String;I)Landroid/widget/Button;
    move-result-object v3
    const/4 v4, 0x2
    invoke-direct {p0, v3, v4}, Lcom/dirty/init/DirtyInitActivity;->attachAct(Landroid/widget/Button;I)V
    const/high16 v4, 0x3f800000    # 1.0f
    invoke-direct {p0, v2, v3, v4}, Lcom/dirty/init/DirtyInitActivity;->addBtnWL(Landroid/widget/LinearLayout;Landroid/widget/Button;F)V
    const-string v3, "Enable thermal"
    const/4 v4, 0x3
    invoke-direct {p0, v3, v4}, Lcom/dirty/init/DirtyInitActivity;->createButton(Ljava/lang/String;I)Landroid/widget/Button;
    move-result-object v3
    const/4 v4, 0x3
    invoke-direct {p0, v3, v4}, Lcom/dirty/init/DirtyInitActivity;->attachAct(Landroid/widget/Button;I)V
    const/high16 v4, 0x3f800000    # 1.0f
    invoke-direct {p0, v2, v3, v4}, Lcom/dirty/init/DirtyInitActivity;->addBtnWR(Landroid/widget/LinearLayout;Landroid/widget/Button;F)V
    const/high16 v3, 0x41000000    # 8.0f
    invoke-direct {p0, v1, v2, v3}, Lcom/dirty/init/DirtyInitActivity;->addChild(Landroid/widget/LinearLayout;Landroid/view/View;F)V

    # CPU section header
    const-string v2, "CPU frequency (min / max)"
    const/high16 v3, 0x41600000    # 14.0f
    const v4, -0x353B30
    const/4 v5, 0x1
    invoke-direct {p0, v2, v3, v4, v5}, Lcom/dirty/init/DirtyInitActivity;->md3Text(Ljava/lang/String;FII)Landroid/widget/TextView;
    move-result-object v2
    const/high16 v3, 0x41400000    # 12.0f
    invoke-direct {p0, v1, v2, v3}, Lcom/dirty/init/DirtyInitActivity;->addChild(Landroid/widget/LinearLayout;Landroid/view/View;F)V

    # CPU cluster rows (policy 0/1/2)
''')
for pol, label in ((0, 'P0'), (1, 'P1'), (2, 'P2')):
    snippet.append(f'''    const/4 v2, 0x{pol:x}
    const-string v3, "{label}"
    const/high16 v4, 0x41000000    # 8.0f
    invoke-direct {{p0, v1, v2, v3, v4}}, Lcom/dirty/init/DirtyInitActivity;->buildCpuRow(Landroid/widget/LinearLayout;ILjava/lang/String;F)V

''')
snippet.append('''    # apply CPU frequencies
    const-string v2, "Apply CPU frequencies"
    const/4 v3, 0x0
    invoke-direct {p0, v2, v3}, Lcom/dirty/init/DirtyInitActivity;->createButton(Ljava/lang/String;I)Landroid/widget/Button;
    move-result-object v2
    const/4 v3, 0x4
    invoke-direct {p0, v2, v3}, Lcom/dirty/init/DirtyInitActivity;->attachAct(Landroid/widget/Button;I)V
    const/high16 v3, 0x41400000    # 12.0f
    invoke-direct {p0, v1, v2, v3}, Lcom/dirty/init/DirtyInitActivity;->addBtn(Landroid/widget/LinearLayout;Landroid/widget/Button;F)V

    # hint
    const-string v2, "Set min/max per cluster, then Apply. Deployed actions activate on the next init log call; if nothing changes after ~60 s, tap again."
    const/high16 v3, 0x41300000    # 11.0f
    const v4, -0x6C7067
    const/4 v5, 0x0
    invoke-direct {p0, v2, v3, v4, v5}, Lcom/dirty/init/DirtyInitActivity;->md3Text(Ljava/lang/String;FII)Landroid/widget/TextView;
    move-result-object v2
    const/16 v3, 0x10
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setGravity(I)V
    const/high16 v3, 0x41000000    # 8.0f
    invoke-direct {p0, v1, v2, v3}, Lcom/dirty/init/DirtyInitActivity;->addChild(Landroid/widget/LinearLayout;Landroid/view/View;F)V

    # add card to root
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v3, -0x1
    const/4 v4, -0x2
    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    const/high16 v3, 0x41400000    # 12.0f
    invoke-direct {p0, v3}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v3
    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I
    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

''')
snippet = '\n'.join(snippet)

anchor = '    # ---- output header ----'
pos = text.rfind(anchor)
assert pos > 0
text = text[:pos] + snippet + text[pos:]

# ---------------- 2b. buildUi: scroll page + fixed output height ----------------
OUT_LP_OLD = '''    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v3, -0x1
    const/4 v4, 0x0
    const/high16 v5, 0x3f800000    # 1.0f
    invoke-direct {v2, v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V
    const/high16 v3, 0x40c00000    # 6.0f'''
OUT_LP_NEW = '''    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v3, -0x1
    const/high16 v4, 0x43610000    # 225.0f
    invoke-direct {p0, v4}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v4
    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    const/high16 v3, 0x40c00000    # 6.0f'''
assert text.count(OUT_LP_OLD) == 1, text.count(OUT_LP_OLD)
text = text.replace(OUT_LP_OLD, OUT_LP_NEW, 1)

SC_OLD = '''    invoke-virtual {p0, v0}, Lcom/dirty/init/DirtyInitActivity;->setContentView(Landroid/view/View;)V
    return-void
.end method'''
SC_NEW = '''    new-instance v1, Landroid/widget/ScrollView;
    invoke-direct {v1, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V
    const v2, -0xEBEDE8
    invoke-virtual {v1, v2}, Landroid/widget/ScrollView;->setBackgroundColor(I)V
    invoke-virtual {v1, v0}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V
    invoke-virtual {p0, v1}, Lcom/dirty/init/DirtyInitActivity;->setContentView(Landroid/view/View;)V
    return-void
.end method'''
assert text.count(SC_OLD) == 1, text.count(SC_OLD)
text = text.replace(SC_OLD, SC_NEW, 1)

# ---------------- 3. new methods ----------------
methods = r'''
# ================= tools methods =================
.method private attachAct(Landroid/widget/Button;I)V
    .locals 2

    new-instance v0, Lcom/dirty/init/DirtyInitActivity$Act;
    invoke-direct {v0, p0, p2}, Lcom/dirty/init/DirtyInitActivity$Act;-><init>(Lcom/dirty/init/DirtyInitActivity;I)V
    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    return-void
.end method

.method private addBtn(Landroid/widget/LinearLayout;Landroid/widget/Button;F)V
    .locals 4

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v1, -0x1
    const/high16 v2, 0x42400000    # 48.0f
    invoke-direct {p0, v2}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v2
    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-direct {p0, p3}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v1
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I
    invoke-virtual {p1, p2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    return-void
.end method

.method private addBtnWL(Landroid/widget/LinearLayout;Landroid/widget/Button;F)V
    .locals 4

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v1, 0x0
    const/high16 v2, 0x42400000    # 48.0f
    invoke-direct {p0, v2}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v2
    invoke-direct {v0, v1, v2, p3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V
    const/high16 v1, 0x41000000    # 8.0f
    invoke-direct {p0, v1}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v1
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I
    invoke-virtual {p1, p2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    return-void
.end method

.method private addBtnWR(Landroid/widget/LinearLayout;Landroid/widget/Button;F)V
    .locals 4

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v1, 0x0
    const/high16 v2, 0x42400000    # 48.0f
    invoke-direct {p0, v2}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v2
    invoke-direct {v0, v1, v2, p3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V
    const/high16 v1, 0x41000000    # 8.0f
    invoke-direct {p0, v1}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v1
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I
    invoke-virtual {p1, p2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    return-void
.end method

.method private addChild(Landroid/widget/LinearLayout;Landroid/view/View;F)V
    .locals 4

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v1, -0x1
    const/4 v2, -0x2
    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-direct {p0, p3}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v1
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I
    invoke-virtual {p1, p2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    return-void
.end method

.method private row()Landroid/widget/LinearLayout;
    .locals 2

    new-instance v0, Landroid/widget/LinearLayout;
    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    const/4 v1, 0x0
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V
    const/16 v1, 0x10
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V
    return-object v0
.end method

.method private buildCpuRow(Landroid/widget/LinearLayout;ILjava/lang/String;F)V
    .locals 8

    invoke-direct {p0}, Lcom/dirty/init/DirtyInitActivity;->row()Landroid/widget/LinearLayout;
    move-result-object v0

    const/high16 v1, 0x41400000    # 12.0f
    const v2, -0x353B30
    const/4 v3, 0x0
    invoke-direct {p0, p3, v1, v2, v3}, Lcom/dirty/init/DirtyInitActivity;->md3Text(Ljava/lang/String;FII)Landroid/widget/TextView;
    move-result-object v1
    const/16 v2, 0x10
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setGravity(I)V
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v3, -0x2
    invoke-direct {v2, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string v1, "Min ----"
    const/4 v2, 0x1
    invoke-direct {p0, v1, v2}, Lcom/dirty/init/DirtyInitActivity;->createButton(Ljava/lang/String;I)Landroid/widget/Button;
    move-result-object v1
    const/4 v2, 0x5
    mul-int/lit8 v3, p2, 0x2
    add-int/2addr v2, v3
    invoke-direct {p0, v1, v2}, Lcom/dirty/init/DirtyInitActivity;->attachAct(Landroid/widget/Button;I)V
    iget-object v2, p0, Lcom/dirty/init/DirtyInitActivity;->cpuButtons:[Landroid/widget/Button;
    mul-int/lit8 v3, p2, 0x2
    aput-object v1, v2, v3
    const/high16 v2, 0x3f800000    # 1.0f
    invoke-direct {p0, v0, v1, v2}, Lcom/dirty/init/DirtyInitActivity;->addBtnWL(Landroid/widget/LinearLayout;Landroid/widget/Button;F)V

    const-string v1, "Max ----"
    const/4 v2, 0x1
    invoke-direct {p0, v1, v2}, Lcom/dirty/init/DirtyInitActivity;->createButton(Ljava/lang/String;I)Landroid/widget/Button;
    move-result-object v1
    const/4 v2, 0x6
    mul-int/lit8 v3, p2, 0x2
    add-int/2addr v2, v3
    invoke-direct {p0, v1, v2}, Lcom/dirty/init/DirtyInitActivity;->attachAct(Landroid/widget/Button;I)V
    iget-object v2, p0, Lcom/dirty/init/DirtyInitActivity;->cpuButtons:[Landroid/widget/Button;
    mul-int/lit8 v3, p2, 0x2
    add-int/lit8 v3, v3, 0x1
    aput-object v1, v2, v3
    const/high16 v2, 0x3f800000    # 1.0f
    invoke-direct {p0, v0, v1, v2}, Lcom/dirty/init/DirtyInitActivity;->addBtnWR(Landroid/widget/LinearLayout;Landroid/widget/Button;F)V

    invoke-direct {p0, p2}, Lcom/dirty/init/DirtyInitActivity;->updateCpuText(I)V
    invoke-direct {p0, p1, v0, p4}, Lcom/dirty/init/DirtyInitActivity;->addChild(Landroid/widget/LinearLayout;Landroid/view/View;F)V
    return-void
.end method

.method private setBtnText(Landroid/widget/Button;Ljava/lang/String;I)V
    .locals 4

    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const/16 v1, 0x3e8
    div-int v1, p3, v1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-virtual {p1, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V
    return-void
.end method

.method private updateCpuText(I)V
    .locals 6

    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity;->cpuNow:[I
    iget-object v1, p0, Lcom/dirty/init/DirtyInitActivity;->cpuButtons:[Landroid/widget/Button;
    mul-int/lit8 v2, p1, 0x2
    aget v3, v0, v2
    aget-object v4, v1, v2
    const-string v5, "Min "
    invoke-direct {p0, v4, v5, v3}, Lcom/dirty/init/DirtyInitActivity;->setBtnText(Landroid/widget/Button;Ljava/lang/String;I)V
    add-int/lit8 v2, v2, 0x1
    aget v3, v0, v2
    aget-object v4, v1, v2
    const-string v5, "Max "
    invoke-direct {p0, v4, v5, v3}, Lcom/dirty/init/DirtyInitActivity;->setBtnText(Landroid/widget/Button;Ljava/lang/String;I)V
    return-void
.end method

.method private getList(I)[I
    .locals 2

    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity;->cpuLists:[[I
    aget-object v0, v0, p1
    return-object v0
.end method

.method private cycleCpu(II)V
    .locals 8

    invoke-direct {p0, p1}, Lcom/dirty/init/DirtyInitActivity;->getList(I)[I
    move-result-object v0
    if-eqz v0, :ret

    iget-object v1, p0, Lcom/dirty/init/DirtyInitActivity;->cpuNow:[I
    mul-int/lit8 v2, p1, 0x2
    add-int/2addr v2, p2
    aget v3, v1, v2

    const/4 v4, 0x0
    const/4 v5, -0x1
    :scan
    array-length v6, v0
    if-ge v4, v6, :scand
    aget v6, v0, v4
    if-ne v6, v3, :found
    add-int/lit8 v4, v4, 0x1
    goto :scan

    :found
    move v5, v4

    :scand
    add-int/lit8 v5, v5, 0x1
    array-length v6, v0
    if-ge v5, v6, :wrap
    const/4 v5, 0x0

    :wrap
    aget v6, v0, v5
    aput v6, v1, v2

    invoke-direct {p0, p1}, Lcom/dirty/init/DirtyInitActivity;->updateCpuText(I)V

    :ret
    return-void
.end method

.method private applyCpu()V
    .locals 8

    iget-object v1, p0, Lcom/dirty/init/DirtyInitActivity;->cpuNow:[I
    const/4 v2, 0x6
    new-array v3, v2, [I
    const/4 v4, 0x0
    :loop
    const/4 v5, 0x3
    if-ge v4, v5, :done
    mul-int/lit8 v5, v4, 0x2
    aget v6, v1, v5
    add-int/lit8 v7, v5, 0x1
    aget v7, v1, v7
    if-le v6, v7, :ordered
    move v0, v6
    move v6, v7
    move v7, v0

    :ordered
    aput v6, v3, v5
    add-int/lit8 v5, v5, 0x1
    aput v7, v3, v5
    add-int/lit8 v4, v4, 0x1
    goto :loop

    :done
    iput-object v3, p0, Lcom/dirty/init/DirtyInitActivity;->cpuVals:[I
    const/16 v0, 0x20
    invoke-direct {p0, v0}, Lcom/dirty/init/DirtyInitActivity;->deploy(I)V
    return-void
.end method

.method private loadCpuLists()V
    .locals 9

    const/4 v0, 0x6
    new-array v0, v0, [I
    iput-object v0, p0, Lcom/dirty/init/DirtyInitActivity;->cpuNow:[I
    const/4 v0, 0x3
    new-array v0, v0, [[I
    iput-object v0, p0, Lcom/dirty/init/DirtyInitActivity;->cpuLists:[[I

    const/4 v1, 0x0
    :loop
    const/4 v2, 0x3
    if-ge v1, v2, :done
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "/sys/devices/system/cpu/cpufreq/policy"
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v3, "/scaling_available_frequencies"
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-static {v2}, Lcom/dirty/init/DirtyInitActivity;->readFreqs(Ljava/lang/String;)[I
    move-result-object v3
    if-eqz v3, :have
    invoke-static {v1}, Lcom/dirty/init/DirtyInitActivity;->freqList(I)[I
    move-result-object v3

    :have
    array-length v4, v3
    const/4 v5, 0x0
    if-le v4, v5, :nonempty
    invoke-static {v1}, Lcom/dirty/init/DirtyInitActivity;->freqList(I)[I
    move-result-object v3
    array-length v4, v3

    :nonempty
    iget-object v5, p0, Lcom/dirty/init/DirtyInitActivity;->cpuLists:[[I
    aput-object v3, v5, v1

    add-int/lit8 v4, v4, -0x1
    const/4 v5, 0x0
    aget v6, v3, v5
    aget v5, v3, v4
    iget-object v4, p0, Lcom/dirty/init/DirtyInitActivity;->cpuNow:[I
    mul-int/lit8 v7, v1, 0x2
    aput v5, v4, v7
    add-int/lit8 v7, v7, 0x1
    aput v6, v4, v7

    add-int/lit8 v1, v1, 0x1
    goto :loop

    :done
    return-void
.end method

.method private static readFreqs(Ljava/lang/String;)[I
    .locals 8

    :try_start
    new-instance v0, Ljava/io/FileInputStream;
    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    invoke-virtual {v0}, Ljava/io/FileInputStream;->available()I
    move-result v1
    new-array v1, v1, [B
    invoke-virtual {v0, v1}, Ljava/io/FileInputStream;->read([B)I
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V
    new-instance v2, Ljava/lang/String;
    invoke-direct {v2, v1}, Ljava/lang/String;-><init>([B)V
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v2
    const-string v3, " "
    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v2
    array-length v3, v2
    new-array v4, v3, [I
    const/4 v5, 0x0
    const/4 v6, 0x0
    :loop
    if-ge v5, v3, :done
    aget-object v7, v2, v5
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-nez v0, :next
    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    move-result v7
    aput v7, v4, v6
    add-int/lit8 v6, v6, 0x1

    :next
    add-int/lit8 v5, v5, 0x1
    goto :loop

    :done
    if-ne v6, v3, :ret
    invoke-static {v4, v6}, Ljava/util/Arrays;->copyOf([II)[I
    move-result-object v4

    :ret
    return-object v4
    :try_end
    .catch Ljava/lang/Exception; {:try_start .. :try_end} :catch

    :catch
    const/4 v4, 0x0
    return-object v4
.end method

.method public onAction(I)V
    .locals 2

    packed-switch p1, :pswitch_data_0

    return-void

    :pswitch_0
    const/16 v0, 0x10
    invoke-direct {p0, v0}, Lcom/dirty/init/DirtyInitActivity;->deploy(I)V
    return-void

    :pswitch_1
    const/16 v0, 0x11
    invoke-direct {p0, v0}, Lcom/dirty/init/DirtyInitActivity;->deploy(I)V
    return-void

    :pswitch_2
    const/16 v0, 0x12
    invoke-direct {p0, v0}, Lcom/dirty/init/DirtyInitActivity;->deploy(I)V
    return-void

    :pswitch_3
    invoke-direct {p0}, Lcom/dirty/init/DirtyInitActivity;->applyCpu()V
    return-void

    :pswitch_4
    const/4 v0, 0x0
    const/4 v1, 0x0
    invoke-direct {p0, v0, v1}, Lcom/dirty/init/DirtyInitActivity;->cycleCpu(II)V
    return-void

    :pswitch_5
    const/4 v0, 0x0
    const/4 v1, 0x1
    invoke-direct {p0, v0, v1}, Lcom/dirty/init/DirtyInitActivity;->cycleCpu(II)V
    return-void

    :pswitch_6
    const/4 v0, 0x1
    const/4 v1, 0x0
    invoke-direct {p0, v0, v1}, Lcom/dirty/init/DirtyInitActivity;->cycleCpu(II)V
    return-void

    :pswitch_7
    const/4 v0, 0x1
    const/4 v1, 0x1
    invoke-direct {p0, v0, v1}, Lcom/dirty/init/DirtyInitActivity;->cycleCpu(II)V
    return-void

    :pswitch_8
    const/4 v0, 0x2
    const/4 v1, 0x0
    invoke-direct {p0, v0, v1}, Lcom/dirty/init/DirtyInitActivity;->cycleCpu(II)V
    return-void

    :pswitch_9
    const/4 v0, 0x2
    const/4 v1, 0x1
    invoke-direct {p0, v0, v1}, Lcom/dirty/init/DirtyInitActivity;->cycleCpu(II)V
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
    .end packed-switch
.end method

.method private deploy(I)V
    .locals 2

    iput p1, p0, Lcom/dirty/init/DirtyInitActivity;->stage:I
    iget v0, p0, Lcom/dirty/init/DirtyInitActivity;->markerSeq:I
    add-int/lit8 v0, v0, 0x1
    iput v0, p0, Lcom/dirty/init/DirtyInitActivity;->markerSeq:I
    invoke-direct {p0}, Lcom/dirty/init/DirtyInitActivity;->runDfiExploit()V
    return-void
.end method

.method private static freqList(I)[I
    .locals 2

    const/4 v0, 0x6

    if-eqz p0, :q1
    new-array v0, v0, [I
    fill-array-data v0, :a0
    return-object v0

    :q1
    const/4 v1, 0x1
    if-ne p0, v1, :q2
    new-array v0, v0, [I
    fill-array-data v0, :a1
    return-object v0

    :q2
    new-array v0, v0, [I
    fill-array-data v0, :a2
    return-object v0

    :a0
    .array-data 4
        ''' + hx(F0[0]) + '''
        ''' + hx(F0[1]) + '''
        ''' + hx(F0[2]) + '''
        ''' + hx(F0[3]) + '''
        ''' + hx(F0[4]) + '''
        ''' + hx(F0[5]) + '''
    .end array-data

    :a1
    .array-data 4
        ''' + hx(F1[0]) + '''
        ''' + hx(F1[1]) + '''
        ''' + hx(F1[2]) + '''
        ''' + hx(F1[3]) + '''
        ''' + hx(F1[4]) + '''
        ''' + hx(F1[5]) + '''
    .end array-data

    :a2
    .array-data 4
        ''' + hx(F2[0]) + '''
        ''' + hx(F2[1]) + '''
        ''' + hx(F2[2]) + '''
        ''' + hx(F2[3]) + '''
        ''' + hx(F2[4]) + '''
        ''' + hx(F2[5]) + '''
    .end array-data
.end method
'''
text = text.rstrip('\n') + '\n' + methods
open(act_path, 'w', encoding='utf-8', newline='\n').write(text)

# ---------------- 4. listener class ----------------
act_src = '''.class Lcom/dirty/init/DirtyInitActivity$Act;
.super Ljava/lang/Object;
.source "DirtyInitActivity.java"

.implements Landroid/view/View$OnClickListener;

.field final synthetic this$0:Lcom/dirty/init/DirtyInitActivity;

.field private final action:I

.method public constructor <init>(Lcom/dirty/init/DirtyInitActivity;I)V
    .locals 0

    iput-object p1, p0, Lcom/dirty/init/DirtyInitActivity$Act;->this$0:Lcom/dirty/init/DirtyInitActivity;
    iput p2, p0, Lcom/dirty/init/DirtyInitActivity$Act;->action:I
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity$Act;->this$0:Lcom/dirty/init/DirtyInitActivity;
    iget v1, p0, Lcom/dirty/init/DirtyInitActivity$Act;->action:I
    invoke-virtual {v0, v1}, Lcom/dirty/init/DirtyInitActivity;->onAction(I)V
    return-void
.end method
'''
open(act_listener, 'w', encoding='utf-8', newline='\n').write(act_src)

# ---------------- 5. $7 asset mapping + patcher call ----------------
p7 = open(p7_path, encoding='utf-8').read()

start_marker = '    .line 517\n    :goto_0'
end_marker = '    :pick_done\n'
i0 = p7.index(start_marker)
i1 = p7.index(end_marker, i0) + len(end_marker)

new_map = '''    .line 517
    :goto_0

    iget-object v12, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    iget v12, v12, Lcom/dirty/init/DirtyInitActivity;->stage:I

    const/16 v9, 0x10

    if-ne v12, v9, :st_thoff

    const-string v4, "payload_adb.bin"

    goto :pick_done

    :st_thoff
    const/16 v9, 0x11

    if-ne v12, v9, :st_thon

    const-string v4, "payload_thoff.bin"

    goto :pick_done

    :st_thon
    const/16 v9, 0x12

    if-ne v12, v9, :st_cpu

    const-string v4, "payload_thon.bin"

    goto :pick_done

    :st_cpu
    const/16 v9, 0x20

    if-ne v12, v9, :st_relay

    const-string v4, "payload_cpu_tpl.bin"

    goto :pick_done

    :st_relay
    if-eqz v12, :legacy1

    const-string v4, "payload_bt.bin"

    goto :pick_done

    :legacy1
    const/4 v9, 0x1

    if-ne v12, v9, :pick_relay

    const-string v4, "payload_cpu.bin"

    goto :pick_done

    :pick_relay
    const-string v4, "payload_576.bin"

    :pick_done
'''
p7 = p7[:i0] + new_map + p7[i1:]

patch_call = '''    :cond_3
    move-object/from16 v12, v15

    iget-object v3, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    iget v13, v3, Lcom/dirty/init/DirtyInitActivity;->stage:I

    iget-object v14, v3, Lcom/dirty/init/DirtyInitActivity;->cpuVals:[I

    iget v4, v3, Lcom/dirty/init/DirtyInitActivity;->markerSeq:I

    move/from16 v15, v4

    invoke-static {v12, v13, v14, v15}, Lcom/dirty/init/PayloadPatcher;->patch([BI[II)[B

    move-result-object v15
'''
old_cond3 = '    :cond_3\n'
assert p7.count(old_cond3) == 1
p7 = p7.replace(old_cond3, patch_call, 1)
open(p7_path, 'w', encoding='utf-8', newline='\n').write(p7)

print('activity size', len(text))
print('p7 size', len(p7))
