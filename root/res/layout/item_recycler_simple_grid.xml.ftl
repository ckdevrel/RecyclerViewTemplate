<?xml version="1.0" encoding="utf-8"?>
    <RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
        xmlns:app="http://schemas.android.com/apk/res-auto"
        android:layout_width="match_parent"
        android:layout_height="180dp"
        android:gravity="center">

        <ImageView
            android:id="@+id/img_user"
            android:layout_width="match_parent"
            android:layout_height="match_parent"
            android:adjustViewBounds="true"
            android:alpha="0.9"
            android:scaleType="centerCrop"
            android:background="#16000000" />

            <LinearLayout
                android:layout_width="match_parent"
                android:layout_height="wrap_content"
                android:gravity="center"
                android:orientation="vertical"
                android:layout_alignParentBottom="true"
                android:background="#80000000">

            <TextView
                android:id="@+id/item_txt_title"
                android:layout_width="match_parent"
                android:layout_height="wrap_content"
                android:maxLines="1"
                android:padding="5dp"
                android:text="Title"
                android:textSize="14sp"
                android:textColor="@android:color/white"
                android:gravity="center" />

            <TextView
                android:id="@+id/item_txt_message"
                android:layout_width="match_parent"
                android:layout_height="wrap_content"
                android:maxLines="1"
                android:padding="5dp"
                android:text="Message"
                android:textSize="12sp"
                android:textColor="@android:color/white"
                android:gravity="center" />
        </LinearLayout>

        <#if features == 'radio'>

        <RadioButton
            android:id="@+id/radio_list"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text=""
            android:layout_alignParentRight="true"
            android:layout_alignParentTop="true"
            android:layout_margin="5dp"/>

        </#if>

    </RelativeLayout>
