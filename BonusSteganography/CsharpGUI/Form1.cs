using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Runtime.InteropServices;


namespace CsharpGUI
{
    public partial class Form1 : Form
    {

        public Bitmap steganographyImage { get; set; }

        public ImageBuffers BuffersFirstImage
        {
            get
            {
                if (this.inputImage_pictureBox != null && this.inputImage_pictureBox.Image != null && steganographyImage != null)
                {
                    return ImageHelper.GetBuffersFromImage(this.steganographyImage);
                }
                return null;
            }
        }

     


        public Form1()
        {
            InitializeComponent();
        }

 
        private void openImageToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Stream myStream = null;
            OpenFileDialog openFileDialog1 = new OpenFileDialog();
            openFileDialog1.InitialDirectory = "c:\\Libraries\\Pictures";
            openFileDialog1.Filter = "*.BMP;*.PPM;*.JPG;*.GIF)|*.BMP;*.JPG;*.GIF|All files (*.*)|*.*";
            openFileDialog1.FilterIndex = 2;
            openFileDialog1.RestoreDirectory = true;
            string fname = "";
            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                try
                {
                    if ((myStream = openFileDialog1.OpenFile()) != null)
                    {
                        string ext = Path.GetExtension(openFileDialog1.FileName);
                        fname = openFileDialog1.FileName;
                        using (myStream)
                        {
                            this.steganographyImage = new Bitmap(myStream);
                            this.inputImage_pictureBox.Image = this.steganographyImage;
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: Could not read file from disk. Original error: " + ex.Message);
                }
            }
        }

        public static byte[] StringToByteArray(string hex)
        {
            return Enumerable.Range(0, hex.Length)
                             .Where(x => x % 2 == 0)
                             .Select(x => Convert.ToByte(hex.Substring(x, 2), 16))
                             .ToArray();
        }

        private void steganographybutton1_Click(object sender, EventArgs e)
        {
            //Get first image buffers
            var steganoImage = BuffersFirstImage;
            byte[] text = StringToByteArray(msgTxtBox.Text);
            byte[] key = StringToByteArray(keyTxtBox.Text);

            //Output channels intialization
            int width = steganoImage.Width;
            int height = steganoImage.Height;
            int imageSize = width * height;

            

            //Call add function from DLL for red channel
            ASMDLL.Steganography(steganoImage.R, steganoImage.B, steganoImage.G, imageSize,text,key);

          
            //Refelct the result to the GUI
            //1. Convert the output channels into bitmap
            var outputBuffersObject = ImageHelper.CreateNewImageBuffersObject(steganoImage.R, steganoImage.G, steganoImage.B, width, height);
            this.outputImage_pictureBox.Image = (Bitmap)ImageHelper.GetImageFromBuffers(outputBuffersObject).BitmapObject;
        }

      
    }
}
