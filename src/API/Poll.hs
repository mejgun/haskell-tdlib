-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Poll where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PollType as PollType
import {-# SOURCE #-} qualified API.PollOption as PollOption

--main = putStrLn "ok"

data Poll = 
 Poll { is_closed :: Bool, _type :: PollType.PollType, is_anonymous :: Bool, recent_voter_user_ids :: [Int], total_voter_count :: Int, options :: [PollOption.PollOption], question :: String, _id :: Int }  -- deriving (Show)

instance T.ToJSON Poll where
 toJSON (Poll { is_closed = is_closed, _type = _type, is_anonymous = is_anonymous, recent_voter_user_ids = recent_voter_user_ids, total_voter_count = total_voter_count, options = options, question = question, _id = _id }) =
  A.object [ "@type" A..= T.String "poll", "is_closed" A..= is_closed, "type" A..= _type, "is_anonymous" A..= is_anonymous, "recent_voter_user_ids" A..= recent_voter_user_ids, "total_voter_count" A..= total_voter_count, "options" A..= options, "question" A..= question, "id" A..= _id ]
-- poll Poll  { is_closed :: Bool, _type :: PollType.PollType, is_anonymous :: Bool, recent_voter_user_ids :: [Int], total_voter_count :: Int, options :: [PollOption.PollOption], question :: String, _id :: Int } 

