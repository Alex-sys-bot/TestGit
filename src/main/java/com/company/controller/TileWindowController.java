package com.company.controller;

import com.company.model.Product;
import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.VBox;

public class TileWindowController {
    @FXML
    private ImageView imageProduct;

    @FXML
    private Label lblTitle;

    @FXML
    private Label lblCost;

    @FXML
    private Label lblIsActive;

    @FXML
    private VBox vbox;

    private Product product;

    private MyListener myListener;

    public void click(){
        myListener.mouseClicked(product);
    }

    public void setData(Product product, MyListener myListener){
        this.product = product;
        this.myListener = myListener;
        if (product.getIsActive() == 0) {
            lblIsActive.setText("Неактивен");
            vbox.setStyle("-fx-background-color: grey");
        } else lblIsActive.setText("Актвиен");


        lblCost.setText(product.getCost() + " Руб.");
        lblTitle.setText(product.getTitle());
        imageProduct.setImage(new Image(product.getMainImagePath()));

        vbox.hoverProperty().addListener((observableValue, aBoolean, t1) -> {
            if (t1){
                vbox.setStyle("-fx-background-radius: grey");
            } else {
                if (product.getIsActive() == 0){
                    vbox.setStyle("-fx-background-color: grey");
                } else vbox.setStyle("-fx-background-color: rgb(225,228,255)");
            };
        });
    }
}
