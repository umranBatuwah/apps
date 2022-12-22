// package com.Asws.co.service.Impl;

// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.security.core.userdetails.UserDetails;
// import org.springframework.security.core.userdetails.UserDetailsService;
// import org.springframework.security.core.userdetails.UsernameNotFoundException;

// import com.Asws.co.repository.UserRepository;
// import com.Asws.co.service.MyUserServiceDetail;

// public class UserDetailServiceImpl implements UserDetailsService{


//     @Autowired
//     private UserRepository userRepository;
    
//     @Override
//     public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//        com.Asws.co.domain.User user = userRepository.getUserByUsername(username);
         
//         if (user == null) {
//             throw new UsernameNotFoundException("Could not find user");
//         }
         
//         return new MyUserServiceDetail(user);
//     }
    
// }
