#include <jni.h>
#include <fcntl.h>
#include <unistd.h>
#include <math.h>

#define DEV_NAME "/dev/blackscholes"
#define FIXED_OFFSET 15
#define DOUBLE_TO_FIXED(x) ((long)((x) * (1 << FIXED_OFFSET)))
#define FIXED_TO_DOUBLE(x) (((double)(x)) / (1 << FIXED_OFFSET))

typedef long fixed;

/**
 * Sets constants that will be used in computation into device before it starts
 * computing.
 *
 * @param K
 * @param const1 A pre-computed value of S*exp((r-0.5*sigma^2)*T).
 * @param const2 A pre-computed value of sigma*sqrt(T).
 * @param niter How many this device iterates computing.
 * @return 0 if it succeeded.
 */
jint
Java_kr_ac_snu_blackscholes_MainActivity_setConstantsIntoDevice(JNIEnv *env,
    jobject thiz, jdouble K, jdouble const1, jdouble const2, jint niter)
{
	int fd;
	fd = open(DEV_NAME, O_WRONLY);
	if (fd < 0)
        return -1;
    fixed fixed_K = DOUBLE_TO_FIXED(K);
    fixed fixed_const1 = DOUBLE_TO_FIXED(const1);
    fixed fixed_const2 = DOUBLE_TO_FIXED(const2);
    write(fd, &fixed_K, 8);
    write(fd, &fixed_const1, 8);
    write(fd, &fixed_const2, 8);
    write(fd, &niter, 4);
	close(fd);
	return 0;
}

jint
Java_kr_ac_snu_blackscholes_MainActivity_setupLutIntoDevice(JNIEnv *env,
    jobject thiz)
{
    int i;
    int result;
    int fd;
    fd = open(DEV_NAME, O_WRONLY);
    if (fd < 0)
        return -1;
    result = lseek(fd, 0x100000, SEEK_SET);
    if (result < 0)
        return result;
    for (i = 0; i < (1<<15); i++) {
        double data = sqrt(-2.0*log(FIXED_TO_DOUBLE(i)));
        short lut1_data = ((short)((data) * (1 << 13)));
        write(fd, &lut1_data, 2);
    }
    close(fd);
    return 0;
}

/**
 * Sets a command byte one pre-defined memory region.
 *
 * @param cmd
 * @return 0 if it succeeded.
 */
jint
Java_kr_ac_snu_blackscholes_MainActivity_commandDevice(JNIEnv *env,
    jobject thiz, jbyte cmd)
{
    int fd;
    int result;
    fd = open(DEV_NAME, O_WRONLY);
    if (fd < 0)
        return -1;
    result = lseek(fd, 0x1000, SEEK_SET);
    if (result < 0)
        return result;
    write(fd, &cmd, 2);
    close(fd);
    return 0;
}

// jint Java_com_example_esdhw2_MainActivity_readFromDeviceRegister(JNIEnv *env, jobject thiz)
// {
//     int fd;
//     int rst;
//     int data;

//     fd = open("/dev/sevseg", O_RDONLY);
//     if (fd < 0)
//         return -1;
//     rst = read(fd, &data, 4);
//     close(fd);
//     if (rst < 0)
//         return rst;
//     return data;
// }
