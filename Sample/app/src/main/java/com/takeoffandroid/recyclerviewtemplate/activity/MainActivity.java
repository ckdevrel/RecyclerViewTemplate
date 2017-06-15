package com.takeoffandroid.recyclerviewtemplate.activity;

import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;

import com.takeoffandroid.recyclerviewtemplate.R;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;

/**
 * Created by f22labs on 15/06/17.
 */

public class MainActivity extends AppCompatActivity {

    @BindView(R.id.btn_simple_list)
    Button btnSimpleList;
    @BindView(R.id.btn_simple_list_cards)
    Button btnSimpleListCards;
    @BindView(R.id.btn_simple_grid)
    Button btnSimpleGrid;
    @BindView(R.id.btn_simple_grid_cards)
    Button btnSimpleGridCards;
    @BindView(R.id.btn_banner_list)
    Button btnBannerList;
    @BindView(R.id.btn_banner_grid)
    Button btnBannerGrid;
    @BindView(R.id.btn_radio_list)
    Button btnRadioList;
    @BindView(R.id.btn_radio_grid)
    Button btnRadioGrid;
    @BindView(R.id.btn_check_list)
    Button btnCheckList;
    @BindView(R.id.btn_check_grid)
    Button btnCheckGrid;
    @BindView(R.id.btn_toggle_list)
    Button btnToggleList;
    @BindView(R.id.btn_toggle_grid)
    Button btnToggleGrid;
    @BindView(R.id.btn_header_list)
    Button btnHeaderList;
    @BindView(R.id.btn_header_grid)
    Button btnHeaderGrid;
    @BindView(R.id.btn_footer_list)
    Button btnFooterList;
    @BindView(R.id.btn_footer_grid)
    Button btnFooterGrid;


    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        ButterKnife.bind(this);

    }


//    @Override
//    public void onCreate(@Nullable Bundle savedInstanceState, @Nullable PersistableBundle persistentState) {
//        super.onCreate(savedInstanceState, persistentState);
//        setContentView(R.layout.activity_main);
//        ButterKnife.bind(this);
//    }


    @OnClick({R.id.btn_simple_list, R.id.btn_simple_list_cards, R.id.btn_simple_grid, R.id.btn_simple_grid_cards, R.id.btn_banner_list, R.id.btn_banner_grid, R.id.btn_radio_list, R.id.btn_radio_grid, R.id.btn_check_list, R.id.btn_check_grid, R.id.btn_toggle_list, R.id.btn_toggle_grid, R.id.btn_header_list, R.id.btn_header_grid, R.id.btn_footer_list, R.id.btn_footer_grid})
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
        }
    }
}
