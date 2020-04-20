-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PollOption where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data PollOption = 
 PollOption { is_being_chosen :: Bool, is_chosen :: Bool, vote_percentage :: Int, voter_count :: Int, text :: String }  -- deriving (Show)

instance T.ToJSON PollOption where
 toJSON (PollOption { is_being_chosen = is_being_chosen, is_chosen = is_chosen, vote_percentage = vote_percentage, voter_count = voter_count, text = text }) =
  A.object [ "@type" A..= T.String "pollOption", "is_being_chosen" A..= is_being_chosen, "is_chosen" A..= is_chosen, "vote_percentage" A..= vote_percentage, "voter_count" A..= voter_count, "text" A..= text ]
-- pollOption PollOption  { is_being_chosen :: Bool, is_chosen :: Bool, vote_percentage :: Int, voter_count :: Int, text :: String } 

