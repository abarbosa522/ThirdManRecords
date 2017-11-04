namespace ThirdManRecords.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class BandMember
    {
        [Key]
        [StringLength(255)]
        public string code { get; set; }

        [Required]
        [StringLength(255)]
        public string band { get; set; }

        [Required]
        [StringLength(255)]
        public string member { get; set; }

        [Required]
        [StringLength(255)]
        public string role { get; set; }

        public virtual Artist artist { get; set; }

        public virtual Artist artist1 { get; set; }
    }
}
