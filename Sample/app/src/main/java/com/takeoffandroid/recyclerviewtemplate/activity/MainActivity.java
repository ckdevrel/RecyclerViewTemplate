package com.takeoffandroid.recyclerviewtemplate.activity;

import android.content.Intent;
import android.os.Bundle;
import android.os.PersistableBundle;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;

import com.takeoffandroid.recyclerviewtemplate.R;

import butterknife.BindView;
import butterknife.ButterKnife;

/**
 * Created by f22labs on 15/06/17.
 */

public class MainActivity extends AppCompatActivity {


    @BindView(R.id.btn_simple_list)
    Button btnSimpleList;
    @BindView(R.id.btn_simple_list_all)
    Button btnSimpleListAll;
    @BindView(R.id.btn_simple_list_all_cards)
    Button btnSimpleListAllCards;
    @BindView(R.id.btn_simple_grid)
    Button btnSimpleGrid;
    @BindView(R.id.btn_simple_grid_all)
    Button btnSimpleGridAll;
    @BindView(R.id.btn_simple_grid_all_cards)
    Button btnSimpleGridAllCards;

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


    @butterknife.OnClick({R.id.btn_simple_list, R.id.btn_simple_list_all, R.id.btn_simple_list_all_cards, R.id.btn_simple_grid, R.id.btn_simple_grid_all, R.id.btn_simple_grid_all_cards})
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.btn_simple_list:

                startActivity(new Intent(MainActivity.this, SimpleListAcivity.class));
                break;
            case R.id.btn_simple_list_all:

                startActivity(new Intent(MainActivity.this, SimpleListAllActivity.class));

                break;
            case R.id.btn_simple_list_all_cards:

                startActivity(new Intent(MainActivity.this, SimpleListAllCardsActivity.class));

                break;
            case R.id.btn_simple_grid:

                startActivity(new Intent(MainActivity.this, SimpleGridActivity.class));

                break;
            case R.id.btn_simple_grid_all:

                startActivity(new Intent(MainActivity.this, SimpleGridAllActivity.class));

                break;
            case R.id.btn_simple_grid_all_cards:

                startActivity(new Intent(MainActivity.this, SimpleGridAllCardsActivity.class));

                break;
        }
    }
}
