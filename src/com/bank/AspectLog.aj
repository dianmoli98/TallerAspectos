package com.bank;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

public aspect AspectLog  {
 
    
    File file = new File("log.txt");
    BufferedWriter bw;
    FileWriter fw = null;
    Calendar cal = Calendar.getInstance();
    pointcut success(): call(* Bank.createUser());
    pointcut transaccion(): call (* Bank.makeTransaction());
    pointcut dinero(): call (* Bank.myMoney());
    after() throws IOException : success() {
    	System.out.println("**** User created ****");
    	try {
            File file = new File("log.txt");
            // Si el archivo no existe, se crea!
            if (!file.exists()) {
                file.createNewFile();
            }
            // flag true, indica adjuntar información al archivo.
            fw = new FileWriter(file.getAbsoluteFile(), true);
            bw = new BufferedWriter(fw);
            bw.write("**** User created ****"+ '\n');
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                            //Cierra instancias de FileWriter y BufferedWriter
                if (bw != null)
                    bw.close();
                if (fw != null)
                    fw.close();
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }
    
    after() throws IOException : transaccion(){
    	System.out.println("TRANSACION REALIZADA "+cal.getTime());
    	try {
            File file = new File("log.txt");
            // Si el archivo no existe, se crea!
            if (!file.exists()) {
                file.createNewFile();
            }
            // flag true, indica adjuntar información al archivo.
            fw = new FileWriter(file.getAbsoluteFile(), true);
            bw = new BufferedWriter(fw);
            bw.write("TRANSACION REALIZADA "+cal.getTime()+ '\n');
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                            //Cierra instancias de FileWriter y BufferedWriter
                if (bw != null)
                    bw.close();
                if (fw != null)
                    fw.close();
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    	
    }
    
    after() : dinero(){
    	System.out.println("Dinero retirado "+cal.getTime());
    	try {
            File file = new File("log.txt");
            // Si el archivo no existe, se crea!
            if (!file.exists()) {
                file.createNewFile();
            }
            // flag true, indica adjuntar información al archivo.
            fw = new FileWriter(file.getAbsoluteFile(), true);
            bw = new BufferedWriter(fw);
            bw.write("Dinero retirado "+cal.getTime()+ '\n');
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                            //Cierra instancias de FileWriter y BufferedWriter
                if (bw != null)
                    bw.close();
                if (fw != null)
                    fw.close();
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }
   
}