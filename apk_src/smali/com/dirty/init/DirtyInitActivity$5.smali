.class Lcom/dirty/init/DirtyInitActivity$5;
.super Ljava/lang/Object;
.source "DirtyInitActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dirty/init/DirtyInitActivity;->onNativeProgress(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dirty/init/DirtyInitActivity;

.field final synthetic val$msg:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/dirty/init/DirtyInitActivity;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 427
    iput-object p1, p0, Lcom/dirty/init/DirtyInitActivity$5;->this$0:Lcom/dirty/init/DirtyInitActivity;

    iput-object p2, p0, Lcom/dirty/init/DirtyInitActivity$5;->val$msg:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 430
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity$5;->val$msg:Ljava/lang/String;

    const-string v1, "[SC]"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    const/16 v2, 0x21

    const/4 v3, 0x0

    const-string v4, ""

    if-eqz v0, :cond_0

    .line 431
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity$5;->val$msg:Ljava/lang/String;

    invoke-virtual {v0, v1, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 432
    new-instance v1, Landroid/text/SpannableString;

    invoke-direct {v1, v0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 433
    new-instance v4, Landroid/text/style/ForegroundColorSpan;

    const/16 v5, -0x5b00

    invoke-direct {v4, v5}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 434
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    .line 433
    invoke-virtual {v1, v4, v3, v0, v2}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 435
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity$5;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-static {v0}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$fgetlogView(Lcom/dirty/init/DirtyInitActivity;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->append(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 436
    :cond_0
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity$5;->val$msg:Ljava/lang/String;

    const-string v1, "[WH]"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 437
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity$5;->val$msg:Ljava/lang/String;

    invoke-virtual {v0, v1, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 438
    new-instance v1, Landroid/text/SpannableString;

    invoke-direct {v1, v0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 439
    new-instance v4, Landroid/text/style/ForegroundColorSpan;

    const/4 v5, -0x1

    invoke-direct {v4, v5}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 440
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    .line 439
    invoke-virtual {v1, v4, v3, v0, v2}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 441
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity$5;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-static {v0}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$fgetlogView(Lcom/dirty/init/DirtyInitActivity;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->append(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 443
    :cond_1
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity$5;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-static {v0}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$fgetlogView(Lcom/dirty/init/DirtyInitActivity;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/dirty/init/DirtyInitActivity$5;->val$msg:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->append(Ljava/lang/CharSequence;)V

    .line 445
    :goto_0
    iget-object v0, p0, Lcom/dirty/init/DirtyInitActivity$5;->this$0:Lcom/dirty/init/DirtyInitActivity;

    invoke-static {v0}, Lcom/dirty/init/DirtyInitActivity;->-$$Nest$fgetscrollView(Lcom/dirty/init/DirtyInitActivity;)Landroid/widget/ScrollView;

    move-result-object v0

    new-instance v1, Lcom/dirty/init/DirtyInitActivity$5$1;

    invoke-direct {v1, p0}, Lcom/dirty/init/DirtyInitActivity$5$1;-><init>(Lcom/dirty/init/DirtyInitActivity$5;)V

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
