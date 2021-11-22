  <%@page import="com.project1.entities.Posts"%>
  <%@page import="java.util.List" %>
  <%@page import="com.project1.helper.DBconnection"%>
  <%@page import="com.project1.dao.Postdao"%>
  
  
   
  <div class="row">

  
  <% 
  Thread.sleep(300);
  Postdao d = new Postdao(DBconnection.createcon());
  int cid = Integer.parseInt(request.getParameter("cid"));
  List<Posts> posts = null;
  if(cid==0){
	  posts = d.getAllPosts();
  }else{
	  posts=d.getPostByCid(cid);
  }
  
  if(posts.size()==0){
	  out.println("<h2 class='display-3 text-center'>Not Display any posts in this category...</h2>");
	  return;
  }
  for(Posts p : posts){

  %>
  
  <div class="col-md-6 mt-2">
  
  	<div class="card">
  	 <img src="blog_pic/<%=p.getpPic()%>" class="card-img-top" alt=" Card image cap">
  		<div class="card-body">
  			<b><%=p.getpTitle() %></b>
  			
  				<p><%=p.getpContent() %></p>
  					<pre><%=p.getpCode() %></pre>

  		</div>

  	</div>

  </div>
  
  
  
  
  <% 
 
  }
  %>
  </div>