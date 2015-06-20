package kr.ac.snu.blackscholes;

import android.app.Activity;
import android.graphics.Color;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.HashMap;


public class MainActivity extends Activity {

    private static final byte RUN = 0x01;
    private static final byte ACK = 0x02;
    // Represents S*exp((r - 0.5*sigma^2)*T).
    private static final String DEP_CONST_1 = "dep1";
    // Represents sigma*sqrt(T).
    private static final String DEP_CONST_2 = "dep2";
    // Represents exp(-r*T).
    private static final String DEP_CONST_3 = "dep3";

    private EditText mEditTextConstantS;
    private EditText mEditTextConstantK;
    private EditText mEditTextConstantR;
    private EditText mEditTextConstantSigma;
    private EditText mEditTextConstantT;
    private EditText mEditTextIterateNumber;
    private LinearLayout mMessageLayout;

    private HashMap<String, Double> mConstants = new HashMap<>();
    private int mIterateNumber;

    public native int setConstantsIntoDevice(double K, double const1, double const2, int niter);
    public native int commandDevice(byte command);
    public native int setupLutIntoDevice();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        // Load JNI library.
        System.loadLibrary("blackscholes");
        // Find views.
        mEditTextConstantS = (EditText)findViewById(R.id.edit_text_S);
        mEditTextConstantK = (EditText)findViewById(R.id.edit_text_K);
        mEditTextConstantR = (EditText)findViewById(R.id.edit_text_r);
        mEditTextConstantSigma = (EditText)findViewById(R.id.edit_text_sigma);
        mEditTextConstantT = (EditText)findViewById(R.id.edit_text_T);
        mEditTextIterateNumber = (EditText)findViewById(R.id.edit_text_M);
        mMessageLayout = (LinearLayout)findViewById(R.id.message_layout);
        // Set LUT for comutation into the device.
        addMessageToMessageLayout("Set LUT for computation into the device...");
        int result = setupLutIntoDevice();
        if (result < 0) {
            addMessageToMessageLayout("An error occurred at setLutIntoDevice().");
            return;
        }
        addMessageToMessageLayout("Success");
    }

    public void onComputeButtonClick(View v) {
        addMessageToMessageLayout("Clicked COMPUTE button.");
        int result;
        // Get a value of in each edit text view, set some dependent constants that will be
        // used in computation. Then set these values into the device by calling
        // setConstantsIntoDevice().
        mIterateNumber = Integer.valueOf(mEditTextIterateNumber.getText().toString());
        mMessageLayout.removeAllViews();
        setIndependentConstants();
        addMessageToMessageLayout("Compute dependent constants for computation...");
        setDependentConstants();
        addMessageToMessageLayout("Set constants into the device...");
        result = setConstantsIntoDevice(
            mConstants.get("K"),
            mConstants.get(DEP_CONST_1),
            mConstants.get(DEP_CONST_2),
            Integer.valueOf(mEditTextIterateNumber.getText().toString())
        );
        if (result != 0) {
            addMessageToMessageLayout("An error occurred at setConstantsIntoDevice(). Exit.");
            return;
        }
        addMessageToMessageLayout("Succeess");
        addMessageToMessageLayout("Command the device to compute...");
        result = commandDevice(RUN);
        if (result != 0) {
            addMessageToMessageLayout("An error occurred at commandDevice(). Exit.");
            return;
        }
//        result = setupLutIntoDevice();
//        if (result != 0) {
//            addMessageToMessageLayout("An error occurred at setupLutIntoDevice(). Exit.");
//            return;
//        }
        // TODO: Confirm the device is running.
    }

    private void addMessageToMessageLayout(String message) {
        TextView textView = new TextView(this);
        textView.setText(message);
        textView.setTextColor(Color.parseColor("#ffffff"));
        mMessageLayout.addView(textView);
    }

    private void setIndependentConstants() {
        mConstants.put("S", Double.valueOf(mEditTextConstantS.getText().toString()));
        mConstants.put("K", Double.valueOf(mEditTextConstantK.getText().toString()));
        mConstants.put("r", Double.valueOf(mEditTextConstantR.getText().toString()));
        mConstants.put("sigma", Double.valueOf(mEditTextConstantSigma.getText().toString()));
        mConstants.put("T", Double.valueOf(mEditTextConstantT.getText().toString()));

        addMessageToMessageLayout("S: " + mConstants.get("S"));
        addMessageToMessageLayout("K: " + mConstants.get("K"));
        addMessageToMessageLayout("r: " + mConstants.get("r"));
        addMessageToMessageLayout("sigma: " + mConstants.get("sigma"));
        addMessageToMessageLayout("T: " + mConstants.get("T"));
    }

    private void setDependentConstants() {
        double S = mConstants.get("S");
        double r = mConstants.get("r");
        double sigma = mConstants.get("sigma");
        double T = mConstants.get("T");

        mConstants.put(DEP_CONST_1, S*Math.exp((r - 0.5*Math.pow(sigma, 2))*T));
        mConstants.put(DEP_CONST_2, sigma*Math.sqrt(T));
        mConstants.put(DEP_CONST_3, Math.exp(-r*T));

        addMessageToMessageLayout("Dependent constant1: " + mConstants.get(DEP_CONST_1));
        addMessageToMessageLayout("Dependent constant2: " + mConstants.get(DEP_CONST_2));
        addMessageToMessageLayout("Dependent constant3: " + mConstants.get(DEP_CONST_3));
    }
}
