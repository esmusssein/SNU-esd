#include <stdio.h>

typedef int fix16;

#define FRACT_OFFSET 14
#define FLOAT2FIXED(x) ((int)((x) * (1 << FRACT_OFFSET)))
#define FIXED2FLOAT(x) (((float)(x)) / (1 << FRACT_OFFSET))

char gbuf[sizeof(float)];

char *float2bytes(float f) {
    memcpy(gbuf, &f, sizeof(float));
    return gbuf;
}

int main() {
    char buf[sizeof(float)];
    // Test.
    float fp = 3.1622777;
    fix16 fx = FLOAT2FIXED(fp);
    printf("fp %x fx %x fxconv %x\n", *(int *)float2bytes(fp), fx, *(int *)float2bytes(FIXED2FLOAT(fx)));

    return 0;
}
