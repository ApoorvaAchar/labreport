class TestParameterRefRangesController < FrontBaseController
  before_action :set_test_parameter_ref_range, only: %i[ show edit update destroy ]

  # GET /test_parameter_ref_ranges or /test_parameter_ref_ranges.json
  def index
    @test_parameter_ref_ranges = TestParameterRefRange.all
  end

  # GET /test_parameter_ref_ranges/1 or /test_parameter_ref_ranges/1.json
  def show
  end

  # GET /test_parameter_ref_ranges/new
  def new
    @test_parameter_ref_range = TestParameterRefRange.new
  end

  # GET /test_parameter_ref_ranges/1/edit
  def edit
  end

  # POST /test_parameter_ref_ranges or /test_parameter_ref_ranges.json
  def create
    @test_parameter_ref_range = TestParameterRefRange.new(test_parameter_ref_range_params)

    respond_to do |format|
      if @test_parameter_ref_range.save
        format.html { redirect_to @test_parameter_ref_range, notice: "Test parameter ref range was successfully created." }
        format.json { render :show, status: :created, location: @test_parameter_ref_range }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @test_parameter_ref_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_parameter_ref_ranges/1 or /test_parameter_ref_ranges/1.json
  def update
    respond_to do |format|
      if @test_parameter_ref_range.update(test_parameter_ref_range_params)
        format.html { redirect_to @test_parameter_ref_range, notice: "Test parameter ref range was successfully updated." }
        format.json { render :show, status: :ok, location: @test_parameter_ref_range }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @test_parameter_ref_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_parameter_ref_ranges/1 or /test_parameter_ref_ranges/1.json
  def destroy
    @test_parameter_ref_range.destroy!

    respond_to do |format|
      format.html { redirect_to test_parameter_ref_ranges_path, status: :see_other, notice: "Test parameter ref range was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_parameter_ref_range
      @test_parameter_ref_range = TestParameterRefRange.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def test_parameter_ref_range_params
      params.require(:test_parameter_ref_range).permit(:lower_limit, :upper_limit, :color, :result_type)
    end
end
