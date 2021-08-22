/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Lehait
 */
public class Category {
    private int id_cat;
    private String name_cat;
    private String describe;

    public Category() {
    }

    public Category(int id_cat, String name_cat, String describe) {
        this.id_cat = id_cat;
        this.name_cat = name_cat;
        this.describe = describe;
    }

    public int getId_cat() {
        return id_cat;
    }

    public void setId_cat(int id_cat) {
        this.id_cat = id_cat;
    }

    public String getName_cat() {
        return name_cat;
    }

    public void setName_cat(String name_cat) {
        this.name_cat = name_cat;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    @Override
    public String toString() {
        return "Category{" + "id_cat=" + id_cat + ", name_cat=" + name_cat + ", describe=" + describe + '}';
    }
       
}
