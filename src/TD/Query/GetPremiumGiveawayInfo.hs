module TD.Query.GetPremiumGiveawayInfo
  (GetPremiumGiveawayInfo(..)
  , defaultGetPremiumGiveawayInfo
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns information about a Telegram Premium giveaway. Returns 'TD.Data.PremiumGiveawayInfo.PremiumGiveawayInfo'
data GetPremiumGiveawayInfo
  = GetPremiumGiveawayInfo
    { chat_id    :: Maybe Int -- ^ Identifier of the channel chat which started the giveaway
    , message_id :: Maybe Int -- ^ Identifier of the giveaway message in the chat
    }
  deriving (Eq, Show)

instance I.ShortShow GetPremiumGiveawayInfo where
  shortShow
    GetPremiumGiveawayInfo
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = "GetPremiumGiveawayInfo"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          ]

instance AT.ToJSON GetPremiumGiveawayInfo where
  toJSON
    GetPremiumGiveawayInfo
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = A.object
          [ "@type"      A..= AT.String "getPremiumGiveawayInfo"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          ]

defaultGetPremiumGiveawayInfo :: GetPremiumGiveawayInfo
defaultGetPremiumGiveawayInfo =
  GetPremiumGiveawayInfo
    { chat_id    = Nothing
    , message_id = Nothing
    }

