package BO;

import BO.Customer;
import BO.Domicile;
import BO.User;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2015-02-06T14:16:30")
@StaticMetamodel(Address.class)
public class Address_ { 

    public static volatile SingularAttribute<Address, String> number;
    public static volatile SingularAttribute<Address, Domicile> woonplaatsidId;
    public static volatile ListAttribute<Address, User> userList;
    public static volatile SingularAttribute<Address, String> street;
    public static volatile ListAttribute<Address, Customer> customerList;
    public static volatile SingularAttribute<Address, Long> id;

}