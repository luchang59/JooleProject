//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace JooleDAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class Product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Product()
        {
            this.PropertyValues = new HashSet<PropertyValue>();
        }
    
        public int Product_ID { get; set; }
        public Nullable<int> SubCategory_ID { get; set; }
        public string Product_Name { get; set; }
        public string Product_Image { get; set; }
        public string Series { get; set; }
        public string Model { get; set; }
        public string Model_Year { get; set; }
        public string Series_Info { get; set; }
    
        public virtual SubCategory SubCategory { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PropertyValue> PropertyValues { get; set; }
    }
}
