# 代码生成时间: 2025-10-01 03:44:21
# This is a simple drag and drop sorting component for Rails applications.
# It allows users to drag and drop elements to sort them in a desired order.

# app/components/drag_and_drop_sorting_component.rb
class DragAndDropSortingComponent < ViewComponent
  # This is the initializer that will take the items array and the path to update.
  # It assumes that the items are ActiveRecord objects that respond to a 'position' attribute.
  attr_reader :items, :update_path

  # This method initializes the component with the items array and update path.
  def initialize(items:, update_path:)
    @items = items
    @update_path = update_path
    super
  end

  # This method renders the component.
  def call
    # Render the component view.
  end

  # This method handles the sorting of items.
  def sort_items
    # Get the item ids and their new positions from the request parameters.
    params = params_with_items

    # Update each item's position based on the new positions.
    params.each do |id, position|
      item = items.find { |i| i.id.to_s == id }
      raise ActiveRecord::RecordNotFound unless item.present?
      item.update!(position: position.to_i)
    end
  rescue ActiveRecord::RecordNotFound => e
    # Handle the error if an item is not found.
    Rails.logger.error("Error sorting items: #{e.message}")
    false
  else
    true
  end

  private

  # This method extracts the item ids and their new positions from the request parameters.
  def params_with_items
    # Assuming the request parameters are sent as 'item_ids' and 'item_positions'.
    # These parameters should be sent from the frontend after a drag and drop action.
    request.params.slice(:item_ids, :item_positions)
  end
end
