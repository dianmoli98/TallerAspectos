package com.bank;


import java.util.Scanner;

public aspect AspectLogin  {
 
    pointcut login(): call (* make*()) || call(* my*());
       
    before() : login(){
    	System.out.println("before ");
    	Scanner obj = new Scanner(System.in);  // Create a Scanner object
        System.out.println("Ingrese nombre de usuario: ");
        String name = obj.nextLine();
        System.out.println("Ingrese contrasena: ");
        String contrasena = obj.nextLine();
        System.out.println("Username : "+name +" Password: "+contrasena);	     
    }
    
    
   
}