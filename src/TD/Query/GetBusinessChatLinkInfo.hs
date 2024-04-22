module TD.Query.GetBusinessChatLinkInfo
  (GetBusinessChatLinkInfo(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns information about a business chat link. Returns 'TD.Data.BusinessChatLinkInfo.BusinessChatLinkInfo'
data GetBusinessChatLinkInfo
  = GetBusinessChatLinkInfo
    { link_name :: Maybe T.Text -- ^ Name of the link
    }
  deriving (Eq, Show)

instance I.ShortShow GetBusinessChatLinkInfo where
  shortShow
    GetBusinessChatLinkInfo
      { link_name = link_name_
      }
        = "GetBusinessChatLinkInfo"
          ++ I.cc
          [ "link_name" `I.p` link_name_
          ]

instance AT.ToJSON GetBusinessChatLinkInfo where
  toJSON
    GetBusinessChatLinkInfo
      { link_name = link_name_
      }
        = A.object
          [ "@type"     A..= AT.String "getBusinessChatLinkInfo"
          , "link_name" A..= link_name_
          ]

