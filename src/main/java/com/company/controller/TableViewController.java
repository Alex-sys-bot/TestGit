package com.company.controller;

import com.company.dao.Dao;
import com.company.dao.impl.ProductDaoImpl;
import com.company.model.Product;
import javafx.beans.property.SimpleObjectProperty;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.collections.transformation.FilteredList;
import javafx.fxml.FXML;
import javafx.scene.control.ComboBox;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class TableViewController {

    @FXML
    private TableView<Product> tableProduct;

    @FXML
    private TableColumn<Product, String> columnName;

    @FXML
    private TableColumn<Product, Double> columnCost;

    @FXML
    private TableColumn<Product, String> columnIsActive;

    @FXML
    private TextField txtSearch;

    @FXML
    private ComboBox<String> comboIsActive;

    private Product product;

    private final ObservableList<Product> listProduct = FXCollections.observableArrayList();


    public void initialize(){
        takeDataFromDataBase();
        initTable();
        searchRealTime();
        sortByIsActivity();
    }

    private void takeDataFromDataBase(){
        SessionFactory factory = new Configuration().configure().buildSessionFactory();
        Dao<Product, Integer> productIntegerDao = new ProductDaoImpl(factory);

        listProduct.addAll(productIntegerDao.returnAll());
    }

    private void initTable(){
        tableProduct.setItems(listProduct);
        columnName.setCellValueFactory(p -> new SimpleObjectProperty<>(p.getValue().getTitle()));
        columnCost.setCellValueFactory(p -> new SimpleObjectProperty<>(p.getValue().getCost()));
        columnIsActive.setCellValueFactory(p -> {
            if (p.getValue().getIsActive() == 1){
                return new SimpleObjectProperty<>("Активен");
            } else return new SimpleObjectProperty<>("Неактивен");
        });
    }

    private void searchRealTime(){
        txtSearch.textProperty().addListener((observableValue, beforeValue, newValue) -> {
            FilteredList<Product> filteredList = new FilteredList<>(listProduct, p -> {
               if (newValue == null || newValue.isEmpty()){
                   return true;
               }

               String currentValue = newValue.toLowerCase();


               if (p.getTitle().toLowerCase().contains(currentValue)){
                   return true;
               }

                   return false;
            });
            tableProduct.setItems(filteredList);
        });
    }

    private void sortByIsActivity(){
        ObservableList<String> listIsActivity = FXCollections.observableArrayList("Активен","Неактивен");
        comboIsActive.setItems(listIsActivity);

        comboIsActive.valueProperty().addListener((obj, beforeValue, newValue) -> {
            int status = 0;

            if (comboIsActive.getValue() != null){
                if (comboIsActive.getValue().contains("Активен")){
                    status = 1;
                } else if (comboIsActive.getValue().contains("Неактивен")){
                    status = 0;
                }
            }

            int finalStatus = status;
            FilteredList<Product> filteredList = new FilteredList<>(listProduct, product -> product.getIsActive() == finalStatus);
            tableProduct.setItems(filteredList);
        });
    }
}


