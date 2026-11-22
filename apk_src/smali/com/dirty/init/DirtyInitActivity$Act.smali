.class Lcom/dirty/init/DirtyInitActivity$Act;
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
