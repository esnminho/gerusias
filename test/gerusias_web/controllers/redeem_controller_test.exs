defmodule GerusiasWeb.RedeemControllerTest do
  use GerusiasWeb.ConnCase

  alias Gerusias.Contest

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:redeem) do
    {:ok, redeem} = Contest.create_redeem(@create_attrs)
    redeem
  end

  describe "index" do
    test "lists all redeems", %{conn: conn} do
      conn = get(conn, Routes.redeem_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Redeems"
    end
  end

  describe "new redeem" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.redeem_path(conn, :new))
      assert html_response(conn, 200) =~ "New Redeem"
    end
  end

  describe "create redeem" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.redeem_path(conn, :create), redeem: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.redeem_path(conn, :show, id)

      conn = get(conn, Routes.redeem_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Redeem"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.redeem_path(conn, :create), redeem: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Redeem"
    end
  end

  describe "edit redeem" do
    setup [:create_redeem]

    test "renders form for editing chosen redeem", %{conn: conn, redeem: redeem} do
      conn = get(conn, Routes.redeem_path(conn, :edit, redeem))
      assert html_response(conn, 200) =~ "Edit Redeem"
    end
  end

  describe "update redeem" do
    setup [:create_redeem]

    test "redirects when data is valid", %{conn: conn, redeem: redeem} do
      conn = put(conn, Routes.redeem_path(conn, :update, redeem), redeem: @update_attrs)
      assert redirected_to(conn) == Routes.redeem_path(conn, :show, redeem)

      conn = get(conn, Routes.redeem_path(conn, :show, redeem))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, redeem: redeem} do
      conn = put(conn, Routes.redeem_path(conn, :update, redeem), redeem: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Redeem"
    end
  end

  describe "delete redeem" do
    setup [:create_redeem]

    test "deletes chosen redeem", %{conn: conn, redeem: redeem} do
      conn = delete(conn, Routes.redeem_path(conn, :delete, redeem))
      assert redirected_to(conn) == Routes.redeem_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.redeem_path(conn, :show, redeem))
      end
    end
  end

  defp create_redeem(_) do
    redeem = fixture(:redeem)
    {:ok, redeem: redeem}
  end
end
