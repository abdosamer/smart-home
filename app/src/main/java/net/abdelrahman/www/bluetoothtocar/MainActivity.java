package net.abdelrahman.www.bluetoothtocar;

import android.annotation.SuppressLint;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Button;
import android.widget.Switch;
import android.widget.Toast;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Set;
import java.util.UUID;

public class MainActivity extends AppCompatActivity {
    private final String DEVICE_ADDRESS = "C0:F8:DA:E8:8C:49"; //MAC Address of Bluetooth Module
    private final UUID PORT_UUID = UUID.fromString("00001101-0000-1000-8000-00805f9b34fb");

    private BluetoothDevice device;
    private BluetoothSocket socket;
    private OutputStream outputStream;
    private Switch SwitchMainDoor,SwitchGarageDoor,SwitchRoomOne,SwitchRoomTwo,SwitchRoomThree,SwitchGarageLight;
    private Button bluetooth_connect_btn,reset_button;
    String command; //string variable that will store value to be transmitted to the bluetooth module
    char com;
    @SuppressLint("ClickableViewAccessibility")
    @Override
    protected void onCreate(Bundle savedInstanceState) { // this method called after the app run
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        SwitchRoomOne    = (Switch) findViewById(R.id.switch_room_one);//finding the spacific button in the layout
        SwitchRoomTwo    = (Switch) findViewById(R.id.switch_room_two);
        SwitchRoomThree  = (Switch) findViewById(R.id.switch_room_three);
        SwitchGarageLight   = (Switch) findViewById(R.id.switch_Garage_light);
        SwitchMainDoor   = (Switch) findViewById(R.id.switch_main_door);
        SwitchGarageDoor = (Switch) findViewById(R.id.switch_garage_door);
        bluetooth_connect_btn = (Button) findViewById(R.id.bluetooth_connect_btn);
        reset_button = (Button) findViewById(R.id.reset_button);


        SwitchRoomOne.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                command = "1";
                try
                {
                    outputStream.write(command.getBytes()); //transmits the value of command to the bluetooth module
                }
                catch (IOException e)
                {
                    e.printStackTrace();
                }
            }
        });
        SwitchRoomTwo.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                command = "2";
                try
                {
                    outputStream.write(command.getBytes()); //transmits the value of command to the bluetooth module
                }
                catch (IOException e)
                {
                    e.printStackTrace();
                }
            }
        });
        SwitchRoomThree.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                command = "3";
                try
                {
                    outputStream.write(command.getBytes()); //transmits the value of command to the bluetooth module
                }
                catch (IOException e)
                {
                    e.printStackTrace();
                }
            }
        });
        SwitchGarageLight.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                command = "4";
                try
                {
                    outputStream.write(command.getBytes()); //transmits the value of command to the bluetooth module
                }
                catch (IOException e)
                {
                    e.printStackTrace();
                }
            }
        });

        SwitchMainDoor.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                command = "5";
                try
                {
                    outputStream.write(command.getBytes()); //transmits the value of command to the bluetooth module
                }
                catch (IOException e)
                {
                    e.printStackTrace();
                }
            }
        });

        SwitchGarageDoor.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                command = "6";
                try
                {
                    outputStream.write(command.getBytes()); //transmits the value of command to the bluetooth module
                }
                catch (IOException e)
                {
                    e.printStackTrace();
                }
            }
        });
    //to restart the hole System
        reset_button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                command = "7";
                try
                {
                    outputStream.write(command.getBytes()); //transmits the value of command to the bluetooth module
                }
                catch (IOException e)
                {
                    e.printStackTrace();
                }
            }
        });

        //Button that connects the device to the bluetooth module when pressed
        bluetooth_connect_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {


                if(BTinit())
                {
                    BTconnect();
                }

            }
        });


    }

    //Initializes bluetooth module
    public boolean BTinit()
    {
        boolean found = false;

        BluetoothAdapter bluetoothAdapter = BluetoothAdapter.getDefaultAdapter();

        if(bluetoothAdapter == null) //Checks if the device supports bluetooth
        {
            Toast.makeText(getApplicationContext(), "Device doesn't support bluetooth", Toast.LENGTH_SHORT).show();
        }

        if(!bluetoothAdapter.isEnabled()) //Checks if bluetooth is enabled. If not, the program will ask permission from the user to enable it
        {
            Intent enableAdapter = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
            startActivityForResult(enableAdapter,0);

            try
            {
                Thread.sleep(1000);
            }
            catch(InterruptedException e)
            {
                e.printStackTrace();
            }
        }

        Set<BluetoothDevice> bondedDevices = bluetoothAdapter.getBondedDevices();

        if(bondedDevices.isEmpty()) //Checks for paired bluetooth devices
        {
            Toast.makeText(getApplicationContext(), "Please pair the device first", Toast.LENGTH_SHORT).show();
        }
        else
        {
            for(BluetoothDevice iterator : bondedDevices)
            {
                if(iterator.getAddress().equals(DEVICE_ADDRESS))
                {
                    device = iterator;
                    found = true;
                    break;
                }
            }
        }

        return found;
    }

    public boolean BTconnect()
    {
        boolean connected = true;

        try
        {
            socket = device.createRfcommSocketToServiceRecord(PORT_UUID); //Creates a socket to handle the outgoing connection
            socket.connect();

            Toast.makeText(getApplicationContext(),
                    "Connection to bluetooth device successful", Toast.LENGTH_LONG).show();
        }
        catch(IOException e)
        {
            e.printStackTrace();
            connected = false;
        }

        if(connected)
        {
            try
            {
                outputStream = socket.getOutputStream(); //gets the output stream of the socket
            }
            catch(IOException e)
            {
                e.printStackTrace();
            }
        }

        return connected;
    }

    @Override
    protected void onStart()
    {
        super.onStart();
    }

}