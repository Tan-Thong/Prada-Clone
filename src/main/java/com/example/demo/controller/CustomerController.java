package com.example.demo.controller;

import com.example.demo.entity.*;
import com.example.demo.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
public class CustomerController {
    private String apiGoBack="";

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private CartService cartService;

    @Autowired
    private CartItemService cartItemService;

    @Autowired
    private WishListService wishListService;

    @Autowired
    private InvoiceService invoiceService;

    public Double totalPrice(List<CartItem> list) {
        double total = 0;
        for(CartItem item : list) {
            total += item.getPrice();
        }
        return total;
    }

    private void populateCommonAttributes(Model model) {
        // ========= clothes ========= //
        // ==== Men
        List<Category> listCategoryClothesMen = categoryService.searchCategoryByParentNameAndGenderNot("Clothes", 2);
        model.addAttribute("listCategoryClothesMen", listCategoryClothesMen);
        model.addAttribute("apiClothesMen", "/men/ready-to-wear");
        // ==== Women
        List<Category> listCategoryClothesWomen = categoryService.searchCategoryByParentNameAndGenderNot("Clothes", 1);
        model.addAttribute("listCategoryClothesWomen", listCategoryClothesWomen);
        model.addAttribute("apiClothesWomen", "/women/ready-to-wear");

        // ========= bags ========= //
        // ==== Men
        List<Category> listCategoryBagMen = categoryService.searchCategoryByParentNameAndGenderNot("Bags", 2);
        model.addAttribute("listCategoryBagMen", listCategoryBagMen);
        model.addAttribute("apiBagMen", "/men/bags");
        // ==== Women
        List<Category> listCategoryBagWomen = categoryService.searchCategoryByParentNameAndGenderNot("Bags", 1);
        model.addAttribute("listCategoryBagWomen", listCategoryBagWomen);
        model.addAttribute("apiBagWomen", "/women/bags");

        // ========= shoes ========= //
        // ==== Men
        List<Category> listCategoryShoesMen = categoryService.searchCategoryByParentNameAndGenderNot("Shoes", 2);
        model.addAttribute("listCategoryShoesMen", listCategoryShoesMen);
        model.addAttribute("apiShoesMen", "/men/shoes");
        // ==== Women
        List<Category> listCategoryShoesWomen = categoryService.searchCategoryByParentNameAndGenderNot("Shoes", 1);
        model.addAttribute("listCategoryShoesWomen", listCategoryShoesWomen);
        model.addAttribute("apiShoesWomen", "/women/shoes");

        // ========= List cart item ========== //
        List<CartItem> listCartItem = cartService.getAllCartItems();
        model.addAttribute("listCartItem", listCartItem);
        model.addAttribute("total", totalPrice(listCartItem));

        // ========= Number of wish list ========== //
        model.addAttribute("numberOfWishList", wishListService.getWishList().getItems().size());

        // ========== Is loggin ========== //
        if (SecurityUtils.getPrincipal() != null) {
            model.addAttribute("loggin", 1);
        } else {
            model.addAttribute("loggin", 0);
        }
    }

    private void sentListProduct(Model model, String categoryParent, String apiCategory, boolean gender, List<Product> list) {
        List<Category> listCategory = categoryService.searchCategoryByParentNameAndGenderNot(categoryParent, gender ? 2 : 1);
        model.addAttribute("listCategory", listCategory);

        model.addAttribute("list", list);
        model.addAttribute("number", list.size());
        model.addAttribute("api", apiCategory);

        if(categoryParent.equals("Clothes")) {
            model.addAttribute("categoryParent", "Ready to wear");
        }
        else {
            model.addAttribute("categoryParent", categoryParent);
        }
    }

    @GetMapping("/search")
    public String search(Model model, @Param("keyWord") String keyWord) {
        List<Product> list = productService.getAll();
        if(keyWord != null){
            list = productService.searchProductByName(keyWord);
            model.addAttribute("keyWord", keyWord);
        }
        model.addAttribute("list", list);
        model.addAttribute("apiGoBack", apiGoBack);
        return "search";
    }

    @GetMapping()
    public String index(Model model) {
        populateCommonAttributes(model);
        apiGoBack = "/";
        return "index";
    }

    // ========= Clothes ========= //
    // ===== Women ===== //
    @GetMapping("/women/ready-to-wear")
    public String GetWomenAll(Model model){
        List<Product> list = productService.getProductByCategoryParentAndGender("Clothes", false);
        populateCommonAttributes(model);
        sentListProduct(model, "Clothes", "/women/ready-to-wear", false, list);
        apiGoBack = "/women/ready-to-wear";
        return "item";
    }

    @GetMapping("/women/ready-to-wear/dresses")
    public String GetWomenDresses(Model model){
        List<Product> list = productService.getProductByCategoryAndGender("Dresses", false);
        populateCommonAttributes(model);
        sentListProduct(model, "Clothes", "/women/ready-to-wear", false, list);
        apiGoBack = "/women/ready-to-wear/dresses";
        return "item";
    }

    @GetMapping("/women/ready-to-wear/shirts-and-tops")
    public String GetWomenSkirtsAndTops(Model model){
        List<Product> list = productService.getProductByCategoryAndGender("Shirts and tops", false);
        populateCommonAttributes(model);
        sentListProduct(model, "Clothes", "/women/ready-to-wear", false, list);
        apiGoBack = "/women/ready-to-wear/shirts-and-tops";
        return "item";
    }

    @GetMapping("/women/ready-to-wear/denim")
    public String GetWomenDenim(Model model){
        List<Product> list = productService.getProductByCategoryAndGender("Denim", false);
        populateCommonAttributes(model);
        sentListProduct(model, "Clothes", "/women/ready-to-wear", false, list);
        apiGoBack = "/women/ready-to-wear/Denim";
        return "item";
    }

    @GetMapping("/women/ready-to-wear/skirts")
    public String GetWomenSkirts(Model model){
        List<Product> list = productService.getProductByCategoryAndGender("Skirts", false);
        populateCommonAttributes(model);
        sentListProduct(model, "Clothes", "/women/ready-to-wear", false, list);
        apiGoBack = "/women/ready-to-wear/skirts";
        return "item";
    }

    // ===== Men ===== //
    @GetMapping("/men/ready-to-wear")
    public String GetMenAll(Model model){
        List<Product> list = productService.getProductByCategoryParentAndGender("Clothes", true);
        populateCommonAttributes(model);
        sentListProduct(model, "Clothes", "/men/ready-to-wear", true, list);
        apiGoBack = "/men/ready-to-wear";
        return "item";
    }

    @GetMapping("/men/ready-to-wear/jackets-and-coats")
    public String GetMenJacketAndCoat(Model model){
        List<Product> list = productService.getProductByCategoryAndGender("Jackets and Coats", true);
        populateCommonAttributes(model);
        sentListProduct(model, "Clothes", "/men/ready-to-wear", true, list);
        apiGoBack = "/men/ready-to-wear/jackets-and-coats";
        return "item";
    }

    @GetMapping("/men/ready-to-wear/shirts")
    public String GetMenSkirt(Model model){
        List<Product> list = productService.getProductByCategoryAndGender("Shirts", true);
        populateCommonAttributes(model);
        sentListProduct(model, "Clothes", "/men/ready-to-wear", true, list);
        apiGoBack = "/men/ready-to-wear/shirts";
        return "item";
    }

    @GetMapping("/men/ready-to-wear/suits")
    public String GetMenDenim(Model model){
        List<Product> list = productService.getProductByCategoryAndGender("Suits", true);
        populateCommonAttributes(model);
        sentListProduct(model, "Clothes", "/men/ready-to-wear", true, list);
        apiGoBack = "/men/ready-to-wear/suits";
        return "item";
    }

    @GetMapping("/men/ready-to-wear/denim")
    public String GetMenSuit(Model model){
        List<Product> list = productService.getProductByCategoryAndGender("Denim", true);
        populateCommonAttributes(model);
        sentListProduct(model, "Clothes", "/men/ready-to-wear", true, list);
        apiGoBack = "/men/ready-to-wear/denim";
        return "item";
    }

    // ========== Bags ========== //

    @GetMapping("/women/bags")
    public String GetWomenBagAll(Model model){
        List<Product> list = productService.getProductByCategoryParentAndGender("Bags", false);
        populateCommonAttributes(model);
        sentListProduct(model, "Bags", "/women/bags", false, list);
        apiGoBack = "/women/bags";
        return "item";
    }

    @GetMapping("/women/bags/top-handles")
    public String GetWomenTopHandles(Model model){
        List<Product> list = productService.getProductByCategoryAndGender("Top handles", false);
        populateCommonAttributes(model);
        sentListProduct(model, "Bags", "/women/bags", false, list);
        apiGoBack = "/women/bags/top-handles";
        return "item";
    }

    @GetMapping("/women/bags/totes")
    public String GetWomenTotes(Model model){
        List<Product> list = productService.getProductByCategoryAndGender("Totes", false);
        populateCommonAttributes(model);
        sentListProduct(model, "Bags", "/women/bags", false, list);
        apiGoBack = "/women/bags/totes";
        return "item";
    }

    @GetMapping("/women/bags/mini-bags")
    public String GetWomenMiniBags(Model model){
        List<Product> list = productService.getProductByCategoryAndGender("Mini bags", false);
        populateCommonAttributes(model);
        sentListProduct(model, "Bags", "/women/bags", false, list);
        apiGoBack = "/women/bags/mini-bags";
        return "item";
    }

    @GetMapping("/men/bags")
    public String GetMenBagAll(Model model){
        List<Product> list = productService.getProductByCategoryParentAndGender("Bags", true);
        populateCommonAttributes(model);
        sentListProduct(model, "Bags", "/men/bags", true, list);
        apiGoBack = "/men/bags";
        return "item";
    }

    @GetMapping("/men/bags/messenger-bags")
    public String GetMenMessengerBag(Model model){
        List<Product> list = productService.getProductByCategoryAndGender("Messenger bags", true);
        populateCommonAttributes(model);
        sentListProduct(model, "Bags", "/men/bags", true, list);
        return "item";
    }

    @GetMapping("/men/bags/backpacks-and-belt-bags")
    public String GetMenBackpacksAndBeltBag(Model model){
        List<Product> list = productService.getProductByCategoryAndGender("Backpacks and Belt Bags", true);
        populateCommonAttributes(model);
        sentListProduct(model, "Bags", "/men/bags", true, list);
        return "item";
    }

    @GetMapping("/men/bags/totes")
    public String GetMenTotes(Model model){
        List<Product> list = productService.getProductByCategoryAndGender("Totes", true);
        populateCommonAttributes(model);
        sentListProduct(model, "Bags", "/men/bags", true, list);
        apiGoBack = "/men/bags/totes";
        return "item";
    }

    @GetMapping("/men/bags/briefcases")
    public String GetMenBriefcases(Model model){
        List<Product> list = productService.getProductByCategoryAndGender("Briefcases", true);
        populateCommonAttributes(model);
        sentListProduct(model, "Bags", "/men/bags", true, list);
        apiGoBack = "/men/bags/briefcases";
        return "item";
    }

    // ========== Shoes ========== //
    @GetMapping("/women/shoes")
    public String GetWomenShoesAll(Model model){
        List<Product> list = productService.getProductByCategoryParentAndGender("Shoes", false);
        populateCommonAttributes(model);
        sentListProduct(model, "Shoes", "/women/shoes", false, list);
        apiGoBack = "/women/shoes";
        return "item";
    }

    @GetMapping("/women/shoes/sneakers")
    public String GetWomenSneakers(Model model){
        List<Product> list = productService.getProductByCategoryAndGender("Sneakers", false);
        populateCommonAttributes(model);
        sentListProduct(model, "Shoes", "/women/shoes", false, list);
        apiGoBack = "/women/shoes/sneakers";
        return "item";
    }

    @GetMapping("/men/shoes")
    public String GetMenShoesAll(Model model){
        List<Product> list = productService.getProductByCategoryParentAndGender("Shoes", true);
        populateCommonAttributes(model);
        sentListProduct(model, "Shoes", "/men/shoes", true, list);
        apiGoBack = "/men/shoes";
        return "item";
    }

    @GetMapping("/men/shoes/sneakers")
    public String GetMenSneakers(Model model){
        List<Product> list = productService.getProductByCategoryAndGender("Sneakers", true);
        populateCommonAttributes(model);
        sentListProduct(model, "Shoes", "/men/shoes", true, list);
        apiGoBack = "/men/shoes/sneakers";
        return "item";
    }

    @GetMapping("/men/shoes/boots")
    public String GetMenBoots(Model model){
        List<Product> list = productService.getProductByCategoryAndGender("Boots", true);
        populateCommonAttributes(model);
        sentListProduct(model, "Shoes", "/men/shoes", true, list);
        apiGoBack = "/men/shoes/boots";
        return "item";
    }

    @GetMapping("/men/shoes/driving-shoes")
    public String GetMenDrivingShoes(Model model){
        List<Product> list = productService.getProductByCategoryAndGender("Driving shoes", true);
        populateCommonAttributes(model);
        sentListProduct(model, "Shoes", "/men/shoes", true, list);

        return "item";
    }

    @GetMapping("/item-detail/{id}")
    public String getItemDetail(Model model, @PathVariable int id){
        populateCommonAttributes(model);
        Product product = productService.findById(id);
        model.addAttribute("product", product);
        CartItem cartItem = cartItemService.getCartItemByProductId(id);
        if(cartItem != null) {
            model.addAttribute("numberInCart", cartItemService.getCartItemByProductId(id).getQuantity());
        }
        return "item-detail";
    }

    @GetMapping("/shopping-bag")
    public String getShoppingBag(Model model){
        populateCommonAttributes(model);
        apiGoBack = "/shopping-bag";
        return "shopping-bag";
    }

    @GetMapping("/profile")
    public String getProfile(Model model){
        populateCommonAttributes(model);
        // ========= Profile ========= //
        User user = SecurityUtils.getPrincipal();
        model.addAttribute("user", user);
        List<Invoice> invoice = invoiceService.findInvoiceByUser(user);
        model.addAttribute("listInvoice", invoice);
        apiGoBack = "/profile";
        return "profile";
    }
}
