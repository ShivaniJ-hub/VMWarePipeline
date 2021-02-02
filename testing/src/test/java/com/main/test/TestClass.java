package com.main.test;
import org.testng.annotations.BeforeSuite;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Parameters;
import org.testng.Assert;
import org.testng.annotations.Test;
import java.net.MalformedURLException;
import java.net.URL;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import com.main.page.PageClass;
import com.google.common.util.concurrent.Uninterruptibles;
import java.util.concurrent.TimeUnit;
public class TestClass {

    private WebDriver driver;
    private PageClass google;
    @BeforeSuite
    public void initialDelay(){
        //intentionally added this as chrome/firefox containers take few ms to register
        //to hub - test fails saying hub does not have node!!
        //very rare
        Uninterruptibles.sleepUninterruptibly(2, TimeUnit.SECONDS);
        
    }

    @BeforeTest
    public void setUp() throws MalformedURLException { 
	System.out.println("before test"); 
	DesiredCapabilities capabilities = DesiredCapabilities.chrome();
	ChromeOptions options = new ChromeOptions();
	options.addArguments("headless");
	capabilities.setCapability(ChromeOptions.CAPABILITY, options);
	driver = new RemoteWebDriver(new URL("http://localhost:4444/wd/hub"), capabilities);
        driver.manage().window().maximize();
        google = new PageClass(driver);
    }

    @Test
    public void googleTest() {
        google.goTo();
        Assert.assertTrue(google.checkTitle("Google"));
	//Assert.assertTrue(google.checkTitle("Player"));
    }
    
    @AfterTest
    public void tearDown() throws InterruptedException {
        driver.quit();
    }   

}
