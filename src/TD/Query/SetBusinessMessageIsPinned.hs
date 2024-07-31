module TD.Query.SetBusinessMessageIsPinned
  (SetBusinessMessageIsPinned(..)
  , defaultSetBusinessMessageIsPinned
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Pins or unpins a message sent on behalf of a business account; for bots only. Returns 'TD.Data.Ok.Ok'
data SetBusinessMessageIsPinned
  = SetBusinessMessageIsPinned
    { business_connection_id :: Maybe T.Text -- ^ Unique identifier of business connection on behalf of which the message was sent
    , chat_id                :: Maybe Int    -- ^ The chat the message belongs to
    , message_id             :: Maybe Int    -- ^ Identifier of the message
    , is_pinned              :: Maybe Bool   -- ^ Pass true to pin the message, pass false to unpin it
    }
  deriving (Eq, Show)

instance I.ShortShow SetBusinessMessageIsPinned where
  shortShow
    SetBusinessMessageIsPinned
      { business_connection_id = business_connection_id_
      , chat_id                = chat_id_
      , message_id             = message_id_
      , is_pinned              = is_pinned_
      }
        = "SetBusinessMessageIsPinned"
          ++ I.cc
          [ "business_connection_id" `I.p` business_connection_id_
          , "chat_id"                `I.p` chat_id_
          , "message_id"             `I.p` message_id_
          , "is_pinned"              `I.p` is_pinned_
          ]

instance AT.ToJSON SetBusinessMessageIsPinned where
  toJSON
    SetBusinessMessageIsPinned
      { business_connection_id = business_connection_id_
      , chat_id                = chat_id_
      , message_id             = message_id_
      , is_pinned              = is_pinned_
      }
        = A.object
          [ "@type"                  A..= AT.String "setBusinessMessageIsPinned"
          , "business_connection_id" A..= business_connection_id_
          , "chat_id"                A..= chat_id_
          , "message_id"             A..= message_id_
          , "is_pinned"              A..= is_pinned_
          ]

defaultSetBusinessMessageIsPinned :: SetBusinessMessageIsPinned
defaultSetBusinessMessageIsPinned =
  SetBusinessMessageIsPinned
    { business_connection_id = Nothing
    , chat_id                = Nothing
    , message_id             = Nothing
    , is_pinned              = Nothing
    }

