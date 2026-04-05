module TD.Data.PollOption
  (PollOption(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.FormattedText as FormattedText
import {-# SOURCE #-} qualified TD.Data.MessageContent as MessageContent
import qualified TD.Data.MessageSender as MessageSender

data PollOption
  = PollOption -- ^ Describes one answer option of a poll
    { _id              :: Maybe T.Text                        -- ^ Unique identifier of the option in the poll
    , text             :: Maybe FormattedText.FormattedText   -- ^ Option text; 1-100 characters; may contain only custom emoji entities
    , media            :: Maybe MessageContent.MessageContent -- ^ Option media. Currently, can be only of the types messageAnimation, messageLocation, messagePhoto, messageSticker, messageVenue, or messageVideo without caption
    , voter_count      :: Maybe Int                           -- ^ Number of voters for this option, available only for closed or voted polls, or if the current user is the creator of the poll
    , vote_percentage  :: Maybe Int                           -- ^ The percentage of votes for this option; 0-100
    , recent_voter_ids :: Maybe [MessageSender.MessageSender] -- ^ Identifiers of recent voters for the option, if the poll is non-anonymous and poll results are available
    , is_chosen        :: Maybe Bool                          -- ^ True, if the option was chosen by the user
    , is_being_chosen  :: Maybe Bool                          -- ^ True, if the option is being chosen by a pending setPollAnswer request
    , author           :: Maybe MessageSender.MessageSender   -- ^ Identifier of the user or chat who added the option; may be null if the option existed from creation of the poll
    , addition_date    :: Maybe Int                           -- ^ Point in time (Unix timestamp) when the option was added; 0 if the option existed from creation of the poll
    }
  deriving (Eq, Show)

instance I.ShortShow PollOption where
  shortShow PollOption
    { _id              = _id_
    , text             = text_
    , media            = media_
    , voter_count      = voter_count_
    , vote_percentage  = vote_percentage_
    , recent_voter_ids = recent_voter_ids_
    , is_chosen        = is_chosen_
    , is_being_chosen  = is_being_chosen_
    , author           = author_
    , addition_date    = addition_date_
    }
      = "PollOption"
        ++ I.cc
        [ "_id"              `I.p` _id_
        , "text"             `I.p` text_
        , "media"            `I.p` media_
        , "voter_count"      `I.p` voter_count_
        , "vote_percentage"  `I.p` vote_percentage_
        , "recent_voter_ids" `I.p` recent_voter_ids_
        , "is_chosen"        `I.p` is_chosen_
        , "is_being_chosen"  `I.p` is_being_chosen_
        , "author"           `I.p` author_
        , "addition_date"    `I.p` addition_date_
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
        _id_              <- o A..:?  "id"
        text_             <- o A..:?  "text"
        media_            <- o A..:?  "media"
        voter_count_      <- o A..:?  "voter_count"
        vote_percentage_  <- o A..:?  "vote_percentage"
        recent_voter_ids_ <- o A..:?  "recent_voter_ids"
        is_chosen_        <- o A..:?  "is_chosen"
        is_being_chosen_  <- o A..:?  "is_being_chosen"
        author_           <- o A..:?  "author"
        addition_date_    <- o A..:?  "addition_date"
        pure $ PollOption
          { _id              = _id_
          , text             = text_
          , media            = media_
          , voter_count      = voter_count_
          , vote_percentage  = vote_percentage_
          , recent_voter_ids = recent_voter_ids_
          , is_chosen        = is_chosen_
          , is_being_chosen  = is_being_chosen_
          , author           = author_
          , addition_date    = addition_date_
          }
  parseJSON _ = mempty

