module TD.Query.GetChatBoostLinkInfo
  (GetChatBoostLinkInfo(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns information about a link to boost a chat. Can be called for any internal link of the type internalLinkTypeChatBoost. Returns 'TD.Data.ChatBoostLinkInfo.ChatBoostLinkInfo'
data GetChatBoostLinkInfo
  = GetChatBoostLinkInfo
    { url :: Maybe T.Text -- ^ The link to boost a chat
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatBoostLinkInfo where
  shortShow
    GetChatBoostLinkInfo
      { url = url_
      }
        = "GetChatBoostLinkInfo"
          ++ I.cc
          [ "url" `I.p` url_
          ]

instance AT.ToJSON GetChatBoostLinkInfo where
  toJSON
    GetChatBoostLinkInfo
      { url = url_
      }
        = A.object
          [ "@type" A..= AT.String "getChatBoostLinkInfo"
          , "url"   A..= url_
          ]

