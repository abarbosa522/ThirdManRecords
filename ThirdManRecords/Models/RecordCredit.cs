namespace ThirdManRecords.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class RecordCredit
    {
        [Key]
        [StringLength(255)]
        public string code { get; set; }

        [Required]
        [StringLength(255)]
        public string record { get; set; }

        [Required]
        [StringLength(255)]
        public string artist { get; set; }

        [Required]
        [StringLength(255)]
        public string role { get; set; }

        public virtual Artist artist1 { get; set; }

        public virtual Record record1 { get; set; }
    }
}
