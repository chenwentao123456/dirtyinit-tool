.class Lcom/dirty/init/DirtyInitActivity$10;
.super Ljava/lang/Object;
.source "DirtyInitActivity.java"

# interfaces
.implements Ljava/lang/Runnable;

# instance fields
.field final synthetic this$0:Lcom/dirty/init/DirtyInitActivity;

# direct methods
.method constructor <init>(Lcom/dirty/init/DirtyInitActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/dirty/init/DirtyInitActivity$10;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

# virtual methods
.method public run()V
    .locals 4

    :loop
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity$10;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-static {v0}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$fgetexecuteButton(Lcom/dirty/init/DirtyInitActivity;)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Button;->isEnabled()Z

    move-result v1

    if-eqz v1, :wait

    const-wide/16 v2, 0x2710

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V

    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity$10;->this$0:Lcom/dirty/init/DirtyInitActivity;

    new-instance v1, Lcom/dirty/init/DirtyInitActivity$11;

    invoke-direct {v1, v0}, Lcom/dirty/init/DirtyInitActivity$11;-><init>(Lcom/dirty/init/DirtyInitActivity;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void

    :wait
    const-wide/16 v2, 0x1f4

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V

    goto :loop
.end method
