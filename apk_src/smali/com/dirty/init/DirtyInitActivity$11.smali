.class Lcom/dirty/init/DirtyInitActivity$11;
.super Ljava/lang/Object;
.source "DirtyInitActivity.java"

# interfaces
.implements Ljava/lang/Runnable;

# instance fields
.field final synthetic this$0:Lcom/dirty/init/DirtyInitActivity;

# direct methods
.method constructor <init>(Lcom/dirty/init/DirtyInitActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/dirty/init/DirtyInitActivity$11;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity$11;->this$0:Lcom/dirty/init/DirtyInitActivity;

    iget v1, v0, Lcom/dirty/init/DirtyInitActivity;->stage:I

    if-eqz v1, :not_stage0

    const/4 v1, 0x1

    iput v1, v0, Lcom/dirty/init/DirtyInitActivity;->stage:I

    invoke-static {v0}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mrunDfiExploit(Lcom/dirty/init/DirtyInitActivity;)V

    new-instance v1, Lcom/dirty/init/DirtyInitActivity$10;

    invoke-direct {v1, v0}, Lcom/dirty/init/DirtyInitActivity$10;-><init>(Lcom/dirty/init/DirtyInitActivity;)V

    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    return-void

    :not_stage0
    const/4 v2, 0x1

    if-ne v1, v2, :done

    const/4 v1, 0x2

    iput v1, v0, Lcom/dirty/init/DirtyInitActivity;->stage:I

    invoke-static {v0}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mrunDfiExploit(Lcom/dirty/init/DirtyInitActivity;)V

    :done
    return-void
.end method
