package com.JavaComm;

import android.os.Bundle;
import android.os.Message;

import java.util.Date;

import esd2015.montecarlo.team6.MainActivity.EventHandler;

public class JavaComm extends Thread
{
	static { System.loadLibrary("JavaComm");}
	
	private native int open(String strDevPath, String strBaud, int vtime, int vmin);
	private native int close(int nFd);
	private native String read(int nFd, int mMaxReadBytes);
	private native int write(int nFd, String strSend, int nSendBytes);
	private native int isInput(int nFd);
	private native int readbin(int nFd, char data[], int nMaxReadBytes);
	private native int writebin(int nFd, char data[], int length);
	
	int COMM_RECV=102;
	
	Date			m_time_set;
	EventHandler 	m_eventHandler;
	int				m_lengthBuf;
	int 			m_fd;
	String 		m_readBuf;
	char			data[];
	int				length;
	boolean		read_complete;
	
	public JavaComm(EventHandler eventHandler, int lengthBuf)
	{
		m_eventHandler = eventHandler;
		m_lengthBuf	= lengthBuf;
		m_time_set		= new Date();
		m_fd			=0;
		m_readBuf		=new String("");
		read_complete = true;
		return;
		
	}
	
	public int openPort(String strDevPath, int nBaudRate, int vtime, int vmin){
			if(m_fd!=0) return 0;
			
			m_fd = open(strDevPath, String.valueOf(nBaudRate), vtime, vmin);
			
			return m_fd;
	}
	
	public int closePort()
	{
			if(m_fd==0) return 0;
			
			close(m_fd);
			m_fd = 0;
			
			return 1;
	}
	
	public void run()
	{

		try
		{
			while(true){
				if((m_fd > 0) )
				{
					String recv = read(m_fd,32);

					{ 
						Bundle data = new Bundle();
						data.putString("getdata", recv);		
						read_complete = false;
						
						Message msg = m_eventHandler.obtainMessage();
						msg.setData(data);
						msg.what = COMM_RECV;
						m_eventHandler.sendMessage(msg);
					}
					
				}
				Thread.sleep(1);
			}
		}
		catch(Exception e){
			System.out.println(e);
		}
		
	}
	
	
	public String recv()
	{
		String tmp;
		
		tmp = new String(m_readBuf);
		m_readBuf = "";
		read_complete = true;
		return tmp;
	}
	
	public int send(String strBuf)
	{
		if(m_fd == 0) return 0;
		return write(m_fd, strBuf, strBuf.length());
	}
	
	public int recvbin(char buf[])
	{
		int i;
		
		for(i=0; i<length; i++)
		{
			buf[i]	= data[i];
		}
		read_complete = true;
		return length;
	}
	
	
	public int sendbin(char buf[], int len)
	{
		if(m_fd == 0) return 0;
		
		return writebin(m_fd, buf, len);
	}
	
	
}
