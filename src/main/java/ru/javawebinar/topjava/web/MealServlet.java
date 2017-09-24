package ru.javawebinar.topjava.web;

import org.slf4j.Logger;
import ru.javawebinar.topjava.model.Meal;
import ru.javawebinar.topjava.model.MealWithExceed;
import ru.javawebinar.topjava.util.MealsUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static org.slf4j.LoggerFactory.getLogger;


public class MealServlet extends HttpServlet {
    private static final Logger log = getLogger(UserServlet.class);
    static List<Meal> meals = MealsUtil.meals;


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        log.debug("redirect to meals");
        List<MealWithExceed> mealsWithExceed = MealsUtil.withExceeded(meals,2000);

        String action = request.getParameter("action");
        if(action != null){
            if(action.equals("del")) {
                meals.remove(Integer.parseInt(request.getParameter("id")));


            }
        }
                request.setAttribute("meals", mealsWithExceed);
                request.getRequestDispatcher("/meals.jsp").forward(request, response);

        //response.sendRedirect("meals.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        Meal meal = new Meal(
                LocalDateTime.now(),
                req.getParameter("description"),
                Integer.parseInt(req.getParameter("KCal"))
        );

        meals.add(meal);

        doGet(req, resp);
    }
}
