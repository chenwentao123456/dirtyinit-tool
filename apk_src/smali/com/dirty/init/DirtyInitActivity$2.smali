.class Lcom/dirty/init/DirtyInitActivity$2;
.super Ljava/lang/Object;
.source "DirtyInitActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dirty/init/DirtyInitActivity;->onCreate(Landroid/os/Bundle;)V
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

    .line 251
    iput-object p1, p0, Lcom/dirty/init/DirtyInitActivity$2;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 253
    iget-object p1, p0, Lcom/dirty/init/DirtyInitActivity$2;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-static {p1}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$mextractDirtyInit(Lcom/dirty/init/DirtyInitActivity;)V

    return-void
.end method
