module TD.Data.DraftMessage
  ( DraftMessage(..)    
  , defaultDraftMessage 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputMessageReplyTo as InputMessageReplyTo
import qualified TD.Data.InputMessageContent as InputMessageContent

data DraftMessage
  = DraftMessage -- ^ Contains information about a message draft
    { reply_to           :: Maybe InputMessageReplyTo.InputMessageReplyTo -- ^ Information about the message to be replied; must be of the type inputMessageReplyToMessage; may be null if none
    , date               :: Maybe Int                                     -- ^ Point in time (Unix timestamp) when the draft was created
    , input_message_text :: Maybe InputMessageContent.InputMessageContent -- ^ Content of the message draft; must be of the type inputMessageText, inputMessageVideoNote, or inputMessageVoiceNote
    }
  deriving (Eq, Show)

instance I.ShortShow DraftMessage where
  shortShow DraftMessage
    { reply_to           = reply_to_
    , date               = date_
    , input_message_text = input_message_text_
    }
      = "DraftMessage"
        ++ I.cc
        [ "reply_to"           `I.p` reply_to_
        , "date"               `I.p` date_
        , "input_message_text" `I.p` input_message_text_
        ]

instance AT.FromJSON DraftMessage where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "draftMessage" -> parseDraftMessage v
      _              -> mempty
    
    where
      parseDraftMessage :: A.Value -> AT.Parser DraftMessage
      parseDraftMessage = A.withObject "DraftMessage" $ \o -> do
        reply_to_           <- o A..:?  "reply_to"
        date_               <- o A..:?  "date"
        input_message_text_ <- o A..:?  "input_message_text"
        pure $ DraftMessage
          { reply_to           = reply_to_
          , date               = date_
          , input_message_text = input_message_text_
          }
  parseJSON _ = mempty

instance AT.ToJSON DraftMessage where
  toJSON DraftMessage
    { reply_to           = reply_to_
    , date               = date_
    , input_message_text = input_message_text_
    }
      = A.object
        [ "@type"              A..= AT.String "draftMessage"
        , "reply_to"           A..= reply_to_
        , "date"               A..= date_
        , "input_message_text" A..= input_message_text_
        ]

defaultDraftMessage :: DraftMessage
defaultDraftMessage =
  DraftMessage
    { reply_to           = Nothing
    , date               = Nothing
    , input_message_text = Nothing
    }

