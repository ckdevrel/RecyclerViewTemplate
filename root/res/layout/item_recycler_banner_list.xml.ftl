<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout
    android:id="@+id/parent_list_map"
    xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:background="@android:color/white">

    <ImageView
        android:id="@+id/img_user"
        android:layout_width="match_parent"
        android:layout_height="200dp"
        android:scaleType="centerCrop"
        android:background="#16000000"/>


    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:layout_alignBottom="@+id/img_user"
        android:layout_alignParentLeft="true"
        android:layout_alignParentStart="true"
        android:orientation="vertical"
        android:paddingBottom="10dp"
        android:paddingLeft="10dp"
        android:paddingRight="10dp"
        android:paddingTop="16dp"
        android:background="#66000000">

        <TextView
            android:id="@+id/item_txt_title"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:singleLine="true"
            android:textColor="@android:color/white"
            android:textSize="16sp"
            android:textStyle="bold"/>


        <TextView
            android:id="@+id/item_txt_message"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:layout_marginTop="5dp"
            android:singleLine="true"
            android:textColor="@android:color/white"
            android:textSize="14sp"/>


    </LinearLayout>

</RelativeLayout>
