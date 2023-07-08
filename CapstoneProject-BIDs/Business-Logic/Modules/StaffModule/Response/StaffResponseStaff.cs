﻿using Common.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business_Logic.Modules.StaffModule.Response
{
    public class StaffResponseStaff
    {
        public string StaffName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public DTODateTime DateOfBirth { get; set; }
        public DTODateTime CreateDate { get; set; }
        public DTODateTime UpdateDate { get; set; }

    }
}
