# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
<div class="container">
<% @page.each do |page| %>
  <div class="row justify-content-md-center">
    <div class="col-8 mt-4">
      <div class="card text-center shadow mb-5 bg-body rounded">
        <div class="card-header fst-italic">
          <%# by <%= article.user.username if article.user %> %>
        </div>
        <div class="card-body">
          <h5 class="card-title"><%= link_to page.title, page_path(page), class: "text-success" %></h5>
          <%# <p class="card-text"><%= truncate(article.description, length: 100) %></p> %>
          <%= link_to "Show" , page_path(page) ,class: "btn btn-outline-success"%>
          <%= link_to "Edit" , edit_page_path(page) ,class: "btn btn-outline-info"%>
          <%= link_to "Delete" , page_path(page), method: :delete, data: { confirm: "Are you sure?" }, class: "btn btn-outline-danger"%>
          <%= link_to 'View Posts', posts_path, class: "btn btn-outline-warning" %>
        </div>
        <div class="card-footer text-muted">
          <small>Created <%= time_ago_in_words(article.created_at) %> ago,
          edited <%= time_ago_in_words(article.updated_at) %> ago </small>
        </div>
      </div>
    </div>
  </div>
<% end%>
</div>

<h1>Books</h1>

<table>
  <thead>
    <tr>
      <th>Bname</th>
      <th>Description</th>
      <th>User</th>
      <th colspan="3"></th>
    </tr>
  </thead>

  <tbody>
    <% @books.each do |book| %>
      <tr>
        <td><%= book.bname %></td>
        <td><%= book.description %></td>
        <td><%= book.user_id %></td>
        <td><%= link_to 'Show', book %></td>
        <%# <% if current_user && current_user.admin %>
        <td><%= link_to 'Edit', edit_book_path(book) %></td>
        <td><%= link_to 'Destroy', book, method: :delete, data: { confirm: 'Are you sure?' } %></td>
      </tr>
    <% end %>
  </tbody>
</table>

<br>

<%= link_to 'New Book', new_book_path %>


<div class="container">
<h3 class="text-center">List of all user who has signed in</h3>
<% @users.each do |user| %>
  <div class="row justify-content-center">
    <div class="col-6">
      <div class="card text-center shadow mb-5 bg-body rounded">
        <div class="card-header fst-italic">
          by <%= user.name if user.name %>
        </div>
        <div class="card-body">
          <h5 class="card-title"><%= link_to user.name, class: "text-success" %></h5>
          <%= link_to user.email, class: "text-succes"%>
          <p><%= link_to 'Show Books', books_path %></p>
        </div>
        <div class="card-footer text-muted">
          <small>Created <%= time_ago_in_words(user.created_at) %> ago,
          edited <%= time_ago_in_words(user.updated_at) %> ago </small>
        </div>
      </div>
    </div>
  </div>
<% end%>
</div>


 <div class="container">
   <div class="main-box">
      <div class="card w-50 shadow rounded">
         <div class="card-body text-center">
            <h5 class="card-title">Total Users</h5></br>
            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p></br>
            <%= link_to "show users", users_path, class: "btn btn-success"%>
         </div>
      </div>
      <div class="card w-50 shadow rounded">
         <div class="card-body text-center">
            <h5 class="card-title">Total Books</h5></br>
            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p></br>
            <%= link_to "show book", books_path, class: "btn btn-info"%>
         </div>
      </div>
   </div>
</div>
<div class="profile-area">
   <div class="container">
      <div class="row ">
         <div class="col-md-4">
            <div class="card">
               <div class="img1"> <%= image_tag("book4.jpg") %>
               <div class="img2"><%= image_tag("book3.jpg") %>
               <div class="main-text">
                  <h2>person one</h2>
                  <p>Lorem3 With supporting text below as a natural lead-in to additional content.</p>
               </div>
               <div class="social">
                  <i class="fa fa-facebook"></i>
                  <i class="fa fa-linkedin"></i>
                  <i class="fa fa-instagram"></i>
                  <i class="fa fa-twitter"></i>
               </div>
            </div>
         </div>
          <div class="col-md-4">
            <div class="card">
               <div class="img1"> <%= image_tag("book4.jpg") %>
               <div class="img2"><%= image_tag("book3.jpg") %>
               <div class="main-text">
                  <h2>person one</h2>
                  <p>Lorem3 With supporting text below as a natural lead-in to additional content.</p>
               </div>
               <div class="social">
                  <i class="fa fa-facebook"></i>
                  <i class="fa fa-linkedin"></i>
                  <i class="fa fa-instagram"></i>
                  <i class="fa fa-twitter"></i>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>

<div class="main-box">
  
  <%# <%= render :partial => "layouts/sidebar" %>
  <div class="left-side">
    <h3 class="text-center">List of all user who has signed in</h3>
    <% @users.each do |user| %>
      <div class="row justify-content-center">
        <div class="col-8 mt-4">
          <div class="card text-center shadow mb-5 bg-body rounded">
          <div class="card-header fst-italic">
            by <%= user.name if user.name %>
          </div>
          <div class="card-body">
            <h5 class="card-title"><%= link_to user.name, class: "text-success" %></h5>
            <%= link_to user.email, class: "text-success"%>
            <div>
              <%= link_to 'View', @user_path, class: "btn btn-success" %>
              <%= link_to 'Show Books', books_path, class: "btn btn-warning" %>
            </div>
          </div>
          <div class="card-footer text-muted">
            <small>Created <%= time_ago_in_words(user.created_at) %> ago,
            edited <%= time_ago_in_words(user.updated_at) %> ago </small>
          </div>
        </div>
      </div>
    </div>
    <% end %>
  </div>

</div>

 <li class="nav-item nav-link mt-2">PRICE</li>
          <%= form_for "", url: books_path, role: "search", method: :get do %>
            <p><%= text_field_tag :searchp, @search_pricen_term, placeholder: "Min.." , class: " shadow rounded w-50"%></p>
            <p><%= text_field_tag :searchpx, @search_pricex_term, placeholder: "Max..", class: " shadow rounded w-50"%></p>
            <%= submit_tag "GO", class:"btn btn-outline-dark "%>
          <% end %>
          </li>
        <hr>
        <li class="nav-item nav-link ">LANGUAGES</li>
          <%= form_with(url: books_path, method: :get) do |form| %>
            <%= form.select :book_language, options_for_select(['English', 'Hindi']) , class: " form shadow rounded " %>
            </br>
            <%= form.submit "GO",  class:"btn btn-outline-dark mt-2 " %>
        <%end%>
        </li>