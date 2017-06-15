package com.takeoffandroid.recyclerviewtemplate.adapter;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.ArrayList;

import com.takeoffandroid.recyclerviewtemplate.AbstractModel;
import com.takeoffandroid.recyclerviewtemplate.R;


/**
 * A custom adapter to use with the RecyclerView widget.
 */
public class HeaderFooterListAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder> {


    private static final int TYPE_HEADER = 0;
    private static final int TYPE_ITEM = 1;
    private static final int TYPE_FOOTER = 2;

    private String mHeaderTitle;
    private String mFooterTitle;

    private OnHeaderClickListener mHeaderClickListener;
    private OnFooterClickListener mFooterClickListener;

    private Context mContext;
    private ArrayList<AbstractModel> modelList;

    private OnItemClickListener mItemClickListener;


    public HeaderFooterListAdapter(Context context, ArrayList<AbstractModel> modelList, String headerTitle, String footerTitle) {
        this.mContext = context;
        this.modelList = modelList;
        this.mHeaderTitle = headerTitle;
        this.mFooterTitle = footerTitle;
    }

    public void updateList(ArrayList<AbstractModel> modelList) {
        this.modelList = modelList;
        notifyDataSetChanged();

    }

    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {

        if (viewType == TYPE_HEADER) {
            View v = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_recycler_header, parent, false);
            return new HeaderViewHolder(v);
        } else if (viewType == TYPE_FOOTER) {
            View v = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_recycler_footer, parent, false);
            return new FooterViewHolder(v);
        } else if (viewType == TYPE_ITEM) {
            View v = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_header_footer_list, parent, false);
            return new ViewHolder(v);
        }
        return null;
    }

    @Override
    public void onBindViewHolder(RecyclerView.ViewHolder holder, final int position) {
        if (holder instanceof HeaderViewHolder) {
            HeaderViewHolder headerHolder = (HeaderViewHolder) holder;

            headerHolder.txtTitleHeader.setText(mHeaderTitle);

        } else if (holder instanceof FooterViewHolder) {
            FooterViewHolder footerHolder = (FooterViewHolder) holder;

            footerHolder.txtFooter.setText(mFooterTitle);

        } else if (holder instanceof ViewHolder) {
            final AbstractModel model = getItem(position - 1);
            ViewHolder genericViewHolder = (ViewHolder) holder;
            genericViewHolder.itemTxtTitle.setText(model.getTitle());
            genericViewHolder.itemTxtMessage.setText(model.getMessage());


        }
    }

    //    need to override this method
    @Override
    public int getItemViewType(int position) {
        if (isPositionHeader(position)) {
            return TYPE_HEADER;
        } else if (isPositionFooter(position)) {
            return TYPE_FOOTER;
        }
        return TYPE_ITEM;
    }


    private boolean isPositionHeader(int position) {
        return position == 0;
    }

    private boolean isPositionFooter(int position) {
        return position == modelList.size() + 1;
    }


    @Override
    public int getItemCount() {

        return modelList.size() + 2;
    }

    public void SetOnItemClickListener(final OnItemClickListener mItemClickListener) {
        this.mItemClickListener = mItemClickListener;
    }

    public void SetOnHeaderClickListener(final OnHeaderClickListener headerClickListener) {
        this.mHeaderClickListener = headerClickListener;
    }

    public void SetOnFooterClickListener(final OnFooterClickListener footerClickListener) {
        this.mFooterClickListener = footerClickListener;
    }

    private AbstractModel getItem(int position) {
        return modelList.get(position);
    }

    public interface OnItemClickListener {
        void onItemClick(View view, int position, AbstractModel model);
    }

    public interface OnHeaderClickListener {
        void onHeaderClick(View view, String headerTitle);
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

    class HeaderViewHolder extends RecyclerView.ViewHolder {
        TextView txtTitleHeader;

        public HeaderViewHolder(final View itemView) {
            super(itemView);
            this.txtTitleHeader = (TextView) itemView.findViewById(R.id.txtHeader);


            itemView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {

                    mHeaderClickListener.onHeaderClick(itemView, mHeaderTitle);
                }
            });

        }
    }

    public class ViewHolder extends RecyclerView.ViewHolder {

        private ImageView imgUser;
        private TextView itemTxtTitle;
        private TextView itemTxtMessage;


        // @BindView(R.id.img_user)
        // ImageView imgUser;
        // @BindView(R.id.item_txt_title)
        // TextView itemTxtTitle;
        // @BindView(R.id.item_txt_message)
        // TextView itemTxtMessage;
        // @BindView(R.id.radio_list)
        // RadioButton itemTxtMessage;
        // @BindView(R.id.check_list)
        // CheckBox itemCheckList;
        public ViewHolder(final View itemView) {
            super(itemView);

            // ButterKnife.bind(this, itemView);

            this.imgUser = (ImageView) itemView.findViewById(R.id.img_user);
            this.itemTxtTitle = (TextView) itemView.findViewById(R.id.item_txt_title);
            this.itemTxtMessage = (TextView) itemView.findViewById(R.id.item_txt_message);


            itemView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {

                    mItemClickListener.onItemClick(itemView, getAdapterPosition(), modelList.get(getAdapterPosition() - 1));


                }
            });

        }
    }

}

