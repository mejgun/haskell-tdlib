module TD.Query.GetChatBoosts
  (GetChatBoosts(..)
  , defaultGetChatBoosts
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns list of boosts applied to a chat. The user must be an administrator in the channel chat to get the list of boosts
data GetChatBoosts
  = GetChatBoosts
    { chat_id :: Maybe Int    -- ^ Identifier of the chat
    , offset  :: Maybe T.Text -- ^ Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    , limit   :: Maybe Int    -- ^ The maximum number of boosts to be returned; up to 100. For optimal performance, the number of returned boosts can be smaller than the specified limit
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatBoosts where
  shortShow
    GetChatBoosts
      { chat_id = chat_id_
      , offset  = offset_
      , limit   = limit_
      }
        = "GetChatBoosts"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          , "offset"  `I.p` offset_
          , "limit"   `I.p` limit_
          ]

instance AT.ToJSON GetChatBoosts where
  toJSON
    GetChatBoosts
      { chat_id = chat_id_
      , offset  = offset_
      , limit   = limit_
      }
        = A.object
          [ "@type"   A..= AT.String "getChatBoosts"
          , "chat_id" A..= chat_id_
          , "offset"  A..= offset_
          , "limit"   A..= limit_
          ]

defaultGetChatBoosts :: GetChatBoosts
defaultGetChatBoosts =
  GetChatBoosts
    { chat_id = Nothing
    , offset  = Nothing
    , limit   = Nothing
    }

