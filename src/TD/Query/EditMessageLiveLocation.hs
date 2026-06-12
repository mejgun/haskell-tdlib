module TD.Query.EditMessageLiveLocation
  (EditMessageLiveLocation(..)
  , defaultEditMessageLiveLocation
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified TD.Data.LiveLocation as LiveLocation

-- | Edits the message content of a live location. Messages can be edited for a limited period of time specified in the live location. Returns the edited message after the edit is completed on the server side. Returns 'TD.Data.Message.Message'
data EditMessageLiveLocation
  = EditMessageLiveLocation
    { chat_id      :: Maybe Int                       -- ^ The chat the message belongs to
    , message_id   :: Maybe Int                       -- ^ Identifier of the message. Use messageProperties.can_be_edited to check whether the message can be edited
    , reply_markup :: Maybe ReplyMarkup.ReplyMarkup   -- ^ The new message reply markup; pass null if none; for bots only
    , location     :: Maybe LiveLocation.LiveLocation -- ^ New live location of the message; pass null to stop sharing the live location. If the new live_period isn't set to 0x7FFFFFFF, then it must not exceed the current live_period by more than a day, and the live location expiration date must remain in the next 90 days
    }
  deriving (Eq, Show)

instance I.ShortShow EditMessageLiveLocation where
  shortShow
    EditMessageLiveLocation
      { chat_id      = chat_id_
      , message_id   = message_id_
      , reply_markup = reply_markup_
      , location     = location_
      }
        = "EditMessageLiveLocation"
          ++ I.cc
          [ "chat_id"      `I.p` chat_id_
          , "message_id"   `I.p` message_id_
          , "reply_markup" `I.p` reply_markup_
          , "location"     `I.p` location_
          ]

instance AT.ToJSON EditMessageLiveLocation where
  toJSON
    EditMessageLiveLocation
      { chat_id      = chat_id_
      , message_id   = message_id_
      , reply_markup = reply_markup_
      , location     = location_
      }
        = A.object
          [ "@type"        A..= AT.String "editMessageLiveLocation"
          , "chat_id"      A..= chat_id_
          , "message_id"   A..= message_id_
          , "reply_markup" A..= reply_markup_
          , "location"     A..= location_
          ]

defaultEditMessageLiveLocation :: EditMessageLiveLocation
defaultEditMessageLiveLocation =
  EditMessageLiveLocation
    { chat_id      = Nothing
    , message_id   = Nothing
    , reply_markup = Nothing
    , location     = Nothing
    }

