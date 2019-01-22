using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.InteropServices;
namespace CsharpGUI
{
    public class ASMDLL
    {


        [DllImport("Project.dll")]
        public static extern void Steganography([In,Out] int[] RArray, [In,Out] int[] GArray
                                            , [In,Out] int[] BArray, [In] int len, [In] byte [] message, [In] byte [] key );

    }
}
