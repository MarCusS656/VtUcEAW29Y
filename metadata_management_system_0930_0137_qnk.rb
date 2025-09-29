# 代码生成时间: 2025-09-30 01:37:30
# metadata_management_system.rb
# This is a simple metadata management system using Ruby on Rails.

# Gemfile
# Add necessary gems
gem 'rails'
gem 'pg'
gem 'activerecord'

# app/controllers/metadata_controller.rb
class MetadataController < ApplicationController
  # GET /metadata
  def index
    @metadata_records = MetadataRecord.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @metadata_records }
    end
  end

  # GET /metadata/1
  def show
    @metadata_record = MetadataRecord.find(params[:id])
  end

  # GET /metadata/new
  def new
    @metadata_record = MetadataRecord.new
  end

  # POST /metadata
  def create
    @metadata_record = MetadataRecord.new(metadata_params)
    if @metadata_record.save
      redirect_to @metadata_record, notice: 'Metadata record was successfully created.'
    else
      render :new
    end
  end

  # GET /metadata/1/edit
  def edit
    @metadata_record = MetadataRecord.find(params[:id])
  end

  # PATCH/PUT /metadata/1
  def update
    @metadata_record = MetadataRecord.find(params[:id])
    if @metadata_record.update(metadata_params)
      redirect_to @metadata_record, notice: 'Metadata record was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /metadata/1
  def destroy
    @metadata_record = MetadataRecord.find(params[:id])
    @metadata_record.destroy
    redirect_to metadata_url, notice: 'Metadata record was successfully destroyed.'
  end

  private
    # Only allow a trusted parameter "white list" through.
    def metadata_params
      params.require(:metadata_record).permit(:key, :value)
    end
  end

# app/models/metadata_record.rb
class MetadataRecord < ApplicationRecord
  # Validations and associations can be added here
end

# app/views/metadata/index.html.erb
<!DOCTYPE html>
<html>
<head>
  <title>Metadata Records</title>
</head>
<body>
  <h1>Metadata Records</h1>
  <table>
    <thead>
      <tr>
        <th>Key</th>
        <th>Value</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
      <% @metadata_records.each do |record| %>
        <tr>
          <td><%= record.key %></td>
          <td><%= record.value %></td>
          <td>
            <%= link_to 'Show', record %>
            <%= link_to 'Edit', edit_metadata_record_path(record) %>
            <%= link_to 'Destroy', record, method: :delete, data: { confirm: 'Are you sure?' } %>
          </td>
        </tr>
      <% end %>
    </tbody>
  </table>
  <%= link_to 'New Metadata Record', new_metadata_record_path %>
</body>
</html>

# config/routes.rb
Rails.application.routes.draw do
  resources :metadata
end
