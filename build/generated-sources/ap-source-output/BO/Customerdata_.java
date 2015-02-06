package BO;

import BO.Customer;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2015-02-06T14:16:30")
@StaticMetamodel(Customerdata.class)
public class Customerdata_ { 

    public static volatile SingularAttribute<Customerdata, Integer> metabolicage;
    public static volatile SingularAttribute<Customerdata, Float> waterpercentage;
    public static volatile SingularAttribute<Customerdata, Float> fattymass;
    public static volatile SingularAttribute<Customerdata, Float> bonemass;
    public static volatile SingularAttribute<Customerdata, Float> weight;
    public static volatile SingularAttribute<Customerdata, Date> weighingdate;
    public static volatile ListAttribute<Customerdata, Customer> customerList;
    public static volatile SingularAttribute<Customerdata, Long> id;
    public static volatile SingularAttribute<Customerdata, Integer> ckalrest;
    public static volatile SingularAttribute<Customerdata, Float> musclemass;
    public static volatile SingularAttribute<Customerdata, Float> visceralfat;
    public static volatile SingularAttribute<Customerdata, Float> bmi;

}