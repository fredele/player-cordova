/*
       Licensed to the Apache Software Foundation (ASF) under one
       or more contributor license agreements.  See the NOTICE file
       distributed with this work for additional information
       regarding copyright ownership.  The ASF licenses this file
       to you under the Apache License, Version 2.0 (the
       "License"); you may not use this file except in compliance
       with the License.  You may obtain a copy of the License at

         http://www.apache.org/licenses/LICENSE-2.0

       Unless required by applicable law or agreed to in writing,
       software distributed under the License is distributed on an
       "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
       KIND, either express or implied.  See the License for the
       specific language governing permissions and limitations
       under the License.
 */

package com.player;

import android.os.Bundle;

import org.apache.cordova.*;
import android.os.Bundle;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.webkit.WebView;
import org.apache.cordova.*;
import android.content.pm.PackageManager;

public class MainActivity extends CordovaActivity
{
    @Override
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);

        // enable Cordova apps to be started in the background
        Bundle extras = getIntent().getExtras();
        if (extras != null && extras.getBoolean("cdvStartInBackground", false)) {
            moveTaskToBack(true);
        }
        
        loadUrl(launchUrl);

        // Set by <content src="index.html" /> in config.xml
        
        // Convertit dp en pixels (24dp ≈ marge confortable)
        float density = getResources().getDisplayMetrics().density;
        
        boolean isAndroidTV = getPackageManager().hasSystemFeature("android.software.leanback");
                
        int marginDp = isAndroidTV ? 24 : 0;
        int marginPx = (int) (marginDp * density);
        
        ViewGroup root = (ViewGroup) findViewById(android.R.id.content);
        WebView webView = (WebView) appView.getEngine().getView();
        
        ((ViewGroup) webView.getParent()).removeView(webView);
        
        FrameLayout wrapper = new FrameLayout(this);
        wrapper.setBackgroundColor(0xFF000000);
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
        FrameLayout.LayoutParams.MATCH_PARENT,
        FrameLayout.LayoutParams.MATCH_PARENT
        );
        

        
        params.setMargins(marginPx, marginPx, marginPx, marginPx);
        wrapper.addView(webView, params);
        root.addView(wrapper);
        
    }
}
