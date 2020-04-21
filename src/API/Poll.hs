-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Poll where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PollType as PollType
import {-# SOURCE #-} qualified API.PollOption as PollOption

data Poll = 
 Poll { is_closed :: Bool, _type :: PollType.PollType, is_anonymous :: Bool, recent_voter_user_ids :: [Int], total_voter_count :: Int, options :: [PollOption.PollOption], question :: String, _id :: Int }  deriving (Show)

instance T.ToJSON Poll where
 toJSON (Poll { is_closed = is_closed, _type = _type, is_anonymous = is_anonymous, recent_voter_user_ids = recent_voter_user_ids, total_voter_count = total_voter_count, options = options, question = question, _id = _id }) =
  A.object [ "@type" A..= T.String "poll", "is_closed" A..= is_closed, "type" A..= _type, "is_anonymous" A..= is_anonymous, "recent_voter_user_ids" A..= recent_voter_user_ids, "total_voter_count" A..= total_voter_count, "options" A..= options, "question" A..= question, "id" A..= _id ]

instance T.FromJSON Poll where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "poll" -> parsePoll v
   _ -> mempty
  where
   parsePoll :: A.Value -> T.Parser Poll
   parsePoll = A.withObject "Poll" $ \o -> do
    is_closed <- o A..: "is_closed"
    _type <- o A..: "type"
    is_anonymous <- o A..: "is_anonymous"
    recent_voter_user_ids <- o A..: "recent_voter_user_ids"
    total_voter_count <- o A..: "total_voter_count"
    options <- o A..: "options"
    question <- o A..: "question"
    _id <- o A..: "id"
    return $ Poll { is_closed = is_closed, _type = _type, is_anonymous = is_anonymous, recent_voter_user_ids = recent_voter_user_ids, total_voter_count = total_voter_count, options = options, question = question, _id = _id }