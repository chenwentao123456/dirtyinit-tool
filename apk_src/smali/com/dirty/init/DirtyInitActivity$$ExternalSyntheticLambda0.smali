.class public final synthetic Lcom/dirty/init/DirtyInitActivity$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Lcom/dirty/init/DirtyInitActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/dirty/init/DirtyInitActivity;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/dirty/init/DirtyInitActivity$$ExternalSyntheticLambda0;->f$0:Lcom/dirty/init/DirtyInitActivity;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity$$ExternalSyntheticLambda0;->f$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-virtual {v0, p1, p2}, Lcom/dirty/init/DirtyInitActivity;->lambda$requestStoragePermissions$0$com-dirty-init-DirtyInitActivity(Landroid/content/DialogInterface;I)V

    return-void
.end method
