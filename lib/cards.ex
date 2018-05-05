defmodule Cards do
  @moduledoc """
  Documentation for Cards.
  """

  @doc """
  Create Deck

  ## Examples

      iex> Cards.create_deck
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

    cards = for suit <- suits do
      for value <- values do
        value <> " of " <> suit
      end
    end

    List.flatten(cards)
  end


  @doc """
  Shuffle

  ## Examples

      iex> Cards.shuffle(Cards.create_deck)
      ["Two", "Ace", "Three"]

  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end


  @doc """
  Contains

  ## Examples

      iex> Cards.contains?(Cards.create_deck, "King")
      false

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end


end
