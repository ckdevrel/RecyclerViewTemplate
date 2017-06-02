<?xml version="1.0" encoding="utf-8"?>

<#if isToolbar || isSearch>
<LinearLayout
       xmlns:android="http://schemas.android.com/apk/res/android"
       xmlns:tools="http://schemas.android.com/tools"
       xmlns:app="http://schemas.android.com/apk/res-auto"
       android:layout_width="match_parent"
       android:layout_height="match_parent"
       android:orientation="vertical">

       <android.support.v7.widget.Toolbar
           android:id="@+id/toolbar"
           android:layout_width="match_parent"
           android:layout_height="?attr/actionBarSize"
           android:background="#5f8ee4"
           app:popupTheme="@style/ThemeOverlay.AppCompat.Light"
           app:titleTextColor="@android:color/white"
           app:theme="@style/ToolbarStyle"/>

</#if>



      <android.support.v7.widget.RecyclerView
      <#if !isToolbar && !isSearch>
          xmlns:android="http://schemas.android.com/apk/res/android"
          xmlns:tools="http://schemas.android.com/tools"
      </#if>
          android:id="@+id/recycler_view"
          android:scrollbars="vertical"
          android:layout_width="match_parent"
          android:layout_height="match_parent"/>



<#if isToolbar || isSearch>
</LinearLayout>
</#if>
