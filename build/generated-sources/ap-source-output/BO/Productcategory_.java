package BO;

import BO.Product;
import BO.Taxrate;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2015-02-06T14:16:30")
@StaticMetamodel(Productcategory.class)
public class Productcategory_ { 

    public static volatile SingularAttribute<Productcategory, String> productcategoryname;
    public static volatile SingularAttribute<Productcategory, Long> id;
    public static volatile SingularAttribute<Productcategory, Taxrate> taxrateidId;
    public static volatile ListAttribute<Productcategory, Product> productList;

}