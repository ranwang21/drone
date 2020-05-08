package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import entities.Item;
import manager.MDB;
import manager.MItem;

import java.io.*;

public class ActionItems {

    public static void getItems(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("items", MItem.getItems(ActionCategory.getSelectedCategory(request, response)));


    }

    public static void getSearchItems(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("items", MItem.getSearchItems(request.getParameter("search")));
    }

    public static void getItemById(int id, HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("item", MItem.getItemById(id));
    }

    public static int removeProduct(HttpServletRequest request, int prodId) {
//        int prodId = Integer.parseInt(productId);
//        Item itemToRemove = MItem.getItemById(prodId);
     
        return MItem.removeProduct(prodId);
    }

    public static void updateItemById(HttpServletRequest request, HttpServletResponse response, Item item) {
        MItem.updateItem(item);
    }

    public static void addItem(HttpServletRequest request, HttpServletResponse response, Item item) {
        MItem.addItem(item);
    }

    /**
     * @param fileName
     * @param filePart
     * @return 1 = File Upload Success
     * 0 = File Upload Error
     * @throws IOException
     */
    public static int uploadProductImg(String fileName, Part filePart) throws IOException {
        // Recuperation du dossier des images de produit en fonction du type de systeme
        //For WINDOWS
        String path = "C:" + File.separator + "isidrone" + File.separator + "products" + File.separator + "img" + File.separator;
        //For LINUX
        if (MDB.isUnix())
            path = File.separator + "isidrone" + File.separator + "products" + File.separator + "img" + File.separator;
        
        try (OutputStream out = new FileOutputStream(new File(path + fileName)); InputStream filecontent = filePart.getInputStream()) {
            int read = 0;
            final byte[] bytes = new byte[1024];

            while ((read = filecontent.read(bytes)) != -1) {
                out.write(bytes, 0, read);
            }
            return 1;
        } catch (FileNotFoundException fne) {
            return 0;
        }
    }

    public static String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    public static String getFileExtension(String fileName) {
        if (fileName.lastIndexOf(".") != -1 && fileName.lastIndexOf(".") != 0)
            return fileName.substring(fileName.lastIndexOf(".") + 1);
        else return "";
    }
}