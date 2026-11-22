.class Lcom/dirty/init/PayloadPatcher;
.super Ljava/lang/Object;
.source "PayloadPatcher.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# public static byte[] patch(byte[] data, int stage, int[] vals, int seq)
.method public static patch([BI[II)[B
    .locals 8

    const/16 v0, 0x10

    if-ne p1, v0, :thoff

    const/16 v0, 0x11

    if-ne p1, v0, :thoff

    const/16 v0, 0x12

    if-ne p1, v0, :thoff

    const/16 v0, 0x20

    if-ne p1, v0, :cpu

    return-object p0

    :thoff
    const/16 v1, 0x10

    if-ne p1, v1, :mkthoff

    const/16 v0, 0x15f
    goto :mkok

    :mkthoff
    const/16 v0, 0x1b7

    :mkok
    invoke-static {p0, v0, p3}, Lcom/dirty/init/PayloadPatcher;->patchMarker([BII)V

    return-object p0

    :cpu
    const/16 v0, 0x133
    invoke-static {p0, v0, p3}, Lcom/dirty/init/PayloadPatcher;->patchMarker([BII)V

    const/16 v1, 0x1a4
    const/4 v2, 0x0
    invoke-static {p0, v1, p2, v2}, Lcom/dirty/init/PayloadPatcher;->patchSlot([BI[II)V

    const/16 v1, 0x1ac
    const/4 v2, 0x1
    invoke-static {p0, v1, p2, v2}, Lcom/dirty/init/PayloadPatcher;->patchSlot([BI[II)V

    const/16 v1, 0x1b4
    const/4 v2, 0x2
    invoke-static {p0, v1, p2, v2}, Lcom/dirty/init/PayloadPatcher;->patchSlot([BI[II)V

    const/16 v1, 0x1bc
    const/4 v2, 0x3
    invoke-static {p0, v1, p2, v2}, Lcom/dirty/init/PayloadPatcher;->patchSlot([BI[II)V

    const/16 v1, 0x1c4
    const/4 v2, 0x4
    invoke-static {p0, v1, p2, v2}, Lcom/dirty/init/PayloadPatcher;->patchSlot([BI[II)V

    const/16 v1, 0x1cc
    const/4 v2, 0x5
    invoke-static {p0, v1, p2, v2}, Lcom/dirty/init/PayloadPatcher;->patchSlot([BI[II)V

    return-object p0
.end method


# private static void patchMarker(byte[] data, int off, int seq)
.method private static patchMarker([BII)V
    .locals 5

    and-int/lit16 v0, p2, 0xff

    shr-int/lit8 v1, v0, 0x4

    and-int/lit8 v1, v1, 0xf

    and-int/lit8 v0, v0, 0xf

    invoke-static {v1}, Lcom/dirty/init/PayloadPatcher;->hexChar(I)I
    move-result v1

    invoke-static {v0}, Lcom/dirty/init/PayloadPatcher;->hexChar(I)I
    move-result v0

    int-to-byte v1, v1

    aput-byte v1, p0, p1

    add-int/lit8 v2, p1, 0x1

    int-to-byte v0, v0

    aput-byte v0, p0, v2

    return-void
.end method


# private static void patchSlot(byte[] data, int slotOff, int[] vals, int idx)
.method private static patchSlot([BI[II)V
    .locals 6

    aget v0, p2, p3

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;
    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B
    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :cpy
    if-ge v2, v1, :cpyd

    aget-byte v3, v0, v2

    add-int v4, p1, v2

    aput-byte v3, p0, v4

    add-int/lit8 v2, v2, 0x1

    goto :cpy

    :cpyd
    add-int v4, p1, v1
    const/4 v3, 0x0
    aput-byte v3, p0, v4

    return-void
.end method


# private static int hexChar(int v)
.method private static hexChar(I)I
    .locals 1

    const/16 v0, 0xa

    if-ge p0, v0, :digit

    add-int/lit8 v0, p0, 0x57

    return v0

    :digit
    add-int/lit8 v0, p0, 0x30

    return v0
.end method
