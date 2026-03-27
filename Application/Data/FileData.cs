using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmailApplication.Data {
    public class FileData {
        public int FileID { get; set; }
        public string FileLocation { get; set; }
        public int Size { get; set; }
        public DateTime DateUploaded { get; set; }
        public int ReferenceCount { get; set; }
    }
}
