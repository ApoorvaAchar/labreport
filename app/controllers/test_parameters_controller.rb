class TestParametersController < FrontBaseController
  before_action :find_lab_test
  before_action :set_test_parameter, only: %i[ show edit update destroy ]

  # GET /test_parameters or /test_parameters.json
  def index
    @test_parameters = TestParameter.all
  end

  # GET /test_parameters/1 or /test_parameters/1.json
  def show
  end

  # GET /test_parameters/new
  def new
    @test_parameter = TestParameter.new
  end

  # GET /test_parameters/1/edit
  def edit
  end

  # POST /test_parameters or /test_parameters.json
  def create
    @test_parameter = TestParameter.new(test_parameter_params)

    respond_to do |format|
      if @test_parameter.save
        format.html { redirect_to @test_parameter, notice: "Test parameter was successfully created." }
        format.json { render :show, status: :created, location: @test_parameter }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @test_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_parameters/1 or /test_parameters/1.json
  def update
    respond_to do |format|
      if @test_parameter.update(test_parameter_params)
        format.html { redirect_to @test_parameter, notice: "Test parameter was successfully updated." }
        format.json { render :show, status: :ok, location: @test_parameter }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @test_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_parameters/1 or /test_parameters/1.json
  def destroy
    @test_parameter.destroy!

    respond_to do |format|
      format.html { redirect_to test_parameters_path, status: :see_other, notice: "Test parameter was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_parameter
      @test_parameter = TestParameter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def test_parameter_params
      params.require(:test_parameter).permit(:description, :name, :key, :cause_effect, :what_can_do, :did_you_konw)
    end
end
