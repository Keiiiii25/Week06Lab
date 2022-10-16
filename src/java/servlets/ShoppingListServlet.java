package servlets;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Keith
 */
public class ShoppingListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");

        if (action != null) {
            if (action.equals("logout")) {
                session.invalidate();
            }
        } else {
            if (session.getAttribute("username") != null) {
                getServletContext().getRequestDispatcher("/WEB-INF/shoppingList.jsp").forward(request, response);
                return;
            }
        }
        getServletContext().getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
        return;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username;
        String item;

        ArrayList<String> items = (ArrayList<String>) session.getAttribute("items");
        if (items == null) {
            items = new ArrayList<String>();
        }

        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "register":
                    username = request.getParameter("username");
                    session.setAttribute("username", username);
                case "add":
                    item = request.getParameter("item");

                    if (item != null && !item.equals("")) {
                        items.add(item);
                    }
                    session.setAttribute("items", items);
                case "delete":
                    item = request.getParameter("itemSelected");

                    if (item != null) {
                        items.remove(item);
                    }
            }
            getServletContext().getRequestDispatcher("/WEB-INF/shoppingList.jsp").forward(request, response);
            return;
        }
    }

}
