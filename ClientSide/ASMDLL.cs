using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.InteropServices;

namespace ClientSide
{
    class ASMDLL
    {
        [DllImport("Project.dll")]
        public static extern void Encrypt([In, Out] byte[] text, [In, Out] byte[] key, [In, Out] int length);
    }
}
