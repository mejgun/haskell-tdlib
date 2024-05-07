module TD.Data.Poll
  (Poll(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.PollOption as PollOption
import qualified TD.Data.MessageSender as MessageSender
import qualified TD.Data.PollType as PollType

data Poll
  = Poll -- ^ Describes a poll
    { _id               :: Maybe Int                           -- ^ Unique poll identifier
    , question          :: Maybe FormattedText.FormattedText   -- ^ Poll question; 1-300 characters. Only custom emoji entities are allowed
    , options           :: Maybe [PollOption.PollOption]       -- ^ List of poll answer options
    , total_voter_count :: Maybe Int                           -- ^ Total number of voters, participating in the poll
    , recent_voter_ids  :: Maybe [MessageSender.MessageSender] -- ^ Identifiers of recent voters, if the poll is non-anonymous
    , is_anonymous      :: Maybe Bool                          -- ^ True, if the poll is anonymous
    , _type             :: Maybe PollType.PollType             -- ^ Type of the poll
    , open_period       :: Maybe Int                           -- ^ Amount of time the poll will be active after creation, in seconds
    , close_date        :: Maybe Int                           -- ^ Point in time (Unix timestamp) when the poll will automatically be closed
    , is_closed         :: Maybe Bool                          -- ^ True, if the poll is closed
    }
  deriving (Eq, Show)

instance I.ShortShow Poll where
  shortShow Poll
    { _id               = _id_
    , question          = question_
    , options           = options_
    , total_voter_count = total_voter_count_
    , recent_voter_ids  = recent_voter_ids_
    , is_anonymous      = is_anonymous_
    , _type             = _type_
    , open_period       = open_period_
    , close_date        = close_date_
    , is_closed         = is_closed_
    }
      = "Poll"
        ++ I.cc
        [ "_id"               `I.p` _id_
        , "question"          `I.p` question_
        , "options"           `I.p` options_
        , "total_voter_count" `I.p` total_voter_count_
        , "recent_voter_ids"  `I.p` recent_voter_ids_
        , "is_anonymous"      `I.p` is_anonymous_
        , "_type"             `I.p` _type_
        , "open_period"       `I.p` open_period_
        , "close_date"        `I.p` close_date_
        , "is_closed"         `I.p` is_closed_
        ]

instance AT.FromJSON Poll where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "poll" -> parsePoll v
      _      -> mempty
    
    where
      parsePoll :: A.Value -> AT.Parser Poll
      parsePoll = A.withObject "Poll" $ \o -> do
        _id_               <- fmap I.readInt64 <$> o A..:?  "id"
        question_          <- o A..:?                       "question"
        options_           <- o A..:?                       "options"
        total_voter_count_ <- o A..:?                       "total_voter_count"
        recent_voter_ids_  <- o A..:?                       "recent_voter_ids"
        is_anonymous_      <- o A..:?                       "is_anonymous"
        _type_             <- o A..:?                       "type"
        open_period_       <- o A..:?                       "open_period"
        close_date_        <- o A..:?                       "close_date"
        is_closed_         <- o A..:?                       "is_closed"
        pure $ Poll
          { _id               = _id_
          , question          = question_
          , options           = options_
          , total_voter_count = total_voter_count_
          , recent_voter_ids  = recent_voter_ids_
          , is_anonymous      = is_anonymous_
          , _type             = _type_
          , open_period       = open_period_
          , close_date        = close_date_
          , is_closed         = is_closed_
          }
  parseJSON _ = mempty

