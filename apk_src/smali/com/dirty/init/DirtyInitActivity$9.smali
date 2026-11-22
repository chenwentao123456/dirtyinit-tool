.class Lcom/dirty/init/DirtyInitActivity$9;
.super Ljava/lang/Object;
.source "DirtyInitActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;

# instance fields
.field final synthetic this$0:Lcom/dirty/init/DirtyInitActivity;

# direct methods
.method constructor <init>(Lcom/dirty/init/DirtyInitActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/dirty/init/DirtyInitActivity$9;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    iget-object p1, p0, Lcom/dirty/init/DirtyInitActivity$9;->this$0:Lcom/dirty/init/DirtyInitActivity;

    const/4 v0, 0x0

    iput v0, p1, Lcom/dirty/init/DirtyInitActivity;->stage:I

    invoke-static {p1}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mrunDfiExploit(Lcom/dirty/init/DirtyInitActivity;)V

    new-instance v0, Lcom/dirty/init/DirtyInitActivity$10;

    invoke-direct {v0, p1}, Lcom/dirty/init/DirtyInitActivity$10;-><init>(Lcom/dirty/init/DirtyInitActivity;)V

    new-instance v1, Ljava/lang/Thread;

    invoke-direct {v1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    return-void
.end method
