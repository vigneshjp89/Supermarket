package com.Supermarket.src;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import com.sun.glass.ui.Window;
import com.sun.java.swing.plaf.windows.resources.windows;

public class Provider {
static Connection con=null;
public Provider() {
	try{
        Class.forName("org.postgresql.Driver");
        con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/salesDB",
           "postgres", "Zxcv1234!");
       }catch(Exception e){
           System.err.println( e.getClass().getName()+": "+ e.getMessage() );
       }
}
public String[] getResult(){
    ArrayList<String> temp=new ArrayList<String>();
    String []select;
     PreparedStatement ps=null;
  try {
     ps = con.prepareStatement("select * from SUPERMARKET_SALESDATA;");
     ResultSet rs;
     rs=ps.executeQuery();
     while(rs.next()){
         temp.add(rs.getString("areacode"));
         temp.add(rs.getString("date"));
         temp.add(rs.getString("value"));
     }
  } catch (Exception e) {
     System.err.println( e.getClass().getName()+": "+ e.getMessage() );
  }
  select =temp.toArray(new String[temp.size()]);
    return select;
}
public String[] getResultViewDate_Value(){
    ArrayList<String> temp=new ArrayList<String>();
    String []select;
     PreparedStatement ps=null;
  try {
     ps = con.prepareStatement("select * from DATE_VALUE;");
     ResultSet rs;
     rs=ps.executeQuery();
     while(rs.next()){
         temp.add(rs.getString("date"));
         temp.add(rs.getString("value"));
     }
  } catch (Exception e) {
     System.err.println( e.getClass().getName()+": "+ e.getMessage() );
  }
  select =temp.toArray(new String[temp.size()]);
    return select;
}
public String[] getResultViewArea_Value(){
    ArrayList<String> temp=new ArrayList<String>();
    String []select;
     PreparedStatement ps=null;
  try {
     ps = con.prepareStatement("select * from AREA_VALUE;");
     ResultSet rs;
     rs=ps.executeQuery();
     while(rs.next()){
         temp.add(rs.getString("areacode"));
         temp.add(rs.getString("value"));
     }
  } catch (Exception e) {
     System.err.println( e.getClass().getName()+": "+ e.getMessage() );
  }
  select =temp.toArray(new String[temp.size()]);
    return select;
}
public void insertCust(String name,String addr,String num) {
	Statement stmt=null;
	try {
		stmt=con.createStatement();
		stmt.executeUpdate("insert into customer(name,address,contact) values("
				+ "'"+name+"','"+addr+"','"+num+"')");
		stmt.close();
		con.commit();
	} catch (Exception e) {
		// TODO: handle exception
	}
}
public void insertEmp(String name,String addr,String num,String pass) {
	Statement stmt=null;
	try {
		stmt=con.createStatement();
		stmt.executeUpdate("insert into employee_management(ename,eaddress,econtact,epass) values("
				+ "'"+name+"','"+addr+"','"+num+"','"+pass+"')");
		stmt.close();
		con.commit();
	} catch (Exception e) {
		// TODO: handle exception
	}
}
public String[] getInventory() {
	String[] inven;
	ArrayList<String> temp=new ArrayList<String>();
	 PreparedStatement ps=null;
	  try {
	     ps = con.prepareStatement("select * from inventory;");
	     ResultSet rs;
	     rs=ps.executeQuery();
	     while(rs.next()){
	         temp.add(String.valueOf(rs.getInt("id")));
	         temp.add(rs.getString("product"));
	         temp.add(String.valueOf(rs.getInt("available")));
	         temp.add(String.valueOf(rs.getInt("price")));
	     }
	     rs.close();
	     ps.close();
	  } catch (Exception e) {
	     System.err.println( e.getClass().getName()+": "+ e.getMessage() );
	  }
	  inven=temp.toArray(new String[temp.size()]);
	return inven;
}
public String [] getBill(String User) {
	String [] data;
	ArrayList<String> temp=new ArrayList<String>();
	PreparedStatement ps=null;
	try {
		ps=con.prepareStatement("SELECT * FROM goods WHERE username='"+User+"'");
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			temp.add(String.valueOf(rs.getInt("itemno")));
			temp.add(rs.getString("item"));
			temp.add(String.valueOf(rs.getInt("quantity")));
			temp.add(String.valueOf(rs.getInt("price")));
		}
	} catch (Exception e) {
		// TODO: handle exception
	}
	data=temp.toArray(new String[temp.size()]);
	return data;
}

public String [] getAllBill() {
	String [] data;
	ArrayList<String> temp=new ArrayList<String>();
	PreparedStatement ps=null;
	try {
		ps=con.prepareStatement("SELECT * FROM goods");
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			temp.add(rs.getString("username"));
			temp.add(String.valueOf(rs.getInt("itemno")));
			temp.add(rs.getString("item"));
			temp.add(String.valueOf(rs.getInt("quantity")));
			temp.add(String.valueOf(rs.getInt("price")));
		}
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	data=temp.toArray(new String[temp.size()]);
	return data;
}
public void updateAdminInventory(String price,String quant,String id) {
	Statement stmt=null;
	try {
		stmt=con.createStatement();
		stmt.executeUpdate("UPDATE inventory SET available="+(Integer.parseInt(quant))+", price="+price+"WHERE id="+id);
		stmt.close();
		con.commit();
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
}
public void insertInvetory(String id,String product,String available,String price) {
	Statement stmt=null;
	try {
		stmt=con.createStatement();
		stmt.executeUpdate("insert into inventory(id,product,available,price) values("
				+Integer.parseInt(id)+",'"+product+"',"+Integer.parseInt(available)+","+Integer.parseInt(price)+")");
		stmt.close();
		con.commit();
	} catch (Exception e) {
		// TODO: handle exception
	}
}
public void updateInventory(String quantity,String product) {
	Statement stmt=null;
	PreparedStatement ps=null;
	int avail=0;
	try {
		stmt=con.createStatement();
		ps=con.prepareStatement("SELECT available FROM inventory WHERE product='"+product+"'");
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		avail=rs.getInt("available");
		stmt.executeUpdate("UPDATE inventory SET available="+(avail-Integer.parseInt(quantity))+"WHERE product='"+product+"'");
		stmt.close();
		con.commit();
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	
	
}
public void insertGood(String user,String itemno,String item,String quantity,String price) {
	int ino,amt,quant;
	ino=Integer.parseInt(itemno);
	amt=Integer.parseInt(price);
	quant=Integer.parseInt(quantity);
	amt=amt*quant;
	Statement stmt=null;
	try {
		stmt=con.createStatement();
		stmt.executeUpdate("insert into goods(itemno,item,quantity,price,username) values("
				+ino+",'"+item+"',"+quant+","+amt+",'"+user+"')");
		stmt.close();
		con.commit();
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
}
public String isCustThere(String user) {
	
	 
    String select=null;
     PreparedStatement ps=null;
  try {
     ps = con.prepareStatement("select contact from customer where contact='"+user+"'");
     ResultSet rs;
     rs=ps.executeQuery();
     while(rs.next()){
        select=rs.getString("contact");
     }
  } catch (Exception e) {
     System.err.println( e.getClass().getName()+": "+ e.getMessage() );
  }
  if(select!=null)
 return select;
  return "not";
}
public String isUserThere(String user) {
	
	 
	    String select=null;
	     PreparedStatement ps=null;
	  try {
	     ps = con.prepareStatement("select eaddress from EMPLOYEE_MANAGEMENT where EADDRESS='"+user+"';");
	     ResultSet rs;
	     rs=ps.executeQuery();
	     while(rs.next()){
	        select=rs.getString("eaddress");
	     }
	  } catch (Exception e) {
	     System.err.println( e.getClass().getName()+": "+ e.getMessage() );
	  }
	  if(select!=null)
		  return select;
	 return "not";
}

public String[] isUserPass(String user,String pass) {
	String ret[]=new String[2];
	ret[0]="empty";
	ret[1]="empty";
    PreparedStatement ps=null;
 try {
    ps = con.prepareStatement("select eaddress,epass from EMPLOYEE_MANAGEMENT where EADDRESS='"+user+"' and EPASS='"+pass+"';");
    ResultSet rs;
    rs=ps.executeQuery();
    while(rs.next()){
    	
       ret[0]=rs.getString("eaddress");
       ret[1]=rs.getString("epass");
    }
 } catch (Exception e) {
    System.err.println( e.getClass().getName()+": "+ e.getMessage() );
 }
 return ret;
}
}
