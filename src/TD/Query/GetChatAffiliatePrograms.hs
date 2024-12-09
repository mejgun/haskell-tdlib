module TD.Query.GetChatAffiliatePrograms
  (GetChatAffiliatePrograms(..)
  , defaultGetChatAffiliatePrograms
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns affiliate programs that were connected to the given chat. Returns 'TD.Data.ChatAffiliatePrograms.ChatAffiliatePrograms'
data GetChatAffiliatePrograms
  = GetChatAffiliatePrograms
    { chat_id :: Maybe Int    -- ^ Identifier of the chat for which the affiliate programs were connected. Can be an identifier of the Saved Messages chat, of a chat with an owned bot, or of a channel chat with can_post_messages administrator right
    , offset  :: Maybe T.Text -- ^ Offset of the first affiliate program to return as received from the previous request; use empty string to get the first chunk of results
    , limit   :: Maybe Int    -- ^ The maximum number of affiliate programs to return
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatAffiliatePrograms where
  shortShow
    GetChatAffiliatePrograms
      { chat_id = chat_id_
      , offset  = offset_
      , limit   = limit_
      }
        = "GetChatAffiliatePrograms"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          , "offset"  `I.p` offset_
          , "limit"   `I.p` limit_
          ]

instance AT.ToJSON GetChatAffiliatePrograms where
  toJSON
    GetChatAffiliatePrograms
      { chat_id = chat_id_
      , offset  = offset_
      , limit   = limit_
      }
        = A.object
          [ "@type"   A..= AT.String "getChatAffiliatePrograms"
          , "chat_id" A..= chat_id_
          , "offset"  A..= offset_
          , "limit"   A..= limit_
          ]

defaultGetChatAffiliatePrograms :: GetChatAffiliatePrograms
defaultGetChatAffiliatePrograms =
  GetChatAffiliatePrograms
    { chat_id = Nothing
    , offset  = Nothing
    , limit   = Nothing
    }

