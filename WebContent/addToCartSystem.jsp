<%@page import="project.Database" %>
<%@page import="java.sql.*" %>
<%
String email=session.getAttribute("email").toString();
String product_id=request.getParameter("id");
int quantity=1;
int product_price=0;
int product_total=0;
int cart_total=0;

int z=0;
try{
	Database conProvider =new Database();
	Connection con=conProvider.getData();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from product where id='"+product_id+"'");
	while(rs.next()){
		product_price=rs.getInt(4);
		product_total=product_price;
	}
	ResultSet rs1=st.executeQuery("select * from cart where product_id='"+product_id+"' and email='"+email+"' and address is NULL");
	while(rs1.next()){
		cart_total=rs1.getInt(5);
		cart_total=cart_total+product_total;
		quantity=rs1.getInt(3);
		quantity=quantity+1;
		z=1;
	}
	if(z==1){
		st.executeUpdate("update cart set total='"+cart_total+"',quantity='"+quantity+"' where product_id='"+product_id+"' and email='"+email+"' and address is NULL");
		out.print("<script language='JavaScript'>alert('Product already exist in your cart! Quantity increased!');window.location.href=document.referrer</script>");
	}
	if(z==0){
		PreparedStatement ps=con.prepareStatement("insert into cart(email,product_id,quantity,price,total) values(?,?,?,?,?)");
		ps.setString(1, email);
		ps.setString(2, product_id);
		ps.setInt(3, quantity);
		ps.setInt(4, product_price);
		ps.setInt(5, product_total);
		ps.executeUpdate();
		out.print("<script language='JavaScript'>alert('Product added successfully! Check on your Cart to proceed!');window.location.href=document.referrer</script>");
	}
}catch(Exception e){
	System.out.println(e);
	out.print("<script language='JavaScript'>alert('Something went wrong! Try Again!');window.location.href=document.referrer</script>");
}
%>