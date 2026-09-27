using System.Collections.Generic;
namespace Covora_Tech_Store.Models
{
    public static class ProductCatalog
    {
        // Week 5 sample data. Both pages read this collection; no database as yet.
        public static IEnumerable<Product> GetProducts()
        {
            return new List<Product>
            {
                new Product {
                    Id = "CT-101", Name = "Everyday Wireless Earbuds",
                    Description = "Wireless earbuds with a compact charging case for music, calls and your daily commute.",
                    Category = "Audio", UnitPrice = 8900m, ImageUrl = "~/assets/earbuds.png", IsFeatured = true
                },
                new Product {
                    Id = "CT-102", Name = "Portable Power Bank",
                    Description = "A compact 10,000 mAh backup battery with USB charging to keep your devices ready while you are out.",
                    Category = "Power", UnitPrice = 5200m, ImageUrl = "~/assets/powerbank.png"
                },
                new Product {
                    Id = "CT-103", Name = "Adjustable Desk Lamp",
                    Description = "An LED desk lamp with an adjustable angle and three brightness settings for study or work.",
                    Category = "Workspace", UnitPrice = 6500m, ImageUrl = "~/assets/lamp.png"
                }
            };
        }
    }
}
