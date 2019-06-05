package com.bank;


import java.util.Scanner;

public aspect AspectLogin  {
 
    pointcut login(): call (* make*()) || call(* my*());
       
    before() : login(){
    	Scanner obj = new Scanner(System.in);  // Create a Scanner object
        System.out.println("Ingrese nombre de usuario: ");
        String name = obj.nextLine();
             
    }
    
    
   
}