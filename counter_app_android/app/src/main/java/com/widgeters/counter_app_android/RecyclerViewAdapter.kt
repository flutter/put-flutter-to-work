package com.widgeters.counter_app_android

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.ProgressBar
import android.widget.TextView
import androidx.annotation.NonNull
import androidx.recyclerview.widget.RecyclerView
import androidx.recyclerview.widget.RecyclerView.ViewHolder

class RecyclerViewAdapter internal constructor(private val itemList: List<String>) :
RecyclerView.Adapter<ViewHolder>() {

   private val VIEW_TYPE_ITEM = 0
   private val VIEW_TYPE_LOADING = 1

   private val CATEGORY = "Category"
   private val CONTENT = "Lorem ipsum dolor sit amet..."
   private val DATE = "13 Jan, 2022"

   @NonNull
   override fun onCreateViewHolder(
   @NonNull parent: ViewGroup,
   viewType: Int
   ): ViewHolder {
      return if (viewType == VIEW_TYPE_ITEM) {
         val view =
         LayoutInflater.from(parent.context).inflate(R.layout.item_row, parent, false)
         ItemViewHolder(view)
      } else {
         val view = LayoutInflater.from(parent.context)
         .inflate(R.layout.item_loading, parent, false)
         LoadingViewHolder(view)
      }
   }
   override fun onBindViewHolder(@NonNull viewHolder: ViewHolder, position: Int) {
      if (viewHolder is ItemViewHolder) {
         populateItemRows(viewHolder, position)
      } else if (viewHolder is LoadingViewHolder) {
         showLoadingView(viewHolder, position)
      }
   }
   override fun getItemViewType(position: Int): Int {
      return if (itemList.size -1 == position) VIEW_TYPE_LOADING else VIEW_TYPE_ITEM
   }
   private inner class ItemViewHolder constructor(@NonNull itemView: View) :
   ViewHolder(itemView) {
      var imageItem: ImageView = itemView.findViewById(R.id.cardViewImage)
      var categoryItem: TextView = itemView.findViewById(R.id.category)
      var contentItem: TextView = itemView.findViewById(R.id.content)
      var dateItem: TextView = itemView.findViewById(R.id.dateText)
   }

   private class LoadingViewHolder constructor(itemView: View) :
   ViewHolder(itemView) {
      var progressBar: ProgressBar = itemView.findViewById(R.id.progressBar)
   }
   override fun getItemCount(): Int {
      return itemList.size
   }
   private fun showLoadingView(viewHolder: LoadingViewHolder, position: Int) {
   }
   private fun populateItemRows(viewHolder: ItemViewHolder, position: Int) {
      viewHolder.categoryItem.text = CATEGORY
      viewHolder.contentItem.text = CONTENT
      viewHolder.dateItem.text = DATE

      when(position%3){
         0->{
            viewHolder.imageItem.setImageResource(R.drawable.placeholder_image);
         }
         1->{
            viewHolder.imageItem.setImageResource(R.drawable.placeholder_image2);
         }
         2->{
            viewHolder.imageItem.setImageResource(R.drawable.placeholder_image3);
         }
      }
   }
}