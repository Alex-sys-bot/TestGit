package com.company.controller;

import com.company.dao.Dao;
import com.company.dao.impl.ProductDaoImpl;
import com.company.model.Product;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.collections.transformation.FilteredList;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.ScrollPane;
import javafx.scene.control.TextField;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.TilePane;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.io.IOException;

public class MainWindowController {
    @FXML
    private BorderPane borderPane;

    @FXML
    private ScrollPane scrollPane;

    @FXML
    private TilePane tilePane;

    @FXML
    private TextField txtSearch;

    private MyListener myListener;

    private final ObservableList<Product> listProduct = FXCollections.observableArrayList();

    @FXML
    public void initialize() throws IOException {
        takeDataFromDataBase();
        search();
        fullWindow();
        generatedTiles(listProduct);
        rubberWindow();
    }

    private void takeDataFromDataBase(){
        SessionFactory factory = new Configuration().configure().buildSessionFactory();

        Dao<Product, Integer> productIntegerDao = new ProductDaoImpl(factory);
        listProduct.addAll(productIntegerDao.returnAll());
    }

    private void generatedTiles(ObservableList<Product> listProduct) throws IOException {
        tilePane.getChildren().clear();

        tilePane.setPadding(new Insets(15));
        tilePane.setVgap(25);
        tilePane.setHgap(50);

        for (Product product: listProduct) {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/view/tileWindow.fxml"));
            VBox vBox = loader.load();
            TileWindowController tileWindowController = loader.getController();

            tileWindowController.setData(product, myListener);
            tilePane.getChildren().add(vBox);
        }
    }

    private void fullWindow() throws IOException {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/view/fullInfoWindow.fxml"));
        AnchorPane anchorPane = loader.load();
        FullInfoWindowController fullInfoWindowController = loader.getController();

        Stage stage = new Stage();
        stage.setTitle("Тест доп окна");
        stage.setScene(new Scene(anchorPane));

        myListener = new MyListener() {
            @Override
            public void mouseClicked(Product product) {
                stage.show();
            }
        };
    }

    private void search(){
        ObservableList<Product> list = FXCollections.observableArrayList();
        txtSearch.setOnKeyReleased(keyEvent -> {
            list.clear();

                for (Product product : listProduct) {
                    if (product.getTitle().toLowerCase().contains(txtSearch.getText().toLowerCase())) {
                        list.addAll(product);
                    }
                }

            try {
                generatedTiles(list);
            } catch (IOException e) {
                e.printStackTrace();
            }
        });
    }

    private void rubberWindow(){
            scrollPane.widthProperty().addListener((obj, oldValue, newValue) -> {
                tilePane.setPrefWidth(newValue.doubleValue());
            });
    }
}
