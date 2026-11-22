.method private buildUi()V
    .locals 12

    # ---- window colors (Material 3 dark surface) ----
    invoke-virtual {p0}, Lcom/dirty/init/DirtyInitActivity;->getWindow()Landroid/view/Window;
    move-result-object v1
    const v2, -0xEBEDE8
    invoke-virtual {v1, v2}, Landroid/view/Window;->setStatusBarColor(I)V

    invoke-virtual {p0}, Lcom/dirty/init/DirtyInitActivity;->getWindow()Landroid/view/Window;
    move-result-object v1
    const v2, -0xEBEDE8
    invoke-virtual {v1, v2}, Landroid/view/Window;->setNavigationBarColor(I)V

    # ---- root ----
    new-instance v0, Landroid/widget/LinearLayout;
    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    const/4 v1, 0x1
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V
    const v1, -0xEBEDE8
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    const/high16 v1, 0x41a00000    # 20.0f
    invoke-direct {p0, v1}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v1
    const/high16 v2, 0x41a00000    # 20.0f
    invoke-direct {p0, v2}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v2
    const/high16 v3, 0x41800000    # 16.0f
    invoke-direct {p0, v3}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v3
    invoke-virtual {v0, v1, v2, v1, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v1, Landroid/view/ViewGroup$LayoutParams;
    const/4 v2, -0x1
    invoke-direct {v1, v2, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    # ---- top app bar ----
    new-instance v1, Landroid/widget/LinearLayout;
    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    const/4 v2, 0x0
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V
    const/16 v2, 0x10
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    # logo badge
    const-string v2, "DI"
    const/high16 v3, 0x41600000    # 14.0f
    const v4, -0x152201
    const/4 v5, 0x1
    invoke-direct {p0, v2, v3, v4, v5}, Lcom/dirty/init/DirtyInitActivity;->md3Text(Ljava/lang/String;FII)Landroid/widget/TextView;
    move-result-object v2
    const v3, -0xB0C875
    invoke-direct {p0, v3}, Lcom/dirty/init/DirtyInitActivity;->oval(I)Landroid/graphics/drawable/GradientDrawable;
    move-result-object v3
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V
    const/16 v3, 0x11
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setGravity(I)V
    const/high16 v3, 0x42200000    # 40.0f
    invoke-direct {p0, v3}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v3
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct {v4, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual {v1, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # title
    const-string v2, "DirtyInit"
    const/high16 v3, 0x41b00000    # 22.0f
    const v4, -0x191E1B
    const/4 v5, 0x1
    invoke-direct {p0, v2, v3, v4, v5}, Lcom/dirty/init/DirtyInitActivity;->md3Text(Ljava/lang/String;FII)Landroid/widget/TextView;
    move-result-object v2
    const/16 v3, 0x10
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setGravity(I)V
    const/high16 v3, 0x41400000    # 12.0f
    invoke-direct {p0, v3}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v3
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v5, 0x0
    const/4 v6, -0x2
    const/high16 v7, 0x3f800000    # 1.0f
    invoke-direct {v4, v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V
    iput v3, v4, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I
    invoke-virtual {v1, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # version chip
    const-string v2, "v1.00"
    const/high16 v3, 0x41300000    # 11.0f
    const v4, -0x353B30
    const/4 v5, 0x1
    invoke-direct {p0, v2, v3, v4, v5}, Lcom/dirty/init/DirtyInitActivity;->md3Text(Ljava/lang/String;FII)Landroid/widget/TextView;
    move-result-object v2
    const/16 v3, 0x11
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setGravity(I)V
    const v3, -0xD4D6D0
    const/16 v4, 0x18
    const/4 v5, 0x1
    const v6, -0xB6BAB1
    invoke-direct {p0, v3, v4, v5, v6}, Lcom/dirty/init/DirtyInitActivity;->makeBg(IIII)Landroid/graphics/drawable/GradientDrawable;
    move-result-object v3
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V
    const/high16 v3, 0x41200000    # 10.0f
    invoke-direct {p0, v3}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v3
    const/high16 v4, 0x40800000    # 4.0f
    invoke-direct {p0, v4}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v4
    invoke-virtual {v2, v3, v4, v3, v4}, Landroid/widget/TextView;->setPadding(IIII)V
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v4, -0x2
    const/4 v5, -0x2
    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # add app bar to root
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v3, -0x1
    const/4 v4, -0x2
    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # ---- hero card ----
    new-instance v1, Landroid/widget/LinearLayout;
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
    const/high16 v2, 0x41a00000    # 20.0f
    invoke-direct {p0, v2}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v2
    invoke-virtual {v1, v2, v2, v2, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const-string v2, "One-touch exploit"
    const/high16 v3, 0x41b00000    # 22.0f
    const v4, -0x191E1B
    const/4 v5, 0x1
    invoke-direct {p0, v2, v3, v4, v5}, Lcom/dirty/init/DirtyInitActivity;->md3Text(Ljava/lang/String;FII)Landroid/widget/TextView;
    move-result-object v2
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const-string v2, "untrusted_app \u2192 init \u00b7 page-cache corruption via IpSecManager"
    const/high16 v3, 0x41600000    # 14.0f
    const v4, -0x353B30
    const/4 v5, 0x0
    invoke-direct {p0, v2, v3, v4, v5}, Lcom/dirty/init/DirtyInitActivity;->md3Text(Ljava/lang/String;FII)Landroid/widget/TextView;
    move-result-object v2
    const/high16 v3, 0x40800000    # 4.0f
    invoke-direct {p0, v3}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v3
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v5, -0x1
    const/4 v6, -0x2
    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    iput v3, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I
    invoke-virtual {v1, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v3, -0x1
    const/4 v4, -0x2
    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    const/high16 v3, 0x41400000    # 12.0f
    invoke-direct {p0, v3}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v3
    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I
    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # ---- status pill ----
    new-instance v1, Landroid/widget/TextView;
    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    iput-object v1, p0, Lcom/dirty/init/DirtyInitActivity;->statusText:Landroid/widget/TextView;
    const-string v2, "Ready"
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const v2, -0xB24954
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V
    const/high16 v2, 0x41500000    # 13.0f
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V
    const/16 v2, 0x11
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setGravity(I)V
    const v2, -0xD4D6D0
    const/16 v3, 0x18
    const/4 v4, 0x1
    const v5, -0xB6BAB1
    invoke-direct {p0, v2, v3, v4, v5}, Lcom/dirty/init/DirtyInitActivity;->makeBg(IIII)Landroid/graphics/drawable/GradientDrawable;
    move-result-object v2
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V
    const/high16 v2, 0x41400000    # 12.0f
    invoke-direct {p0, v2}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v2
    const/high16 v3, 0x41000000    # 8.0f
    invoke-direct {p0, v3}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v3
    invoke-virtual {v1, v2, v3, v2, v3}, Landroid/widget/TextView;->setPadding(IIII)V
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v3, -0x1
    const/4 v4, -0x2
    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    const/high16 v3, 0x41400000    # 12.0f
    invoke-direct {p0, v3}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v3
    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I
    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # ---- actions ----
    new-instance v1, Landroid/widget/LinearLayout;
    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    const/4 v2, 0x1
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    # Execute exploit - filled
    const-string v2, "Execute exploit"
    const/4 v3, 0x0
    invoke-direct {p0, v2, v3}, Lcom/dirty/init/DirtyInitActivity;->createButton(Ljava/lang/String;I)Landroid/widget/Button;
    move-result-object v2
    iput-object v2, p0, Lcom/dirty/init/DirtyInitActivity;->executeButton:Landroid/widget/Button;
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v4, -0x1
    const/high16 v5, 0x42500000    # 52.0f
    invoke-direct {p0, v5}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v5
    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    const/high16 v4, 0x41000000    # 8.0f
    invoke-direct {p0, v4}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v4
    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I
    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # Extract CLI - tonal secondary
    const-string v2, "Extract CLI"
    const/4 v3, 0x1
    invoke-direct {p0, v2, v3}, Lcom/dirty/init/DirtyInitActivity;->createButton(Ljava/lang/String;I)Landroid/widget/Button;
    move-result-object v2
    iput-object v2, p0, Lcom/dirty/init/DirtyInitActivity;->extractButton:Landroid/widget/Button;
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v4, -0x1
    const/high16 v5, 0x42500000    # 52.0f
    invoke-direct {p0, v5}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v5
    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    const/high16 v4, 0x41000000    # 8.0f
    invoke-direct {p0, v4}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v4
    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I
    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # One-click max + ADB - tonal primary
    const-string v2, "One-click max + ADB"
    const/4 v3, 0x2
    invoke-direct {p0, v2, v3}, Lcom/dirty/init/DirtyInitActivity;->createButton(Ljava/lang/String;I)Landroid/widget/Button;
    move-result-object v2
    new-instance v3, Lcom/dirty/init/DirtyInitActivity$9;
    invoke-direct {v3, p0}, Lcom/dirty/init/DirtyInitActivity$9;-><init>(Lcom/dirty/init/DirtyInitActivity;)V
    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v4, -0x1
    const/high16 v5, 0x42500000    # 52.0f
    invoke-direct {p0, v5}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v5
    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v3, -0x1
    const/4 v4, -0x2
    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    const/high16 v3, 0x41400000    # 12.0f
    invoke-direct {p0, v3}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v3
    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I
    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I
    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # ---- output header ----
    new-instance v1, Landroid/widget/LinearLayout;
    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    const/4 v2, 0x0
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V
    const/16 v2, 0x10
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    const-string v2, "OUTPUT"
    const/high16 v3, 0x41300000    # 11.0f
    const v4, -0x353B30
    const/4 v5, 0x1
    invoke-direct {p0, v2, v3, v4, v5}, Lcom/dirty/init/DirtyInitActivity;->md3Text(Ljava/lang/String;FII)Landroid/widget/TextView;
    move-result-object v2
    const v3, 0x3dcccccd    # 0.1f
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setLetterSpacing(F)V
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v3, -0x1
    const/4 v4, -0x2
    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    const/high16 v3, 0x40800000    # 4.0f
    invoke-direct {p0, v3}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v3
    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I
    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # ---- output card ----
    new-instance v1, Landroid/widget/LinearLayout;
    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    const/4 v2, 0x1
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V
    const v2, -0xE2E4E0
    const/16 v3, 0x14
    const/4 v4, 0x1
    const v5, -0xB6BAB1
    invoke-direct {p0, v2, v3, v4, v5}, Lcom/dirty/init/DirtyInitActivity;->makeBg(IIII)Landroid/graphics/drawable/GradientDrawable;
    move-result-object v2
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V
    const/high16 v2, 0x41400000    # 12.0f
    invoke-direct {p0, v2}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v2
    invoke-virtual {v1, v2, v2, v2, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v2, Landroid/widget/ScrollView;
    invoke-direct {v2, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V
    iput-object v2, p0, Lcom/dirty/init/DirtyInitActivity;->scrollView:Landroid/widget/ScrollView;
    const/4 v3, 0x0
    invoke-virtual {v2, v3}, Landroid/widget/ScrollView;->setBackgroundColor(I)V

    new-instance v3, Landroid/widget/TextView;
    invoke-direct {v3, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    iput-object v3, p0, Lcom/dirty/init/DirtyInitActivity;->logView:Landroid/widget/TextView;
    const v4, -0x353B30
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V
    const/high16 v4, 0x41300000    # 11.0f
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextSize(F)V
    sget-object v4, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
    const/4 v4, 0x0
    const v5, 0x3f933333    # 1.15f
    invoke-virtual {v3, v4, v5}, Landroid/widget/TextView;->setLineSpacing(FF)V
    invoke-virtual {v2, v3}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v4, -0x1
    const/4 v5, 0x0
    const/high16 v6, 0x3f800000    # 1.0f
    invoke-direct {v3, v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V
    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v3, -0x1
    const/4 v4, 0x0
    const/high16 v5, 0x3f800000    # 1.0f
    invoke-direct {v2, v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V
    const/high16 v3, 0x40c00000    # 6.0f
    invoke-direct {p0, v3}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v3
    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I
    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # ---- footer ----
    const-string v1, "Execute the exploit, then use Extract CLI to save the shell binary."
    const/high16 v2, 0x41300000    # 11.0f
    const v3, -0x6C7067
    const/4 v4, 0x0
    invoke-direct {p0, v1, v2, v3, v4}, Lcom/dirty/init/DirtyInitActivity;->md3Text(Ljava/lang/String;FII)Landroid/widget/TextView;
    move-result-object v1
    const/16 v2, 0x11
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setGravity(I)V
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v3, -0x1
    const/4 v4, -0x2
    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    const/high16 v3, 0x40c00000    # 6.0f
    invoke-direct {p0, v3}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v3
    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I
    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, v0}, Lcom/dirty/init/DirtyInitActivity;->setContentView(Landroid/view/View;)V
    return-void
.end method
