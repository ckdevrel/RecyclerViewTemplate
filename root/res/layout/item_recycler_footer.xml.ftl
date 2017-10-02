<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
              xmlns:card_view="http://schemas.android.com/apk/res-auto"
              <#if layoutorientation == 'horizontal'>
              android:layout_width="200dp"
              <#else>
              android:layout_width="match_parent"
              </#if>
              android:layout_height="180dp"
              android:orientation="vertical">


    <TextView
        android:id="@+id/txtFooter"
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:background="@android:color/holo_blue_dark"
        android:gravity="center"
        android:textColor="@android:color/white"
        android:textSize="16sp"/>
</LinearLayout>
