#include <jni.h>
#include <fcntl.h>
#include <unistd.h>

#define DEV_NAME "/dev/blackscholes"
#define FIX12_OFFSET 12
#define DOUBLE_TO_FIX12(x) ((long)((x) * (1 << FIX12_OFFSET)))
#define FIX12_TO_DOUBLE(x) (((double)(x)) / (1 << FIX12_OFFSET))

typedef long fix12;

/**
 * Sets constants that will be used in computation into device before it starts
 * computing.
 *
 * @param K
 * @param const1 A pre-computed value of S*exp((r-0.5*sigma^2)*T).
 * @param const2 A pre-computed value of sigma*sqrt(T).
 * @return 0 if it succeeded.
 */
jint
Java_kr_ac_snu_blackscholes_MainActivity_setConstantsIntoDevice(JNIEnv *env,
    jobject thiz, jdouble K, jdouble const1, jdouble const2)
{
	int fd;
	fd = open(DEV_NAME, O_WRONLY);
	if (fd < 0)
        return -1;
    fix12 fix12_K = DOUBLE_TO_FIX12(K);
    fix12 fix12_const1 = DOUBLE_TO_FIX12(const1);
    fix12 fix12_const2 = DOUBLE_TO_FIX12(const2);
    write(fd, &fix12_K, 8);
    write(fd, &fix12_const1, 8);
    write(fd, &fix12_const2, 8);
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
    // TODO: there is a case that failed?
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
