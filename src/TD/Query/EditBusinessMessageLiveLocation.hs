module TD.Query.EditBusinessMessageLiveLocation
  (EditBusinessMessageLiveLocation(..)
  , defaultEditBusinessMessageLiveLocation
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified TD.Data.LiveLocation as LiveLocation

-- | Edits the content of a live location in a message sent on behalf of a business account; for bots only. Returns 'TD.Data.BusinessMessage.BusinessMessage'
data EditBusinessMessageLiveLocation
  = EditBusinessMessageLiveLocation
    { business_connection_id :: Maybe T.Text                    -- ^ Unique identifier of business connection on behalf of which the message was sent
    , chat_id                :: Maybe Int                       -- ^ The chat the message belongs to
    , message_id             :: Maybe Int                       -- ^ Identifier of the message
    , reply_markup           :: Maybe ReplyMarkup.ReplyMarkup   -- ^ The new message reply markup; pass null if none
    , location               :: Maybe LiveLocation.LiveLocation -- ^ New live location of the message; pass null to stop sharing the live location. If the new live_period isn't set to 0x7FFFFFFF, then it must not exceed the current live_period by more than a day, and the live location expiration date must remain in the next 90 days
    }
  deriving (Eq, Show)

instance I.ShortShow EditBusinessMessageLiveLocation where
  shortShow
    EditBusinessMessageLiveLocation
      { business_connection_id = business_connection_id_
      , chat_id                = chat_id_
      , message_id             = message_id_
      , reply_markup           = reply_markup_
      , location               = location_
      }
        = "EditBusinessMessageLiveLocation"
          ++ I.cc
          [ "business_connection_id" `I.p` business_connection_id_
          , "chat_id"                `I.p` chat_id_
          , "message_id"             `I.p` message_id_
          , "reply_markup"           `I.p` reply_markup_
          , "location"               `I.p` location_
          ]

instance AT.ToJSON EditBusinessMessageLiveLocation where
  toJSON
    EditBusinessMessageLiveLocation
      { business_connection_id = business_connection_id_
      , chat_id                = chat_id_
      , message_id             = message_id_
      , reply_markup           = reply_markup_
      , location               = location_
      }
        = A.object
          [ "@type"                  A..= AT.String "editBusinessMessageLiveLocation"
          , "business_connection_id" A..= business_connection_id_
          , "chat_id"                A..= chat_id_
          , "message_id"             A..= message_id_
          , "reply_markup"           A..= reply_markup_
          , "location"               A..= location_
          ]

defaultEditBusinessMessageLiveLocation :: EditBusinessMessageLiveLocation
defaultEditBusinessMessageLiveLocation =
  EditBusinessMessageLiveLocation
    { business_connection_id = Nothing
    , chat_id                = Nothing
    , message_id             = Nothing
    , reply_markup           = Nothing
    , location               = Nothing
    }

