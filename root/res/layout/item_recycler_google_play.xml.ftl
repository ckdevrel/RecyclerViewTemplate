<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:background="?android:selectableItemBackground"
    android:orientation="vertical"
    android:paddingBottom="8dp"
    android:paddingTop="8dp">

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:gravity="center_vertical"
        android:orientation="horizontal"
        android:paddingLeft="16dp"
        android:paddingRight="16dp">


        <TextView
            android:id="@+id/item_txt_title"
            android:layout_width="0dp"
            android:layout_height="wrap_content"
            android:layout_weight="1"
            android:text="Sample title"
            android:textColor="@android:color/black"
            android:textSize="18sp" />

        <TextView
            android:id="@+id/item_txt_more"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:padding="16dp"
            android:text="MORE"
            android:textColor="#009688"
            android:textSize="12sp" />


    </LinearLayout>

    <android.support.v7.widget.RecyclerView
        android:id="@+id/recycler_view_horizontal_list"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:layout_gravity="center_vertical"
        android:orientation="horizontal" />


</LinearLayout>
