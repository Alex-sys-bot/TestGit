package com.company;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;


public class ProgramStart extends Application {
    public static void main(String[] args) {
        launch(args);
    }

    @Override
    public void start(Stage stage) throws Exception {
        Parent parent = FXMLLoader.load(getClass().getResource("/view/tableView.fxml"));
        stage.setTitle("Салон красоты Бровушка");
//        stage.getIcons().add(new Image(getClass().getResourceAsStream()));
        stage.setScene(new Scene(parent));
        stage.show();
    }
}
