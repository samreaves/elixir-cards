defmodule Cards do
  @moduledoc """
  Documentation for Cards.
  Learning Elixir by making basic deck of cards functionality
  """

  @doc """
  Create Deck
  Creates a deck of cards with all suits and values

  ## Examples

      iex> Cards.create_deck()
      [
         "Ace of Spades", "Two of Spades", "Three of Spades", "Four of Spades",
         "Five of Spades", "Six of Spades", "Seven of Spades", "Eight of Spades",
         "Nine of Spades", "Jack of Spades", "Queen of Spades", "King of Spades",
         "Ace of Hearts", "Two of Hearts", "Three of Hearts", "Four of Hearts",
         "Five of Hearts", "Six of Hearts", "Seven of Hearts", "Eight of Hearts",
         "Nine of Hearts", "Jack of Hearts", "Queen of Hearts", "King of Hearts",
         "Ace of Clubs", "Two of Clubs", "Three of Clubs", "Four of Clubs",
         "Five of Clubs", "Six of Clubs", "Seven of Clubs", "Eight of Clubs",
         "Nine of Clubs", "Jack of Clubs", "Queen of Clubs", "King of Clubs",
         "Ace of Diamonds", "Two of Diamonds", "Three of Diamonds",
         "Four of Diamonds", "Five of Diamonds", "Six of Diamonds",
         "Seven of Diamonds", "Eight of Diamonds", "Nine of Diamonds",
         "Jack of Diamonds", "Queen of Diamonds", "King of Diamonds"
      ]

  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Jack", "Queen", "King"]
    suits = ["Spades", "Hearts", "Clubs", "Diamonds"]

    for suit <- suits, value <- values do
      value <> " of " <> suit
    end
  end


  @doc """
  Shuffle
  Randomizes order of the cards in a given deck

  ## Examples

      iex> Cards.shuffle(Cards.create_deck())
      ["Two", "Ace", "Three"]

  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end


  @doc """
  Deal
  Deals a hand of a number of specified cards from a provided deck

  ## Examples

      iex> Cards.deal(Cards.create_deck(), 5)
      ["Two of Hearts", "Ace of Spades", "Three of Clubs", "Jack of Hearts", "Queen of Diamonds"]

  """
  def deal(deck, size_of_hand) do
    Enum.split(deck, size_of_hand)
  end



  @doc """
  Contains
  Checks to see if a card is within the deck

  ## Examples

      iex> Cards.contains?(Cards.create_deck(), "King of The World")
      false

      iex> Cards.contains?(Cards.create_deck(), "King of Hearts")
      true

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end


  @doc """
  Save
  Saves deck of cards to binary

  """
  def save(deck, file_name) do
    binary = :erlang.term_to_binary(deck)
    File.write(binary, file_name)
  end



  @doc """
  Load
  Loads deck of cards from binary


  """
  def load(file_name) do
    {status, binary} = File.read(file_name)

    case status do
      :ok -> :erlang.binary_to_term(binary)
      :error -> "File does not exist"
    end
  end


end
