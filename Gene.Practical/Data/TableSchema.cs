using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Gene.Practical.Data
{
    /// <summary>
    /// Branch table
    /// </summary>
    public class tblBranch
    {
        /// <summary>
        /// Primary Id
        /// </summary>
        public string Id { get; set; }
        /// <summary>
        /// Branch name
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        /// Branch code
        /// </summary>
        public string Code { get; set; }
        /// <summary>
        /// Branch created date
        /// </summary>
        public DateTime Created { get; set; }
        /// <summary>
        /// User uploaded foreign key
        /// </summary>
        public string User_FK { get; set; }
    }

    /// <summary>
    /// Information logged table
    /// </summary>
    public class tblInfo
    {
        /// <summary>
        /// Primary Id
        /// </summary>
        public string Id { get; set; }
        /// <summary>
        /// Certificate number
        /// </summary>
        public string Certificate { get; set; }
        /// <summary>
        /// Information logged date
        /// </summary>
        public DateTime Created { get; set; }
        /// <summary>
        /// Branch foreign key
        /// </summary>
        public string Branch_FK { get; set; }
        /// <summary>
        /// User uploaded foreign key
        /// </summary>
        public string User_FK { get; set; }
    }

    
}
