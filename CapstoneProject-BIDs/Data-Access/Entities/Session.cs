﻿using System;
using System.Collections.Generic;

#nullable disable

namespace Data_Access.Entities
{
    public partial class Session
    {
        public Session()
        {
            PaymentStaffs = new HashSet<PaymentStaff>();
            PaymentUsers = new HashSet<PaymentUser>();
            SessionDetails = new HashSet<SessionDetail>();
        }

        public Guid Id { get; set; }
        public Guid ItemId { get; set; }
        public int FeeId { get; set; }
        public Guid SessionRuleId { get; set; }
        public string Name { get; set; }
        public DateTime BeginTime { get; set; }
        public TimeSpan AuctionTime { get; set; }
        public DateTime EndTime { get; set; }
        public double FinalPrice { get; set; }
        public DateTime UpdateDate { get; set; }
        public DateTime CreateDate { get; set; }
        public int Status { get; set; }

        public virtual Fee Fee { get; set; }
        public virtual Item Item { get; set; }
        public virtual SessionRule SessionRule { get; set; }
        public virtual ICollection<SessionDetail> SessionDetails { get; set; }
        public virtual ICollection<PaymentStaff> PaymentStaffs { get; set; }
        public virtual ICollection<PaymentUser> PaymentUsers { get; set; }
    }
}
