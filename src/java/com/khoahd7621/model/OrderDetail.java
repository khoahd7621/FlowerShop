package com.khoahd7621.model;

import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author KhoaHD7621
 */

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class OrderDetail implements Serializable {
    
    private int orderDetailId;
    private int orderId;
    private int plantId;
    private int price;
    private int quantity;
    
}
