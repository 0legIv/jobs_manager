defmodule JobsManager.JobsTest do
  use JobsManager.DataCase

  alias JobsManager.Jobs

  describe "contract_types" do
    alias JobsManager.Jobs.ContractType

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def contract_type_fixture(attrs \\ %{}) do
      {:ok, contract_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Jobs.create_contract_type()

      contract_type
    end

    test "list_contract_types/0 returns all contract_types" do
      contract_type = contract_type_fixture()
      assert Jobs.list_contract_types() == [contract_type]
    end

    test "get_contract_type!/1 returns the contract_type with given id" do
      contract_type = contract_type_fixture()
      assert Jobs.get_contract_type!(contract_type.id) == contract_type
    end

    test "create_contract_type/1 with valid data creates a contract_type" do
      assert {:ok, %ContractType{} = contract_type} = Jobs.create_contract_type(@valid_attrs)
      assert contract_type.name == "some name"
    end

    test "create_contract_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Jobs.create_contract_type(@invalid_attrs)
    end

    test "update_contract_type/2 with valid data updates the contract_type" do
      contract_type = contract_type_fixture()
      assert {:ok, %ContractType{} = contract_type} = Jobs.update_contract_type(contract_type, @update_attrs)
      assert contract_type.name == "some updated name"
    end

    test "update_contract_type/2 with invalid data returns error changeset" do
      contract_type = contract_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Jobs.update_contract_type(contract_type, @invalid_attrs)
      assert contract_type == Jobs.get_contract_type!(contract_type.id)
    end

    test "delete_contract_type/1 deletes the contract_type" do
      contract_type = contract_type_fixture()
      assert {:ok, %ContractType{}} = Jobs.delete_contract_type(contract_type)
      assert_raise Ecto.NoResultsError, fn -> Jobs.get_contract_type!(contract_type.id) end
    end

    test "change_contract_type/1 returns a contract_type changeset" do
      contract_type = contract_type_fixture()
      assert %Ecto.Changeset{} = Jobs.change_contract_type(contract_type)
    end
  end

  describe "categories" do
    alias JobsManager.Jobs.Category

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def category_fixture(attrs \\ %{}) do
      {:ok, category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Jobs.create_category()

      category
    end

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Jobs.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Jobs.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      assert {:ok, %Category{} = category} = Jobs.create_category(@valid_attrs)
      assert category.name == "some name"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Jobs.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      assert {:ok, %Category{} = category} = Jobs.update_category(category, @update_attrs)
      assert category.name == "some updated name"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Jobs.update_category(category, @invalid_attrs)
      assert category == Jobs.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Jobs.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Jobs.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Jobs.change_category(category)
    end
  end

  describe "professions" do
    alias JobsManager.Jobs.Profession

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def profession_fixture(attrs \\ %{}) do
      {:ok, profession} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Jobs.create_profession()

      profession
    end

    test "list_professions/0 returns all professions" do
      profession = profession_fixture()
      assert Jobs.list_professions() == [profession]
    end

    test "get_profession!/1 returns the profession with given id" do
      profession = profession_fixture()
      assert Jobs.get_profession!(profession.id) == profession
    end

    test "create_profession/1 with valid data creates a profession" do
      assert {:ok, %Profession{} = profession} = Jobs.create_profession(@valid_attrs)
      assert profession.name == "some name"
    end

    test "create_profession/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Jobs.create_profession(@invalid_attrs)
    end

    test "update_profession/2 with valid data updates the profession" do
      profession = profession_fixture()
      assert {:ok, %Profession{} = profession} = Jobs.update_profession(profession, @update_attrs)
      assert profession.name == "some updated name"
    end

    test "update_profession/2 with invalid data returns error changeset" do
      profession = profession_fixture()
      assert {:error, %Ecto.Changeset{}} = Jobs.update_profession(profession, @invalid_attrs)
      assert profession == Jobs.get_profession!(profession.id)
    end

    test "delete_profession/1 deletes the profession" do
      profession = profession_fixture()
      assert {:ok, %Profession{}} = Jobs.delete_profession(profession)
      assert_raise Ecto.NoResultsError, fn -> Jobs.get_profession!(profession.id) end
    end

    test "change_profession/1 returns a profession changeset" do
      profession = profession_fixture()
      assert %Ecto.Changeset{} = Jobs.change_profession(profession)
    end
  end

  describe "job_offers" do
    alias JobsManager.Jobs.JobOffer

    @valid_attrs %{name: "some name", office_latitude: 120.5, office_longitude: 120.5}
    @update_attrs %{name: "some updated name", office_latitude: 456.7, office_longitude: 456.7}
    @invalid_attrs %{name: nil, office_latitude: nil, office_longitude: nil}

    def job_offer_fixture(attrs \\ %{}) do
      {:ok, job_offer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Jobs.create_job_offer()

      job_offer
    end

    test "list_job_offers/0 returns all job_offers" do
      job_offer = job_offer_fixture()
      assert Jobs.list_job_offers() == [job_offer]
    end

    test "get_job_offer!/1 returns the job_offer with given id" do
      job_offer = job_offer_fixture()
      assert Jobs.get_job_offer!(job_offer.id) == job_offer
    end

    test "create_job_offer/1 with valid data creates a job_offer" do
      assert {:ok, %JobOffer{} = job_offer} = Jobs.create_job_offer(@valid_attrs)
      assert job_offer.name == "some name"
      assert job_offer.office_latitude == 120.5
      assert job_offer.office_longitude == 120.5
    end

    test "create_job_offer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Jobs.create_job_offer(@invalid_attrs)
    end

    test "update_job_offer/2 with valid data updates the job_offer" do
      job_offer = job_offer_fixture()
      assert {:ok, %JobOffer{} = job_offer} = Jobs.update_job_offer(job_offer, @update_attrs)
      assert job_offer.name == "some updated name"
      assert job_offer.office_latitude == 456.7
      assert job_offer.office_longitude == 456.7
    end

    test "update_job_offer/2 with invalid data returns error changeset" do
      job_offer = job_offer_fixture()
      assert {:error, %Ecto.Changeset{}} = Jobs.update_job_offer(job_offer, @invalid_attrs)
      assert job_offer == Jobs.get_job_offer!(job_offer.id)
    end

    test "delete_job_offer/1 deletes the job_offer" do
      job_offer = job_offer_fixture()
      assert {:ok, %JobOffer{}} = Jobs.delete_job_offer(job_offer)
      assert_raise Ecto.NoResultsError, fn -> Jobs.get_job_offer!(job_offer.id) end
    end

    test "change_job_offer/1 returns a job_offer changeset" do
      job_offer = job_offer_fixture()
      assert %Ecto.Changeset{} = Jobs.change_job_offer(job_offer)
    end
  end
end
