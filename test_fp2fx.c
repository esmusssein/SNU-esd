#include <stdio.h>

typedef long fix12;

#define FIX12_OFFSET 12
#define DOUBLE_TO_FIX12(x) ((long)((x) * (1 << FIX12_OFFSET)))
#define FIX12_TO_DOUBLE(x) (((double)(x)) / (1 << FIX12_OFFSET))

char *double2bytes(double f, char *buf) {
    memcpy(buf, &f, sizeof(double));
    return buf;
}

int main() {
    char buf[sizeof(double)];
    // Test.
    double orig = 50.0;
    fix12 fx = DOUBLE_TO_FIX12(orig);
    printf("orig %16x, fix12 %16x, converted orig %16x\n", *(long *)double2bytes(orig, buf), fx, *(long *)double2bytes(FIX12_TO_DOUBLE(fx), buf));

    return 0;
}
