<?xml version="1.0" encoding="utf-8"?>
<android.support.design.widget.CoordinatorLayout
    xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:layout_width="match_parent"
    android:layout_height="match_parent">



    <#if !isFragment && (isToolbar || isSearch)>
    <LinearLayout
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
    <android.support.v4.widget.SwipeRefreshLayout
      android:id="@+id/swipe_refresh_recycler_list"
      android:layout_width="match_parent"
      android:layout_height="match_parent">

          <android.support.v7.widget.RecyclerView
              android:id="@+id/recycler_view"
              android:scrollbars="vertical"
              android:layout_width="match_parent"
              android:layout_height="match_parent"/>


    </android.support.v4.widget.SwipeRefreshLayout>

    <#if !isFragment && (isToolbar || isSearch)>
    </LinearLayout>
    </#if>

<android.support.design.widget.FloatingActionButton
     android:id="@+id/fab"
     android:layout_width="wrap_content"
     android:layout_height="wrap_content"
     android:layout_margin="24dp"
     android:src="@drawable/abc_ic_search_api_material"
     app:backgroundTint="#6CC887"
     app:borderWidth="0dp"
     app:elevation="6dp"
     app:fabSize="normal"
     app:layout_anchor="@+id/recycler_view"
     app:layout_anchorGravity="bottom|end"
     app:layout_behavior="${packageName}.FABScrollBehaviour"/>


</android.support.design.widget.CoordinatorLayout>
