module TD.Query.GetDefaultMessageAutoDeleteTime
  (GetDefaultMessageAutoDeleteTime(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns default message auto-delete time setting for new chats. Returns 'TD.Data.MessageAutoDeleteTime.MessageAutoDeleteTime'
data GetDefaultMessageAutoDeleteTime
  = GetDefaultMessageAutoDeleteTime
  deriving (Eq, Show)

instance I.ShortShow GetDefaultMessageAutoDeleteTime where
  shortShow
    GetDefaultMessageAutoDeleteTime
        = "GetDefaultMessageAutoDeleteTime"

instance AT.ToJSON GetDefaultMessageAutoDeleteTime where
  toJSON
    GetDefaultMessageAutoDeleteTime
        = A.object
          [ "@type" A..= AT.String "getDefaultMessageAutoDeleteTime"
          ]

