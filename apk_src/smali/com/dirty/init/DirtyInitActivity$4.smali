.class Lcom/dirty/init/DirtyInitActivity$4;
.super Ljava/lang/Object;
.source "DirtyInitActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dirty/init/DirtyInitActivity;->enableExtractButton()V
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

    .line 417
    iput-object p1, p0, Lcom/dirty/init/DirtyInitActivity$4;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 420
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity$4;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-static {v0}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$fgetextractButton(Lcom/dirty/init/DirtyInitActivity;)Landroid/widget/Button;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    return-void
.end method
