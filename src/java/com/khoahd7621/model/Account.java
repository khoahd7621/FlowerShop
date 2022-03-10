package com.khoahd7621.model;

import java.io.Serializable;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
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
public class Account implements Serializable{
    
    private int accId;
    private String email;
    private String password;
    private String fullName;
    private int status;
    private String phone;
    private int role;
    
}
