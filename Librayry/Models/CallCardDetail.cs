//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Librayry.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class CallCardDetail
    {
        public int CallCardDetailId { get; set; }
        public System.DateTime PaymentAppointmentDate { get; set; }
        public System.DateTime PaymentDate { get; set; }
        public int CallCardId { get; set; }
        public string BookId { get; set; }
        public string Status { get; set; }
    
        public virtual Book Book { get; set; }
        public virtual CallCard CallCard { get; set; }
    }
}
