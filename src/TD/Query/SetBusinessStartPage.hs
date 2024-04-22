module TD.Query.SetBusinessStartPage
  (SetBusinessStartPage(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputBusinessStartPage as InputBusinessStartPage

-- | Changes the business start page of the current user. Requires Telegram Business subscription. Returns 'TD.Data.Ok.Ok'
data SetBusinessStartPage
  = SetBusinessStartPage
    { start_page :: Maybe InputBusinessStartPage.InputBusinessStartPage -- ^ The new start page of the business; pass null to remove custom start page
    }
  deriving (Eq, Show)

instance I.ShortShow SetBusinessStartPage where
  shortShow
    SetBusinessStartPage
      { start_page = start_page_
      }
        = "SetBusinessStartPage"
          ++ I.cc
          [ "start_page" `I.p` start_page_
          ]

instance AT.ToJSON SetBusinessStartPage where
  toJSON
    SetBusinessStartPage
      { start_page = start_page_
      }
        = A.object
          [ "@type"      A..= AT.String "setBusinessStartPage"
          , "start_page" A..= start_page_
          ]

