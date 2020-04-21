-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PollOption where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data PollOption = 
 PollOption { is_being_chosen :: Bool, is_chosen :: Bool, vote_percentage :: Int, voter_count :: Int, text :: String }  deriving (Show)

instance T.ToJSON PollOption where
 toJSON (PollOption { is_being_chosen = is_being_chosen, is_chosen = is_chosen, vote_percentage = vote_percentage, voter_count = voter_count, text = text }) =
  A.object [ "@type" A..= T.String "pollOption", "is_being_chosen" A..= is_being_chosen, "is_chosen" A..= is_chosen, "vote_percentage" A..= vote_percentage, "voter_count" A..= voter_count, "text" A..= text ]

instance T.FromJSON PollOption where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "pollOption" -> parsePollOption v
   _ -> mempty
  where
   parsePollOption :: A.Value -> T.Parser PollOption
   parsePollOption = A.withObject "PollOption" $ \o -> do
    is_being_chosen <- o A..: "is_being_chosen"
    is_chosen <- o A..: "is_chosen"
    vote_percentage <- o A..: "vote_percentage"
    voter_count <- o A..: "voter_count"
    text <- o A..: "text"
    return $ PollOption { is_being_chosen = is_being_chosen, is_chosen = is_chosen, vote_percentage = vote_percentage, voter_count = voter_count, text = text }