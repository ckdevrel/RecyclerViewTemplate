package com.takeoffandroid.recyclerviewtemplate;

import android.content.Context;
import android.graphics.Rect;
import androidx.recyclerview.widget.RecyclerView;
import android.view.View;

public class GridMarginDecoration extends RecyclerView.ItemDecoration {
    private int left;
    private int right;
    private int top;
    private int bottom;

    public GridMarginDecoration(Context context, int left, int right, int top, int bottom) {

        this.left = left;
        this.right = right;
        this.top = top;
        this.bottom = bottom;
    }

    @Override
    public void getItemOffsets(
            Rect outRect, View view, RecyclerView parent, RecyclerView.State state) {
        outRect.set(left, top, right, bottom);
    }
}
