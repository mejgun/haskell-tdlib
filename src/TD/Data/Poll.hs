{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Poll where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.PollOption as PollOption
import qualified TD.Data.PollType as PollType
import qualified Utils as U

data Poll = -- | Describes a poll @id Unique poll identifier @question Poll question; 1-300 characters @options List of poll answer options
  Poll
  { -- |
    is_closed :: Maybe Bool,
    -- |
    close_date :: Maybe Int,
    -- | Amount of time the poll will be active after creation, in seconds @close_date Point in time (Unix timestamp) when the poll will automatically be closed @is_closed True, if the poll is closed
    open_period :: Maybe Int,
    -- |
    _type :: Maybe PollType.PollType,
    -- | True, if the poll is anonymous @type Type of the poll
    is_anonymous :: Maybe Bool,
    -- |
    recent_voter_user_ids :: Maybe [Int],
    -- | Total number of voters, participating in the poll @recent_voter_user_ids User identifiers of recent voters, if the poll is non-anonymous
    total_voter_count :: Maybe Int,
    -- |
    options :: Maybe [PollOption.PollOption],
    -- |
    question :: Maybe String,
    -- |
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
        close_date_ <- mconcat [o A..:? "close_date", U.rm <$> (o A..: "close_date" :: T.Parser String)] :: T.Parser (Maybe Int)
        open_period_ <- mconcat [o A..:? "open_period", U.rm <$> (o A..: "open_period" :: T.Parser String)] :: T.Parser (Maybe Int)
        _type_ <- o A..:? "type"
        is_anonymous_ <- o A..:? "is_anonymous"
        recent_voter_user_ids_ <- o A..:? "recent_voter_user_ids"
        total_voter_count_ <- mconcat [o A..:? "total_voter_count", U.rm <$> (o A..: "total_voter_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        options_ <- o A..:? "options"
        question_ <- o A..:? "question"
        _id_ <- mconcat [o A..:? "id", U.rm <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
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
          "id" A..= _id_
        ]
