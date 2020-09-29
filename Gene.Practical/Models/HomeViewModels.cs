using Gene.Practical.Data;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Gene.Practical.Models
{
    public class InfoViewModel
    {
        [Required]
        public string Certificate { get; set; }

        [Required]
        [Display(Name ="Branch")]
        public string Branch_FK { get; set; }

        [Required]
        [Display(Name = "Username")]
        public string Username { get; set; }

        [Required]
        [Display(Name = "User Id")]
        public string User_FK { get; set; }
    }

    public class BrancViewModel
    {
        [Required]
        public string Branch { get; set; }

        [Required]
        public string Code { get; set; }

        [Required]
        public string Username { get; set; }

        [Required]
        [Display(Name = "User Id")]
        public string User_FK { get; set; }
    }

    public class InformationViewModel : tblInfo
    {
        [Display(Name = "Logged By")]
        public string Username { get; set; }
        public string Branch { get; set; }
        public string Code { get; set; }
    }

    public class BranchViewModel : tblBranch
    {
        [Display(Name = "Logged By")]
        public string Username { get; set; }
    }
}
