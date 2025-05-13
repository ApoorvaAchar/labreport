class ParameterRefRangesController < FrontBaseController
  before_action :find_lab_test
  before_action :find_test_parameter
  before_action :set_parameter_ref_range, only: %i[ show edit update destroy ]

 
  # GET /parameter_ref_ranges/1 or /parameter_ref_ranges/1.json
  def show
  end

  # GET /parameter_ref_ranges/new
  def new
    @parameter_ref_range = @test_parameter.parameter_ref_ranges.new
  end

  # GET /parameter_ref_ranges/1/edit
  def edit
  end

  # POST /parameter_ref_ranges or /parameter_ref_ranges.json
  def create
    @parameter_ref_range = @test_parameter.parameter_ref_ranges.new(parameter_ref_range_params)

    respond_to do |format|
      if @parameter_ref_range.save
        format.html { redirect_to @lab_test, notice: "Test parameter ref range was successfully created." }
        format.json { render :show, status: :created, location: @parameter_ref_range }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @parameter_ref_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parameter_ref_ranges/1 or /parameter_ref_ranges/1.json
  def update
    respond_to do |format|
      if @parameter_ref_range.update(parameter_ref_range_params)
        format.html { redirect_to @lab_test, notice: "Test parameter ref range was successfully updated." }
        format.json { render :show, status: :ok, location: @parameter_ref_range }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @parameter_ref_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parameter_ref_ranges/1 or /parameter_ref_ranges/1.json
  def destroy
    @parameter_ref_range.destroy!

    respond_to do |format|
      format.html { redirect_to parameter_ref_ranges_path, status: :see_other, notice: "Test parameter ref range was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parameter_ref_range
      @parameter_ref_range = ParameterRefRange.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def parameter_ref_range_params
      params.require(:parameter_ref_range).permit(:lower_limit, :upper_limit, :color, :result_type, :result)
    end

    def find_test_parameter
      @test_parameter = @lab_test.test_parameters.find(params[:test_parameter_id])
    end


end
