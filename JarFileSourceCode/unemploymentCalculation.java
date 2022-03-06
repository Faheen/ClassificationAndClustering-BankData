package bank;

import java.io.IOException; 
import org.apache.pig.EvalFunc; 
import org.apache.pig.data.Tuple; 

public class unemp extends EvalFunc<Double>{ 

   public Double exec(Tuple input) throws IOException {   
      if (input == null || input.size() == 0)      
      return null;      
      Double emp_1 = (Double)input.get(0);
      Double emp_2 = (Double)input.get(1);
      if(emp_2 > emp_1)
    	  return emp_2-emp_1; 
      else
    	  return emp_1-emp_2;
   } 
}