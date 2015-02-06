package BO;

import BO.User;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2015-02-06T14:16:30")
@StaticMetamodel(Usersetting.class)
public class Usersetting_ { 

    public static volatile ListAttribute<Usersetting, User> userList;
    public static volatile SingularAttribute<Usersetting, Boolean> isadmin;
    public static volatile SingularAttribute<Usersetting, Boolean> ismailverified;
    public static volatile SingularAttribute<Usersetting, Boolean> islocked;
    public static volatile SingularAttribute<Usersetting, String> levelName;
    public static volatile SingularAttribute<Usersetting, Long> id;
    public static volatile SingularAttribute<Usersetting, Boolean> ismember;

}