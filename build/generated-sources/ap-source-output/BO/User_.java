package BO;

import BO.Address;
import BO.Herbalevel;
import BO.Usersetting;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2015-02-06T14:16:30")
@StaticMetamodel(User.class)
public class User_ { 

    public static volatile SingularAttribute<User, String> firstname;
    public static volatile SingularAttribute<User, String> herbaccount;
    public static volatile SingularAttribute<User, String> password;
    public static volatile SingularAttribute<User, Long> id;
    public static volatile SingularAttribute<User, Address> addressidId;
    public static volatile SingularAttribute<User, Usersetting> usersettingidId;
    public static volatile SingularAttribute<User, String> email;
    public static volatile SingularAttribute<User, Herbalevel> herbalevelidId;
    public static volatile SingularAttribute<User, String> lastname;

}