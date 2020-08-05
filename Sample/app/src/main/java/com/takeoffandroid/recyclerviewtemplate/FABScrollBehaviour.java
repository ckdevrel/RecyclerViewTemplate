package com.takeoffandroid.recyclerviewtemplate;

import android.content.Context;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import com.google.android.material.floatingactionbutton.FloatingActionButton;
import android.util.AttributeSet;
import android.view.View;

import org.jetbrains.annotations.NotNull;

public class FABScrollBehaviour extends CoordinatorLayout.Behavior<FloatingActionButton> {
    public FABScrollBehaviour(Context context, AttributeSet attrs) {
        super();
    }

    @Override
    public boolean onStartNestedScroll(@NotNull final CoordinatorLayout coordinatorLayout, @NotNull final FloatingActionButton child,
                                       @NotNull final View directTargetChild, @NotNull final View target, final int nestedScrollAxes,
                                       final int type) {
        return true;
    }

    @Override
    public void onNestedScroll(@NotNull final CoordinatorLayout coordinatorLayout,
                               @NotNull final FloatingActionButton child,
                               @NotNull final View target, final int dxConsumed, final int dyConsumed,
                               final int dxUnconsumed, final int dyUnconsumed, final int type,
                               final int[] consumed) {
        super.onNestedScroll(coordinatorLayout, child, target, dxConsumed, dyConsumed, dxUnconsumed, dyUnconsumed, type, consumed);
        if (dyConsumed > 0 && child.getVisibility() == View.VISIBLE) {
//            child.hide();

            child.hide(new FloatingActionButton.OnVisibilityChangedListener() {
                @Override
                public void onHidden(FloatingActionButton fab) {
                    super.onHidden(fab);
                    fab.setVisibility(View.INVISIBLE);
                }
            });
        } else if (dyConsumed < 0 && child.getVisibility() != View.VISIBLE) {
            child.show();
        }
    }
}
