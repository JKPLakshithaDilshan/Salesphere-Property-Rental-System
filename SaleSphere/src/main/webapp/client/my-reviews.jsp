<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Reviews | RentSphere</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body class="bg-slate-900 text-white font-sans">

<!-- Header -->
<c:choose>
  <c:when test="${isLoggedIn}">
    <jsp:include page="./partials/sessionheader.jsp" />
  </c:when>
  <c:otherwise>
    <jsp:include page="./partials/header.jsp" />
  </c:otherwise>
</c:choose>

<!-- Dashboard -->
<div class="max-w-7xl mx-auto px-6 py-10 flex flex-col lg:flex-row gap-8">

  <!-- Sidebar -->
  <%@ include file="./partials/sidebar.jsp" %>

  <!-- Content -->
  <main class="flex-1 bg-slate-800 border border-slate-700 rounded-2xl shadow-lg p-8">
    <h1 class="text-3xl font-bold text-teal-400 mb-6">My Reviews</h1>

    <c:if test="${not empty success}">
      <div class="mb-6 p-4 bg-green-900/30 text-green-300 border border-green-600 rounded">
        <i class="fas fa-check-circle mr-2"></i> ${success}
      </div>
    </c:if>

    <c:if test="${not empty error}">
      <div class="mb-6 p-4 bg-red-900/30 text-red-300 border border-red-600 rounded">
        <i class="fas fa-exclamation-circle mr-2"></i> ${error}
      </div>
    </c:if>

    <c:if test="${empty reviews}">
      <p class="text-slate-300">You have not submitted any reviews yet.</p>
    </c:if>

    <c:if test="${not empty reviews}">
      <div class="overflow-x-auto border border-slate-700 rounded-lg">
        <table class="min-w-full text-sm text-left text-slate-300">
          <thead class="bg-slate-700 text-slate-400 uppercase text-xs">
          <tr>
            <th class="px-4 py-3">Review ID</th>
            <th class="px-4 py-3">Property</th>
            <th class="px-4 py-3">Rating</th>
            <th class="px-4 py-3">Comment</th>
            <th class="px-4 py-3">Reviewed At</th>
            <th class="px-4 py-3">Actions</th>
          </tr>
          </thead>
          <tbody class="divide-y divide-slate-700">
          <c:forEach var="review" items="${reviews}">
            <tr class="hover:bg-slate-700/40 transition">
              <td class="px-4 py-3">${review.reviewId}</td>
              <td class="px-4 py-3">${review.propertyTitle}</td>
              <td class="px-4 py-3">${review.rating} <i class="fas fa-star text-yellow-400"></i></td>
              <td class="px-4 py-3">${review.comment}</td>
              <td class="px-4 py-3">${review.reviewedAt}</td>
              <td class="px-4 py-3 flex gap-2">
                <a href="${pageContext.request.contextPath}/review?reviewId=${review.reviewId}&propertyId=${review.propertyId}"
                   class="inline-flex items-center px-3 py-1.5 text-xs font-medium rounded bg-teal-500 hover:bg-teal-600 text-white transition">
                  <i class="fas fa-edit mr-1"></i> Edit
                </a>
                <form action="${pageContext.request.contextPath}/reviews" method="post"
                      onsubmit="return confirm('Are you sure you want to delete this review? This action cannot be undone.');">
                  <input type="hidden" name="action" value="delete">
                  <input type="hidden" name="reviewId" value="${review.reviewId}">
                  <button type="submit"
                          class="inline-flex items-center px-3 py-1.5 text-xs font-medium rounded bg-red-500 hover:bg-red-600 text-white transition">
                    <i class="fas fa-trash-alt mr-1"></i> Delete
                  </button>
                </form>
              </td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>
    </c:if>
  </main>
</div>

<!-- Footer -->
<%@ include file="./partials/footer.jsp" %>
</body>
</html>