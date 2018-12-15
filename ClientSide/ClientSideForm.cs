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
namespace ClientSide
{
    public partial class clientSideForm : Form
    {
        IPEndPoint serverIP;
        Socket clientSocket;
        public clientSideForm()
        {
            InitializeComponent();
        }
        public void IntializeIPEndPoint()
        {
            this.serverIP = new IPEndPoint(IPAddress.Parse("127.0.0.1"), 8005);
        }
        public void IntializeClientSocket()
        {
            clientSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            clientSocket.Connect(serverIP);
        }

        public void SendMessage(byte[] encryptedMessage)
        {
            clientSocket.Send(encryptedMessage);
        }

        /// <summary>
        /// Encrypt the string using Assembly DLL
        /// </summary>
        /// <param name="message"></param>
        /// <returns></returns>
        public byte[] EncryptMessage(string message, string key)
        {
            throw new NotImplementedException();
        }
        private void SendBtn_Click(object sender, EventArgs e)
        {
            this.IntializeIPEndPoint();
            this.IntializeClientSocket();
            string key = keyTextBox.Text;
            byte[] encryptedMessage = this.EncryptMessage(messageTxtBox.Text, key);
            this.clientSocket.Send(encryptedMessage.Concat(ASCIIEncoding.ASCII.GetBytes(key)).ToArray());
            this.CloseClientSocket();
        }

        public void CloseClientSocket()
        {
            this.clientSocket.Close();
        }
    }
}
