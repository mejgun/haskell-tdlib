module TD.Query.GetChatBoosts
  (GetChatBoosts(..)
  , defaultGetChatBoosts
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns the list of boosts applied to a chat; requires administrator rights in the chat. Returns 'TD.Data.FoundChatBoosts.FoundChatBoosts'
data GetChatBoosts
  = GetChatBoosts
    { chat_id         :: Maybe Int    -- ^ Identifier of the chat
    , only_gift_codes :: Maybe Bool   -- ^ Pass true to receive only boosts received from gift codes and giveaways created by the chat
    , offset          :: Maybe T.Text -- ^ Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    , limit           :: Maybe Int    -- ^ The maximum number of boosts to be returned; up to 100. For optimal performance, the number of returned boosts can be smaller than the specified limit
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatBoosts where
  shortShow
    GetChatBoosts
      { chat_id         = chat_id_
      , only_gift_codes = only_gift_codes_
      , offset          = offset_
      , limit           = limit_
      }
        = "GetChatBoosts"
          ++ I.cc
          [ "chat_id"         `I.p` chat_id_
          , "only_gift_codes" `I.p` only_gift_codes_
          , "offset"          `I.p` offset_
          , "limit"           `I.p` limit_
          ]

instance AT.ToJSON GetChatBoosts where
  toJSON
    GetChatBoosts
      { chat_id         = chat_id_
      , only_gift_codes = only_gift_codes_
      , offset          = offset_
      , limit           = limit_
      }
        = A.object
          [ "@type"           A..= AT.String "getChatBoosts"
          , "chat_id"         A..= chat_id_
          , "only_gift_codes" A..= only_gift_codes_
          , "offset"          A..= offset_
          , "limit"           A..= limit_
          ]

defaultGetChatBoosts :: GetChatBoosts
defaultGetChatBoosts =
  GetChatBoosts
    { chat_id         = Nothing
    , only_gift_codes = Nothing
    , offset          = Nothing
    , limit           = Nothing
    }

