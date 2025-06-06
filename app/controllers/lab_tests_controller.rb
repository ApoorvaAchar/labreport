class LabTestsController < FrontBaseController
  before_action :set_lab_test, only: %i[ show edit update destroy ]

  # GET /lab_tests or /lab_tests.json
  def index
    @lab_tests = LabTest.all
  end

  # GET /lab_tests/1 or /lab_tests/1.json
  def show
  end

  # GET /lab_tests/new
  def new
    @lab_test = LabTest.new
  end

  # GET /lab_tests/1/edit
  def edit
  end

  # POST /lab_tests or /lab_tests.json
  def create
    @lab_test = LabTest.new(lab_test_params)

    respond_to do |format|
      if @lab_test.save
        format.html { redirect_to lab_test_path(@lab_test.id), notice: "Lab test was successfully created." }
        format.json { render :show, status: :created, location: @lab_test }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lab_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lab_tests/1 or /lab_tests/1.json
  def update
    respond_to do |format|
      if @lab_test.update(lab_test_params)
        format.html { redirect_to lab_test_path(@lab_test), notice: "Lab test was successfully updated." }
        format.json { render :show, status: :ok, location: @lab_test }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lab_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lab_tests/1 or /lab_tests/1.json
  def destroy
    @lab_test.destroy!

    respond_to do |format|
      format.html { redirect_to lab_tests_path, status: :see_other, notice: "Lab test was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lab_test
      @lab_test = LabTest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lab_test_params
      params.require(:lab_test).permit(:name, :key)
    end
end
