#include <TimerOne.h>
double T, xung;
double vitri, vitridat;
double tocdo, tocdodat;
double E, E1, E2;
double a, b, g, kp, ki, kd;
double Output, LastOutput;
bool mode = false;
String strArr[6];


void setup()
{
    pinMode(2, INPUT_PULLUP);
    pinMode(8, INPUT_PULLUP);
    pinMode(5, OUTPUT);
    pinMode(10, OUTPUT);
    pinMode(11, OUTPUT);
    vitridat = 90; vitri = 0;
    tocdodat = 100; tocdo = 0;
    E = 0; E1 = 0; E2 = 0;
    Output = 0; LastOutput = 0;
    T = 0.01; // thoi gian lay mau
    kp = 4.9; ki = 10; kd = 0.16;
    Serial.begin(9600);
    attachInterrupt(0, demxung, FALLING);
    Timer1.initialize(10000);


    if (mode == false)
    { Timer1.attachInterrupt(pid_vitri); }
    if (mode == true)
    { Timer1.attachInterrupt(pid_vantoc); }
}

void loop()
{
    for (int i = 0; i < 10; i++)
        delay(1);
    SendData();
    ReceiveData();
}

void demxung()
{
    if (digitalRead(8) == LOW)
        xung++;
    else
        xung--;
}

void pid_vitri()
{
    vitri = ((xung * 360) / 223);
    E = vitridat - vitri;
    a = 2 * T * kp + ki * T * T + 2 * kd;
    b = ki * T * T - 4 * kd - 2 * T * kp;
    g = 2 * kd;
    Output = (a * E + b * E1 + g * E2 + 2 * T * LastOutput) / (2 * T);
    LastOutput = Output;
    E2 = E1;
    E1 = E;
    if (Output > 255)
        Output = 255;
    if (Output < -255)
        Output = -255;
    if (Output > 0)
    {
        analogWrite(5, Output);
        digitalWrite(10, HIGH);
        digitalWrite(11, LOW);
    }
    else if (Output < 0)
    {
        analogWrite(5, abs(Output));
        digitalWrite(10, LOW);
        digitalWrite(11, HIGH);
    }
    else
    {
        analogWrite(5, 0);
        digitalWrite(10, LOW);
        digitalWrite(11, LOW);
    }
}


void pid_vantoc()
{
    tocdo = (xung / 223) * (1 / T) * 60;
    xung = 0;
    E = tocdodat - tocdo;
    a = 2 * T * kp + ki * T * T + 2 * kd;
    b = ki * T * T - 4 * kd - 2 * T * kp;
    g = 2 * kd;
    Output = (a * E + b * E1 + g * E2 + 2 * T * LastOutput) / (2 * T);
    LastOutput = Output;
    E2 = E1;
    E1 = E;
    if (Output > 255)
        Output = 255;
    if (Output < 0)
        Output = 0;
    if (Output > 0)
    {
        analogWrite(5, Output);
        digitalWrite(10, HIGH);
        digitalWrite(11, LOW);
    }
    else
    {
        analogWrite(5, 0);
        digitalWrite(10, LOW);
        digitalWrite(11, LOW);
    }
}

void SendData()
{
    Serial.println(String(vitri) + "|" + String(tocdo));
}

void ReceiveData()
{
    String rxString = "";
    while (Serial.available())
    {
        delay(2);
        char ch = Serial.read();
        rxString += ch;

    }
    int stringStart = 0;
    int arrayIndex = 0;
    for (int i = 0; i < rxString.length(); i++)
    {

        if (rxString.charAt(i) == '|')
        {

            strArr[arrayIndex] = "";

            strArr[arrayIndex] = rxString.substring(stringStart, i);

            stringStart = (i + 1);
            arrayIndex++;
        }
    }

    if (strArr[0].tolower() == "true")
        mode = true;
    else(strArr[0].tolower() == "false")
        mode = false;
    
    vitridat = strArr[1].toDouble();
    tocdodat = strArr[2].toDouble();
    kp = strArr[3].toDouble();
    ki = strArr[4].toDouble();
    kd = strArr[5].toDouble();




}