module Data.AddressBook where

import Prelude

import Control.Plus (empty)
import Data.List (List(..), filter, head)
import Data.Maybe (Maybe)

type Address = {
    street :: String,
    country :: String
}

type Entry = {
    firstName :: String,
    lastName :: String,
    address :: Address
}

type AddressBook = List Entry

showAddress :: Address -> String
showAddress addr = addr.street <> ", " <> addr.country

showEntry :: Entry -> String
showEntry entry = entry.firstName <> " " <>
    entry.lastName <> ", " <>
    showAddress entry.address

emptyBook :: AddressBook
emptyBook = empty

insertEntry :: Entry -> AddressBook -> AddressBook
insertEntry = Cons

findEntry :: String -> String -> AddressBook -> Maybe Entry
findEntry firstName lastName book = head $ filter filterEntry book
    where
        filterEntry :: Entry -> Boolean
        filterEntry entry = entry.firstName == firstName && entry.lastName == lastName
