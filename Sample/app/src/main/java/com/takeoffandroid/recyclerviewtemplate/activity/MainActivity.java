package com.takeoffandroid.recyclerviewtemplate.activity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;

import androidx.appcompat.app.AppCompatActivity;

import com.takeoffandroid.recyclerviewtemplate.R;

/**
 * Created by f22labs on 15/06/17.
 * Reworked by Cyb3rKo on 05/08/20.
 */

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.btn_simple_list:
                startActivity(new Intent(MainActivity.this, SimpleListActivity.class));
                break;
            case R.id.btn_simple_list_cards:
                startActivity(new Intent(MainActivity.this, SimpleListCardsActivity.class));
                break;
            case R.id.btn_simple_grid:
                startActivity(new Intent(MainActivity.this, SimpleGridActivity.class));
                break;
            case R.id.btn_simple_grid_cards:
                startActivity(new Intent(MainActivity.this, SimpleGridCardsActivity.class));
                break;
            case R.id.btn_banner_list:
                startActivity(new Intent(MainActivity.this, BannerListActivity.class));
                break;
            case R.id.btn_banner_grid:
                startActivity(new Intent(MainActivity.this, BannerGridActivity.class));
                break;
            case R.id.btn_radio_list:
                startActivity(new Intent(MainActivity.this, RadioListActivity.class));
                break;
            case R.id.btn_radio_grid:
                startActivity(new Intent(MainActivity.this, RadioGridActivity.class));
                break;
            case R.id.btn_check_list:
                startActivity(new Intent(MainActivity.this, CheckboxListActivity.class));
                break;
            case R.id.btn_check_grid:
                startActivity(new Intent(MainActivity.this, CheckboxGridActivity.class));
                break;
            case R.id.btn_toggle_list:
                startActivity(new Intent(MainActivity.this, ToggleListActivity.class));
                break;
            case R.id.btn_toggle_grid:
                startActivity(new Intent(MainActivity.this, ToggleGridActivity.class));
                break;
            case R.id.btn_header_list:
                startActivity(new Intent(MainActivity.this, HeaderListActivity.class));
                break;
            case R.id.btn_header_grid:
                startActivity(new Intent(MainActivity.this, HeaderGridActivity.class));
                break;
            case R.id.btn_footer_list:
                startActivity(new Intent(MainActivity.this, FooterListActivity.class));
                break;
            case R.id.btn_footer_grid:
                startActivity(new Intent(MainActivity.this, FooterGridActivity.class));
                break;
            case R.id.btn_header_footer_list:
                startActivity(new Intent(MainActivity.this, HeaderFooterListActivity.class));
                break;
            case R.id.btn_header_footer_grid:
                startActivity(new Intent(MainActivity.this, HeaderFooterGridActivity.class));
                break;
            case R.id.btn_google_play:
                startActivity(new Intent(MainActivity.this, GooglePlayActivity.class));
                break;
        }
    }
}
