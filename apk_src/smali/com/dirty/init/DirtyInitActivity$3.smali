.class Lcom/dirty/init/DirtyInitActivity$3;
.super Ljava/lang/Object;
.source "DirtyInitActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dirty/init/DirtyInitActivity;->doExtract()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dirty/init/DirtyInitActivity;


# direct methods
.method constructor <init>(Lcom/dirty/init/DirtyInitActivity;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 366
    iput-object p1, p0, Lcom/dirty/init/DirtyInitActivity$3;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .line 370
    const-string v0, "overlay_scratch.img"

    const-string v1, "dirtyinit"

    .line 0
    const-string v2, "[*] overlay_scratch.img extracted ("

    const-string v3, "[*] Written to "

    const-string v4, "[*] Extracting shell ("

    const v5, -0x9495

    .line 370
    :try_start_0
    iget-object v6, p0, Lcom/dirty/init/DirtyInitActivity$3;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-static {v6, v1}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mloadAsset(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;)[B

    move-result-object v6

    if-nez v6, :cond_0

    .line 372
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity$3;->this$0:Lcom/dirty/init/DirtyInitActivity;

    const-string v1, "[!] Binary not found in assets"

    invoke-static {v0, v1}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mappendLog(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;)V

    .line 373
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity$3;->this$0:Lcom/dirty/init/DirtyInitActivity;

    const-string v1, "Asset missing"

    invoke-static {v0, v1, v5}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$msetStatus(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;I)V

    .line 374
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity$3;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-static {v0}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$menableExtractButton(Lcom/dirty/init/DirtyInitActivity;)V

    return-void

    .line 378
    :cond_0
    iget-object v7, p0, Lcom/dirty/init/DirtyInitActivity$3;->this$0:Lcom/dirty/init/DirtyInitActivity;

    array-length v8, v6

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v8, " bytes)..."

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v7, v4}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mappendLog(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;)V

    .line 380
    new-instance v4, Ljava/io/File;

    .line 381
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v7

    invoke-direct {v4, v7, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 382
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 383
    invoke-virtual {v1, v6}, Ljava/io/FileOutputStream;->write([B)V

    .line 384
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 386
    iget-object v1, p0, Lcom/dirty/init/DirtyInitActivity$3;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mappendLog(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;)V

    .line 389
    iget-object v1, p0, Lcom/dirty/init/DirtyInitActivity$3;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-static {v1, v0}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mloadAsset(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;)[B

    move-result-object v1

    if-eqz v1, :cond_1

    .line 391
    new-instance v3, Ljava/io/File;

    .line 392
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 393
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 394
    invoke-virtual {v0, v1}, Ljava/io/FileOutputStream;->write([B)V

    .line 395
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    .line 396
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity$3;->this$0:Lcom/dirty/init/DirtyInitActivity;

    array-length v1, v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " bytes)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mappendLog(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;)V

    goto :goto_0

    .line 398
    :cond_1
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity$3;->this$0:Lcom/dirty/init/DirtyInitActivity;

    const-string v1, "[!] overlay_scratch.img not found in assets (overlay setup will need manual extraction)"

    invoke-static {v0, v1}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mappendLog(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;)V

    .line 401
    :goto_0
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity$3;->this$0:Lcom/dirty/init/DirtyInitActivity;

    const-string v1, ""

    invoke-static {v0, v1}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mappendLog(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;)V

    .line 402
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity$3;->this$0:Lcom/dirty/init/DirtyInitActivity;

    const-string v1, "To run, copy to an exec-capable path:"

    invoke-static {v0, v1}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mappendLog(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;)V

    .line 403
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity$3;->this$0:Lcom/dirty/init/DirtyInitActivity;

    const-string v1, "  cp /sdcard/dirtyinit ~/ && chmod +x ~/dirtyinit"

    invoke-static {v0, v1}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mappendLog(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;)V

    .line 404
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity$3;->this$0:Lcom/dirty/init/DirtyInitActivity;

    const-string v1, "  ~/dirtyinit"

    invoke-static {v0, v1}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mappendLog(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;)V

    .line 405
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity$3;->this$0:Lcom/dirty/init/DirtyInitActivity;

    const-string v1, "Extracted"

    const v2, -0xb24954

    invoke-static {v0, v1, v2}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$msetStatus(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 407
    iget-object v1, p0, Lcom/dirty/init/DirtyInitActivity$3;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "[!] Extract failed: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mappendLog(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;)V

    .line 408
    const-string v1, "DIRTY_INIT"

    const-string v2, "Extract failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 409
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity$3;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-static {v0, v2, v5}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$msetStatus(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;I)V

    .line 411
    :goto_1
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity$3;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-static {v0}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$menableExtractButton(Lcom/dirty/init/DirtyInitActivity;)V

    return-void
.end method
