module TD.Query.EditInlineMessageLiveLocation
  (EditInlineMessageLiveLocation(..)
  , defaultEditInlineMessageLiveLocation
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified TD.Data.LiveLocation as LiveLocation

-- | Edits the content of a live location in an inline message sent via a bot; for bots only. Returns 'TD.Data.Ok.Ok'
data EditInlineMessageLiveLocation
  = EditInlineMessageLiveLocation
    { inline_message_id :: Maybe T.Text                    -- ^ Inline message identifier
    , reply_markup      :: Maybe ReplyMarkup.ReplyMarkup   -- ^ The new message reply markup; pass null if none
    , location          :: Maybe LiveLocation.LiveLocation -- ^ New live location of the message; pass null to stop sharing the live location. If the new live_period isn't set to 0x7FFFFFFF, then it must not exceed the current live_period by more than a day, and the live location expiration date must remain in the next 90 days
    }
  deriving (Eq, Show)

instance I.ShortShow EditInlineMessageLiveLocation where
  shortShow
    EditInlineMessageLiveLocation
      { inline_message_id = inline_message_id_
      , reply_markup      = reply_markup_
      , location          = location_
      }
        = "EditInlineMessageLiveLocation"
          ++ I.cc
          [ "inline_message_id" `I.p` inline_message_id_
          , "reply_markup"      `I.p` reply_markup_
          , "location"          `I.p` location_
          ]

instance AT.ToJSON EditInlineMessageLiveLocation where
  toJSON
    EditInlineMessageLiveLocation
      { inline_message_id = inline_message_id_
      , reply_markup      = reply_markup_
      , location          = location_
      }
        = A.object
          [ "@type"             A..= AT.String "editInlineMessageLiveLocation"
          , "inline_message_id" A..= inline_message_id_
          , "reply_markup"      A..= reply_markup_
          , "location"          A..= location_
          ]

defaultEditInlineMessageLiveLocation :: EditInlineMessageLiveLocation
defaultEditInlineMessageLiveLocation =
  EditInlineMessageLiveLocation
    { inline_message_id = Nothing
    , reply_markup      = Nothing
    , location          = Nothing
    }

