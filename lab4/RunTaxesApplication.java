import java.sql.*;
import java.io.*;
import java.util.*;

/**
 * A class that connects to PostgreSQL and disconnects.
 * You will need to change your credentials below, to match the usename and password of your account
 * in the PostgreSQL server.
 * The name of your database in the server is the same as your username.
 * You are asked to include code that tests the methods of the TaxesApplication class
 * in a similar manner to the sample RunStoresApplication.java program.
*/

import java.sql.*;
import java.io.*;
import java.util.*;


public class RunTaxesApplication
{
    public static void main(String[] args) {
    	
    	Connection connection = null;
    	try {
    	    //Register the driver
    		Class.forName("org.postgresql.Driver"); 
    	    // Make the connection.
            // You will need to fill in your real username
            // and password for your Postgres account in the arguments of the
            // getConnection method below.
            connection = DriverManager.getConnection(
                                                     "jdbc:postgresql://cmps180-db.lt.ucsc.edu/luelai",
                                                     "luelai",
                                                     "2458yucsdbgN");
            
            if (connection != null)
                System.out.println("Connected to the database!");

            /* Include your code below to test the methods of the TaxesApplication class
             * The sample code in RunStoresApplication.java should be useful.
             * That code tests other methods for a different database schema.
             * Your code below: */
            TaxesApplication app = new TaxesApplication(connection);
            //testing method getAirlinesWithManyFlights
            int numberofDelinquents = 2;
            System.out.println("\n" + "Tax Payer ID");
            List<Integer> IRSagents = app.getIRSagentsWithManyDelinquents(numberofDelinquents);
            //printing results
            // for (Integer IRSagent : IRSagents)
            //     System.out.println(IRSagent);

            /*
                Output of getIRSagentsWithManyDelinquents when numberofDelinquents is 2.
                
                Tax Payer ID
                    110
                    133
                    136

            // */

            String address = "843 Ante Ave";
            int increment = 125;
            System.out.println("Update totaltaxed owed for address '843 Ante Ave' : " + app.increaseTaxOwed(address, increment));

            /*
                Output of increaseTaxOwed when the increment is 125.00
                
                Update totaltaxed owed for address '843 Ante Ave' : 3

            */
                
            int theCount = 1, theCount2 = 4;
            String theAgent = "P3E4RR", theAgent2 = "31AD01";
            System.out.println("\n" + "Update deliquent without an IRSagentID with 'P3E4RR': " + app.setAgentForSomeDelinquents(theAgent, theCount));
            // result
            //Update deliquent without an IRSagentID with 'P3E4RR': 1

            System.out.println("Update deliquent without an IRSagentID with '31AD01': " + app.setAgentForSomeDelinquents(theAgent2, theCount2));
            // result
            //Update deliquent without an IRSagentID with '31AD01': 4
            /*******************
            * Your code ends here */
            
    	}
    	catch (SQLException | ClassNotFoundException e) {
    		System.out.println("Error while connecting to database: " + e);
    		e.printStackTrace();
    	}
    	finally {
    		if (connection != null) {
    			// Closing Connection
    			try {
					connection.close();
				} catch (SQLException e) {
					System.out.println("Failed to close connection: " + e);
					e.printStackTrace();
				}
    		}
    	}
    }
}
