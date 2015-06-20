#include <stdio.h>
#include <math.h>

typedef long fixed;

#define FIXED_OFFSET 15
#define DOUBLE_TO_FIXED(x) ((long)((x) * (1 << FIXED_OFFSET)))
#define FIXED_TO_DOUBLE(x) (((double)(x)) / (1 << FIXED_OFFSET))

float K = 50.0;
float const1 = 58.18241639;
float const2 = 0.433012701;

int main() {
    float seed = -2;
    float orig = pow(K-const1*exp(const2*seed), 2);
//    float orig = K-const1*exp(const2*seed);
//    float orig = const1*exp(const2*seed);
//    float orig = exp(const2*seed);
//    float orig = const2*seed;
//    float orig = seed;
    fixed conv = DOUBLE_TO_FIXED((double)orig);
    float convconv = FIXED_TO_DOUBLE((double)conv);

    printf("seed %f, orig %f\n", seed, orig);
    printf("orig %x\n", *(long *)&orig);
    printf("conv %x\n", *(long *)&conv);
    printf("convconv %x\n", *(long *)&convconv);

    return 0;
}
