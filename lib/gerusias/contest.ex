defmodule Gerusias.Contest do
  @moduledoc """
  The Contest context.
  """

  import Ecto.Query, warn: false
  alias Gerusias.Repo

  alias Gerusias.Contest.Badge

  @doc """
  Returns the list of badges.

  ## Examples

      iex> list_badges()
      [%Badge{}, ...]

  """
  def list_badges do
    Repo.all(Badge)
  end

  @doc """
  Gets a single badge.

  Raises `Ecto.NoResultsError` if the Badge does not exist.

  ## Examples

      iex> get_badge!(123)
      %Badge{}

      iex> get_badge!(456)
      ** (Ecto.NoResultsError)

  """
  def get_badge!(id), do: Repo.get!(Badge, id)

  @doc """
  Creates a badge.

  ## Examples

      iex> create_badge(%{field: value})
      {:ok, %Badge{}}

      iex> create_badge(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_badge(attrs \\ %{}) do
    %Badge{}
    |> Badge.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a badge.

  ## Examples

      iex> update_badge(badge, %{field: new_value})
      {:ok, %Badge{}}

      iex> update_badge(badge, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_badge(%Badge{} = badge, attrs) do
    badge
    |> Badge.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Badge.

  ## Examples

      iex> delete_badge(badge)
      {:ok, %Badge{}}

      iex> delete_badge(badge)
      {:error, %Ecto.Changeset{}}

  """
  def delete_badge(%Badge{} = badge) do
    Repo.delete(badge)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking badge changes.

  ## Examples

      iex> change_badge(badge)
      %Ecto.Changeset{source: %Badge{}}

  """
  def change_badge(%Badge{} = badge) do
    Badge.changeset(badge, %{})
  end

  alias Gerusias.Contest.Redeem

  @doc """
  Returns the list of redeems.

  ## Examples

      iex> list_redeems()
      [%Redeem{}, ...]

  """
  def list_redeems do
    Repo.all(Redeem)
  end

  @doc """
  Gets a single redeem.

  Raises `Ecto.NoResultsError` if the Redeem does not exist.

  ## Examples

      iex> get_redeem!(123)
      %Redeem{}

      iex> get_redeem!(456)
      ** (Ecto.NoResultsError)

  """
  def get_redeem!(id), do: Repo.get!(Redeem, id)

  @doc """
  Creates a redeem.

  ## Examples

      iex> create_redeem(%{field: value})
      {:ok, %Redeem{}}

      iex> create_redeem(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_redeem(attrs \\ %{}) do
    %Redeem{}
    |> Redeem.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a redeem.

  ## Examples

      iex> update_redeem(redeem, %{field: new_value})
      {:ok, %Redeem{}}

      iex> update_redeem(redeem, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_redeem(%Redeem{} = redeem, attrs) do
    redeem
    |> Redeem.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Redeem.

  ## Examples

      iex> delete_redeem(redeem)
      {:ok, %Redeem{}}

      iex> delete_redeem(redeem)
      {:error, %Ecto.Changeset{}}

  """
  def delete_redeem(%Redeem{} = redeem) do
    Repo.delete(redeem)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking redeem changes.

  ## Examples

      iex> change_redeem(redeem)
      %Ecto.Changeset{source: %Redeem{}}

  """
  def change_redeem(%Redeem{} = redeem) do
    Redeem.changeset(redeem, %{})
  end
end
