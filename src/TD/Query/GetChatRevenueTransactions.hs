module TD.Query.GetChatRevenueTransactions
  (GetChatRevenueTransactions(..)
  , defaultGetChatRevenueTransactions
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the list of revenue transactions for a chat. Currently, this method can be used only for channels if supergroupFullInfo.can_get_revenue_statistics == true or bots if userFullInfo.bot_info.can_get_revenue_statistics == true. Returns 'TD.Data.ChatRevenueTransactions.ChatRevenueTransactions'
data GetChatRevenueTransactions
  = GetChatRevenueTransactions
    { chat_id :: Maybe Int -- ^ Chat identifier
    , offset  :: Maybe Int -- ^ Number of transactions to skip
    , limit   :: Maybe Int -- ^ The maximum number of transactions to be returned; up to 200
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatRevenueTransactions where
  shortShow
    GetChatRevenueTransactions
      { chat_id = chat_id_
      , offset  = offset_
      , limit   = limit_
      }
        = "GetChatRevenueTransactions"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          , "offset"  `I.p` offset_
          , "limit"   `I.p` limit_
          ]

instance AT.ToJSON GetChatRevenueTransactions where
  toJSON
    GetChatRevenueTransactions
      { chat_id = chat_id_
      , offset  = offset_
      , limit   = limit_
      }
        = A.object
          [ "@type"   A..= AT.String "getChatRevenueTransactions"
          , "chat_id" A..= chat_id_
          , "offset"  A..= offset_
          , "limit"   A..= limit_
          ]

defaultGetChatRevenueTransactions :: GetChatRevenueTransactions
defaultGetChatRevenueTransactions =
  GetChatRevenueTransactions
    { chat_id = Nothing
    , offset  = Nothing
    , limit   = Nothing
    }

