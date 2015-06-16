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

    // Represents S*exp(r - 0.5*sigma^2)*T.
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

    private HashMap<String, Float> mConstants = new HashMap<>();
    private int mIterateNumber;

    public native int setConstantsIntoDevice(float K, float const1, float const2, float const3);

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
        addMessageToMessageLayout("Set constants into device...");
        result = setConstantsIntoDevice(
            mConstants.get("K"),
            mConstants.get(DEP_CONST_1),
            mConstants.get(DEP_CONST_2),
            mConstants.get(DEP_CONST_3)
        );
        if (result != 0) {
            addMessageToMessageLayout("An error occurred at setConstantsIntoDevice(). Exit.");
            return;
        }
        addMessageToMessageLayout("Succeess");
    }

    private void addMessageToMessageLayout(String message) {
        TextView textView = new TextView(this);
        textView.setText(message);
        textView.setTextColor(Color.parseColor("#ffffff"));
        mMessageLayout.addView(textView);
    }

    private void setIndependentConstants() {
        mConstants.put("S", Float.valueOf(mEditTextConstantS.getText().toString()));
        mConstants.put("K", Float.valueOf(mEditTextConstantK.getText().toString()));
        mConstants.put("r", Float.valueOf(mEditTextConstantR.getText().toString()));
        mConstants.put("sigma", Float.valueOf(mEditTextConstantSigma.getText().toString()));
        mConstants.put("T", Float.valueOf(mEditTextConstantT.getText().toString()));

        addMessageToMessageLayout("S: " + mConstants.get("S"));
        addMessageToMessageLayout("K: " + mConstants.get("K"));
        addMessageToMessageLayout("r: " + mConstants.get("r"));
        addMessageToMessageLayout("sigma: " + mConstants.get("sigma"));
        addMessageToMessageLayout("T: " + mConstants.get("T"));
    }

    private void setDependentConstants() {
        float S = mConstants.get("S");
        float r = mConstants.get("r");
        float sigma = mConstants.get("sigma");
        float T = mConstants.get("T");

        mConstants.put(DEP_CONST_1, (float)(S*Math.exp((r - 0.5*Math.pow(sigma, 2))*T)));
        mConstants.put(DEP_CONST_2, (float)(sigma*Math.sqrt(T)));
        mConstants.put(DEP_CONST_3, (float)(Math.exp(-r * T)));

        addMessageToMessageLayout("Dependent constant1: " + mConstants.get(DEP_CONST_1));
        addMessageToMessageLayout("Dependent constant2: " + mConstants.get(DEP_CONST_2));
        addMessageToMessageLayout("Dependent constant3: " + mConstants.get(DEP_CONST_3));
    }
}
