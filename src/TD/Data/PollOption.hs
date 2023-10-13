module TD.Data.PollOption (PollOption(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data PollOption
  = PollOption -- ^ Describes one answer option of a poll
    { text            :: Maybe T.Text -- ^ Option text; 1-100 characters
    , voter_count     :: Maybe Int    -- ^ Number of voters for this option, available only for closed or voted polls
    , vote_percentage :: Maybe Int    -- ^ The percentage of votes for this option; 0-100
    , is_chosen       :: Maybe Bool   -- ^ True, if the option was chosen by the user
    , is_being_chosen :: Maybe Bool   -- ^ True, if the option is being chosen by a pending setPollAnswer request
    }
  deriving (Eq)

instance Show PollOption where
  show PollOption
    { text            = text_
    , voter_count     = voter_count_
    , vote_percentage = vote_percentage_
    , is_chosen       = is_chosen_
    , is_being_chosen = is_being_chosen_
    }
      = "PollOption"
        ++ I.cc
        [ "text"            `I.p` text_
        , "voter_count"     `I.p` voter_count_
        , "vote_percentage" `I.p` vote_percentage_
        , "is_chosen"       `I.p` is_chosen_
        , "is_being_chosen" `I.p` is_being_chosen_
        ]

instance AT.FromJSON PollOption where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "pollOption" -> parsePollOption v
      _            -> mempty
    
    where
      parsePollOption :: A.Value -> AT.Parser PollOption
      parsePollOption = A.withObject "PollOption" $ \o -> do
        text_            <- o A..:?  "text"
        voter_count_     <- o A..:?  "voter_count"
        vote_percentage_ <- o A..:?  "vote_percentage"
        is_chosen_       <- o A..:?  "is_chosen"
        is_being_chosen_ <- o A..:?  "is_being_chosen"
        pure $ PollOption
          { text            = text_
          , voter_count     = voter_count_
          , vote_percentage = vote_percentage_
          , is_chosen       = is_chosen_
          , is_being_chosen = is_being_chosen_
          }
  parseJSON _ = mempty

instance AT.ToJSON PollOption where
  toJSON PollOption
    { text            = text_
    , voter_count     = voter_count_
    , vote_percentage = vote_percentage_
    , is_chosen       = is_chosen_
    , is_being_chosen = is_being_chosen_
    }
      = A.object
        [ "@type"           A..= AT.String "pollOption"
        , "text"            A..= text_
        , "voter_count"     A..= voter_count_
        , "vote_percentage" A..= vote_percentage_
        , "is_chosen"       A..= is_chosen_
        , "is_being_chosen" A..= is_being_chosen_
        ]
