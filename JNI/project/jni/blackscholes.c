#include <jni.h>
#include <fcntl.h>
#include <unistd.h>

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
Java_kr_ac_snu_blackscholes_MainActivity_setConstantsIntoDevice(JNIEnv* env,
    jobject thiz, jfloat K, jfloat const1, jfloat const2, jfloat const3)
{
	int fd;
    // For test.
    int data = 0x12345678;

	fd = open("/dev/blackscholes", O_WRONLY);
	if(fd < 0)
        return -1;

	if (write(fd, &data, 4) == 0) {
		close(fd);
		return -2;
	}

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
