#include <jni.h>
// For open().
#include <fcntl.h>
// For write(), close(), read()
#include <unistd.h>

jint Java_com_example_esdhw2_MainActivity_writeToDeviceRegister(JNIEnv* env, jobject thiz, jint data)
{
	int fd;
	int write_result;

	fd = open("/dev/sevseg", O_WRONLY);
	if(fd < 0) {
		return -1;
	}

	if (write(fd, &data, 4) < 0) {
		close(fd);
		return -2;
	}

	close(fd);
	return 0;
}

jint Java_com_example_esdhw2_MainActivity_readFromDeviceRegister(JNIEnv *env, jobject thiz)
{
    int fd;
    int rst;
    int data;

    fd = open("/dev/sevseg", O_RDONLY);
    if (fd < 0)
        return -1;
    rst = read(fd, &data, 4);
    close(fd);
    if (rst < 0)
        return rst;
    return data;
}
