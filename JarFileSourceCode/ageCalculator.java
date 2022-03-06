package bank;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.pig.EvalFunc;
import org.apache.pig.data.Tuple;
import org.joda.time.DateTime;
import org.joda.time.Period;
import org.joda.time.ReadableInstant;

@SuppressWarnings("unused")
public class age extends EvalFunc<String>{
@Override	
		public String exec(Tuple input) throws IOException { 
		
	  if (input == null || input.size() == 0)      
		  return null; 
		  try{
		      String s = (String)input.get(0);
		      String month = s.substring(2,4); 
			      if(Integer.parseInt(month)>50)
			      {
			   	  int x = Integer.parseInt(month)-50;
				  if(x<10)
			   		  month = "0"+String.valueOf(x);
			   	  else
			   		  month = String.valueOf(x);
			      }
		      
		      String str = s.substring(0,2).concat(month).concat(s.substring(4,6));
		      Date date = new Date();   
		      DateTime today = new DateTime(date);
		         
		      Date dob = null;
		         try {
		        	 dob = new SimpleDateFormat("yyMMdd").parse(str);
		         } 
		         catch (ParseException e) {
		        	 e.printStackTrace();
		         } 
		         
		         DateTime dt_dob = new DateTime(dob);
		         Period period = new Period(dt_dob,today);
		         int age_res = period.getYears();
		         return String.valueOf(age_res);
		      }
		  
	    catch(Exception e){
			 throw new IOException("exception caught"+e.getMessage(),e);
		   }
		      
	}

}
