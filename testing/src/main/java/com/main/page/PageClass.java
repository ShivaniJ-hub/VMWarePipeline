package com.main.page;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class PageClass {

    private final WebDriver driver;
    private final WebDriverWait wait;

    public PageClass(final WebDriver driver) {
        this.driver = driver;
        PageFactory.initElements(driver, this);
        this.wait = new WebDriverWait(driver, 30);
    }

    public void goTo() {
        //this.driver.get("http://172.31.7.80:9090/MusicStore/index.html");
        this.driver.get("https://google.com");
        //this.driver.get("http://172.27.160.1:9090/MusicStore/index.html");
        //this.driver.get("http://devopsteamgoa.westindia.cloudapp.azure.com:9090/MusicStore/index.html");
        System.out.println("Browser launched and navigated to Google");
    }

    public boolean checkTitle(String expectedTitle) {
        System.out.println(driver.getTitle().contains(expectedTitle));
        boolean x = driver.getTitle().contains(expectedTitle);
        return x;
    }

}
