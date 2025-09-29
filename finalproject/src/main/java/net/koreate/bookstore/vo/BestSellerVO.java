package net.koreate.bookstore.vo;

import lombok.Data;

@Data
public class BestSellerVO {
    private int rank_num;
    private String title;
    private String image_src;
    private String link_url;
}


