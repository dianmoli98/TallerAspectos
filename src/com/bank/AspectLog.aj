package com.bank;

import java.io.File;
import java.util.Calendar;

public aspect AspectLog  {
 
    
    File file = new File("log.txt");
    Calendar cal = Calendar.getInstance();
    pointcut success(): call(* Bank.createUser());
    pointcut transaccion(): call (* Bank.makeTransaction());
    pointcut dinero(): call (* Bank.myMoney());
    after() : success() {
    	System.out.println("**** User created ****");
    	
    }
    after() : transaccion(){
    	System.out.println("TRANSACION REALIZADA"+cal.getTime());
    }
    after() : dinero(){
    	System.out.println("Dinero retirado "+cal.getTime());
    }
   
}