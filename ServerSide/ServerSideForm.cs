using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ServerSide
{
    public partial class ServerSideForm : Form
    {
        IPEndPoint serverIP;
        Socket serverSocket;
        Socket receiverSocket;
        bool secondClick = false;

        public ServerSideForm()
        {
            InitializeComponent();
        }

        public void IntializeIPEndPoint()
        {
            this.serverIP = new IPEndPoint(IPAddress.Parse("127.0.0.1"), 8005);
        }
        public void IntializeServerSocket()
        {
            this.serverSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            this.serverSocket.Bind(serverIP);
            this.serverSocket.Listen(5);
            this.receiverSocket = serverSocket.Accept();
        }

        public byte[] GetData()
        {
            byte[] temp = new byte[1000];
            int count = this.receiverSocket.Receive(temp);
            return temp;
        }

        public void UpdateMessage(byte[] decryptedMessage)
        {
            messageTextBox.Text = byteArrayToHexString(decryptedMessage);
        }
        /// <summary>
        /// Decrypt the cipher text received from client side using your assembly DLL
        /// </summary>
        /// <param name="cipherText"></param>
        /// <returns></returns>
        public byte[] DecryptMessage(byte[] cipherText, byte[] key)
        {
            ASMDLL.Decrypt(cipherText, key, 16);
            return cipherText; //plainText.
        }

        private void btnStartServer_Click(object sender, EventArgs e)
        {
            
            this.IntializeIPEndPoint();
            this.IntializeServerSocket();
            
            this.CloseServerSocket();
        }


        private void CloseServerSocket()
        {
            this.serverSocket.Close();
        }

        public static string byteArrayToHexString(byte[] ba)
        {
            StringBuilder hex = new StringBuilder(ba.Length * 2);
            foreach(byte b in ba)
            {
                hex.AppendFormat("{0:x2}", b);
            }
            return hex.ToString();
                    
        }
        byte[] cipherText = new byte[16];
        byte[] key = new byte[16];
       // string myIn = "3925841D02DC09FBDC118597196A0B32";
        //string keyIN = "2B7E151628AED2A6ABF7158809CF4F3C";
        private void button1_Click(object sender, EventArgs e)
        {

            byte[] allData = this.GetData();


            Array.Copy(allData, 0, cipherText, 0, 16);
            Array.Copy(allData, 16, key, 0, 16);
            this.UpdateMessage((cipherText));

            byte[] plainText = new byte[16];
            // DecryptMessage(StringToByteArray(myIn),StringToByteArray(keyIN));

        }

        public static byte[] StringToByteArray(string hex)
        {
            return Enumerable.Range(0, hex.Length)
                             .Where(x => x % 2 == 0)
                             .Select(x => Convert.ToByte(hex.Substring(x, 2), 16))
                             .ToArray();
        }
        private void button2_Click(object sender, EventArgs e)
        {
            byte[] plainText = new byte[16];
            plainText = DecryptMessage(cipherText, key);
            this.UpdateMessage(plainText);
        }
    }
}
