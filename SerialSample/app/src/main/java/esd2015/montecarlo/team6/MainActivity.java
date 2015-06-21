package esd2015.montecarlo.team6;

import android.app.Activity;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioGroup;
import android.widget.TextView;

import com.JavaComm.JavaComm;

import java.util.Formatter;

public class MainActivity extends Activity {

    public native int setConstantsIntoDevice(double K, double const1, double const2, int niter);
    public native double readSumResultFromDevice();
    public native double readPowSumResultFromDevice();
    public native byte readDeviceStatus();
    public native int commandDevice(byte command);

    /** Called when the activity is first created. */
    final int COMM_RECV = 102;
    final int COMM_SEND = 201;

    final char Sync = 0x7E;
    final char Dummy = 0x7D;

    boolean isConnected = false;
    JavaComm m_comm;
    EventHandler m_eventHandler;

    int m_fd;

    //Recive Data
    char	RecvData[];
    int		RcvLength;

    int		RcvTmpLength;
    char	RecvTmp[];

    Button btConnect;
    Button btSend;
    TextView tvLog;
    TextView tvInfo;
    EditText etSendData;

    //Log
    int tvLogCount;

    private RadioGroup rgSelect;
    private int RadioId;
    String Port;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);

        System.loadLibrary("blackscholes");

        m_eventHandler = new EventHandler();

        m_comm = new JavaComm(m_eventHandler, 1024);
        m_comm.start();

        isConnected = false;

        //Receive Data
        RecvData = new char[1024];
        RecvTmp = new char[1024];

        rgSelect = (RadioGroup)findViewById(R.id.rg_select);

        //Log
        tvLog = (TextView)findViewById(R.id.tv_log);
        tvLog.setText("");
        tvLogCount = 0;
        tvInfo = (TextView)findViewById(R.id.tv_info);


        etSendData = (EditText)findViewById(R.id.et_send_data);

        btConnect = (Button) findViewById(R.id.bt_connect);
        btConnect.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View arg0) {
                if(isConnected)
                {
                    m_fd = m_comm.closePort();
                    isConnected = false;
                    btConnect.setText("Connect");
                    tvInfo.setText("");
                    tvLog.setText("");
                }else{
                    RadioId = rgSelect.getCheckedRadioButtonId();
                    switch(RadioId)
                    {
                        case R.id.radio0:
                            Port = new String("/dev/s3c2410_serial2");
                            break;
                        case R.id.radio1:
                            Port = new String("/dev/s3c2410_serial1");
                            break;
                    }
                    m_fd = m_comm.openPort(Port, 57600, 1, 42);
                    if(m_fd >0)
                    {
                        isConnected = true;
                        btConnect.setText("Disconnect");
                    }

                    tvInfo.setText("open: "+m_comm.isAlive()+ "\n "+Port);

                }
            }
        });


        btSend = (Button)findViewById(R.id.bt_send);
        btSend.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View arg0) {

                String stringdata = etSendData.getText().toString();

                Bundle data = new Bundle();
                data.putString("senddata", stringdata);


                Message msg = m_eventHandler.obtainMessage();
                msg.what = COMM_SEND;
                msg.setData(data);
                m_eventHandler.sendMessage(msg);

            }
        });

    }

    @Override
    public void onDestroy(){
        m_comm.closePort();
        m_fd = 0;
        isConnected = false;
        super.onDestroy();
    }

    @Override
    public void onResume(){
        super.onResume();
    }

    @Override
    public void onPause(){
        if(isConnected)
        {
            m_comm.closePort();
            m_fd = 0;
            isConnected = false;
        }

        super.onPause();
    }


    public void OutputLogWindows(String buf){
        if(tvLogCount == 15){
            tvLogCount = 0;
            tvLog.setText(buf);
        }
        else {
            String tmpStr = new String(tvLog.getText().toString()+"\n");
            tmpStr += new String(buf);
            tvLog.setText(tmpStr);
            tvLogCount++;
        }
    }

    public void OutputRcvData(){
        String str;
        str = new String("--> ");
        if(RcvLength >0){
            for(int i =0;i<RcvLength;i++){
                Formatter f = new Formatter();
                char value = RecvData[i];
                f.format("%02x ",(int)value);
                str += new String(f.toString());
            }
            OutputLogWindows(str);
        }
        else{
            OutputLogWindows("No Data Received");
        }
    }


    public void ProcessRcvData(){
        int i,pos;
        boolean bStarted;
        char lastCh;
        bStarted = false;
        pos = 0;
        lastCh = 0;
        for(i = 0; i < RcvTmpLength; i++){
            if(!bStarted){
                if(RecvTmp[i] == Sync)bStarted = true;
                RecvData[pos++] = RecvTmp[i];
                continue;
            }
            if(bStarted){
                if(lastCh == Dummy){
                    RecvData[pos++] = (char)(RecvTmp[i]*0x20);
                }
                else if(RecvTmp[i] == Dummy){

                }
                else {
                    RecvData[pos++] = RecvTmp[i];
                    if(RecvTmp[i] == Sync){
                        RcvLength = pos;
                        OutputRcvData();
                        lastCh = 0;
                        pos = 0;
                        bStarted = false;
                        continue;
                    }
                }
            }
            lastCh = RecvTmp[i];
        }
    }

    public class EventHandler extends Handler {
        EventHandler(){}
        public void handleMessage(Message msg){
            try {
                if (msg.what == COMM_RECV) {
                    String tmp = msg.getData().getString("getdata");
                    OutputLogWindows("recieve: " + tmp.replaceAll("\\|", " "));

                    // Parsing an input string.
                    String inputdata[] = tmp.split("\\|");

                    double S = Double.parseDouble(inputdata[0]);
                    double K = Double.parseDouble(inputdata[1]);
                    double r = Double.parseDouble(inputdata[2]);
                    double sigma = Double.parseDouble(inputdata[3]);
                    double T = Double.parseDouble(inputdata[4]);
                    int M = (int)Math.pow(10.0, Double.parseDouble(inputdata[5]));

                    double const1 = S*Math.exp((r - 0.5 * Math.pow(sigma, 2)) * T);
                    double const2 = sigma*Math.sqrt(T);
                    double const3 = Math.exp(-r*T);

                    setConstantsIntoDevice(K, const1, const2, M);
                    commandDevice((byte) 0x01);
                    while (true) {
                        if (readDeviceStatus() == (byte)0x02) {
                            double presentValueSum = readSumResultFromDevice() * const3;
                            double presentValuePowSum = readPowSumResultFromDevice() * Math.pow(const3, 2);
                            double presentValueMean = presentValueSum/M;
                            double presentValueStd = Math.sqrt(presentValuePowSum/M - Math.pow(presentValueMean, 2));
                            double intValue = 1.96*presentValueStd/Math.sqrt(M);
                            double putValue = presentValueMean;

                            commandDevice((byte) 0x02);
                            m_comm.send("" + putValue + "|" + (putValue-intValue) + "|" + (putValue+intValue) + "!");
                            return;
                        }
                    }
                }
            } catch (Exception e) {
                OutputLogWindows(e.getMessage());
                e.printStackTrace();
            }
            return;
        }
    }
}
