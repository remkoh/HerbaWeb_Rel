package BO;

import BO.Address;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2015-02-06T14:16:30")
@StaticMetamodel(Domicile.class)
public class Domicile_ { 

    public static volatile SingularAttribute<Domicile, String> country;
    public static volatile SingularAttribute<Domicile, String> city;
    public static volatile SingularAttribute<Domicile, String> postalcode;
    public static volatile ListAttribute<Domicile, Address> addressList;
    public static volatile SingularAttribute<Domicile, Long> id;

}