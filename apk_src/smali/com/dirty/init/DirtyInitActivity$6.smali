.class Lcom/dirty/init/DirtyInitActivity$6;
.super Ljava/lang/Object;
.source "DirtyInitActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dirty/init/DirtyInitActivity;->setStatus(Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dirty/init/DirtyInitActivity;

.field final synthetic val$color:I

.field final synthetic val$status:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 461
    iput-object p1, p0, Lcom/dirty/init/DirtyInitActivity$6;->this$0:Lcom/dirty/init/DirtyInitActivity;

    iput-object p2, p0, Lcom/dirty/init/DirtyInitActivity$6;->val$status:Ljava/lang/String;

    iput p3, p0, Lcom/dirty/init/DirtyInitActivity$6;->val$color:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 464
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity$6;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-static {v0}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$fgetstatusText(Lcom/dirty/init/DirtyInitActivity;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/dirty/init/DirtyInitActivity$6;->val$status:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 465
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity$6;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-static {v0}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$fgetstatusText(Lcom/dirty/init/DirtyInitActivity;)Landroid/widget/TextView;

    move-result-object v0

    iget v1, p0, Lcom/dirty/init/DirtyInitActivity$6;->val$color:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    return-void
.end method
