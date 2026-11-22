.method private createButton(Ljava/lang/String;I)Landroid/widget/Button;
    .locals 8

    new-instance v0, Landroid/widget/Button;
    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    # style 0 = filled primary, 1 = tonal primary container, 2 = tonal secondary container
    if-eqz p2, :style_1
    const v1, -0x2F4301
    const v2, -0xC7E18E
    const v3, 0x33381E72
    goto :style_done
    :style_1
    const/4 v4, 0x1
    if-ne p2, v4, :style_2
    const v1, -0xB0C875
    const v2, -0x152201
    const v3, 0x33EADDFF
    goto :style_done
    :style_2
    const v1, -0xB5BBA8
    const v2, -0x172108
    const v3, 0x33E8DEF8
    :style_done

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setTextColor(I)V
    const/high16 v4, 0x41600000    # 14.0f
    invoke-virtual {v0, v4}, Landroid/widget/Button;->setTextSize(F)V
    const/4 v4, 0x0
    invoke-virtual {v0, v4}, Landroid/widget/Button;->setAllCaps(Z)V
    const-string v4, "sans-serif-medium"
    const/4 v5, 0x0
    invoke-static {v4, v5}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;
    move-result-object v4
    invoke-virtual {v0, v4}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;)V
    invoke-virtual {v0, v5}, Landroid/widget/Button;->setMinWidth(I)V
    invoke-virtual {v0, v5}, Landroid/widget/Button;->setMinHeight(I)V
    const/4 v5, 0x0
    invoke-virtual {v0, v5}, Landroid/widget/Button;->setStateListAnimator(Landroid/animation/StateListAnimator;)V

    # rounded content drawable + mask drawable + ripple
    const/16 v4, 0x18
    const/4 v5, 0x0
    invoke-direct {p0, v1, v4, v5, v5}, Lcom/dirty/init/DirtyInitActivity;->makeBg(IIII)Landroid/graphics/drawable/GradientDrawable;
    move-result-object v6
    const v4, -0x1
    const/16 v5, 0x18
    const/4 v7, 0x0
    invoke-direct {p0, v4, v5, v7, v7}, Lcom/dirty/init/DirtyInitActivity;->makeBg(IIII)Landroid/graphics/drawable/GradientDrawable;
    move-result-object v7
    invoke-static {v3}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;
    move-result-object v3
    new-instance v4, Landroid/graphics/drawable/RippleDrawable;
    invoke-direct {v4, v3, v6, v7}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    invoke-virtual {v0, v4}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/high16 v3, 0x41a00000    # 20.0f
    invoke-direct {p0, v3}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v3
    const/4 v4, 0x0
    invoke-virtual {v0, v3, v4, v3, v4}, Landroid/widget/Button;->setPadding(IIII)V

    return-object v0
.end method

.method private createLabel(Ljava/lang/String;)Landroid/widget/TextView;
    .locals 3

    new-instance v0, Landroid/widget/TextView;
    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const v1, -0x353B30
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V
    const/high16 v1, 0x41300000    # 11.0f
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V
    const-string v1, "sans-serif-medium"
    const/4 v2, 0x0
    invoke-static {v1, v2}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;
    move-result-object v1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
    const v1, 0x3dcccccd    # 0.1f
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLetterSpacing(F)V
    const/high16 v1, 0x40c00000    # 6.0f
    invoke-direct {p0, v1}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v1
    const/4 v2, 0x0
    invoke-virtual {v0, v2, v2, v2, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    return-object v0
.end method

.method private makeBg(IIII)Landroid/graphics/drawable/GradientDrawable;
    .locals 3

    new-instance v0, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V
    const/4 v1, 0x0
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
    int-to-float v1, p2
    invoke-direct {p0, v1}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v1
    int-to-float v1, v1
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
    if-lez p3, :no_stroke
    int-to-float v1, p3
    invoke-direct {p0, v1}, Lcom/dirty/init/DirtyInitActivity;->dpI(F)I
    move-result v1
    invoke-virtual {v0, v1, p4}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V
    :no_stroke
    return-object v0
.end method

.method private oval(I)Landroid/graphics/drawable/GradientDrawable;
    .locals 1

    new-instance v0, Landroid/graphics/drawable/GradientDrawable;
    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V
    const/4 v1, 0x1
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
    return-object v0
.end method

.method private md3Text(Ljava/lang/String;FII)Landroid/widget/TextView;
    .locals 2

    new-instance v0, Landroid/widget/TextView;
    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextSize(F)V
    if-eqz p4, :normal
    const-string v1, "sans-serif-medium"
    const/4 v2, 0x0
    invoke-static {v1, v2}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;
    move-result-object v1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
    goto :done
    :normal
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
    :done

    return-object v0
.end method

.method private dpI(F)I
    .locals 1

    invoke-direct {p0, p1}, Lcom/dirty/init/DirtyInitActivity;->dp(F)F
    move-result v0
    float-to-int v0, v0
    return v0
.end method
