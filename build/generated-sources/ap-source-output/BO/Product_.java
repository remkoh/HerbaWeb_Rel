package BO;

import BO.Productcategory;
import BO.Productline;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2015-02-06T14:16:30")
@StaticMetamodel(Product.class)
public class Product_ { 

    public static volatile SingularAttribute<Product, Productline> productlineidId;
    public static volatile SingularAttribute<Product, Productcategory> productcategoryidId;
    public static volatile SingularAttribute<Product, String> productdescription;
    public static volatile SingularAttribute<Product, String> productname;
    public static volatile SingularAttribute<Product, Long> id;
    public static volatile SingularAttribute<Product, String> sku;
    public static volatile SingularAttribute<Product, Double> productprice;

}