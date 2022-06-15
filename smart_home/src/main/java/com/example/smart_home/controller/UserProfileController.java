package com.example.smart_home.controller;

import com.example.smart_home.entity.User;
import com.example.smart_home.entity.UserProfile;
import com.example.smart_home.repository.UserProfileRepository;
import com.example.smart_home.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/profile")
public class UserProfileController {
    @Autowired
    UserProfileRepository userProfileRepository;
    @Autowired
    UserRepository userRepository;

    @GetMapping("/findAll")
    public List<UserProfile> findAll(){
        return userProfileRepository.findAll();
    }

    @GetMapping("/findByEmail")
    public UserProfile findProfileByEmail(@RequestParam("email") String email){
        return userProfileRepository.findUserProfileByEmail(email);
    }


    @GetMapping("/findByUsernameLike")
    public List<UserProfile> findByUsernameLike(@RequestParam("username") String usernmae){
        return userProfileRepository.findAllByUsernameContains(usernmae);
    }

    @PostMapping(value="/save")
    public String save(@RequestBody UserProfile userProfile) {
        User user=userRepository.findByEmail(userProfile.getEmail());

        if(user!=null){
            user.setUsername(userProfile.getUsername());//更新用户名
            userRepository.deleteUserByEmail(user.getEmail());
            userRepository.save(user);                  //更新user

            userProfileRepository.deleteUserProfileByEmail(userProfile.getEmail());
            userProfileRepository.save(userProfile);    //更新userProfile
            return "success";
        }
        else
            return "User Don't Exit, Please Register First!";
    }

    @PostMapping(value="/update")
    public String update(@RequestBody UserProfile userProfile) {
        User user=userRepository.findByEmail(userProfile.getEmail());
        if(user!=null){
            user.setUsername(userProfile.getUsername());//更新用户名
            userRepository.deleteUserByEmail(user.getEmail());
            userRepository.save(user);                  //更新user

            userProfileRepository.deleteUserProfileByEmail(userProfile.getEmail());
            userProfileRepository.save(userProfile);    //更新userProfile
            return "success";
        }
        else
            return "User Don't Exit, Please Register First!";
    }

    @GetMapping("/delete")
    public Integer deleteUserProfileByEmail(@RequestParam("email") String email){
        userRepository.deleteUserByEmail(email);
        return  userProfileRepository.deleteUserProfileByEmail(email);
    }

}
