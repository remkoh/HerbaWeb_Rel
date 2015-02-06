/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BO;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Temp
 */
@Entity
@Table(name = "product")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Product.findAll", query = "SELECT p FROM Product p"),
    @NamedQuery(name = "Product.findById", query = "SELECT p FROM Product p WHERE p.id = :id"),
    @NamedQuery(name = "Product.findBySku", query = "SELECT p FROM Product p WHERE p.sku = :sku"),
    @NamedQuery(name = "Product.findByProductprice", query = "SELECT p FROM Product p WHERE p.productprice = :productprice"),
    @NamedQuery(name = "Product.findByProductdescription", query = "SELECT p FROM Product p WHERE p.productdescription = :productdescription"),
    @NamedQuery(name = "Product.findByProductname", query = "SELECT p FROM Product p WHERE p.productname = :productname")})
public class Product implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Long id;
    @Size(max = 255)
    @Column(name = "SKU")
    private String sku;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "PRODUCTPRICE")
    private Double productprice;
    @Size(max = 255)
    @Column(name = "PRODUCTDESCRIPTION")
    private String productdescription;
    @Size(max = 255)
    @Column(name = "PRODUCTNAME")
    private String productname;
    @JoinColumn(name = "PRODUCTCATEGORYID_ID", referencedColumnName = "ID")
    @ManyToOne
    private Productcategory productcategoryidId;
    @JoinColumn(name = "PRODUCTLINEID_ID", referencedColumnName = "ID")
    @ManyToOne
    private Productline productlineidId;

    public Product() {
    }

    public Product(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public Double getProductprice() {
        return productprice;
    }

    public void setProductprice(Double productprice) {
        this.productprice = productprice;
    }

    public String getProductdescription() {
        return productdescription;
    }

    public void setProductdescription(String productdescription) {
        this.productdescription = productdescription;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public Productcategory getProductcategoryidId() {
        return productcategoryidId;
    }

    public void setProductcategoryidId(Productcategory productcategoryidId) {
        this.productcategoryidId = productcategoryidId;
    }

    public Productline getProductlineidId() {
        return productlineidId;
    }

    public void setProductlineidId(Productline productlineidId) {
        this.productlineidId = productlineidId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Product)) {
            return false;
        }
        Product other = (Product) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "[" + this.productcategoryidId.getProductcategoryname() + "]" + " " + this.getProductname();
    }
    
}
