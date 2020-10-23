require 'test_helper'

class PeriodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @periodo = periodos(:one)
  end

  test "should get index" do
    get periodos_url
    assert_response :success
  end

  test "should get new" do
    get new_periodo_url
    assert_response :success
  end

  test "should create periodo" do
    assert_difference('Periodo.count') do
      post periodos_url, params: { periodo: { dt_fin: @periodo.dt_fin, dt_ini: @periodo.dt_ini, periodo: @periodo.periodo, plataforma_id: @periodo.plataforma_id } }
    end

    assert_redirected_to periodo_url(Periodo.last)
  end

  test "should show periodo" do
    get periodo_url(@periodo)
    assert_response :success
  end

  test "should get edit" do
    get edit_periodo_url(@periodo)
    assert_response :success
  end

  test "should update periodo" do
    patch periodo_url(@periodo), params: { periodo: { dt_fin: @periodo.dt_fin, dt_ini: @periodo.dt_ini, periodo: @periodo.periodo, plataforma_id: @periodo.plataforma_id } }
    assert_redirected_to periodo_url(@periodo)
  end

  test "should destroy periodo" do
    assert_difference('Periodo.count', -1) do
      delete periodo_url(@periodo)
    end

    assert_redirected_to periodos_url
  end
end
