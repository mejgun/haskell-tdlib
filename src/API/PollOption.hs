-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PollOption where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Describes one answer option of a poll 
-- 
-- __text__ Option text, 1-100 characters
-- 
-- __voter_count__ Number of voters for this option, available only for closed or voted polls
-- 
-- __vote_percentage__ The percentage of votes for this option, 0-100
-- 
-- __is_chosen__ True, if the option was chosen by the user
-- 
-- __is_being_chosen__ True, if the option is being chosen by a pending setPollAnswer request
data PollOption = 

 PollOption { is_being_chosen :: Maybe Bool, is_chosen :: Maybe Bool, vote_percentage :: Maybe Int, voter_count :: Maybe Int, text :: Maybe String }  deriving (Show, Eq)

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
    is_being_chosen <- o A..:? "is_being_chosen"
    is_chosen <- o A..:? "is_chosen"
    vote_percentage <- mconcat [ o A..:? "vote_percentage", readMaybe <$> (o A..: "vote_percentage" :: T.Parser String)] :: T.Parser (Maybe Int)
    voter_count <- mconcat [ o A..:? "voter_count", readMaybe <$> (o A..: "voter_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    text <- o A..:? "text"
    return $ PollOption { is_being_chosen = is_being_chosen, is_chosen = is_chosen, vote_percentage = vote_percentage, voter_count = voter_count, text = text }