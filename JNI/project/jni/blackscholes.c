#include <jni.h>
#include <fcntl.h>
#include <unistd.h>

static const char *dev_name = "/dev/blackscholes";

/**
 * Sets constants that will be used in computation into device before it starts
 * computing.
 *
 * @param K
 * @param const1 A pre-computed value of S*exp((r-0.5*sigma^2)*T).
 * @param const2 A pre-computed value of sigma*sqrt(T).
 * @param const3 A pre-computed value of exp(-r*T).
 * @return 0 if it succeeded.
 */
jint
Java_kr_ac_snu_blackscholes_MainActivity_setConstantsIntoDevice(JNIEnv *env,
    jobject thiz, jfloat K, jfloat const1, jfloat const2, jfloat const3)
{
	int fd;
	fd = open(dev_name, O_WRONLY);
	if (fd < 0)
        return -1;
    // TODO: there is a case that failed?
    write(fd, &K, 4);
    write(fd, &const1, 4);
    write(fd, &const2, 4);
    write(fd, &const3, 4);
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
    fd = open(dev_name, O_WRONLY);
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
