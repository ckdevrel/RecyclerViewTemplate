package com.takeoffandroid.recyclerviewtemplate.adapter;

import android.content.Context;
import androidx.recyclerview.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.ArrayList;

import androidx.recyclerview.widget.LinearLayoutManager;

import com.takeoffandroid.recyclerviewtemplate.AbstractModel;
import com.takeoffandroid.recyclerviewtemplate.R;


/**
 * A custom adapter to use with the RecyclerView widget.
 */
public class FooterListAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder> {


    private static final int TYPE_ITEM = 1;
    private static final int TYPE_FOOTER = 2;
    private String mFooterTitle;

    private OnFooterClickListener mFooterClickListener;


    private Context mContext;
    private ArrayList<AbstractModel> modelList;

    private OnItemClickListener mItemClickListener;


    public FooterListAdapter(Context context, ArrayList<AbstractModel> modelList, String footerTitle) {
        this.mContext = context;
        this.modelList = modelList;
        this.mFooterTitle = footerTitle;
    }

    public void updateList(ArrayList<AbstractModel> modelList) {
        this.modelList = modelList;
        notifyDataSetChanged();

    }

    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        if (viewType == TYPE_FOOTER) {
            View v = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_recycler_footer, parent, false);
            return new FooterViewHolder(v);
        } else if (viewType == TYPE_ITEM) {
            View v = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_footer_list, parent, false);
            return new ViewHolder(v);
        }
        return null;
    }

    @Override
    public void onBindViewHolder(RecyclerView.ViewHolder holder, final int position) {
        if (holder instanceof FooterViewHolder) {
            FooterViewHolder footerHolder = (FooterViewHolder) holder;

            footerHolder.txtFooter.setText(mFooterTitle);

        } else if (holder instanceof ViewHolder) {
            final AbstractModel model = getItem(position);
            ViewHolder genericViewHolder = (ViewHolder) holder;
            genericViewHolder.itemTxtTitle.setText(model.getTitle());
            genericViewHolder.itemTxtMessage.setText(model.getMessage());


        }
    }

    //    need to override this method
    @Override
    public int getItemViewType(int position) {
        if (isPositionFooter(position)) {
            return TYPE_FOOTER;
        }
        return TYPE_ITEM;
    }

    private boolean isPositionFooter(int position) {
        return position == modelList.size();
    }


    @Override
    public int getItemCount() {

        return modelList.size() + 1;
    }


    private AbstractModel getItem(int position) {
        return modelList.get(position);
    }


    public void SetOnItemClickListener(final OnItemClickListener mItemClickListener) {
        this.mItemClickListener = mItemClickListener;
    }

    public void SetOnFooterClickListener(final OnFooterClickListener footerClickListener) {
        this.mFooterClickListener = footerClickListener;
    }



    public interface OnItemClickListener {
        void onItemClick(View view, int position, AbstractModel model);
    }

    public interface OnFooterClickListener {
        void onFooterClick(View view, String headerTitle);
    }

    class FooterViewHolder extends RecyclerView.ViewHolder {
        TextView txtFooter;

        public FooterViewHolder(final View itemView) {
            super(itemView);
            this.txtFooter = (TextView) itemView.findViewById(R.id.txtFooter);


            itemView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {

                    mFooterClickListener.onFooterClick(itemView, mFooterTitle);
                }
            });

        }
    }

    public class ViewHolder extends RecyclerView.ViewHolder {

        private ImageView imgUser;
        private TextView itemTxtTitle;
        private TextView itemTxtMessage;


        
        public ViewHolder(final View itemView) {
            super(itemView);


            this.imgUser = (ImageView) itemView.findViewById(R.id.img_user);
            this.itemTxtTitle = (TextView) itemView.findViewById(R.id.item_txt_title);
            this.itemTxtMessage = (TextView) itemView.findViewById(R.id.item_txt_message);


            itemView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    mItemClickListener.onItemClick(itemView, getAdapterPosition(), modelList.get(getAdapterPosition()));


                }
            });

        }
    }

}

