
/**
 * A custom adapter to use with the RecyclerView widget.
 */
public class ${adapterClass} extends RecyclerView.Adapter<RecyclerView.ViewHolder> {

  <#if isHeader && isFooter>

  private static final int TYPE_HEADER = 0;
  private static final int TYPE_ITEM = 1;
  private static final int TYPE_FOOTER = 2;

  private String mHeaderTitle;
  private String mFooterTitle;

  <#if isItemClick>
  private OnHeaderClickListener mHeaderClickListener;
  private OnFooterClickListener mFooterClickListener;
  </#if>

    <#elseif isHeader>

    private static final int TYPE_HEADER = 0;
    private static final int TYPE_ITEM = 1;
    private String mHeaderTitle;

    <#if isItemClick>
    private OnHeaderClickListener mHeaderClickListener;
    </#if>

    <#elseif isFooter>

      private static final int TYPE_ITEM = 1;
      private static final int TYPE_FOOTER = 2;
      private String mFooterTitle;

      <#if isItemClick>
      private OnFooterClickListener mFooterClickListener;
      </#if>



  </#if>
    private Context mContext;
    private ArrayList<${adapterModelClass}> modelList;

    <#if isItemClick>
    private OnItemClickListener mItemClickListener;
    </#if>

    <#if features == 'checkbox' || features == 'toggle'>
    private OnCheckedListener mOnCheckedListener;
    </#if>

    <#if features == 'radio'>
    private int lastCheckedPosition = -1;
    </#if>

    <#if features == 'checkbox' || features == 'toggle'>
    private Set<Integer> checkSet = new HashSet<>();
    </#if>


    public void updateList(ArrayList<${adapterModelClass}> modelList) {
            this.modelList = modelList;
            notifyDataSetChanged();

    }

    <#if isHeader && isFooter>

    public ${adapterClass}(Context context, ArrayList<${adapterModelClass}> modelList, String headerTitle, String footerTitle) {
            this.mContext = context;
            this.modelList = modelList;
            this.mHeaderTitle = headerTitle;
            this.mFooterTitle = footerTitle;
    }


    @Override
    public RecyclerView.ViewHolder onCreateViewHolder (ViewGroup parent, int viewType) {

        if(viewType == TYPE_HEADER) {
          View v = LayoutInflater.from (parent.getContext ()).inflate (R.layout.${itemLayoutHeaderName}, parent, false);
          return new HeaderViewHolder (v);
      } else if(viewType == TYPE_FOOTER) {
          View v = LayoutInflater.from (parent.getContext ()).inflate (R.layout.${itemLayoutFooterName}, parent, false);
          return new FooterViewHolder (v);
      } else if(viewType == TYPE_ITEM) {
          View v = LayoutInflater.from (parent.getContext ()).inflate (R.layout.${itemLayoutName}, parent, false);
          return new ${itemClass} (v);
      }
        return null;
    }

    @Override
    public void onBindViewHolder (RecyclerView.ViewHolder holder, final int position) {
        if(holder instanceof HeaderViewHolder) {
            HeaderViewHolder headerHolder = (HeaderViewHolder) holder;

            headerHolder.txtTitleHeader.setText(mHeaderTitle);

        }else if(holder instanceof FooterViewHolder) {
            FooterViewHolder footerHolder = (FooterViewHolder) holder;

            footerHolder.txtFooter.setText(mFooterTitle);

          }else if(holder instanceof ${itemClass}) {
            final ${adapterModelClass} model = getItem (position - 1);
            ${itemClass} genericViewHolder = (${itemClass}) holder;
            genericViewHolder.itemTxtTitle.setText (model.getTitle ());
            genericViewHolder.itemTxtMessage.setText (model.getMessage ());

            <#if features == 'radio'>

            genericViewHolder.radioList.setChecked(position == lastCheckedPosition);

            genericViewHolder.radioList.setOnClickListener(new View.OnClickListener() {
             @Override
             public void onClick(View view) {

                 lastCheckedPosition = position;
                 notifyItemRangeChanged(0, modelList.size());

                 mItemClickListener.onItemClick(view, position,model);

             }
          });
          </#if>


          <#if features == 'checkbox'>

          //in some cases, it will prevent unwanted situations
          genericViewHolder.itemCheckList.setOnCheckedChangeListener(null);

          //if true, your checkbox will be selected, else unselected
          genericViewHolder.itemCheckList.setChecked(checkSet.contains(position));

          genericViewHolder.itemCheckList.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
           @Override
           public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {

               if(isChecked){
                 checkSet.add(position);
               }else{
                 checkSet.remove(position);
               }

               mOnCheckedListener.onChecked(buttonView, isChecked, position, model);

           }
          });

          </#if>

          <#if features == 'toggle'>


          genericViewHolder.itemSwitchList.setOnCheckedChangeListener(null);

          //if true, your checkbox will be selected, else unselected
          genericViewHolder.itemSwitchList.setChecked(checkSet.contains(position));

          genericViewHolder.itemSwitchList.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
           @Override
           public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {

               if(isChecked){
                 checkSet.add(position);
               }else{
                 checkSet.remove(position);
               }

               mOnCheckedListener.onChecked(buttonView, isChecked, position, model);

           }
          });

          </#if>


    }
    }

            //    need to override this method
            @Override
         public int getItemViewType (int position) {
             if(isPositionHeader (position)) {
                 return TYPE_HEADER;
             } else if(isPositionFooter (position)) {
                 return TYPE_FOOTER;
             }
             return TYPE_ITEM;
         }


        private boolean isPositionHeader (int position) {
            return position == 0;
        }

        private boolean isPositionFooter (int position) {
              return position == modelList.size () + 1;
        }


    @Override
    public int getItemCount() {

        return modelList.size() + 2;
    }


    class FooterViewHolder extends RecyclerView.ViewHolder {
        TextView txtFooter;

        public FooterViewHolder (final View itemView) {
            super (itemView);
            this.txtFooter = (TextView) itemView.findViewById (R.id.txtFooter);

            <#if isItemClick>

            itemView.setOnClickListener(new View.OnClickListener() {
               @Override
               public void onClick(View view) {

                   mFooterClickListener.onFooterClick(itemView,mFooterTitle);
               }
           });

           </#if>
        }
    }


    class HeaderViewHolder extends RecyclerView.ViewHolder {
        TextView txtTitleHeader;

        public HeaderViewHolder (final View itemView) {
            super (itemView);
            this.txtTitleHeader = (TextView) itemView.findViewById (R.id.txt_header);

            <#if isItemClick>

            itemView.setOnClickListener(new View.OnClickListener() {
               @Override
               public void onClick(View view) {

                   mHeaderClickListener.onHeaderClick(itemView,mHeaderTitle);
               }
           });

           </#if>
        }
    }


    <#if isItemClick>

      public interface OnItemClickListener {
              void onItemClick(View view, int position,${adapterModelClass} model);
      }

      public void SetOnItemClickListener(final OnItemClickListener mItemClickListener) {
              this.mItemClickListener = mItemClickListener;
      }

      public interface OnHeaderClickListener {
              void onHeaderClick(View view, String headerTitle);
      }

      public void SetOnHeaderClickListener(final OnHeaderClickListener headerClickListener) {
              this.mHeaderClickListener = headerClickListener;
      }

      public interface OnFooterClickListener {
              void onFooterClick(View view, String headerTitle);
      }

      public void SetOnFooterClickListener(final OnFooterClickListener footerClickListener) {
              this.mFooterClickListener = footerClickListener;
      }


      <#if features == 'checkbox' || features == 'toggle'>

      public void SetOnCheckedListener(final OnCheckedListener onCheckedListener) {
            this.mOnCheckedListener = onCheckedListener;

        }

        public interface OnCheckedListener {
            void onChecked(View view, boolean isChecked, int position, AbstractModel model);
        }

      </#if>

    </#if>

    <#elseif isHeader>

    public ${adapterClass}(Context context, ArrayList<${adapterModelClass}> modelList, String headerTitle) {
            this.mContext = context;
            this.modelList = modelList;
            this.mHeaderTitle = headerTitle;
    }

    @Override
    public RecyclerView.ViewHolder onCreateViewHolder (ViewGroup parent, int viewType) {
        if(viewType == TYPE_HEADER) {
            View v = LayoutInflater.from (parent.getContext ()).inflate (R.layout.${itemLayoutHeaderName}, parent, false);
            return new HeaderViewHolder (v);
        } else if(viewType == TYPE_ITEM) {
            View v = LayoutInflater.from (parent.getContext ()).inflate (R.layout.${itemLayoutName}, parent, false);
            return new ${itemClass} (v);
        }
        return null;
    }

    @Override
    public void onBindViewHolder (RecyclerView.ViewHolder holder, final int position) {
        if(holder instanceof HeaderViewHolder) {
            HeaderViewHolder headerHolder = (HeaderViewHolder) holder;

            headerHolder.txtTitleHeader.setText(mHeaderTitle);

        } else if(holder instanceof ${itemClass}) {
            final ${adapterModelClass} model = getItem (position - 1);
            ${itemClass} genericViewHolder = (${itemClass}) holder;
            genericViewHolder.itemTxtTitle.setText (model.getTitle ());
            genericViewHolder.itemTxtMessage.setText (model.getMessage ());

            <#if features == 'radio'>

            genericViewHolder.radioList.setChecked(position == lastCheckedPosition);

            genericViewHolder.radioList.setOnClickListener(new View.OnClickListener() {
             @Override
             public void onClick(View view) {

                 lastCheckedPosition = position;
                 notifyItemRangeChanged(0, modelList.size());

                 mItemClickListener.onItemClick(view, position,model);

             }
         });
         </#if>


         <#if features == 'checkbox'>

         //in some cases, it will prevent unwanted situations
       genericViewHolder.itemCheckList.setOnCheckedChangeListener(null);

       //if true, your checkbox will be selected, else unselected
       genericViewHolder.itemCheckList.setChecked(checkSet.contains(position));

       genericViewHolder.itemCheckList.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
           @Override
           public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {

               if(isChecked){
                 checkSet.add(position);
               }else{
                 checkSet.remove(position);
               }

               mOnCheckedListener.onChecked(buttonView, isChecked, position, model);

           }
       });

       </#if>


       <#if features == 'toggle'>


       genericViewHolder.itemSwitchList.setOnCheckedChangeListener(null);

       //if true, your checkbox will be selected, else unselected
       genericViewHolder.itemSwitchList.setChecked(checkSet.contains(position));

       genericViewHolder.itemSwitchList.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
        @Override
        public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {

            if(isChecked){
              checkSet.add(position);
            }else{
              checkSet.remove(position);
            }

            mOnCheckedListener.onChecked(buttonView, isChecked, position, model);

        }
       });

       </#if>

    }
  }

    @Override
    public int getItemViewType (int position) {
    if(isPositionHeader (position)) {
        return TYPE_HEADER;
    }
        return TYPE_ITEM;
    }

    private boolean isPositionHeader (int position) {
        return position == 0;
    }


    @Override
    public int getItemCount() {

        return modelList.size() + 1;
    }


    class HeaderViewHolder extends RecyclerView.ViewHolder {
        TextView txtTitleHeader;

        public HeaderViewHolder (final View itemView) {
            super (itemView);
            this.txtTitleHeader = (TextView) itemView.findViewById (R.id.txt_header);

            <#if isItemClick>

            itemView.setOnClickListener(new View.OnClickListener() {
               @Override
               public void onClick(View view) {

                   mHeaderClickListener.onHeaderClick(itemView,mHeaderTitle);
               }
           });

           </#if>
        }
    }

  <#if isItemClick>

    public interface OnItemClickListener {
            void onItemClick(View view, int position,${adapterModelClass} model);
    }

    public void SetOnItemClickListener(final OnItemClickListener mItemClickListener) {
            this.mItemClickListener = mItemClickListener;
    }

    public interface OnHeaderClickListener {
            void onHeaderClick(View view, String headerTitle);
    }

    public void SetOnHeaderClickListener(final OnHeaderClickListener headerClickListener) {
            this.mHeaderClickListener = headerClickListener;
    }

    <#if features == 'checkbox' || features == 'toggle'>

    public void SetOnCheckedListener(final OnCheckedListener onCheckedListener) {
          this.mOnCheckedListener = onCheckedListener;

      }

      public interface OnCheckedListener {
          void onChecked(View view, boolean isChecked, int position, AbstractModel model);
      }

    </#if>

  </#if>


  <#elseif isFooter>


      public ${adapterClass}(Context context, ArrayList<${adapterModelClass}> modelList, String footerTitle) {
              this.mContext = context;
              this.modelList = modelList;
              this.mFooterTitle = footerTitle;
      }

      @Override
      public RecyclerView.ViewHolder onCreateViewHolder (ViewGroup parent, int viewType) {
          if(viewType == TYPE_FOOTER) {
              View v = LayoutInflater.from (parent.getContext ()).inflate (R.layout.${itemLayoutFooterName}, parent, false);
              return new FooterViewHolder (v);
          } else if(viewType == TYPE_ITEM) {
              View v = LayoutInflater.from (parent.getContext ()).inflate (R.layout.${itemLayoutName}, parent, false);
              return new ${itemClass} (v);
          }
          return null;
      }

      @Override
      public void onBindViewHolder (RecyclerView.ViewHolder holder, final int position) {
          if(holder instanceof FooterViewHolder) {
              FooterViewHolder footerHolder = (FooterViewHolder) holder;

              footerHolder.txtFooter.setText(mFooterTitle);

          } else if(holder instanceof ${itemClass}) {
              final ${adapterModelClass} model = getItem (position);
              ${itemClass} genericViewHolder = (${itemClass}) holder;
              genericViewHolder.itemTxtTitle.setText (model.getTitle ());
              genericViewHolder.itemTxtMessage.setText (model.getMessage ());

              <#if features == 'radio'>

              genericViewHolder.radioList.setChecked(position == lastCheckedPosition);

              genericViewHolder.radioList.setOnClickListener(new View.OnClickListener() {
               @Override
               public void onClick(View view) {

                   lastCheckedPosition = position;
                   notifyItemRangeChanged(0, modelList.size());

                   mItemClickListener.onItemClick(view, position,model);

               }
            });
            </#if>


            <#if features == 'checkbox'>

            //in some cases, it will prevent unwanted situations
            genericViewHolder.itemCheckList.setOnCheckedChangeListener(null);

            //if true, your checkbox will be selected, else unselected
            genericViewHolder.itemCheckList.setChecked(checkSet.contains(position));

            genericViewHolder.itemCheckList.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
             @Override
             public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {

                 if(isChecked){
                   checkSet.add(position);
                 }else{
                   checkSet.remove(position);
                 }

                 mOnCheckedListener.onChecked(buttonView, isChecked, position, model);

             }
            });

            </#if>

            <#if features == 'toggle'>


            genericViewHolder.itemSwitchList.setOnCheckedChangeListener(null);

            //if true, your checkbox will be selected, else unselected
            genericViewHolder.itemSwitchList.setChecked(checkSet.contains(position));

            genericViewHolder.itemSwitchList.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
             @Override
             public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {

                 if(isChecked){
                   checkSet.add(position);
                 }else{
                   checkSet.remove(position);
                 }

                 mOnCheckedListener.onChecked(buttonView, isChecked, position, model);

             }
            });

            </#if>


      }
    }

              //    need to override this method
          @Override
          public int getItemViewType (int position) {
            if(isPositionFooter(position)) {
                return TYPE_FOOTER;
            }
            return TYPE_ITEM;
        }

        private boolean isPositionFooter (int position) {
              return position == modelList.size ();
        }


      @Override
      public int getItemCount() {

          return modelList.size() + 1;
      }



      class FooterViewHolder extends RecyclerView.ViewHolder {
          TextView txtFooter;

          public FooterViewHolder (final View itemView) {
              super (itemView);
              this.txtFooter = (TextView) itemView.findViewById (R.id.txtFooter);

              <#if isItemClick>

              itemView.setOnClickListener(new View.OnClickListener() {
                 @Override
                 public void onClick(View view) {

                     mFooterClickListener.onFooterClick(itemView,mFooterTitle);
                 }
             });

             </#if>
          }
      }

          <#if isItemClick>

              public interface OnItemClickListener {
                      void onItemClick(View view, int position,${adapterModelClass} model);
              }

              public void SetOnItemClickListener(final OnItemClickListener mItemClickListener) {
                      this.mItemClickListener = mItemClickListener;
              }

              public interface OnFooterClickListener {
                      void onFooterClick(View view, String headerTitle);
              }

              public void SetOnFooterClickListener(final OnFooterClickListener footerClickListener) {
                      this.mFooterClickListener = footerClickListener;
              }

              <#if features == 'checkbox' || features == 'toggle'>

              public void SetOnCheckedListener(final OnCheckedListener onCheckedListener) {
                    this.mOnCheckedListener = onCheckedListener;

                }

              public interface OnCheckedListener {
                  void onChecked(View view, boolean isChecked, int position, AbstractModel model);
              }

              </#if>

          </#if>


    <#else>

    public ${adapterClass}(Context context, ArrayList<${adapterModelClass}> modelList) {
            this.mContext = context;
            this.modelList = modelList;
    }


    @Override
    public ${itemClass} onCreateViewHolder(ViewGroup viewGroup, int viewType) {

        View view = LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.${itemLayoutName}, viewGroup, false);

        return new ${itemClass}(view);
    }

    @Override
     public void onBindViewHolder(RecyclerView.ViewHolder holder, final int position) {

         //Here you can fill your row view
      if(holder instanceof ${itemClass}) {
           final ${adapterModelClass} model = getItem (position);
           ${itemClass} genericViewHolder = (${itemClass}) holder;

             genericViewHolder.itemTxtTitle.setText(model.getTitle());
             genericViewHolder.itemTxtMessage.setText(model.getMessage());

             <#if features == 'radio'>

             genericViewHolder.radioList.setChecked(position == lastCheckedPosition);

             genericViewHolder.radioList.setOnClickListener(new View.OnClickListener() {
              @Override
              public void onClick(View view) {

                  lastCheckedPosition = position;
                  notifyItemRangeChanged(0, modelList.size());

                  mItemClickListener.onItemClick(view, position,model);

              }
          });
          </#if>



       <#if features == 'checkbox'>

       //in some cases, it will prevent unwanted situations
     genericViewHolder.itemCheckList.setOnCheckedChangeListener(null);

     //if true, your checkbox will be selected, else unselected
     genericViewHolder.itemCheckList.setChecked(checkSet.contains(position));

     genericViewHolder.itemCheckList.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
         @Override
         public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {

             if(isChecked){
               checkSet.add(position);
             }else{
               checkSet.remove(position);
             }

             mOnCheckedListener.onChecked(buttonView, isChecked, position, model);

         }
     });

     </#if>

     <#if features == 'toggle'>


     genericViewHolder.itemSwitchList.setOnCheckedChangeListener(null);

     //if true, your checkbox will be selected, else unselected
     genericViewHolder.itemSwitchList.setChecked(checkSet.contains(position));

     genericViewHolder.itemSwitchList.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
      @Override
      public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {

          if(isChecked){
            checkSet.add(position);
          }else{
            checkSet.remove(position);
          }

          mOnCheckedListener.onChecked(buttonView, isChecked, position, model);

      }
     });

     </#if>


     }
   }


     @Override
     public int getItemCount() {

         return modelList.size();
     }


     <#if isItemClick>

         public interface OnItemClickListener {
                 void onItemClick(View view, int position,${adapterModelClass} model);
         }

         public void SetOnItemClickListener(final OnItemClickListener mItemClickListener) {
                 this.mItemClickListener = mItemClickListener;
         }

         <#if features == 'checkbox' || features == 'toggle'>

         public void SetOnCheckedListener(final OnCheckedListener onCheckedListener) {
               this.mOnCheckedListener = onCheckedListener;

           }

         public interface OnCheckedListener {
             void onChecked(View view, boolean isChecked, int position, AbstractModel model);
         }

         </#if>
     </#if>



    </#if>





    private ${adapterModelClass} getItem (int position) {
       return modelList.get (position);
   }


    public class ${itemClass} extends RecyclerView.ViewHolder {

        private ImageView imgUser;
        private TextView itemTxtTitle;
        private TextView itemTxtMessage;
        <#if features == 'radio'>
        private RadioButton radioList;
        </#if>

        <#if features == 'checkbox'>

        private CheckBox itemCheckList;
        </#if>

        <#if features == 'toggle'>

        private SwitchCompat itemSwitchList;
        </#if>
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
        public ${itemClass}(final View itemView) {
            super(itemView);

            // ButterKnife.bind(this, itemView);

            this.imgUser = (ImageView) itemView.findViewById(R.id.img_user);
            this.itemTxtTitle = (TextView) itemView.findViewById(R.id.item_txt_title);
            this.itemTxtMessage = (TextView) itemView.findViewById(R.id.item_txt_message);
            <#if features == 'radio'>
            this.radioList = (RadioButton) itemView.findViewById(R.id.radio_list);
            </#if>
            <#if features == 'checkbox'>
            this.itemCheckList = (CheckBox) itemView.findViewById(R.id.check_list);
            </#if>

            <#if features == 'toggle'>
            this.itemSwitchList = (SwitchCompat) itemView.findViewById(R.id.switch_list);
            </#if>


            <#if isItemClick>

            itemView.setOnClickListener(new View.OnClickListener() {
             @Override
             public void onClick(View view) {
            <#if features == 'radio'>
                 lastCheckedPosition = getAdapterPosition();
                 notifyItemRangeChanged(0, modelList.size());
            </#if>
            <#if isHeader>

                 mItemClickListener.onItemClick(itemView, getAdapterPosition(),modelList.get(getAdapterPosition()-1));

            <#else>
                  mItemClickListener.onItemClick(itemView, getAdapterPosition(),modelList.get(getAdapterPosition()));

            </#if>

             }
         });

            </#if>
        }
    }

}
