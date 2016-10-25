class Users::ContactsController < ApplicationController
  before_action :set_user
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = @user.contacts.includes(:phones).all # => deixa os phones carregados no objeto
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new

    # Reserva 4 espaços para armazenar os telefones
    4.times { @contact.phones.build }
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = @user.contacts.new(contact_params)
    @contact.user_id = params[:user_id]

    respond_to do |format|
      if @contact.save
        format.html { redirect_to user_contact_path(@contact.user_id, @contact), notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to user_contact_path(@contact.user_id, @contact), notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to user_contacts_url(@contact.user_id), notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
      format.js # => Responde ajax
    end
  end

  private

    def set_user
      @user = User.find(params[:user_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:phones)
    end
end
