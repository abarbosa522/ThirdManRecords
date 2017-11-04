namespace ThirdManRecords.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class RecordEdition
    {
        [Key]
        [StringLength(255)]
        public string code { get; set; }

        [Required]
        [StringLength(255)]
        public string record { get; set; }

        [Required]
        [StringLength(255)]
        public string edition { get; set; }

        [Required]
        [StringLength(255)]
        public string quantity { get; set; }

        [Required]
        [StringLength(255)]
        public string picture { get; set; }

        public virtual Record record1 { get; set; }
    }
}
