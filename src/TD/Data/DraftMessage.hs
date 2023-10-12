module TD.Data.DraftMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import {-# SOURCE #-} qualified TD.Data.InputMessageContent as InputMessageContent

data DraftMessage
  = DraftMessage -- ^ Contains information about a message draft
    { reply_to_message_id :: Maybe Int                                     -- ^ Identifier of the replied message; 0 if none
    , date                :: Maybe Int                                     -- ^ Point in time (Unix timestamp) when the draft was created
    , input_message_text  :: Maybe InputMessageContent.InputMessageContent -- ^ Content of the message draft; must be of the type inputMessageText
    }
  deriving (Eq)

instance Show DraftMessage where
  show DraftMessage
    { reply_to_message_id = reply_to_message_id_
    , date                = date_
    , input_message_text  = input_message_text_
    }
      = "DraftMessage"
        ++ I.cc
        [ "reply_to_message_id" `I.p` reply_to_message_id_
        , "date"                `I.p` date_
        , "input_message_text"  `I.p` input_message_text_
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
        reply_to_message_id_ <- o A..:?  "reply_to_message_id"
        date_                <- o A..:?  "date"
        input_message_text_  <- o A..:?  "input_message_text"
        pure $ DraftMessage
          { reply_to_message_id = reply_to_message_id_
          , date                = date_
          , input_message_text  = input_message_text_
          }

instance AT.ToJSON DraftMessage where
  toJSON DraftMessage
    { reply_to_message_id = reply_to_message_id_
    , date                = date_
    , input_message_text  = input_message_text_
    }
      = A.object
        [ "@type"               A..= AT.String "draftMessage"
        , "reply_to_message_id" A..= reply_to_message_id_
        , "date"                A..= date_
        , "input_message_text"  A..= input_message_text_
        ]
