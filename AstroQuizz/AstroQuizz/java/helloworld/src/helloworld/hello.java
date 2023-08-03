package helloworld;

public class hello {

	 public static void main(String[] args) {
		 String[] ssnNumbers = {"Good Boy Yoga happy"};                  
		               String pattern =  "\\b(Boy)\\b";           
		              for(String ssnNum : ssnNumbers) {
		                 if (ssnNum.matches(pattern)) {     
		                     System.out.println(ssnNum+ " : Valid"); 
		                 } else {     
		                     System.out.println(ssnNum+ " : Invalid"); 
		                 }
		              }
		              
		     }

}
