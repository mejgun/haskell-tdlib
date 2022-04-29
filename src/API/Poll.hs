-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Poll where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.PollType as PollType
import {-# SOURCE #-} qualified API.PollOption as PollOption

-- |
-- 
-- Describes a poll 
-- 
-- __id__ Unique poll identifier
-- 
-- __question__ Poll question; 1-300 characters
-- 
-- __options__ List of poll answer options
-- 
-- __total_voter_count__ Total number of voters, participating in the poll
-- 
-- __recent_voter_user_ids__ User identifiers of recent voters, if the poll is non-anonymous
-- 
-- __is_anonymous__ True, if the poll is anonymous
-- 
-- __type__ Type of the poll
-- 
-- __open_period__ Amount of time the poll will be active after creation, in seconds
-- 
-- __close_date__ Point in time (Unix timestamp) when the poll will automatically be closed
-- 
-- __is_closed__ True, if the poll is closed
data Poll = 

 Poll { is_closed :: Maybe Bool, close_date :: Maybe Int, open_period :: Maybe Int, _type :: Maybe PollType.PollType, is_anonymous :: Maybe Bool, recent_voter_user_ids :: Maybe [Int], total_voter_count :: Maybe Int, options :: Maybe [PollOption.PollOption], question :: Maybe String, _id :: Maybe Int }  deriving (Eq)

instance Show Poll where
 show Poll { is_closed=is_closed, close_date=close_date, open_period=open_period, _type=_type, is_anonymous=is_anonymous, recent_voter_user_ids=recent_voter_user_ids, total_voter_count=total_voter_count, options=options, question=question, _id=_id } =
  "Poll" ++ cc [p "is_closed" is_closed, p "close_date" close_date, p "open_period" open_period, p "_type" _type, p "is_anonymous" is_anonymous, p "recent_voter_user_ids" recent_voter_user_ids, p "total_voter_count" total_voter_count, p "options" options, p "question" question, p "_id" _id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON Poll where
 toJSON Poll { is_closed = is_closed, close_date = close_date, open_period = open_period, _type = _type, is_anonymous = is_anonymous, recent_voter_user_ids = recent_voter_user_ids, total_voter_count = total_voter_count, options = options, question = question, _id = _id } =
  A.object [ "@type" A..= T.String "poll", "is_closed" A..= is_closed, "close_date" A..= close_date, "open_period" A..= open_period, "type" A..= _type, "is_anonymous" A..= is_anonymous, "recent_voter_user_ids" A..= recent_voter_user_ids, "total_voter_count" A..= total_voter_count, "options" A..= options, "question" A..= question, "id" A..= _id ]

instance T.FromJSON Poll where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "poll" -> parsePoll v
   _ -> mempty
  where
   parsePoll :: A.Value -> T.Parser Poll
   parsePoll = A.withObject "Poll" $ \o -> do
    is_closed <- o A..:? "is_closed"
    close_date <- mconcat [ o A..:? "close_date", readMaybe <$> (o A..: "close_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    open_period <- mconcat [ o A..:? "open_period", readMaybe <$> (o A..: "open_period" :: T.Parser String)] :: T.Parser (Maybe Int)
    _type <- o A..:? "type"
    is_anonymous <- o A..:? "is_anonymous"
    recent_voter_user_ids <- o A..:? "recent_voter_user_ids"
    total_voter_count <- mconcat [ o A..:? "total_voter_count", readMaybe <$> (o A..: "total_voter_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    options <- o A..:? "options"
    question <- o A..:? "question"
    _id <- mconcat [ o A..:? "id", readMaybe <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ Poll { is_closed = is_closed, close_date = close_date, open_period = open_period, _type = _type, is_anonymous = is_anonymous, recent_voter_user_ids = recent_voter_user_ids, total_voter_count = total_voter_count, options = options, question = question, _id = _id }
 parseJSON _ = mempty
