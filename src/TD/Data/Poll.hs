{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Poll where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.PollOption as PollOption
import qualified TD.Data.PollType as PollType
import qualified Utils as U

-- |
data Poll = -- | Describes a poll
  Poll
  { -- | True, if the poll is closed
    is_closed :: Maybe Bool,
    -- | Point in time (Unix timestamp) when the poll will automatically be closed
    close_date :: Maybe Int,
    -- | Amount of time the poll will be active after creation, in seconds
    open_period :: Maybe Int,
    -- | Type of the poll
    _type :: Maybe PollType.PollType,
    -- | True, if the poll is anonymous
    is_anonymous :: Maybe Bool,
    -- | User identifiers of recent voters, if the poll is non-anonymous
    recent_voter_user_ids :: Maybe [Int],
    -- | Total number of voters, participating in the poll
    total_voter_count :: Maybe Int,
    -- | List of poll answer options
    options :: Maybe [PollOption.PollOption],
    -- | Poll question; 1-300 characters
    question :: Maybe String,
    -- | Unique poll identifier
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show Poll where
  show
    Poll
      { is_closed = is_closed_,
        close_date = close_date_,
        open_period = open_period_,
        _type = _type_,
        is_anonymous = is_anonymous_,
        recent_voter_user_ids = recent_voter_user_ids_,
        total_voter_count = total_voter_count_,
        options = options_,
        question = question_,
        _id = _id_
      } =
      "Poll"
        ++ U.cc
          [ U.p "is_closed" is_closed_,
            U.p "close_date" close_date_,
            U.p "open_period" open_period_,
            U.p "_type" _type_,
            U.p "is_anonymous" is_anonymous_,
            U.p "recent_voter_user_ids" recent_voter_user_ids_,
            U.p "total_voter_count" total_voter_count_,
            U.p "options" options_,
            U.p "question" question_,
            U.p "_id" _id_
          ]

instance T.FromJSON Poll where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "poll" -> parsePoll v
      _ -> mempty
    where
      parsePoll :: A.Value -> T.Parser Poll
      parsePoll = A.withObject "Poll" $ \o -> do
        is_closed_ <- o A..:? "is_closed"
        close_date_ <- o A..:? "close_date"
        open_period_ <- o A..:? "open_period"
        _type_ <- o A..:? "type"
        is_anonymous_ <- o A..:? "is_anonymous"
        recent_voter_user_ids_ <- o A..:? "recent_voter_user_ids"
        total_voter_count_ <- o A..:? "total_voter_count"
        options_ <- o A..:? "options"
        question_ <- o A..:? "question"
        _id_ <- U.rm <$> (o A..:? "id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        return $ Poll {is_closed = is_closed_, close_date = close_date_, open_period = open_period_, _type = _type_, is_anonymous = is_anonymous_, recent_voter_user_ids = recent_voter_user_ids_, total_voter_count = total_voter_count_, options = options_, question = question_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON Poll where
  toJSON
    Poll
      { is_closed = is_closed_,
        close_date = close_date_,
        open_period = open_period_,
        _type = _type_,
        is_anonymous = is_anonymous_,
        recent_voter_user_ids = recent_voter_user_ids_,
        total_voter_count = total_voter_count_,
        options = options_,
        question = question_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "poll",
          "is_closed" A..= is_closed_,
          "close_date" A..= close_date_,
          "open_period" A..= open_period_,
          "type" A..= _type_,
          "is_anonymous" A..= is_anonymous_,
          "recent_voter_user_ids" A..= recent_voter_user_ids_,
          "total_voter_count" A..= total_voter_count_,
          "options" A..= options_,
          "question" A..= question_,
          "id" A..= U.toS _id_
        ]
