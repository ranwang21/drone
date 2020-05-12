package action;

import manager.MProvince;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ActionProvince {
    public static void getProvinces(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("provinces", MProvince.getProvinces());
    }
}
