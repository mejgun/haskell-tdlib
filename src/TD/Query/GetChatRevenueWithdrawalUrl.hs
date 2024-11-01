module TD.Query.GetChatRevenueWithdrawalUrl
  (GetChatRevenueWithdrawalUrl(..)
  , defaultGetChatRevenueWithdrawalUrl
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns a URL for chat revenue withdrawal; requires owner privileges in the channel chat or the bot. Currently, this method can be used only if getOption("can_withdraw_chat_revenue") for channels with supergroupFullInfo.can_get_revenue_statistics == true or bots with userFullInfo.bot_info.can_get_revenue_statistics == true. Returns 'TD.Data.HttpUrl.HttpUrl'
data GetChatRevenueWithdrawalUrl
  = GetChatRevenueWithdrawalUrl
    { chat_id  :: Maybe Int    -- ^ Chat identifier
    , password :: Maybe T.Text -- ^ The 2-step verification password of the current user
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatRevenueWithdrawalUrl where
  shortShow
    GetChatRevenueWithdrawalUrl
      { chat_id  = chat_id_
      , password = password_
      }
        = "GetChatRevenueWithdrawalUrl"
          ++ I.cc
          [ "chat_id"  `I.p` chat_id_
          , "password" `I.p` password_
          ]

instance AT.ToJSON GetChatRevenueWithdrawalUrl where
  toJSON
    GetChatRevenueWithdrawalUrl
      { chat_id  = chat_id_
      , password = password_
      }
        = A.object
          [ "@type"    A..= AT.String "getChatRevenueWithdrawalUrl"
          , "chat_id"  A..= chat_id_
          , "password" A..= password_
          ]

defaultGetChatRevenueWithdrawalUrl :: GetChatRevenueWithdrawalUrl
defaultGetChatRevenueWithdrawalUrl =
  GetChatRevenueWithdrawalUrl
    { chat_id  = Nothing
    , password = Nothing
    }

