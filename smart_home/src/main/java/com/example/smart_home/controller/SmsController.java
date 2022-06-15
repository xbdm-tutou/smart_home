package com.example.smart_home.controller;

import com.example.smart_home.entity.SMS;
import com.github.qcloudsms.SmsSingleSender;
import com.github.qcloudsms.SmsSingleSenderResult;
import org.json.JSONException;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.xml.ws.http.HTTPException;
import java.io.IOException;
/*

@RestController
@RequestMapping( value = "send")


public class SmsController {
    @RequestMapping( value = "sendCode",method = RequestMethod.POST)
    public  void sms(@RequestBody SMS sms){
        int appId = 1400686104;
        String appKey = "e7c78634048bde0baba8982f8a38490c";
        int templateId = 466060;
        String smsSign = "智能家居管理123公众号";

        try {
            String params = sms.getCode();
            SmsSingleSender smsSingleSender = new SmsSingleSender(appId,appKey);
            SmsSingleSenderResult result = smsSingleSender.sendWithParam("86",sms.getPhoneNumber(),templateId,params,smsSign,"","");
            System.out.println(result);
        }catch (HTTPException e){
            e.printStackTrace();
        }catch (JSONException e){
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }
    }

} */
