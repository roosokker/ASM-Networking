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
using System.Linq;

namespace ServerSide
{
    public partial class ServerSideForm : Form
    {
        IPEndPoint serverIP;
        Socket serverSocket;
        Socket receiverSocket;

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
            messageTextBox.Text = Encoding.ASCII.GetString(decryptedMessage, 0, decryptedMessage.Length);
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
            byte[] allData = this.GetData();
            byte[] cipherText = new byte[16];
            byte[] key = new byte[16];
            Array.Copy(allData, 0, cipherText, 0, 16);
            Array.Copy(allData, 16, key, 0, 16);
            byte[] plainText = DecryptMessage(cipherText, key);
            this.UpdateMessage(plainText);
            this.CloseServerSocket();
        }

        private void CloseServerSocket()
        {
            this.serverSocket.Close();
        }

        private void ServerSideForm_Load(object sender, EventArgs e)
        {

        }
    }
}
