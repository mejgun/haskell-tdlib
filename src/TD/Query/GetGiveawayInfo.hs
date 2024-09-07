module TD.Query.GetGiveawayInfo
  (GetGiveawayInfo(..)
  , defaultGetGiveawayInfo
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns information about a giveaway. Returns 'TD.Data.GiveawayInfo.GiveawayInfo'
data GetGiveawayInfo
  = GetGiveawayInfo
    { chat_id    :: Maybe Int -- ^ Identifier of the channel chat which started the giveaway
    , message_id :: Maybe Int -- ^ Identifier of the giveaway or a giveaway winners message in the chat
    }
  deriving (Eq, Show)

instance I.ShortShow GetGiveawayInfo where
  shortShow
    GetGiveawayInfo
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = "GetGiveawayInfo"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          ]

instance AT.ToJSON GetGiveawayInfo where
  toJSON
    GetGiveawayInfo
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = A.object
          [ "@type"      A..= AT.String "getGiveawayInfo"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          ]

defaultGetGiveawayInfo :: GetGiveawayInfo
defaultGetGiveawayInfo =
  GetGiveawayInfo
    { chat_id    = Nothing
    , message_id = Nothing
    }

