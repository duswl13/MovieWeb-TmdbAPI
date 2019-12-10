<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="result" items="${gen}">
											<div class="col-md-4">
												<div class="item-box-blog">
													<div class="item-box-blog-image">
														<!--Image-->
														<figure>
															<img alt="" src="${image}${result.poster_path}">
														</figure>
													</div>
													<div class="item-box-blog-body">
														<!--Heading-->
														<div class="item-box-blog-heading">
															<a tabindex="0">
																<h5>${result.title}</h5>
															</a>
															<%-- <textarea rows="5" cols="35">${result.overview }</textarea></p>  --%>
														</div>
														<div class="item-box-blog-data" style="padding: px 15px;">
															<p>
																<i class="fa fa-user-o"></i> 개봉일 : <i
																	class="fa fa-comments-o"></i> ${result.release_date }
															</p>
														</div>
														<!--Text-->
														<div class="item-box-blog-text">
															<textarea rows="5" cols="32">${result.overview }</textarea>
														</div>

														<div class="mt">
															<a href="moviedetail.ml?open=false&id=${result.id}&title=${result.title}" tabindex="0" class="btn bg-blue-ui white read">read
																more</a>
														</div>
														<!--Read More Button-->
													</div>
												</div>
											</div>
										</c:forEach>
                   