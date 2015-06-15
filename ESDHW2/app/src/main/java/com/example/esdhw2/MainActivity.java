package com.example.esdhw2;

import android.os.Handler;
import android.app.Activity;
import android.os.Bundle;
import android.os.Looper;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;


public class MainActivity extends Activity {

    private static int DEVICE_IDLE_COMMAND = 0x0 << 30;
    private static int DEVICE_SET_COMMAND = 0x1 << 30;
    private static int DEVICE_START_COMMAND = 0x2 << 30;
    private static int DEVICE_STOP_COMMAND = 0x3 << 30;
    private static int COUNTER_VALUE_CHECK_INTERVAL = 100;

    private EditText mEditText;
    private TextView mTextView;
    private Handler mHandler = new Handler(Looper.getMainLooper());

    public native int writeToDeviceRegister(int data);
    public native int readFromDeviceRegister();

    Runnable mCounterValueChecker = new Runnable() {
        @Override
        public void run() {
            final int deviceRegisterValue = readFromDeviceRegister();
            System.out.println(deviceRegisterValue);
            mTextView.setText("counter value: " + getCounterValueFromOutput(deviceRegisterValue));
            mHandler.postDelayed(mCounterValueChecker, COUNTER_VALUE_CHECK_INTERVAL);
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        // Load JNI lib.
        System.loadLibrary("sevseg");

        mEditText = (EditText)findViewById(R.id.edit_text);
        mTextView = (TextView)findViewById(R.id.text_view);
        mHandler = new Handler();

        // Initialize the device register.
        int result = writeToDeviceRegister(DEVICE_IDLE_COMMAND);
        if (result < 0) {
            handleJNIFunctionError(result);
        };
    }

    public void onSetButtonClicked(View v) {
        // Get device set command with given an input of an edit text.
        int deviceSetCommand = getDeviceSetCommandWithInput();
        if (deviceSetCommand < 0) {
            return;
        }
        // Set device set command then set command bit as idle to prevent a race condition.
        int result = writeToDeviceRegister(deviceSetCommand);
        if (result < 0) {
            handleJNIFunctionError(result);
        };
    }

    public void onStartButtonClicked(View v) {
        int result = writeToDeviceRegister(DEVICE_START_COMMAND);
        if (result < 0) {
            handleJNIFunctionError(result);
        }

        mCounterValueChecker.run();
    }

    public void onStopButtonClicked(View v) {
        int result = writeToDeviceRegister(DEVICE_STOP_COMMAND);
        if (result < 0) {
            handleJNIFunctionError(result);
        }
    }

    private int getCounterValueFromOutput(int value) {
        int result = 0;
        for (int i = 0; i <= 5; i++) {
            result += (value & 0xF) * (int)Math.pow(10, i);
            value = value >> 4;
        }
        return result;
    }

    private int getDeviceSetCommandWithInput() {
        int result = 0x0;
        // Write input initializing value to result in a specific form.
        int value = 0;
        try {
            value = Integer.parseInt(mEditText.getText().toString());
        } catch (NumberFormatException e) {
            Toast.makeText(this, "NumberFormatException raised.", Toast.LENGTH_SHORT);
            return -1;
        }
        for (int i = 5; i >= 0; i--) {
            result = result << 4;
            result |= (0xF & (value / (int)Math.pow(10, i)));
//            System.out.println(0xF & (value/(int)Math.pow(10, i)));
            value -= (value / (int)Math.pow(10, i)) * (int)Math.pow(10, i);
        }

        // Set command bits.
        result |= DEVICE_SET_COMMAND;
//        Toast.makeText(this, "" + result, Toast.LENGTH_SHORT).show();
        return result;
    }

    private void handleJNIFunctionError(int errno) {
//        Toast.makeText(this, "JNI lib error " + errno, Toast.LENGTH_SHORT).show();
    }
}
