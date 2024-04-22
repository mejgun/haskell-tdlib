module TD.Query.GetBusinessChatLinks
  (GetBusinessChatLinks(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns business chat links created for the current account. Returns 'TD.Data.BusinessChatLinks.BusinessChatLinks'
data GetBusinessChatLinks
  = GetBusinessChatLinks
  deriving (Eq, Show)

instance I.ShortShow GetBusinessChatLinks where
  shortShow
    GetBusinessChatLinks
        = "GetBusinessChatLinks"

instance AT.ToJSON GetBusinessChatLinks where
  toJSON
    GetBusinessChatLinks
        = A.object
          [ "@type" A..= AT.String "getBusinessChatLinks"
          ]

