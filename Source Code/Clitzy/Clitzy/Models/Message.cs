//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Clitzy.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Message
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Body { get; set; }
        public System.DateTime DateCreation { get; set; }
        public int CustomerId { get; set; }
        public int VendorId { get; set; }
        public bool Status { get; set; }
    
        public virtual Account Account { get; set; }
        public virtual Vendor Vendor { get; set; }
    }
}
