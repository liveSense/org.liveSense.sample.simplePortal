<%@page import="javax.jcr.NodeIterator"%>
<%@page import="javax.jcr.query.Query"%>
<%@page import="javax.jcr.query.QueryManager"%>
<%@page import="javax.jcr.Node"%>
<%@page session="false"%>
<%@page contentType="text/html; charset=UTF-8" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0"%>

<sling:defineObjects/>


<jsp:directive.include file="/apps/simpleportal/simplepage/header.jsp" />

    <div class="Main">
        <div class="Sheet">
            <div class="Sheet-tl"></div>
            <div class="Sheet-tr"></div>
            <div class="Sheet-bl"></div>
            <div class="Sheet-br"></div>
            <div class="Sheet-tc"></div>
            <div class="Sheet-bc"></div>
            <div class="Sheet-cl"></div>
            <div class="Sheet-cr"></div>
            <div class="Sheet-cc"></div>
            <div class="Sheet-body">
                <div class="Header">
                    <div class="Header-jpeg"></div>
                    <div class="logo">
                        <h1 id="name-text" class="logo-name"><a href="#">Headline</a></h1>
                        <div id="slogan-text" class="logo-text">Your Slogan Here</div>
                    </div>
                </div>
                <div class="nav">
                	<div class="l"></div>
                	<div class="r"></div>
                	<ul class="artmenu">
                	<%
                	Node node = currentNode;
                	
                	NodeIterator siblings = node.getSession().getWorkspace().getQueryManager().
                	createQuery("SELECT [menu] FROM [simpleportal:simplepage]  WHERE [portalName] = 'simpleportal' ORDER BY [menuOrder]", Query.JCR_SQL2).execute().getNodes();
                	while (siblings.hasNext()) {
                		node = siblings.nextNode();
                		
                		out.print("<li><a href=\""+node.getPath()+".html"+"\" ");
                		if (node.getName().equals(currentNode.getName())) {
                			out.print("class=\"active\" ");
                		}
                		out.print("><span class=\"l\"></span><span class=\"r\"></span><span class=\"t\">"+node.getProperty("menu").getString()+"</span></a></li>");
                	}
                	%>
                	</ul>
                </div>
                <div class="contentLayout">
                    <div class="sidebar1">
                        <div class="Block">
                            <div class="Block-tl"></div>
                            <div class="Block-tr"></div>
                            <div class="Block-bl"></div>
                            <div class="Block-br"></div>
                            <div class="Block-tc"></div>
                            <div class="Block-bc"></div>
                            <div class="Block-cl"></div>
                            <div class="Block-cr"></div>
                            <div class="Block-cc"></div>
                            <div class="Block-body">
                                <div class="BlockHeader">
                                    <div class="l"></div>
                                    <div class="r"></div>
                                    <div class="header-tag-icon">
                                        <div class="t">Contact Info</div>
                                    </div>
                                </div><div class="BlockContent">
                                    <div class="BlockContent-body">
                                        <div>
                                              <img src="images/contact.jpg" alt="an image" style="margin: 0 auto;display:block;width:95%" />
                                        <br />
                                        <b>Company Co.</b><br />
                                        Las Vegas, NV 12345<br />
                                        Email: <a href="mailto:info@company.com">info@company.com</a><br />
                                        <br/>
                                        Phone: (123) 456-7890 <br/>
                                        Fax: (123) 456-7890
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="Block">
                            <div class="Block-tl"></div>
                            <div class="Block-tr"></div>
                            <div class="Block-bl"></div>
                            <div class="Block-br"></div>
                            <div class="Block-tc"></div>
                            <div class="Block-bc"></div>
                            <div class="Block-cl"></div>
                            <div class="Block-cr"></div>
                            <div class="Block-cc"></div>
                            <div class="Block-body">
                                <div class="BlockHeader">
                                    <div class="l"></div>
                                    <div class="r"></div>
                                    <div class="header-tag-icon">
                                        <div class="t">Newsletter</div>
                                    </div>
                                </div><div class="BlockContent">
                                    <div class="BlockContent-body">
                                        <div><form method="get" id="newsletterform" action="javascript:void(0)">
                                        <input type="text" value="" name="email" id="s" style="width: 95%;" />
                                        <button class="Button" type="submit" name="search">
                                              <span class="btn">
                                                  <span class="l"></span>
                                                  <span class="r"></span>
                                                  <span class="t">Subscribe</span>
                                              </span>
                                        </button>
                                        </form></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="content">
                        <div class="Post">
                            <div class="Post-body">
                        <div class="Post-inner">
                            <h2 class="PostHeaderIcon-wrapper">
                                <span class="PostHeader">Welcome</span>
                            </h2>
                            <div class="PostContent">
                                
								<p>
									<%=currentNode.getProperty("content").getValue().getString() %>									
								</p>
                    </div>
	                </div>

<jsp:directive.include file="/apps/simpleportal/simplepage/footer.jsp" />